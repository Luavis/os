#ifndef _ISR_H_
#define _ISR_H_

void isr_trap_divide_by_zero();
void isr_trap_debug();
void isr_trap_non_maskable_interrupt();
void isr_trap_breakpoint();
void isr_trap_overflow();
void isr_trap_bound_range_exceeded();
void isr_trap_invalid_opcode();
void isr_trap_device_not_available();
void isr_trap_double_fault();
void isr_trap_invalid_tss();
void isr_trap_segment_not_present();
void isr_trap_stack_segment_fault();
void isr_trap_general_protection_fault();
void isr_trap_page_fault();
void isr_trap_x87_floating_point();
void isr_trap_machine_check();
void isr_trap_simd_floating_point();
void isr_trap_virtualization();
void isr_trap_security_exception();

void isr_common_handler(int number);

#endif
