.data

    x: .space 4
    format: .asciz "x!            = %d\n"
    formatScanf: .asciz "%d"
    formatScanfPrint: .asciz "Introduceti x =  "

.text

.global main

main:
	
	pushl x
	pushl $formatScanfPrint
	call printf
	addl $8, %esp
	
    pushl $x
	pushl $formatScanf
	call scanf
	addl $8, %esp

    xorl %edx, %edx
    movl x, %ecx
    movl %ecx, %ebx

label_loop:
    decl %ecx
    movl %ecx, %eax
    mull %ebx
    movl %eax, %ebx
    
    
    cmp $1, %ecx
    jg  label_loop
    
    movl %ebx, %eax

    

    pushl %ebx
    pushl $format
    call printf
    addl $8, %esp



    
    mov $1, %eax
    mov $0, %ebx
    int $0x80

