BITS 64

SECTION .text

GLOBAL memset

memset:
    xor rcx, rcx                    ; Initialise rcx

func_memset:
    cmp rcx, rdx                    ; if count rcx = count size
    je func_ret                     ; go to func ret
    mov BYTE[rdi], sil              ; else set pointer[octet] to value in param
    inc rdi                         ; increment rdi
    inc rcx                         ; increment rcx
    jmp func_memset                 ; recursive of func_memset

func_ret:
    mov rax, rdi                    ; copy rdi to rax
    ret