#include "./linkage.h"

.extern isr_common_handler

ISR(trap_divide_by_zero, 0)
    push $0;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_divide_by_zero)

ISR(trap_debug, 1)
    push $1;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_debug)

ISR(trap_non_maskable_interrupt, 2)
    push $2;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_non_maskable_interrupt)

ISR(trap_breakpoint, 3)
    push $3;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_breakpoint)

ISR(trap_overflow, 4)
    push $4;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_overflow)

ISR(trap_bound_range_exceeded, 5)
    push $5;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_bound_range_exceeded)

ISR(trap_invalid_opcode, 6)
    push $6;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_invalid_opcode)

ISR(trap_device_not_available, 7)
    push $7;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_device_not_available)

ISR(trap_double_fault, 8)
    push $8;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_double_fault)

ISR(trap_invalid_tss, 10)
    push $10;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_invalid_tss)

ISR(trap_segment_not_present, 11)
    push $11;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_segment_not_present)

ISR(trap_stack_segment_fault, 12)
    push $12;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_stack_segment_fault)

ISR(trap_general_protection_fault, 13)
    push $13;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_general_protection_fault)

ISR(trap_page_fault, 14)
    push $14;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_page_fault)

ISR(trap_x87_floating_point, 16)
    push $16;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_x87_floating_point)

ISR(trap_machine_check, 17)
    push $17;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_machine_check)

ISR(trap_simd_floating_point, 18)
    push $18;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_simd_floating_point)

ISR(trap_virtualization, 19)
    push $19;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_virtualization)

ISR(trap_security_exception, 20)
    push $20;
    call isr_common_handler;
    add $0x4, %esp
ENDISR(trap_security_exception)
