#define NULL '\0'
#define VIDEO_ADDR 0xB8000

void print(char *str) {
    char *video = VIDEO_ADDR;
    for(int i = 0; str[i] != NULL; i++) {
        video[i * 2] = str[i];
        video[i * 2 + 1] = 0x4A;
    }
}

void clear_screen() {
    char *video = VIDEO_ADDR;
    for(int i = 0; i < 80 * 25; i++) {
        video[i * 2] = 0;
        video[i * 2 + 1] = 0x00;
    }
}

void start_kernel() {
    clear_screen();
    print("Hello World");
    while(1) {}
}
