.data

.text

.global main



main:


    movl $1, %eax
    subl $1, %eax
    jns et_exit

# sare daca rezultatul ultimei operatii nu are bitul
# de semn setat
# daca inlocuiesc cu 2 nu va mai sari


et_debug:
    movl $999, %eax

et_exit:


    mov $1, %eax
    mov $0, %ebx
    int $0x80


