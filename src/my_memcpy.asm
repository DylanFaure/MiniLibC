BITS 64

SECTION .text

GLOBAL my_memcpy

my_memcpy:
    xor rcx, rcx                    ; Initialise rcx

func_memcpy:
    cmp rcx, rdx                    ; if count rcx = count size
    je func_ret                     ; go to func ret
    mov dil, BYTE[rsi]              ; set av[1][count] to av[2][count]
    inc rsi                         ; increment rsi
    inc rdi                         ; increment rdx
    inc rcx                         ; increment rcx
    jmp func_memcpy                 ; recursive of func_memset

func_ret:
    ret