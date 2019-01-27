#include "intr.h"


void intr_set() {
    asm ("sti");
}

void intr_clear() {
    asm ("cli");
}
