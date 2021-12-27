BITS 64                     ; INITIATE PROGRAM IN 64 MODE

SECTION .text

GLOBAL strchr

strchr:
    xor rax, rax            ; Initiate rax (return value) to 0

find_arg:
    cmp BYTE[rdi], sil      ; if av[1][count] == av[2][0]
    je missed_inc           ; go to missed_inc
    cmp BYTE[rdi], 0        ; if av[1][count] == NULL
    je func_ret             ; go to func_ret
    inc rdi                 ; increment rdi
    jmp find_arg            ; recursive go to find_arg again

missed_inc:
    mov rax, rdi            ; copy rdi to rax

func_ret:
    ret                     ; return rax