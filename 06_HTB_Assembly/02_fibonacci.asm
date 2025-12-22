;   Fibonacci Sequence Generator
;   ============================

global _start

section .data
    msg db "Fibonacci Sequence:", 0x0a

section .text
_start:
    ; Print the intorduction message.
    mov rax, 1      ; syscall number 1 - write function
    mov rdi, 1      ; specify stout
    mov rsi, msg    ; pass the pointer to the message to be printed
    mov rdx, 20     ; specify the message length
    syscall         ; call the function

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
