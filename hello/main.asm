;%include "stud_io.inc"
; entry address for executable after linking - global label for entrypoint

section .data
msg db 69
; eval diff between current address and msg var start address
len equ $-msg
;syswrite db 4

section .text
global _start
; code section address
; label entry and counter with init value=0
_start: mov eax, 0
; label too
;;again: PRINT ""
;;again: PRINT "Hello"
; end line control ASCII
;;PUTCHAR 10

mov edx, len ; put bytes length
mov ecx, msg ; put address of msg
mov ebx, 1   ; stdout == 1
again:
  mov [ecx], eax ; write new char code value from eax to address contained in ecx 
  push eax 
  mov eax, 4   ; sys write call
  int 0x80 ; call kernel to do output
  pop eax
  inc eax
  ; is eax less than 5?
  cmp eax, 255
  ; jasm first less- if previous comparison puts 1 in flags registers - then go to lable address 
  jl again

; FINISH
mov eax, 1 ; sys exit call to kernel
int 0x80
