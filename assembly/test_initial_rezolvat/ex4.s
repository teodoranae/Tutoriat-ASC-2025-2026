.data


.text

.global main

main:

    movl $11521, %eax
    movl $0x58, %ebx
    xorl %edx, %edx
    cmpb %al, %bl
    # eax = 10 1101 0000 0001 => al = 1
    # ebx = 0101 1000      => bl = 88
    jg et1
    sub %edi, %edi
et0:

    cmpl %ebx, %edi
    je et_exit
    incw %dx;
    addl $3, %edi
    jmp et0


et1:
    sub %edi, %edi
et2:
    cmpl %ebx, %edi
    #ebx = 88, edi = 88, edx = 44
    je et_exit
    incw %dx
    addl $2, %edi
    jmp et2

et_exit:

    #EDX = 0000 .. 0000 0010 1100
    #EBX = 0000 .. 0000 0101 1000 
    
    movb %dl, %bh

    #EBX = 0010 1100 0101 1000 = 11352


exit:

    
    mov $1, %eax
    mov $0, %ebx
    int $0x80

# Raspuns: 11352 D


