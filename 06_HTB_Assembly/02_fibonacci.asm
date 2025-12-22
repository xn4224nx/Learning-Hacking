;   Fibonacci Sequence Generator
;   ============================

global _start

section .text
_start:
    ; Set the two initial values of the fibonacci sequence to zero and one.
    xor rax, rax
    xor rbx, rbx
    inc rbx

    ; Define how many fibonnaci values to generate.
    mov rcx, 10

fibloop:
   add rax, rbx     ; Generate the next number
   xchg rax, rbx    ; Swap the two numbers
   loop fibloop
