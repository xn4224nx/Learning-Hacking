;   Fibonacci Sequence Generator
;   ============================

global _start

section .text
_start:
    ; Set the two initial values of the fibonacci sequence to zero and one.
    xor rax, rax
    xor rbx, rbx
    inc rbx

    add rax, rbx
