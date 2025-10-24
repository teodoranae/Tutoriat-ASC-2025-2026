.data

    x: .long 10
    y: .long 6

.text
.global main


main:
	
	# 1. ======= INMULTIRE SIMPLA =======
	
    movl x, %eax
    movl y, %ebx
    mull %ebx
    
    bpt1: 
	# aici cu gdb vad ce valoare am in (%edx : %eax) 
	# => 10 * 6 = 60
	# %edx va fi tot 0 pt ca 60 nu are nevoie de mai mult de 32 de biti
	# pentru reprezentare
    
    
    
    
    # 2. ======= IMPARTIRE CU REST =======
    
    xorl %edx, %edx
    
    # aici deja aveam 0 in edx dar e bine ca inainte de o 
    # impartire sa ma asigur ca am 0 in el ca sa nu impart ce nu
    # vreau
    
    # xor ul cu sinele e mai rapid decat movl $0, %edx
    # de aceea se foloseste mai des in practica
    
	incl %eax # adaug 1 in eax => eax = 61
	movl $2, %ebx
	divl %ebx
	
	bpt2: 
	# in gdb dau iar i r si observ ca am impartit 61 la 2
    # si catul 30 este in eax si restul 1 este in edx
	
	
	
	
	#3. ======= INMULTIRE CU NUMAR NEGATIV FARA IMUL =======
	
	movl $-10, %eax
	mull %ebx	#atentie am folosit MUL care ignora semnul (unsigned)
	
	bpt3: 
	# dau breakpoint in gdb aici si ma uit la edx si eax:
	# eax are -20 = 0xffffffec
	# edx are   1 = 0x00000001
	# Stim din teorie catul final al inmultirii se obtine
	# prin concatenarea registrilor %edx si %eax deci:
	# (%edx:%eax) = 0x00000001ffffffec = 8589934572 => un numar la care
	# nu ne asteptam cu inmultirea noastra initiala: -20 * 2
	# de aceea vom repeta inmultirea de mai sus dar cu 	IMUL	
	
	
	
	
	#4. ======= INMULTIRE CU NUMAR NEGATIV CU IMUL =======
	
	# in ebx inca tin 2
	# in eax tin -20 si deci mut -10 inapoi
	# si apoi dau breakpoint
	
	movl $-10, %eax
	imull %ebx
	
	bpt4:
	# eax tine 0xffffffec = -20
	# edx tine 0xffffffff = -1
	# (%edx:%eax) = 0xffff ffff ffff ffec = -20
	# deci folosind imul observ ca s a tinut cont de semn
	
	
	
    
    # ======= IMPARTIRE CU UN NUMAR NEGATIV FARA IDIV =======
    
    # movl 0xffffffff, %edx
    
    # va trebui sa completez cu 1 edx ul deoarece la inmultire
    # se concateneaza registrele si daca nu fac asta voi 
    # imparti ceva cu un junk in fata sau un numar pozitiv
    
	# movl $-11, %eax
    # movl $2, %ebx
    # divl %ebx
    
    bpt5:
    # am comentat codul pt ca seg fault: 
    # Segmentation fault (core dumped)
	# de ce?
	# pai fara acel i in fata la div edx:eax e vazut ca un intreg 
	# pozitiv care are valoarea
	# (%edx:%eax) = 0xfffffffffffffff5 = 18446744073709551605
	# si atunci asta impartit la 2 va avea catul
	# 9223372036854775802 care nu incape in eax 
	# e mai mare decat 0xffffffff = 2^32 - 1 = 4294967295
    
    
    
    # ======= IMPARTIRE CU UN NUMAR NEGATIV CU IDIV =======
    
    movl $0xffffffff, %edx
    movl $-11, %eax
    movl $2, %ebx
    idivl %ebx
    
    bpt6:
    # eax tine 0xfffffffb = -5
	# edx tine 0xffffffff = -1
	# deci folosind idivl observ ca s a tinut cont de semn
	# (si ca a compilat in primul rand)
	# de ce restul e negativ??
	# pentru ca pastreaza semnul deimparitului
	# astfel verifica proprietatea: deimp = cat * impartitor + rest
	# -11 = -5 * 2 + (-1) <=>
	# -11 = -10 - 1 => Adevarat
    
    
    
    # ======= mai jos este syscall ul pt exit
    # care imi termina executia programului
    
    movl $1, %eax
    movl $0, %ebx
    int $0x80

