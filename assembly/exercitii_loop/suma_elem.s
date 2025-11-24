# suma elementelor din array
.data

array: .long 9,9,9

.text

.global main

main:




movl $0, %ecx
lea array, %edi
movl $0, %eax

et_loop:


    # %edi + (4 * index) 

    movl (%edi, %ecx, 4), %ebx

    addl %ebx, %eax

    incl %ecx
    cmpl $5, %ecx
    jge et_exit
    jmp et_loop

    

et_exit:
	# aici ma uit in eax sa vad suma elementelor din array

    mov $1, %eax
    mov $0, %ebx
    int $0x80

    
