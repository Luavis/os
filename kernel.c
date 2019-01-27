#include "idt.h"
#include "vga.h"


void start_kernel() {
    clear_screen();
    idt_setup();
    println("Hello World");
    asm ("int $0x03");
    println("Does not crash!");
    while(1) {}
}
