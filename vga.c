#include "vga.h"

int vga_cursor = 0;

void print(char *str) {
    char *video = VIDEO_ADDR + vga_cursor;

    for(int i = 0; str[i] != NULL; i++) {
        video[i * 2] = str[i];
        video[i * 2 + 1] = 0x4A;
        vga_cursor += 2;
    }
}

void println(char *str) {
    char *video = VIDEO_ADDR + vga_cursor;

    for(int i = 0; str[i] != NULL; i++) {
        video[i * 2] = str[i];
        video[i * 2 + 1] = 0x4A;
        vga_cursor += 2;
    }

    vga_cursor += 160 - (vga_cursor % 160);
}

void clear_screen() {
    char *video = VIDEO_ADDR;
    for(int i = 0; i < 80 * 25; i++) {
        video[i * 2] = 0;
        video[i * 2 + 1] = 0x00;
    }

    vga_cursor = 0;
}
