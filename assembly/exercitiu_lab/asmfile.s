# suma divizorilor unui numar = numar
.data

v: .long 12, 28, 6, 9
n: .long 4
cnt: .long 0
printnu: .asciz "%d nu este perfect"
printda: .asciz "este perfect\n"


.text

perfect:
    pushl %ebp
    movl %esp, %ebp

    
    pushl %ecx

    movl $1, %ecx
    xorl %ebx, %ebx

parcurgere_div:
    
    movl 8(%ebp), %eax
    cmp %ecx, 8(%ebp)
    je exit_divizori
    
    xorl %edx, %edx
    divl %ecx
    cmp $0, %edx
    je este_div
    jmp nu_e_div
    
este_div:
    addl %ecx, %ebx
    
nu_e_div:
    incl %ecx
    jmp parcurgere_div
    
exit_divizori:
    #ebx tine suma divizorilor
    cmp %ebx, 8(%ebp)
    je et_egale
    mov $0, %eax
    jmp exit_functie
    
et_egale:
    mov $1, %eax
    
exit_functie:
    #in %eax tine bool-ul
    popl %ecx
    popl %ebp
    ret

.global main

main:

    xorl %ecx, %ecx 
    lea v, %edi 

    parcurgere_vector:
        cmp %ecx, n
        je et_exit

        movl (%edi, %ecx, 4), %eax

        pushl %eax
        call perfect
        addl $4, %esp

        cmp $1, %eax
        je creste_cnt
        jmp continua

        creste_cnt:
            movl cnt, %edx 
            addl $1, %edx
            movl %edx, cnt
        
        continua:
        addl $1, %ecx
        jmp parcurgere_vector



et_exit:

    movl cnt, %edx

    mov $1, %eax
    mov $0, %ebx
    int $0x80

    
