	.file	"asgn1.c"		# source file name
	.text					
	.section	.rodata		# read-only data section 
	.align 8				# align with 8-byte boundary
.LC0:						# Label for below string
	.string	"Enter the string (all lowrer case): "	# Prompt to get input
.LC1:
	.string	"%s"
.LC2:										# Label for below string
	.string	"Length of the string: %d\n"	# Text to print before result
	.align 8
.LC3:
	.string	"The string in descending order: %s\n"	# Text to print before result
	.text						# Code starts
	.globl	main				# main is a global name
	.type	main, @function		# indicates that main is a function
main:							# start of main
.LFB0:
	.cfi_startproc		
	endbr64						
	pushq	%rbp				# Save address of previous stack frame
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp			# rbp <-- rsp set new stack base pointer 		
	.cfi_def_cfa_register 6
	subq	$80, %rsp			# Create space for local array and variables
	movq	%fs:40, %rax  		# Access value of %fs:40 and store it in %rax 
	movq	%rax, -8(%rbp)		# M[rbp-8] <-- rax
	xorl	%eax, %eax			# equivalent to eax = eax XOR eax = 0
	leaq	.LC0(%rip), %rax	# load the .LC0 string in rax
	movq	%rax, %rdi			# rdi <-- rax
	movl	$0, %eax			# eax <-- 0
	call	printf@PLT			# call printf, return value is in eax
	leaq	-64(%rbp), %rax		# rax <-- (rbp - 64)
	movq	%rax, %rsi			# rsi <-- rax, moves length(str) into rsi which acts as second argument of sort 
	leaq	.LC1(%rip), %rax	# load the .LC1 string in rax
	movq	%rax, %rdi			# rdi <-- rax, rdi is first argument for scanf
	movl	$0, %eax			# eax <-- 0
	call	__isoc99_scanf@PLT	# call scanf
	leaq	-64(%rbp), %rax		# rax <-- (rbp - 64), loads input string (str)  into rax 
	movq	%rax, %rdi			# rdi <-- rax ,move input string (str)  to rdi
	call	length				# call length(str)
	movl	%eax, -68(%rbp)		# M[rbp-68] <-- eax
	movl	-68(%rbp), %eax		# eax <-- M[rbp-68]
	movl	%eax, %esi			# esi <-- eax
	leaq	.LC2(%rip), %rax	# load the .LC2 string in rax for printing
	movq	%rax, %rdi			# rdi <-- rax, rdi is first argument of below printf
	movl	$0, %eax			# eax <-- 0
	call	printf@PLT			# call printf 
	leaq	-32(%rbp), %rdx		# rdx <-- (rbp - 32), moves dest array to rdx (3rd argument of sort)
	movl	-68(%rbp), %ecx		# ecx <-- M[rbp - 68]
	leaq	-64(%rbp), %rax		# rax <-- (rbp - 64)
	movl	%ecx, %esi			# esi <-- ecx
	movq	%rax, %rdi			# moves str to rdi which acts as argument for sort function
	call	sort				# calls sort(str, length, dest)
	leaq	-32(%rbp), %rax		# rax <-- (rbp - 32), loads address of dest in rax
	movq	%rax, %rsi			# rsi <-- rax, moves address of dest to rsi for printing		
	leaq	.LC3(%rip), %rax	# loads the string .LC3 into rax
	movq	%rax, %rdi			# moves addess of .LC3 to rdi, which will act as 1st argument of printf
	movl	$0, %eax			# eax <-- 0
	call	printf@PLT			# call printf with arguments .LC3 and dest
	movl	$0, %eax			# eax <-- 0
	movq	-8(%rbp), %rdx		# rdx <-- M[rbp - 8]
	subq	%fs:40, %rdx		# used to check for corruption
	je	.L3						# if no corruption jump to .L3
	call	__stack_chk_fail@PLT # else call Stack fail
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret							# return
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	length				# length is global name
	.type	length, @function	# length is a function
length:							# length starts
.LFB1:
	.cfi_startproc				# Call Frame Information
	endbr64						# Terminate Indirect Branch in 64 bit
	pushq	%rbp				# Save old base pointer by pushing it into the current stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp			# rbp <-- rsp, Set new stack pointer
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)		# M[rbp-24] <-- rdi
	movl	$0, -4(%rbp)		# M[rbp-4] <-- 0
	jmp	.L5						# jump to .L5
.L6:
	addl	$1, -4(%rbp)		# M[rbp-4] <-- M[rbp-4] + 1
.L5:
	movl	-4(%rbp), %eax		# eax <-- M[rbp - 4]
	movslq	%eax, %rdx			# 
	movq	-24(%rbp), %rax		# rax <-- M[rbp-24]
	addq	%rdx, %rax			# rax <-- rax + rdx
	movzbl	(%rax), %eax		# eax <-- (byte to long)rax
	testb	%al, %al
	jne	.L6
	movl	-4(%rbp), %eax
	popq	%rbp				# pop top of stack into rbp; This restores the previous base pointer saves in line 80
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	length, .-length
	.globl	sort                # sort is a global name 
	.type	sort, @function     # sort is a function
sort:                           # sort starts
.LFB2:                          
	.cfi_startproc              # Call Frame Information
	endbr64                     # Terminate Indirect Branch in 64 bit
	pushq	%rbp                # Save address of previous base pointer by pushing it into the stack   
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp          # rbp <-- rsp, move base pointer to current stack pointer's position           
	.cfi_def_cfa_register 6
	subq	$48, %rsp           # rsp <-- (rsp - 48), Create space for local array and variables
	movq	%rdi, -24(%rbp)     # M[rbp-24] <-- rdi, stores the 1st argument (str) in (rbp-24)   
	movl	%esi, -28(%rbp)     # M[rbp-28] <-- esi, stores the 2nd argument (len) in (rbp-28)
	movq	%rdx, -40(%rbp)     # M[rbp-40] <-- rdx, stores the 3rd argument (dest) in (rbp-40)
	movl	$0, -8(%rbp)        # M[rbp-8] <-- 0, here M[rbp-8] = i
	jmp	.L9                     # jump to .L9
.L13:
	movl	$0, -4(%rbp)        # M[rbp-4] <-- 0, intialize j = 0
	jmp	.L10                    # jump to .L10
.L12:
	movl	-8(%rbp), %eax      # eax <-- M[rbp-8], i.e. assign eax = i
	movslq	%eax, %rdx          # rdx <-- (sign-extended double word to quad word) i
	movq	-24(%rbp), %rax     # rax <-- str
	addq	%rdx, %rax          # rax <-- str + i
	movzbl	(%rax), %edx        # edx <-- (long) str[i]
	movl	-4(%rbp), %eax      # eax <-- j
	movslq	%eax, %rcx          # rcx <-- (quad word) j
	movq	-24(%rbp), %rax     # rax <-- str 
	addq	%rcx, %rax          # rax <-- str + j
	movzbl	(%rax), %eax        # eax <-- (long) str[j]
	cmpb	%al, %dl            # compare al(str[j]) and dl(str[i])
	jge	.L11                    # if( str[i] >= str[j] ) jump to .L11  else we go below and swap str[i] with str[j]
	movl	-8(%rbp), %eax      # eax <-- i
	movslq	%eax, %rdx          # rdx <-- (quad word) i
	movq	-24(%rbp), %rax     # rax <-- str
	addq	%rdx, %rax          # rax <-- str + i 
	movzbl	(%rax), %eax        # eax <-- (long) str[i]
	movb	%al, -9(%rbp)       # M[rbp-9] <-- str[i]
	movl	-4(%rbp), %eax      # eax <-- j
	movslq	%eax, %rdx          # rdx <-- (quad word) j
	movq	-24(%rbp), %rax     # rax <-- str
	addq	%rdx, %rax          # rax <-- str + j
	movl	-8(%rbp), %edx      # edx <-- i
	movslq	%edx, %rcx          # rcx <-- (quad word) i
	movq	-24(%rbp), %rdx     # rdx <-- str
	addq	%rcx, %rdx          # rdx <-- str + i
	movzbl	(%rax), %eax        # eax <-- (long) str[j]
	movb	%al, (%rdx)         # str[i] <-- str[j] 
	movl	-4(%rbp), %eax      # eax <-- j
	movslq	%eax, %rdx          # rdx <-- (quad word) j
	movq	-24(%rbp), %rax     # rax <-- str
	addq	%rax, %rdx          # rdx <-- str + j
	movzbl	-9(%rbp), %eax      # eax <-- (long) str[i]; since, M[rbp-9] = str[i]
	movb	%al, (%rdx)         # str[j] <-- str[i]
.L11:
	addl	$1, -4(%rbp)        # j = j + 1
.L10:
	movl	-4(%rbp), %eax      # eax <-- j
	cmpl	-28(%rbp), %eax     # compare M[rbp-28] (len) and eax (j)
	jl	.L12                    # if j < len jump to .L12
	addl	$1, -8(%rbp)        # i = i + 1
.L9:
	movl	-8(%rbp), %eax      # eax <-- i, here i = M[rbp-8]
	cmpl	-28(%rbp), %eax     # compare M[rbp-28] (len) and eax (i)
	jl	.L13                    # if i < len  jump to .L13
	movq	-40(%rbp), %rdx     # rdx <-- dest, 3rd argument for reverse function
	movl	-28(%rbp), %ecx     # ecx <-- len
	movq	-24(%rbp), %rax     # rax <-- str
	movl	%ecx, %esi          # esi <-- len, 2nd argument for reverse function
	movq	%rax, %rdi          # rdi <-- str, 1sr argument for reverse function
	call	reverse             # call reverse(str, len, dest)
	nop                         # performs no operation
	leave                       # deallocates all the local space and restoes previous base pointer by popping it from stack into rbp
	.cfi_def_cfa 7, 8
	ret                         # return
	.cfi_endproc
.LFE2:
	.size	sort, .-sort
	.globl	reverse             # reverse is a global name
	.type	reverse, @function  # reverse is a function
reverse:                        # reverse function starts
.LFB3:
	.cfi_startproc              # Call Frame Information
	endbr64                     # Terminate Indirect Branch in 64 bit
	pushq	%rbp                # save old base pointer by pushing it into the stack
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp          # rbp <-- rsp, move base pointer to current stack pointer's position
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)     # M[rbp-24] <-- str ( str is present in rdi, 1st function argument )
	movl	%esi, -28(%rbp)     # M[rbp-28] <-- len ( len is present in esi, 2nd function argument )
	movq	%rdx, -40(%rbp)     # M[rbp-40] <-- dest ( dest is present in rdx, 3rd function argument)
	movl	$0, -8(%rbp)        # M[rbp-8] <-- 0 or i <-- 0; here M[rbp-8] represents i
	jmp	.L15                    # jump to .L15
.L20:
	movl	-28(%rbp), %eax     # eax <-- len
	subl	-8(%rbp), %eax      # eax <-- eax - i; hence, eax = len-i
	subl	$1, %eax            # eax <-- eax - 1; hence, eax = len-i-1
	movl	%eax, -4(%rbp)      # j <-- len-i-1; here M[rbp-4] represents j
	nop                         # performs no operation
	movl	-28(%rbp), %eax     # eax <-- len
	movl	%eax, %edx          # edx <-- len
	shrl	$31, %edx           # edx <-- (edx >> 31); hence, edx = (len >> 31), in our case (len >> 31) is always 0 because len is never negative
	addl	%edx, %eax          # eax <-- eax + edx; hence eax = len + (len >> 31) = len + 0; adding (len >> 31) to len helps incase len is negative
	sarl	%eax                # eax <-- (eax >> 1); hence eax = eax/2 = len/2
	cmpl	%eax, -4(%rbp)      # compare len/2 with  j 
	jl	.L18                    # if j < len/2 jump to .L18
	movl	-8(%rbp), %eax		# eax <-- i
	cmpl	-4(%rbp), %eax		# compare j with i
	je	.L23					# if i == j jump to .L23
	movl	-8(%rbp), %eax		# else eax <-- i
	movslq	%eax, %rdx			# rdx <-- (quad word) i
	movq	-24(%rbp), %rax		# rax <-- str
	addq	%rdx, %rax			# rax <-- str + i
	movzbl	(%rax), %eax		# eax <-- (long) str[i]
	movb	%al, -9(%rbp)		# temp <-- str[i], Here M[rbp-9] refers to variable temp
	movl	-4(%rbp), %eax		# eax <-- j
	movslq	%eax, %rdx			# rdx <-- (quad word) j
	movq	-24(%rbp), %rax		# rax <-- str
	addq	%rdx, %rax			# rax <-- str + j
	movl	-8(%rbp), %edx		# edx <-- i
	movslq	%edx, %rcx			# rcx <-- (quad word) i
	movq	-24(%rbp), %rdx		# rdx <-- str
	addq	%rcx, %rdx			# rdx <-- str + i
	movzbl	(%rax), %eax		# eax <-- (long) str[j]
	movb	%al, (%rdx)			# str[i] <-- str[j]
	movl	-4(%rbp), %eax		# eax <-- j
	movslq	%eax, %rdx			# rdx <-- (quad word) j
	movq	-24(%rbp), %rax		# rax <-- str
	addq	%rax, %rdx			# rdx <-- str + j
	movzbl	-9(%rbp), %eax		# eax <-- temp
	movb	%al, (%rdx)			# str[j] <-- temp; here M[str+j] is written as str[j]
	jmp	.L18					# jump to .L18
.L23:
	nop							# performs no operation
.L18:
	addl	$1, -8(%rbp)		# i = i + 1
.L15:
	movl	-28(%rbp), %eax 	# eax <-- len
	movl	%eax, %edx			# edx <-- len
	shrl	$31, %edx			# edx <-- (edx >> 31); hence, edx = (len >> 31), in our case (len >> 31) is always 0 because len is never negative
	addl	%edx, %eax			# eax <-- len + (len >> 31) = len + 0 = len
	sarl	%eax				# eax <-- (eax >> 1); hence eax = eax/2 = len/2
	cmpl	%eax, -8(%rbp)		# compare len/2 with  j 
	jl	.L20					# if j < len/2 jump to .L20			
	movl	$0, -8(%rbp)		# i <-- 0
	jmp	.L21						# jump to .L21
.L22:
	movl	-8(%rbp), %eax		# eax <-- i
	movslq	%eax, %rdx			# rdx <-- (quad word) i
	movq	-24(%rbp), %rax		# rax <-- str
	addq	%rdx, %rax			# rax <-- str + i
	movl	-8(%rbp), %edx		# edx <-- i
	movslq	%edx, %rcx			# rcx <-- (quad word) i
	movq	-40(%rbp), %rdx		# rdx <-- dest
	addq	%rcx, %rdx			# rdx <-- dest + i
	movzbl	(%rax), %eax		# eax <-- (long) str[i]
	movb	%al, (%rdx)			# dest[i] <-- str[i]
	addl	$1, -8(%rbp)		# i = i + 1
.L21:
	movl	-8(%rbp), %eax		# eax <-- i
	cmpl	-28(%rbp), %eax		# compare len with i
	jl	.L22					# if i<len jump to .L22
	nop							# performs no operation
	nop							# performs no operation
	popq	%rbp				# pop top of stack into rbp; This restores the previous base pointer saves in line 190
	.cfi_def_cfa 7, 8
	ret							# return
	.cfi_endproc
.LFE3:
	.size	reverse, .-reverse
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
