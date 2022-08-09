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
	endbr64						# Terminate Indirect Branch in 64 bit
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
	pushq	%rbp				# Save old base pointer
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
	popq	%rbp
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
	pushq	%rbp                # Save address of previous stack frame   
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp          
	.cfi_def_cfa_register 6
	subq	$48, %rsp           # Create space for local array and variables
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L9
.L13:
	movl	$0, -4(%rbp)
	jmp	.L10
.L12:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %edx
	movl	-4(%rbp), %eax
	movslq	%eax, %rcx
	movq	-24(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, %dl
	jge	.L11
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-9(%rbp), %eax
	movb	%al, (%rdx)
.L11:
	addl	$1, -4(%rbp)
.L10:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L12
	addl	$1, -8(%rbp)
.L9:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L13
	movq	-40(%rbp), %rdx
	movl	-28(%rbp), %ecx
	movq	-24(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	reverse
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	sort, .-sort
	.globl	reverse
	.type	reverse, @function
reverse:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L15
.L20:
	movl	-28(%rbp), %eax
	subl	-8(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -4(%rbp)
	nop
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -4(%rbp)
	jl	.L18
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	je	.L23
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-9(%rbp), %eax
	movb	%al, (%rdx)
	jmp	.L18
.L23:
	nop
.L18:
	addl	$1, -8(%rbp)
.L15:
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -8(%rbp)
	jl	.L20
	movl	$0, -8(%rbp)
	jmp	.L21
.L22:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-40(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	addl	$1, -8(%rbp)
.L21:
	movl	-8(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L22
	nop
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
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
