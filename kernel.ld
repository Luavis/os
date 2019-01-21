OUTPUT_FORMAT("elf32-i386")

SECTIONS
{
    . = 0x10000;
    .text :
    {
        init.o (.kernel.init)
        *(.text .text.*)
        . = ALIGN(512);
    } = 0

    .rodata :
    {
        *(.rodata .rodata.*)
    }

    .data :
    {
        *(.data .data.*)
    }

    .bss :
    {
        *(.bss .bss.*)
    }

    /DISCARD/ : {
        *(COMMON)
        *(.comment)
        *(.eh_frame)
    }
}
