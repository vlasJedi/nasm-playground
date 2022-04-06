%include "stud_io.inc"
; entry address for executable after linking - global label for entrypoint
global _start

; code section address
section .text
; label entry and counter with init value=0
_start: mov eax, 0
; label too
;;again: PRINT ""
again: PRINT "Hello"
; end line control ASCII
PUTCHAR 10
inc eax
; is eax less than 5?
cmp eax, 127
; if previous comparison puts 1 in flags registers - then go to lable address 
jl again

FINISH