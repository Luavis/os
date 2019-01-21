.code32
.text

.extern start_kernel
.section ".kernel.init", "ax"
_init_kernel:
    movl $0x10, %eax
    movl %eax, %ds
    movl %eax, %es
    movl %eax, %fs
    movl %eax, %gs
    movl %eax, %ss

    // clear stack
    movl $0xFFFE, %ebp
    movl $0xFFFE, %esp
    call start_kernel
