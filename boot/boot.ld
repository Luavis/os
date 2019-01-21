OUTPUT_FORMAT("binary")


SECTIONS
{
    .boot 0x7c00 :
    {
        *(.boot.bootsect)
        *(.boot.data)
        . = 510;
        SHORT(0xAA55);
    } = 0x00

    /DISCARD/ : {
        *(COMMON)
        *(.text)
    }
}
