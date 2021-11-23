
all: tojal-os

tojal-os: boot.o vga_driver.o kernel.o
	i386-elf-tools/bin/i386-elf-gcc -T src/linker.ld -o build/tojal-os.bin -ffreestanding -O2 -nostdlib build/boot.o build/vga_driver.o build/kernel.o -lgcc

boot.o: src/boot.s
	i386-elf-tools/bin/i386-elf-as src/boot.s -o build/boot.o

vga_driver.o: src/vga/vga_driver.c
	i386-elf-tools/bin/i386-elf-gcc -c src/vga/vga_driver.c -o build/vga_driver.o -ffreestanding -O2 -Wall -Wextra

kernel.o: src/kernel.c
	i386-elf-tools/bin/i386-elf-gcc -c src/kernel.c -o build/kernel.o -ffreestanding -O2 -Wall -Wextra