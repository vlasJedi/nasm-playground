nasm -f elf32 -o main.o -i ../macros main.asm
ld -m elf_i386 -o main.exe main.o