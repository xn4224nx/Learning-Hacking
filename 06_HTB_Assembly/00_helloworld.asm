global  _start

section .data
    message db "Hello, world!", 0x0a
    message_len equ $-message
    
section .text
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, message
    mov rdx, message_len
    syscall
    
    mov rax, 60
    mov rdi, 0
    syscall

     
