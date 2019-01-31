	.file	1 "lab02_5.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,96,$31		# vars= 64, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-96
	sw	$31,92($sp)
	sw	$fp,88($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,84($fp)
	li	$2,1			# 0x1
	sw	$2,36($fp)
	li	$2,2			# 0x2
	sw	$2,40($fp)
	li	$2,3			# 0x3
	sw	$2,44($fp)
	li	$2,4			# 0x4
	sw	$2,48($fp)
	li	$2,1			# 0x1
	sw	$2,52($fp)
	li	$2,2			# 0x2
	sw	$2,56($fp)
	li	$2,3			# 0x3
	sw	$2,60($fp)
	li	$2,4			# 0x4
	sw	$2,64($fp)
	sw	$0,28($fp)
	.option	pic0
	b	$L2
	nop

	.option	pic2
$L5:
	sw	$0,32($fp)
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L4:
	lw	$2,28($fp)
	sll	$3,$2,1
	lw	$2,32($fp)
	addu	$2,$3,$2
	sll	$2,$2,2
	addiu	$3,$fp,88
	addu	$2,$3,$2
	lw	$3,-52($2)
	lw	$2,28($fp)
	sll	$4,$2,1
	lw	$2,32($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addiu	$4,$fp,88
	addu	$2,$4,$2
	lw	$2,-20($2)
	addu	$3,$3,$2
	lw	$2,28($fp)
	sll	$4,$2,1
	lw	$2,32($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addiu	$4,$fp,88
	addu	$2,$4,$2
	sw	$3,-20($2)
	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)
$L3:
	lw	$2,32($fp)
	slt	$2,$2,2
	bne	$2,$0,$L4
	nop

	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L2:
	lw	$2,28($fp)
	slt	$2,$2,2
	bne	$2,$0,$L5
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,84($fp)
	lw	$3,0($3)
	beq	$4,$3,$L7
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L7:
	move	$sp,$fp
	lw	$31,92($sp)
	lw	$fp,88($sp)
	addiu	$sp,$sp,96
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
