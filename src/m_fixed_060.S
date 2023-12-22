#if defined(__GNUC__) && (defined(__m68k__) && !defined(__mcoldfire__))

	.globl	FixedMul060
	.globl	FixedDiv2060

	.arch	68060
	.cpu	68060

FixedMul060:
	fmove.l	4(%sp),fp0
	fmul.l	8(%sp),fp0
	fmul.s	&0f0.0000152587890625,fp0
	fmove.l	fp0,%d0

	rts

FixedDiv2060:
	fmove.l	4(%sp),fp0
	fmove.l	8(%sp),fp1
	fdiv.x		fp1,fp0
	fmul.s		&0f65536.0,fp0
	fmove.l	fp0,d0

	rts

#endif
