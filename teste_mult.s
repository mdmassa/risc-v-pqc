	.file	"teste_mult.c"
	.text
	.section	.rodata
.LC0:
	.string	"Resultado acumulado: %d\n"
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
	subq	$16, %rsp
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L3:
	movl	-4(%rbp), %eax
	leal	1(%rax), %ecx
	movl	-4(%rbp), %eax
	movl	$3329, %edx
	movl	%ecx, %esi
	movl	%eax, %edi
	call	multiplicar_coeficientes
	movl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
.L2:
	cmpl	$255, -4(%rbp)
	jle	.L3
	movl	-8(%rbp), %eax
	leaq	.LC0(%rip), %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	multiplicar_coeficientes
	.type	multiplicar_coeficientes, @function
multiplicar_coeficientes:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	%edx, -12(%rbp)
	movl	-4(%rbp), %eax
	imull	-8(%rbp), %eax
	cltd
	idivl	-12(%rbp)
	movl	%edx, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	multiplicar_coeficientes, .-multiplicar_coeficientes
	.ident	"GCC: (GNU) 16.2.1 20260810"
	.section	.note.GNU-stack,"",@progbits
