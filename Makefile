all: os.img

os.img: boot/boot.img kernel.img
	@cat $^ > $@

boot/boot.img:
	make all -C boot

kernel.img: kernel.elf
	x86_64-elf-objcopy -O binary $< $@

kernel.elf: init.o kernel.o
	x86_64-elf-ld -T kernel.ld -melf_i386 $^ -o $@

init.o: init.S
	x86_64-elf-gcc -m32 -c -o $@ $<

kernel.o: kernel.c
	x86_64-elf-gcc -m32 -Wno-int-conversion -ffreestanding -c -o $@ $<

run: all
	qemu-system-x86_64 -monitor stdio -drive format=raw,file=os.img \
	-m 256M -no-reboot -no-shutdown -d cpu_reset

clean:
	make clean -C boot
	rm -f kernel.o
	rm -f init.o
	rm -f kernel.elf
	rm -f kernel.img
	rm -f os.img

