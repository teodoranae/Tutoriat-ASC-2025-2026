.data

    p: .space 4
    x: .long 410
.text

.global main

main:

    movl $1, p

    # p are initial valoarea 1

L0:

    movl x, %edi
    cmpl $9, %edi
    jle et_exit

    # daca x <= 9 termin programul

    movl p, %eax
    movl $3, %ebx
    mul %ebx
    movl %eax, p

    # p = p*3
    # (presupunand ca p nu e aproape de 2^32 ca sa imi intre
    # rezultatul inmultirii si pe edx)

    movl x, %eax
    xorl %edx, %edx
    movl $10, %ebx
    div %ebx
    movl %eax, x
    
    #x = x div 10

    movl p, %eax
    addl %edx, %eax
    movl %eax, p

    #p += x mod 10

    jmp L0



et_exit:

    movl p, %eax
    
    mov $1, %eax
    mov $0, %ebx
    int $0x80

# toate numerele de doua cifre care se termina cu 7
# toate numerele de 3 cifre de forma _10 
# => raspuns: B C F G
