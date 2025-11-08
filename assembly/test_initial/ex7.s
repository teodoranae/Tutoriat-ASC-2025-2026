.data

.text

.global main

main:

    xorl %ecx, %ecx
    incl %ecx

    #ecx = 1

L0:

    cmpl $0, %ecx
    jl et_exit

    # daca ecx < 0 termina  

    incl %ecx

    # ecx ++

    jmp L0



et_exit:


    mov $1, %eax
    mov $0, %ebx
    int $0x80

# raspuns: da, va ajunge la et_exit
# ii tot adaug 1 lui ecx pana cand acesta va da 
# overflow si va deveni negativ (1000 0000 ....) 
# si atunci va sari la et_exit

# modificare minimala: 
# pot sterge incl

# pot sterge saltul conditionat

# pot da un decl dupa incl

# pot modifica saltul conditionat in jl LO


