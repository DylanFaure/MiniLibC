BITS 64                     ; INITIATE PROGRAM IN 64 MODE

SECTION .text

GLOBAL my_strncmp

my_strncmp:
    xor rax, rax                    ; Initiate rax (return value) to 0
    xor rcx, rcx                    ; Initiate rcx to 0

func_cmp:
    cmp rdx, rcx                    ; compare count3 and av[3] (rdx is av[3] = length)
    je func_ret                     ; if equal => go to func_ret
    cmp BYTE[rdi], 0                ; compare av[1][count] and NULL (av[1][count] is BYTE[rdi])
    je func_check_rsi               ; if equal => go to func_check_rsi
    cmp BYTE[rsi], 0                ; else compare av[2][count2] and NULL (av[2][count2] is BYTE[rsi])
    je func_check_rdi               ; if equal => go to func_check_rsi
    cmp dil, sil                    ; else compare av[1][count] (av[1][count] is dil) with av[2][count2] (av[2][count2] is sil)
    jl func_inc                     ; if condition av[1][count] > av[2][count2] go to func_inc
    cmp dil, sil                    ; else compare av[1][count] (av[1][count] is dil) with av[2][count2] (av[2][count2] is sil)
    jnle func_dec                   ; if condition av[1][count] < av[2][count2] go to func_dec
    inc dil                         ; else increment count dil
    inc sil                         ; increment count2 sil
    inc rcx                         ; increment count3 rcx
    jmp func_cmp                    ; call as recursive func_cmp

func_check_rsi:
    cmp BYTE[rsi], 0                ; compare av[2][count2] and NULL (av[2][count2] is BYTE[rsi])
    je func_ret                     ; if equal => go to func_ret
    dec rax                         ; else decrement rax
    jmp func_ret                    ; go to func_ret

func_check_rdi:
    cmp BYTE[rdi], 0                ; compare av[1][count] and NULL (av[1][count] is BYTE[rdi])
    je func_ret                     ; if equal => func_ret
    inc rax                         ; else increment rax
    jmp func_ret                    ; go to func_ret

func_dec:
    dec rax                         ; decrement rax
    jmp func_ret                    ; go to func_ret

func_inc:
    inc rax                         ; increment rax

func_ret:
    ret