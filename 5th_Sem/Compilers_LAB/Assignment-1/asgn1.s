	.file	"asgn1.c"
# GNU C17 (Ubuntu 11.2.0-19ubuntu1) version 11.2.0 (x86_64-linux-gnu)
#	compiled by GNU C version 11.2.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter the string (all lowrer case): "
.LC1:
	.string	"%s"
.LC2:
	.string	"Length of the string: %d\n"
	.align 8
.LC3:
	.string	"The string in descending order: %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$80, %rsp	#,
# asgn1.c:9: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp97
	movq	%rax, -8(%rbp)	# tmp97, D.2417
	xorl	%eax, %eax	# tmp97
# asgn1.c:13:     printf("Enter the string (all lowrer case): ");
	leaq	.LC0(%rip), %rax	#, tmp84
	movq	%rax, %rdi	# tmp84,
	movl	$0, %eax	#,
	call	printf@PLT	#
# asgn1.c:14:     scanf("%s", str);
	leaq	-64(%rbp), %rax	#, tmp85
	movq	%rax, %rsi	# tmp85,
	leaq	.LC1(%rip), %rax	#, tmp86
	movq	%rax, %rdi	# tmp86,
	movl	$0, %eax	#,
	call	__isoc99_scanf@PLT	#
# asgn1.c:16:     len = length(str); //calling length function
	leaq	-64(%rbp), %rax	#, tmp87
	movq	%rax, %rdi	# tmp87,
	call	length	#
	movl	%eax, -68(%rbp)	# tmp88, len
# asgn1.c:17:     printf("Length of the string: %d\n", len);
	movl	-68(%rbp), %eax	# len, tmp89
	movl	%eax, %esi	# tmp89,
	leaq	.LC2(%rip), %rax	#, tmp90
	movq	%rax, %rdi	# tmp90,
	movl	$0, %eax	#,
	call	printf@PLT	#
# asgn1.c:18:     sort(str, len, dest); //calling sorting function
	leaq	-32(%rbp), %rdx	#, tmp91
	movl	-68(%rbp), %ecx	# len, tmp92
	leaq	-64(%rbp), %rax	#, tmp93
	movl	%ecx, %esi	# tmp92,
	movq	%rax, %rdi	# tmp93,
	call	sort	#
# asgn1.c:20:     printf("The string in descending order: %s\n", dest);
	leaq	-32(%rbp), %rax	#, tmp94
	movq	%rax, %rsi	# tmp94,
	leaq	.LC3(%rip), %rax	#, tmp95
	movq	%rax, %rdi	# tmp95,
	movl	$0, %eax	#,
	call	printf@PLT	#
# asgn1.c:21:     return 0;
	movl	$0, %eax	#, _9
# asgn1.c:22: }
	movq	-8(%rbp), %rdx	# D.2417, tmp98
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp98
	je	.L3	#,
	call	__stack_chk_fail@PLT	#
.L3:
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	length
	.type	length, @function
length:
.LFB1:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# str, str
# asgn1.c:26: for(i=0; str[i]!='\0'; i++) //computing length of the string
	movl	$0, -4(%rbp)	#, i
# asgn1.c:26: for(i=0; str[i]!='\0'; i++) //computing length of the string
	jmp	.L5	#
.L6:
# asgn1.c:26: for(i=0; str[i]!='\0'; i++) //computing length of the string
	addl	$1, -4(%rbp)	#, i
.L5:
# asgn1.c:26: for(i=0; str[i]!='\0'; i++) //computing length of the string
	movl	-4(%rbp), %eax	# i, tmp87
	movslq	%eax, %rdx	# tmp87, _1
	movq	-24(%rbp), %rax	# str, tmp88
	addq	%rdx, %rax	# _1, _2
	movzbl	(%rax), %eax	# *_2, _3
# asgn1.c:26: for(i=0; str[i]!='\0'; i++) //computing length of the string
	testb	%al, %al	# _3
	jne	.L6	#,
# asgn1.c:30: return i;
	movl	-4(%rbp), %eax	# i, _8
# asgn1.c:31: }
	popq	%rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE1:
	.size	length, .-length
	.globl	sort
	.type	sort, @function
sort:
.LFB2:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	#,
	movq	%rdi, -24(%rbp)	# str, str
	movl	%esi, -28(%rbp)	# len, len
	movq	%rdx, -40(%rbp)	# dest, dest
# asgn1.c:36: for(i=0; i<len; i++)
	movl	$0, -8(%rbp)	#, i
# asgn1.c:36: for(i=0; i<len; i++)
	jmp	.L9	#
.L13:
# asgn1.c:38: for(j=0; j<len; j++)
	movl	$0, -4(%rbp)	#, j
# asgn1.c:38: for(j=0; j<len; j++)
	jmp	.L10	#
.L12:
# asgn1.c:40: if(str[i]<str[j]) //sorting in ascending order
	movl	-8(%rbp), %eax	# i, tmp97
	movslq	%eax, %rdx	# tmp97, _1
	movq	-24(%rbp), %rax	# str, tmp98
	addq	%rdx, %rax	# _1, _2
	movzbl	(%rax), %edx	# *_2, _3
# asgn1.c:40: if(str[i]<str[j]) //sorting in ascending order
	movl	-4(%rbp), %eax	# j, tmp99
	movslq	%eax, %rcx	# tmp99, _4
	movq	-24(%rbp), %rax	# str, tmp100
	addq	%rcx, %rax	# _4, _5
	movzbl	(%rax), %eax	# *_5, _6
# asgn1.c:40: if(str[i]<str[j]) //sorting in ascending order
	cmpb	%al, %dl	# _6, _3
	jge	.L11	#,
# asgn1.c:42: temp = str[i];
	movl	-8(%rbp), %eax	# i, tmp101
	movslq	%eax, %rdx	# tmp101, _7
	movq	-24(%rbp), %rax	# str, tmp102
	addq	%rdx, %rax	# _7, _8
# asgn1.c:42: temp = str[i];
	movzbl	(%rax), %eax	# *_8, tmp103
	movb	%al, -9(%rbp)	# tmp103, temp
# asgn1.c:43: str[i] = str[j];
	movl	-4(%rbp), %eax	# j, tmp104
	movslq	%eax, %rdx	# tmp104, _9
	movq	-24(%rbp), %rax	# str, tmp105
	addq	%rdx, %rax	# _9, _10
# asgn1.c:43: str[i] = str[j];
	movl	-8(%rbp), %edx	# i, tmp106
	movslq	%edx, %rcx	# tmp106, _11
	movq	-24(%rbp), %rdx	# str, tmp107
	addq	%rcx, %rdx	# _11, _12
# asgn1.c:43: str[i] = str[j];
	movzbl	(%rax), %eax	# *_10, _13
# asgn1.c:43: str[i] = str[j];
	movb	%al, (%rdx)	# _13, *_12
# asgn1.c:44: str[j] = temp;
	movl	-4(%rbp), %eax	# j, tmp108
	movslq	%eax, %rdx	# tmp108, _14
	movq	-24(%rbp), %rax	# str, tmp109
	addq	%rax, %rdx	# tmp109, _15
# asgn1.c:44: str[j] = temp;
	movzbl	-9(%rbp), %eax	# temp, tmp110
	movb	%al, (%rdx)	# tmp110, *_15
.L11:
# asgn1.c:38: for(j=0; j<len; j++)
	addl	$1, -4(%rbp)	#, j
.L10:
# asgn1.c:38: for(j=0; j<len; j++)
	movl	-4(%rbp), %eax	# j, tmp111
	cmpl	-28(%rbp), %eax	# len, tmp111
	jl	.L12	#,
# asgn1.c:36: for(i=0; i<len; i++)
	addl	$1, -8(%rbp)	#, i
.L9:
# asgn1.c:36: for(i=0; i<len; i++)
	movl	-8(%rbp), %eax	# i, tmp112
	cmpl	-28(%rbp), %eax	# len, tmp112
	jl	.L13	#,
# asgn1.c:49: reverse(str,len,dest);
	movq	-40(%rbp), %rdx	# dest, tmp113
	movl	-28(%rbp), %ecx	# len, tmp114
	movq	-24(%rbp), %rax	# str, tmp115
	movl	%ecx, %esi	# tmp114,
	movq	%rax, %rdi	# tmp115,
	call	reverse	#
# asgn1.c:50: }
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
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)	# str, str
	movl	%esi, -28(%rbp)	# len, len
	movq	%rdx, -40(%rbp)	# dest, dest
# asgn1.c:55: for(i=0; i<len/2; i++)
	movl	$0, -8(%rbp)	#, i
# asgn1.c:55: for(i=0; i<len/2; i++)
	jmp	.L15	#
.L20:
# asgn1.c:57: for(j=len-i-1; j>=len/2; j--) //reversing the string
	movl	-28(%rbp), %eax	# len, tmp99
	subl	-8(%rbp), %eax	# i, _1
# asgn1.c:57: for(j=len-i-1; j>=len/2; j--) //reversing the string
	subl	$1, %eax	#, tmp100
	movl	%eax, -4(%rbp)	# tmp100, j
# asgn1.c:57: for(j=len-i-1; j>=len/2; j--) //reversing the string
	nop	
# asgn1.c:57: for(j=len-i-1; j>=len/2; j--) //reversing the string
	movl	-28(%rbp), %eax	# len, tmp112
	movl	%eax, %edx	# tmp112, tmp113
	shrl	$31, %edx	#, tmp113
	addl	%edx, %eax	# tmp113, tmp114
	sarl	%eax	# tmp115
# asgn1.c:57: for(j=len-i-1; j>=len/2; j--) //reversing the string
	cmpl	%eax, -4(%rbp)	# _11, j
	jl	.L18	#,
# asgn1.c:59: if(i==j)
	movl	-8(%rbp), %eax	# i, tmp101
	cmpl	-4(%rbp), %eax	# j, tmp101
	je	.L23	#,
# asgn1.c:62: temp = str[i];
	movl	-8(%rbp), %eax	# i, tmp102
	movslq	%eax, %rdx	# tmp102, _2
	movq	-24(%rbp), %rax	# str, tmp103
	addq	%rdx, %rax	# _2, _3
# asgn1.c:62: temp = str[i];
	movzbl	(%rax), %eax	# *_3, tmp104
	movb	%al, -9(%rbp)	# tmp104, temp
# asgn1.c:63: str[i] = str[j];
	movl	-4(%rbp), %eax	# j, tmp105
	movslq	%eax, %rdx	# tmp105, _4
	movq	-24(%rbp), %rax	# str, tmp106
	addq	%rdx, %rax	# _4, _5
# asgn1.c:63: str[i] = str[j];
	movl	-8(%rbp), %edx	# i, tmp107
	movslq	%edx, %rcx	# tmp107, _6
	movq	-24(%rbp), %rdx	# str, tmp108
	addq	%rcx, %rdx	# _6, _7
# asgn1.c:63: str[i] = str[j];
	movzbl	(%rax), %eax	# *_5, _8
# asgn1.c:63: str[i] = str[j];
	movb	%al, (%rdx)	# _8, *_7
# asgn1.c:64: str[j] = temp;
	movl	-4(%rbp), %eax	# j, tmp109
	movslq	%eax, %rdx	# tmp109, _9
	movq	-24(%rbp), %rax	# str, tmp110
	addq	%rax, %rdx	# tmp110, _10
# asgn1.c:64: str[j] = temp;
	movzbl	-9(%rbp), %eax	# temp, tmp111
	movb	%al, (%rdx)	# tmp111, *_10
# asgn1.c:65: break;
	jmp	.L18	#
.L23:
# asgn1.c:60: break;
	nop	
.L18:
# asgn1.c:55: for(i=0; i<len/2; i++)
	addl	$1, -8(%rbp)	#, i
.L15:
# asgn1.c:55: for(i=0; i<len/2; i++)
	movl	-28(%rbp), %eax	# len, tmp116
	movl	%eax, %edx	# tmp116, tmp117
	shrl	$31, %edx	#, tmp117
	addl	%edx, %eax	# tmp117, tmp118
	sarl	%eax	# tmp119
# asgn1.c:55: for(i=0; i<len/2; i++)
	cmpl	%eax, -8(%rbp)	# _12, i
	jl	.L20	#,
# asgn1.c:69: for(i=0;i<len;i++)
	movl	$0, -8(%rbp)	#, i
# asgn1.c:69: for(i=0;i<len;i++)
	jmp	.L21	#
.L22:
# asgn1.c:70: dest[i]=str[i];
	movl	-8(%rbp), %eax	# i, tmp120
	movslq	%eax, %rdx	# tmp120, _13
	movq	-24(%rbp), %rax	# str, tmp121
	addq	%rdx, %rax	# _13, _14
# asgn1.c:70: dest[i]=str[i];
	movl	-8(%rbp), %edx	# i, tmp122
	movslq	%edx, %rcx	# tmp122, _15
	movq	-40(%rbp), %rdx	# dest, tmp123
	addq	%rcx, %rdx	# _15, _16
# asgn1.c:70: dest[i]=str[i];
	movzbl	(%rax), %eax	# *_14, _17
# asgn1.c:70: dest[i]=str[i];
	movb	%al, (%rdx)	# _17, *_16
# asgn1.c:69: for(i=0;i<len;i++)
	addl	$1, -8(%rbp)	#, i
.L21:
# asgn1.c:69: for(i=0;i<len;i++)
	movl	-8(%rbp), %eax	# i, tmp124
	cmpl	-28(%rbp), %eax	# len, tmp124
	jl	.L22	#,
# asgn1.c:71: }
	nop	
	nop	
	popq	%rbp	#
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
