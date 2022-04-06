; translate for Linux with 64bit
format ELF64
public _start

; db - data in bytes, 8 bit
; word - 16 bit
; dword - 32 bit
; qword - 64 bit
new_line equ 0xA
msg db "Hello, world!", new_line, 0
; eval diff between current address and msg var start address
len = $-msg
_start:
    mov rax, 4 ; signal that program going to write
    mov rbx, 1 ; stdout
    mov rcx, msg ; pointer to msg string
    mov rdx, len ; length of string
    int 0x80 ; id of interreption to handle values in registers to exitq
    call exit

length_string:
    xor rax, rax ; exclusive or, true only if elements are different as 1 + 0 = 1

exit:
    mov rax, 1 ; signal that program going to exit
    mov rbx, 0 ; return value for OS to signal error/not
    int 0x80 ; id of interreption to handle values in registers to exitq