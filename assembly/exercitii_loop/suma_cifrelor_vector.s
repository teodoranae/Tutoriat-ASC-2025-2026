# suma cifrelor tuturor elementelor dintr un array
.data

array: .long 11, 12, 13,14
n: .long 4
s: .long 0
ct10: .long 10


.text

.global main

main:



# ebx = suma cifrelor


movl $0, %ecx
movl $0, %ebx
lea array, %edi

et_loop:
    
    movl (%edi, %ecx, 4), %eax

et_loop2:
    
    xorl %edx, %edx
    divl ct10
    addl %edx, %ebx

    cmpl $0, %eax
    je et_terminat_suma
    jmp et_loop2

et_terminat_suma:

    

    incl %ecx
    cmpl n, %ecx
    je et_exit
    jmp et_loop


    

et_exit:
    # ebx tine suma tuturor cifrelor din vector


    mov $1, %eax
    mov $0, %ebx
    int $0x80

    
