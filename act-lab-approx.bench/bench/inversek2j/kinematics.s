	.file	"kinematics.c"
	.globl	l1
	.data
	.align 4
	.type	l1, @object
	.size	l1, 4
l1:
	.long	1056964608
	.globl	l2
	.align 4
	.type	l2, @object
	.size	l2, 4
l2:
	.long	1056964608
	.text
	.globl	forwardk2j
	.type	forwardk2j, @function
forwardk2j:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movss	l1(%rip), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	movss	-4(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	call	cos
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -40(%rbp)
	movss	l2(%rip), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	movss	-4(%rbp), %xmm0
	addss	-8(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	call	cos
	mulsd	-48(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	movss	l1(%rip), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, -56(%rbp)
	movss	-4(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	call	sin
	movsd	-56(%rbp), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -64(%rbp)
	movss	l2(%rip), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, -72(%rbp)
	movss	-4(%rbp), %xmm0
	addss	-8(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	call	sin
	mulsd	-72(%rbp), %xmm0
	addsd	-64(%rbp), %xmm0
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movq	-24(%rbp), %rax
	movss	%xmm0, (%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	forwardk2j, .-forwardk2j
	.globl	inversek2j
	.type	inversek2j, @function
inversek2j:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movss	%xmm0, -4(%rbp)
	movss	%xmm1, -8(%rbp)
	movq	%rdi, -16(%rbp)
	movq	%rsi, -24(%rbp)
	movss	-4(%rbp), %xmm0
	movaps	%xmm0, %xmm1
	mulss	-4(%rbp), %xmm1
	movss	-8(%rbp), %xmm0
	mulss	-8(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	l1(%rip), %xmm2
	movss	l1(%rip), %xmm1
	mulss	%xmm2, %xmm1
	subss	%xmm1, %xmm0
	movss	l2(%rip), %xmm2
	movss	l2(%rip), %xmm1
	mulss	%xmm2, %xmm1
	movaps	%xmm0, %xmm2
	subss	%xmm1, %xmm2
	movaps	%xmm2, %xmm1
	movss	l1(%rip), %xmm0
	addss	%xmm0, %xmm0
	movss	l2(%rip), %xmm2
	mulss	%xmm2, %xmm0
	movaps	%xmm1, %xmm2
	divss	%xmm0, %xmm2
	movaps	%xmm2, %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	call	acos
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movq	-24(%rbp), %rax
	movss	%xmm0, (%rax)
	movss	-8(%rbp), %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	movss	l1(%rip), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, -40(%rbp)
	movss	l2(%rip), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	call	cos
	mulsd	-48(%rbp), %xmm0
	addsd	-40(%rbp), %xmm0
	movsd	-32(%rbp), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	%xmm1, -56(%rbp)
	movss	l2(%rip), %xmm0
	mulss	-4(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movsd	%xmm0, -64(%rbp)
	movq	-24(%rbp), %rax
	movss	(%rax), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	call	sin
	mulsd	-64(%rbp), %xmm0
	movsd	-56(%rbp), %xmm2
	subsd	%xmm0, %xmm2
	movapd	%xmm2, %xmm0
	movss	-4(%rbp), %xmm1
	movaps	%xmm1, %xmm2
	mulss	-4(%rbp), %xmm2
	movss	-8(%rbp), %xmm1
	mulss	-8(%rbp), %xmm1
	addss	%xmm2, %xmm1
	unpcklps	%xmm1, %xmm1
	cvtps2pd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	call	asin
	unpcklpd	%xmm0, %xmm0
	cvtpd2ps	%xmm0, %xmm0
	movq	-16(%rbp), %rax
	movss	%xmm0, (%rax)
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	inversek2j, .-inversek2j
	.ident	"GCC: (Ubuntu/Linaro 4.6.3-1ubuntu5) 4.6.3"
	.section	.note.GNU-stack,"",@progbits
