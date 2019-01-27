#ifndef _VGA_H_
#define _VGA_H_

#define NULL '\0'
#define VIDEO_ADDR 0xB8000

void print(char *str);
void println(char *str);
void clear_screen();

#endif
