	.file	1 "lab02_4.c"
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
	.frame	$fp,40,$31		# vars= 32, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$fp,36($sp)
	move	$fp,$sp
	li	$2,100			# 0x64
	sw	$2,4($fp)
	lw	$3,4($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1
	and	$2,$3,$2
	bgez	$2,$L2
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3
	addiu	$2,$2,1
$L2:
	sw	$2,8($fp)
	sw	$0,12($fp)
	li	$2,2			# 0x2
	sw	$2,16($fp)
	.option	pic0
	b	$L3
	nop

	.option	pic2
$L5:
	lw	$3,4($fp)
	lw	$2,16($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L4
	nop

	li	$2,1			# 0x1
	sw	$2,12($fp)
$L4:
	lw	$2,16($fp)
	addiu	$2,$2,1
	sw	$2,16($fp)
$L3:
	lw	$2,4($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,16($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L5
	nop

	lw	$2,12($fp)
	beq	$2,$0,$L6
	nop

	li	$2,2			# 0x2
	sw	$2,8($fp)
$L6:
	lw	$2,8($fp)
	li	$3,1			# 0x1
	beq	$2,$3,$L8
	nop

	li	$3,2			# 0x2
	beq	$2,$3,$L9
	nop

	bne	$2,$0,$L7
	nop

	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
	.option	pic0
	b	$L7
	nop

	.option	pic2
$L8:
	lw	$2,4($fp)
	addiu	$2,$2,2
	sw	$2,20($fp)
$L15:
	sw	$0,24($fp)
	li	$2,2			# 0x2
	sw	$2,28($fp)
	.option	pic0
	b	$L11
	nop

	.option	pic2
$L13:
	lw	$3,20($fp)
	lw	$2,28($fp)
	teq	$2,$0,7
	div	$0,$3,$2
	mfhi	$2
	bne	$2,$0,$L12
	nop

	li	$2,1			# 0x1
	sw	$2,24($fp)
$L12:
	lw	$2,28($fp)
	addiu	$2,$2,1
	sw	$2,28($fp)
$L11:
	lw	$2,4($fp)
	srl	$3,$2,31
	addu	$2,$3,$2
	sra	$2,$2,1
	move	$3,$2
	lw	$2,28($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L13
	nop

	lw	$2,24($fp)
	bne	$2,$0,$L14
	nop

	lw	$2,20($fp)
	sw	$2,4($fp)
	.option	pic0
	b	$L9
	nop

	.option	pic2
$L14:
	lw	$2,20($fp)
	addiu	$2,$2,2
	sw	$2,20($fp)
	.option	pic0
	b	$L15
	nop

	.option	pic2
$L9:
	lw	$2,4($fp)
	addiu	$2,$2,1
	sw	$2,4($fp)
	nop
$L7:
	move	$2,$0
	move	$sp,$fp
	lw	$fp,36($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.3.0-27ubuntu1~18.04) 7.3.0"
