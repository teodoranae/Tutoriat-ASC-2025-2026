.data

x: .long 0x00800000

.text

.global main

main:

movl $0x04000000, %eax
mull x

et_cont:

# inmultesc cele doua numere si pun rezultatul in cei doi registrii
# (EDX:EAX) = 0x04000000 * 0x00800000
#           = 4 * 16^6 * 8 * 16^5 
#           = (2^2) * (2^4)^6 * (2^3) * (2^4)^5
#           = 2^23 * 2^26
#           = 2^49
# cum se reprinzinta acest numar pe cei doi registrii:
# pun un singur 1 pe bitul cu numarul de ordine 50 in rest pun 0
# EDX = 0000 ... 0010 0000 0000 0000 0000 = 20000 (in baza 2)
# EAX = 0000 ...                     0000 = 0 (in baza 2)

# => raspuns: B

exit:

    
    mov $1, %eax
    mov $0, %ebx
    int $0x80