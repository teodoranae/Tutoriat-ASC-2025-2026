# suma cifrelor unui numar (variabila long)


.data

n: .long 9990
constant10: .long 10


.text



.global main

main:



# ebx = suma cifrelor

movl $0, %ebx
movl n, %eax

et_loop:


    xorl %edx, %edx
    divl constant10

    addl %edx, %ebx

    cmpl $0, %eax
    je et_exit
    jmp et_loop


et_exit:

	#aici ma uit la ebx si vad ca tine suma cifrelor lui n

    mov $1, %eax
    mov $0, %ebx
    int $0x80

    
