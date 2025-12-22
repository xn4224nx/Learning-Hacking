;   Fibonacci Sequence Generator
;   ============================

global _start


section .text
_start:
    ; Set the two initial values of the fibonacci sequence.
    mov al, 0
    mov bl, 1
