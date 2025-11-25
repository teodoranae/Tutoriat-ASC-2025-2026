# suma divizorilor unui numar = numar
.data

n: .long 12
printnu: .asciz "%d nu este perfect"
printda: .asciz "este perfect\n"


.text

perfect:
    pushl %ebp
    movl %esp, %ebp
    
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
    popl %ebp
    ret

.global main

main:

pushl n
call perfect
#addl $4, %esp
popl n
#eax tine 0 sau 1 in functie de n, daca e perfect
cmp $0, %eax
je print_nu

pushl $printda
call printf
addl $4, %esp

jmp et_exit

print_nu:

pushl n
pushl $printnu
call printf
addl $8, %esp

pushl $0
call fflush
addl $4, %esp

et_exit:
    mov $1, %eax
    mov $0, %ebx
    int $0x80

    
