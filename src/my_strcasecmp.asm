BITS 64                             ; INITIATE PROGRAM IN 64 MODE

SECTION .text

GLOBAL my_strcasecmp

my_strcasecmp:
    xor rax, rax                    ; Initiate rax (return value) to 0

func_cmp:
    cmp BYTE[rdi], 0                ; else check if av[1][count] == NULL (av[1][count] is BYTE[rdi])
    je func_check_rsi               ; if condition is true => go to func_check_rsi
    cmp BYTE[rsi], 0                ; else check if av[2][count2] == NULL (av[2][count2] is BYTE[rsi])
    je func_check_rdi               ; if condition is true => go to func_check_rsi
    mov al, dil
    cmp al, 'A'
    jb func_nextcmp
    cmp al, 'Z'
    ja func_nextcmp
    sub al, 0x20
    mov dil, al
    mov al, sil
    cmp al, 'A'
    jb func_nextcmp
    cmp al, 'Z'
    ja func_nextcmp
    sub al, 0x20
    mov sil, al

func_nextcmp:
    cmp dil, sil                    ; else compare av[1][count] (av[1][count] is dil) with av[2][count2] (av[2][count2] is sil)
    jl func_inc                     ; if condition av[1][count] > av[2][count2] go to func_inc
    cmp dil, sil                    ; else compare av[1][count] (av[1][count] is dil) with av[2][count2] (av[2][count2] is sil)
    jnle func_dec                   ; if condition av[1][count] < av[2][count2] go to func_dec
    inc dil                         ; else increment count dil
    inc sil                         ; increment count2 sil
    je func_ret                     ; if condition is true => go to func_ret
    jmp func_cmp                    ; call as recursive func_cmp

func_check_rsi:
    cmp BYTE[rsi], 0                ; check if av[2][count2] == NULL (av[2][count2] is BYTE[rsi])
    je func_ret                     ; if condition is true => go to func_ret
    dec rax                         ; else decrement rax
    jmp func_ret                    ; go to func_ret

func_check_rdi:
    cmp BYTE[rdi], 0                ; check if av[1][count] == NULL (av[1][count] is BYTE[rdi])
    je func_ret                     ; if condition is true => func_ret
    inc rax                         ; else increment rax
    jmp func_ret                    ; go to func_ret

func_dec:
    dec rax                         ; decrement rax
    jmp func_ret                    ; go to func_ret

func_inc:
    inc rax                         ; increment rax

func_ret:
    ret