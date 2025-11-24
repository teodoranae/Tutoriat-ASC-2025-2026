.data

    x: .long 15
    y: .long 30

.text

.global main

main:

    movl x, %eax
    movl $10, %ecx
L0:

    incl %eax
    loop L0

    #eax -> 25

    movl y, %ebx
    addl %eax, %ebx

    #ebx = 55

    mul %ebx

    #eax = 1375
    xorl %edx, %edx
    movl $5, %edi
    div %edi

    #eax = 275

    addl %ebx, %eax

    #eax = 330

    shl $2, %eax

    #eax = 330 * 4 = 1320 = 101 0010 1000

    movb %al, %dh

    #edx = 0010 1000 0000 0000 = 10240

    incb %dl
    decw %dx
    shr $1, %edx

    #edx = 5120
exit:

    
    mov $1, %eax
    mov $0, %ebx
    int $0x80

#raspuns:
#EAX = 1320
#EBX = 55
#ECX = 0
#EDX = 5120


