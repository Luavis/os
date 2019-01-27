#include "isr.h"
#include "vga.h"

void isr_common_handler(int number) {
    char num_message[3];
    if (number / 10 == 0) {  // check digits
        num_message[0] = 0x30 + number;
        num_message[1] = '\0';
    } else {
        num_message[0] = 0x30 + (number / 10);
        num_message[1] = 0x30 + (number % 10);
        num_message[2] = '\0';
    }

    print("!Exception:");
    println(num_message);
}
