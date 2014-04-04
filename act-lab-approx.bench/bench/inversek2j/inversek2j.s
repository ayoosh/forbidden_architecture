	.file	"inversek2j.c"
	.section	.rodata
.LC0:
	.string	"Number of iterations: %d\n"
	.align 8
.LC1:
	.string	"Cannot allocate memory for the coordinates an angles!"
	.align 8
.LC6:
	.string	"####################################################################"
	.align 8
.LC8:
	.string	"(t1 = %0.4f, t2 = %0.4f) =========> (x = %0.4f, y = %0.4f)\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	cmpl	$1, -36(%rbp)
	jg	.L2
	movl	$10000, -8(%rbp)
	jmp	.L3
.L2:
	movq	-48(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -8(%rbp)
.L3:
	movl	$.LC0, %eax
	movl	-8(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	-8(%rbp), %eax
	cltq
	salq	$4, %rax
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L4
	movl	$.LC1, %eax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf
	movl	$-1, %eax
	jmp	.L5
.L4:
	movl	$0, -12(%rbp)
	jmp	.L6
.L7:
	call	rand
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	cvtsi2ss	-4(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	divss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	call	rand
	movl	%eax, -4(%rbp)
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	cvtsi2ss	-4(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	divss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movss	%xmm0, (%rax)
	movl	-12(%rbp), %eax
	cltq
	addq	$2, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	$0x00000000, %edx
	movl	%edx, (%rax)
	movl	-12(%rbp), %eax
	cltq
	addq	$3, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	$0x00000000, %edx
	movl	%edx, (%rax)
	movl	$.LC6, %edi
	call	puts
	movl	-12(%rbp), %eax
	cltq
	addq	$3, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm3
	movl	-12(%rbp), %eax
	cltq
	addq	$2, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm2
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm1
	movss	.LC7(%rip), %xmm0
	mulss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm1
	movapd	%xmm0, %xmm4
	divsd	%xmm1, %xmm4
	movapd	%xmm4, %xmm1
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm4
	movss	.LC7(%rip), %xmm0
	mulss	%xmm4, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm4
	divsd	%xmm4, %xmm0
	movl	$.LC8, %eax
	movq	%rax, %rdi
	movl	$4, %eax
	call	printf
	movl	-12(%rbp), %eax
	cltq
	addq	$3, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	addq	-24(%rbp), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	$2, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$1, %rcx
	salq	$2, %rcx
	addq	-24(%rbp), %rcx
	movss	(%rcx), %xmm1
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	-24(%rbp), %rcx
	movss	(%rcx), %xmm0
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	forwardk2j
	movl	-12(%rbp), %eax
	cltq
	addq	$3, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm3
	movl	-12(%rbp), %eax
	cltq
	addq	$2, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm2
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm1
	movss	.LC7(%rip), %xmm0
	mulss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm1
	movapd	%xmm0, %xmm4
	divsd	%xmm1, %xmm4
	movapd	%xmm4, %xmm1
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm4
	movss	.LC7(%rip), %xmm0
	mulss	%xmm4, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm4
	divsd	%xmm4, %xmm0
	movl	$.LC8, %eax
	movq	%rax, %rdi
	movl	$4, %eax
	call	printf
	addl	$4, -12(%rbp)
.L6:
	movl	-8(%rbp), %eax
	sall	$2, %eax
	cmpl	-12(%rbp), %eax
	jg	.L7
	movl	$.LC6, %edi
	call	puts
	movl	$0, -12(%rbp)
	jmp	.L8
.L9:
	movl	$.LC6, %edi
	call	puts
	movl	-12(%rbp), %eax
	cltq
	addq	$3, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm3
	movl	-12(%rbp), %eax
	cltq
	addq	$2, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm2
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm1
	movss	.LC7(%rip), %xmm0
	mulss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm1
	movapd	%xmm0, %xmm4
	divsd	%xmm1, %xmm4
	movapd	%xmm4, %xmm1
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm4
	movss	.LC7(%rip), %xmm0
	mulss	%xmm4, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm4
	divsd	%xmm4, %xmm0
	movl	$.LC8, %eax
	movq	%rax, %rdi
	movl	$4, %eax
	call	printf
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	addq	-24(%rbp), %rdx
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$3, %rcx
	salq	$2, %rcx
	addq	-24(%rbp), %rcx
	movss	(%rcx), %xmm1
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$2, %rcx
	salq	$2, %rcx
	addq	-24(%rbp), %rcx
	movss	(%rcx), %xmm0
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	inversek2j
	movl	-12(%rbp), %eax
	cltq
	addq	$3, %rax
	salq	$2, %rax
	movq	%rax, %rdx
	addq	-24(%rbp), %rdx
	movl	-12(%rbp), %eax
	cltq
	addq	$2, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	addq	$1, %rcx
	salq	$2, %rcx
	addq	-24(%rbp), %rcx
	movss	(%rcx), %xmm1
	movl	-12(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$2, %rcx
	addq	-24(%rbp), %rcx
	movss	(%rcx), %xmm0
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	forwardk2j
	movl	-12(%rbp), %eax
	cltq
	addq	$3, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm3
	movl	-12(%rbp), %eax
	cltq
	addq	$2, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm2
	movl	-12(%rbp), %eax
	cltq
	addq	$1, %rax
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm1
	movss	.LC7(%rip), %xmm0
	mulss	%xmm1, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm1
	movapd	%xmm0, %xmm4
	divsd	%xmm1, %xmm4
	movapd	%xmm4, %xmm1
	movl	-12(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	-24(%rbp), %rax
	movss	(%rax), %xmm4
	movss	.LC7(%rip), %xmm0
	mulss	%xmm4, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	.LC3(%rip), %xmm4
	divsd	%xmm4, %xmm0
	movl	$.LC8, %eax
	movq	%rax, %rdi
	movl	$4, %eax
	call	printf
	addl	$4, -12(%rbp)
.L8:
	movl	-8(%rbp), %eax
	sall	$2, %eax
	cmpl	-12(%rbp), %eax
	jg	.L9
	movl	$.LC6, %edi
	call	puts
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -24(%rbp)
	movl	$0, %eax
.L5:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC2:
	.long	1325400064
	.align 8
.LC3:
	.long	1405670641
	.long	1074340347
	.align 8
.LC4:
	.long	0
	.long	1073741824
	.align 4
.LC7:
	.long	1127481344
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
