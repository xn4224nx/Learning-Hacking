;   Fibonacci Sequence Generator
;   ============================

global _start

section .data
    msg db "Fibonacci Sequence:", 0x0a
    msg_l equ $-msg

section .text
_start:
    call print_intro_msg
    call init_fib_seq
    call fib_loop
    call prog_exit

; Print the introduction message.
print_intro_msg:
    mov rax, 1      ; syscall number 1 - write function
    mov rdi, 1      ; specify stout
    mov rsi, msg    ; pass the pointer to the message to be printed
    mov rdx, msg_l  ; specify the message length
    syscall         ; call the function

; Set the two initial values of the fibonacci sequence to zero and one.
init_fib_seq:
    xor rax, rax
    xor rbx, rbx
    inc rbx

    ; Define how many fibonnaci values to generate.
    mov rcx, 10

fib_loop:
   add rax, rbx     ; Generate the next number
   xchg rax, rbx    ; Swap the two numbers
   loop fib_loop



   ; Close down the program gracefully.
prog_exit:
   mov rax, 60
   mov rdi, 0
   syscall
