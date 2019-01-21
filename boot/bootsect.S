.code16
.text
.org 0x7c00

.global _start
.section ".boot.bootsect", "ax"
_start:
    cli
    ljmp $0, $_setup  // _setup

_setup:
    // init stack
    movw $0x0000, %ax
    movw %ax, %ss

    movw $0xFFFF, %sp
    movw $0xFFFF, %bp

    // Enable A20 gate
    movw $0x2401, %ax
    int $0x15

    // loading kernel
    movb $0x42, %ah
    movb $0x80, %dl
    movw $_kernel_lba, %si
    int $0x13

    movw $0, %ax
    movw %ax, %ds
    lgdt (_gdtr)

    movl $0x4000003B, %eax
    movl %eax, %cr0
    jmpl $0x08, $0x10000

.section ".boot.data", "a"
_gdtr:
    .word 0x18
    .long _gdt.head
_gdt.head:
    gdt.null:
        .word 0, 0, 0, 0
    gdt.code:
        .word 0xffff // limit [15:0]
        .word 0 // base [15:0]
        .byte 0 // base [23:16]
        .byte 0x9A // P=1, DPL =0, read/exec
        .byte 0xCF // G =1, D=1, L=0, Limit [19:16]
        .byte 0x00 // base [31:24]
    gdt.data:
        .word 0xffff // limit [15:0]
        .word 0 // base [15:0]
        .byte 0 // base [23:16]
        .byte 0x92 // P=1, DPL =0, read/write
        .byte 0xCF // G =1, D=1, L=0, Limit [19:16]
        .byte 0x00 // base [31:24]
_gdt.end:

_kernel_lba:
    .byte 0x10  // size
    .byte 0
    .word 0x10  // size to read
    .word 0x0000  // offset
    .word 0x1000  // segment
    .quad 0x1  // LBA
