#include "idt.h"
#include "type.h"
#include "isr.h"

#define IDT_SIZE 256
#define CODE_SEGMENT 0x08
#define DEFAULT_IDT_ENTRY_TYPE 0x0E

typedef unsigned short idt_entry_option;

struct idt_entry {
    uint16_t low_offset;
    uint16_t selector;
    uint8_t reserved;
    uint8_t type;
    uint16_t high_offset;
} __attribute__((packed));

struct idt_entry idt[IDT_SIZE];
struct {
    uint16_t limit;
    uint32_t base;
} __attribute__((packed)) interrupt_descriptor_table = {
    .limit = IDT_SIZE,
    .base = (uint32_t) &idt,
};

void set_idt_entry(struct idt_entry *entry, void *handler) {
    uint32_t handler_addr = (uint32_t) handler;
    entry->type |= (1 << 7);  // set present
    entry->selector = CODE_SEGMENT;
    entry->low_offset = (uint16_t)(handler_addr & 0xFFFF);
    entry->high_offset = (uint16_t)(handler_addr >> 16);
}

void idt_setup() {
    for (int i = 0; i < IDT_SIZE; i++) {
        idt[i].low_offset = 0;
        idt[i].selector = 0;
        idt[i].reserved = 0;
        idt[i].type = DEFAULT_IDT_ENTRY_TYPE;
        idt[i].high_offset = 0;
    }

    set_idt_entry(&idt[0], isr_trap_divide_by_zero);
    set_idt_entry(&idt[1], isr_trap_debug);
    set_idt_entry(&idt[2], isr_trap_non_maskable_interrupt);
    set_idt_entry(&idt[3], isr_trap_breakpoint);
    set_idt_entry(&idt[4], isr_trap_overflow);
    set_idt_entry(&idt[5], isr_trap_bound_range_exceeded);
    set_idt_entry(&idt[6], isr_trap_invalid_opcode);
    set_idt_entry(&idt[7], isr_trap_device_not_available);
    set_idt_entry(&idt[8], isr_trap_double_fault);
    // 9 deprecated
    set_idt_entry(&idt[10], isr_trap_invalid_tss);
    set_idt_entry(&idt[11], isr_trap_segment_not_present);
    set_idt_entry(&idt[12], isr_trap_stack_segment_fault);
    set_idt_entry(&idt[13], isr_trap_general_protection_fault);
    set_idt_entry(&idt[14], isr_trap_page_fault);
    // 15 reserved
    set_idt_entry(&idt[16], isr_trap_x87_floating_point);
    set_idt_entry(&idt[17], isr_trap_machine_check);
    set_idt_entry(&idt[18], isr_trap_simd_floating_point);
    set_idt_entry(&idt[19], isr_trap_virtualization);
    set_idt_entry(&idt[20], isr_trap_security_exception);

    asm ("lidtl (%0)"
        :
        : "r" (&interrupt_descriptor_table)
    );
}
