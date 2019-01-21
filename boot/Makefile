all: boot.img

boot.img: bootsect.o
	x86_64-elf-ld -T boot.ld -melf_i386 $^ -o $@

bootsect.o: bootsect.S
	x86_64-elf-gcc -m32 -c -o $@ $<

clean:
	rm -f bootsect.o head.o setup.o boot.img boot.elf
