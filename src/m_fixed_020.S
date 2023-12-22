#if defined(__GNUC__) && (defined(__m68k__) && !defined(__mcoldfire__))

	.globl	FixedMul020
	.globl	FixedDiv2020

	.arch	68020
	.cpu	68020

FixedMul020:
	move.l 4(%sp),%d0
	move.l 8(%sp),%d1

	mulsl	%d1,%d1:%d0
	movew	%d1,%d0
	swap	%d0

	rts

FixedDiv2020:
	move.l %d2,-(%sp)
	move.l 8(%sp),%d0

	movel	%d0,d2
	swap	%d0
	movew	%d0,d1
	extl	d1
	clrw	%d0
	divsl	12(%sp),d1:%d0

	move.l (%sp)+,%d2
	rts

#endif
