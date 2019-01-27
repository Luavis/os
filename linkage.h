#define ISR(name, irq)   \
    .global isr_##name; \
isr_##name: \
    push %ebp; \
    mov %esp, %ebp; \
    push %eax; \
    push %ebx; \
    push %ecx; \
    push %edx; \
    push %edi; \
    push %esi;

#define ENDISR(name) \
    pop %esi; \
    pop %edi; \
    pop %edx; \
    pop %ecx; \
    pop %ebx; \
    pop %eax; \
    pop %ebp; \
    iret; \
    .type isr_##name, @function; \
    .size isr_##name, .-isr_##name;
