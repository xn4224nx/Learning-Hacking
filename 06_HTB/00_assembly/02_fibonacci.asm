;   Fibonacci Sequence Generator
;   ============================

global _start
extern  printf, scanf

section .data
    msg db "Input the max value: ", 0x0
    msg_l equ $-msg
    out_fmt db "%d", 0x0a, 0x00
    in_fmt db "%d", 0x00

section .bss
    user_in resb 1

section .text
_start:
    call print_intro_msg
    call get_input
    call init_fib_seq
    call fib_loop
    call prog_exit

; Print the introduction message.
print_intro_msg:
    mov rax, 1          ; syscall number 1 - write function
    mov rdi, 1          ; specify stout
    mov rsi, msg        ; pass the pointer to the message to be printed
    mov rdx, msg_l      ; specify the message length
    syscall             ; call the function
    ret

; Set the two initial values of the fibonacci sequence to zero and one.
init_fib_seq:
    xor rax, rax
    xor rbx, rbx
    inc rbx
    ret

fib_loop:
    call print_curr_fib
    add rax, rbx        ; Generate the next number
    xchg rax, rbx       ; Swap the two numbers
    cmp rbx, [user_in]  ; do rbx - 200
    js fib_loop         ; jump if result is <0
    ret

; Close down the program gracefully.
prog_exit:
    mov rax, 60
    mov rdi, 0
    syscall

; Print the current fibonacci number
print_curr_fib:
    ; Push the registers to the stack
    push rax
    push rbx

    ; Set the arguments for the print function and then call it
    mov rdi, out_fmt
    mov rsi, rbx
    call printf

    ; Restore the registers from the stack
    pop rbx
    pop rax
    ret

; Get user input
get_input:
    sub rsp, 8
    mov rdi, in_fmt
    mov rsi, user_in
    call scanf
    add rsp, 8
    ret
