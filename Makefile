
all: tojal-os

tojal-os: boot.o kernel.o
	i386-elf-tools/bin/i386-elf-gcc -T src/linker.ld -o build/tojal-os.bin -ffreestanding -O2 -nostdlib build/boot.o build/kernel.o -lgcc

boot.o: src/boot.s
	i386-elf-tools/bin/i386-elf-as src/boot.s -o build/boot.o

kernel.o: src/kernel.c
	i386-elf-tools/bin/i386-elf-gcc -c src/kernel.c -o build/kernel.o -ffreestanding -O2 -Wall -Wextra