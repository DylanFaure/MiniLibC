BITS 64                     ; INITIATE PROGRAM IN 64 MODE

SECTION .text

GLOBAL strlen

strlen:
    xor rax, rax            ; Initiate rax (return value) to 0

checkstr:
    cmp BYTE[rdi], 0        ; BYTE[rdi] <==> count like av[1][count] and we compare av[1][count] and NULL
    je func_ret             ; je = if condition true we call func_ret and return rax
    inc rax                 ; incremente rax (return value)
    inc rdi                 ; incremente BYTE[rdi] <==> increment count to check the other character
    jmp checkstr            ; recursive, we call checkstr again

func_ret:
    ret
