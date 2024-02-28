* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"synth.c"			
						
						
						
						
						
	.text					
	.globl	___mulsi3			
	.align	2				
						
_dct32:						
	lea (-176,sp),sp			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 216(sp),a6			
						
	move.l 124(a6),d0			
						
	move.l (a6),a0				
	add.l d0,a0				
						
	move.l (a6),d1				
	sub.l d0,d1				
	moveq #12,d0				
	asr.l d0,d1				
						
	move.l d1,d0				
	moveq #10,d2				
	lsl.l d2,d0				
	sub.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	sub.l d1,d0				
						
	move.l 64(a6),d2			
						
	move.l 60(a6),a1			
	add.l d2,a1				
						
	move.l 60(a6),d1			
	sub.l d2,d1				
	moveq #12,d3				
	asr.l d3,d1				
						
	move.l d1,d2				
	add.l d1,d2				
	add.l d1,d2				
	lsl.l #3,d2				
	add.l d2,d1				
	lsl.l #3,d1				
						
	move.l d0,d4				
	add.l d1,d4				
	move.l d4,44(sp)			
						
	sub.l d1,d0				
	asr.l d3,d0				
						
	move.l d0,d1				
	lsl.l #8,d1				
	sub.l d0,d1				
	add.l d1,d1				
	add.l d1,d1				
	sub.l d0,d1				
	move.l d1,d0				
	add.l d1,d0				
	add.l d0,d0				
	move.l d0,76(sp)			
						
	lea (a0,a1.l),a2			
	move.l a2,48(sp)			
						
	move.l a0,d1				
	sub.l a1,d1				
	asr.l d3,d1				
						
	move.l d1,d0				
	lsl.l #8,d0				
	sub.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	sub.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,72(sp)			
						
	move.l 96(a6),d1			
						
	move.l 28(a6),a0			
	add.l d1,a0				
						
	move.l 28(a6),d0			
	sub.l d1,d0				
	asr.l d3,d0				
						
	move.l d0,d1				
	add.l d0,d1				
	add.l d0,d1				
	lsl.l #5,d1				
	sub.l d0,d1				
	add.l d1,d1				
	add.l d1,d1				
	sub.l d0,d1				
	add.l d1,d1				
	add.l d1,d1				
	add.l d1,d0				
	add.l d0,d0				
						
	move.l 92(a6),d1			
						
	move.l 32(a6),a1			
	add.l d1,a1				
						
	move.l 32(a6),d2			
	sub.l d1,d2				
	asr.l d3,d2				
						
	move.l d2,d1				
	add.l d2,d1				
	add.l d2,d1				
	add.l d1,d1				
	add.l d1,d1				
	sub.l d2,d1				
	add.l d1,d1				
	add.l d1,d1				
	sub.l d2,d1				
	lsl.l #5,d1				
	sub.l d2,d1				
	add.l d1,d1				
						
	move.l d0,d2				
	add.l d1,d2				
	move.l d2,52(sp)			
						
	sub.l d1,d0				
	asr.l d3,d0				
						
	move.l d0,d1				
	add.l d0,d1				
	add.l d0,d1				
	lsl.l #3,d1				
	add.l d0,d1				
	lsl.l #4,d1				
	add.l d0,d1				
	move.l d1,92(sp)			
						
	lea (a0,a1.l),a5			
						
	move.l a0,d0				
	sub.l a1,d0				
	asr.l d3,d0				
						
	move.l d0,d1				
	add.l d0,d1				
	add.l d0,d1				
	lsl.l #3,d1				
	add.l d0,d1				
	lsl.l #4,d1				
	add.l d0,d1				
	move.l d1,96(sp)			
						
	move.l 112(a6),a0			
						
	move.l 12(a6),d1			
	add.l a0,d1				
						
	move.l 12(a6),d0			
	sub.l a0,d0				
	asr.l d3,d0				
						
	move.l d0,d2				
	lsl.l #4,d2				
	sub.l d0,d2				
	move.l d2,d3				
	lsl.l #8,d3				
	add.l d3,d2				
	add.l d2,d0				
						
	move.l 76(a6),a1			
						
	move.l 48(a6),a0			
	add.l a1,a0				
						
	move.l 48(a6),d2			
	sub.l a1,d2				
	moveq #12,d4				
	asr.l d4,d2				
						
	move.l d2,a1				
	add.l d2,a1				
	move.l a1,d3				
	add.l d2,d3				
	lsl.l #3,d3				
	sub.l d2,d3				
	move.l d3,d4				
	lsl.l #4,d4				
	move.l d4,a1				
	sub.l d3,a1				
	add.l a1,a1				
	add.l a1,a1				
	sub.l d2,a1				
						
	lea (a1,d0.l),a2			
	move.l a2,56(sp)			
						
	sub.l a1,d0				
	moveq #12,d2				
	asr.l d2,d0				
						
	move.l d0,a1				
	add.l d0,a1				
	move.l a1,d2				
	add.l d0,d2				
	move.l d2,d3				
	lsl.l #5,d3				
	add.l d3,d2				
	lsl.l #4,d2				
	move.l d2,a1				
	sub.l d0,a1				
	add.l a1,a1				
	move.l a1,100(sp)			
						
	lea (a0,d1.l),a1			
	move.l a1,60(sp)			
						
	sub.l a0,d1				
	moveq #12,d0				
	asr.l d0,d1				
						
	move.l d1,d0				
	add.l d1,d0				
	add.l d1,d0				
	move.l d0,d2				
	lsl.l #5,d2				
	add.l d2,d0				
	lsl.l #4,d0				
	sub.l d1,d0				
	add.l d0,d0				
	move.l d0,104(sp)			
						
	move.l 108(a6),d1			
						
	move.l 16(a6),d3			
	add.l d1,d3				
						
	move.l 16(a6),d0			
	sub.l d1,d0				
	moveq #12,d1				
	asr.l d1,d0				
						
	pea 3702.w				
	move.l d0,-(sp)				
	jbsr ___mulsi3				
	addq.l #8,sp				
						
	move.l 80(a6),a1			
						
	move.l 44(a6),a0			
	add.l a1,a0				
						
	move.l 44(a6),d1			
	sub.l a1,d1				
	moveq #12,d2				
	asr.l d2,d1				
						
	move.l d1,a1				
	add.l d1,a1				
	add.l d1,a1				
	add.l a1,a1				
	add.l a1,a1				
	move.l a1,d2				
	add.l d1,d2				
	lsl.l #3,d2				
	sub.l d1,d2				
	move.l d2,d1				
	lsl.l #4,d1				
	add.l d2,d1				
						
	move.l d0,d4				
	add.l d1,d4				
	move.l d4,64(sp)			
						
	sub.l d1,d0				
	moveq #12,d5				
	asr.l d5,d0				
						
	move.l d0,d1				
	add.l d0,d1				
	add.l d1,d1				
	add.l d0,d1				
	move.l d1,d2				
	lsl.l #6,d2				
	add.l d2,d1				
	add.l d1,d1				
	add.l d1,d1				
	sub.l d0,d1				
	add.l d1,d1				
	move.l d1,108(sp)			
						
	lea (a0,d3.l),a4			
						
	sub.l a0,d3				
	asr.l d5,d3				
						
	move.l d3,d0				
	add.l d3,d0				
	add.l d0,d0				
	add.l d3,d0				
	move.l d0,d1				
	lsl.l #6,d1				
	add.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	sub.l d3,d0				
	add.l d0,d0				
	move.l d0,112(sp)			
						
	move.l 120(a6),d0			
						
	move.l 4(a6),a0				
	add.l d0,a0				
						
	move.l 4(a6),d1				
	sub.l d0,d1				
	asr.l d5,d1				
						
	move.l d1,d0				
	lsl.l #6,d0				
	sub.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l d1,d0				
	lsl.l #3,d0				
	add.l d1,d0				
	add.l d0,d0				
	add.l d0,d1				
						
	move.l 68(a6),d2			
						
	move.l 56(a6),a1			
	add.l d2,a1				
						
	move.l 56(a6),d0			
	sub.l d2,d0				
	asr.l d5,d0				
						
	move.l d0,d2				
	add.l d0,d2				
	add.l d2,d2				
	move.l d2,d3				
	add.l d0,d3				
	move.l d3,d2				
	lsl.l #4,d2				
	sub.l d3,d2				
	lsl.l #3,d2				
	add.l d0,d2				
						
	move.l d1,d6				
	add.l d2,d6				
	move.l d6,68(sp)			
						
	sub.l d2,d1				
	asr.l d5,d1				
						
	move.l d1,d0				
	lsl.l #3,d0				
	add.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	sub.l d1,d0				
	move.l d0,d2				
	lsl.l #3,d2				
	sub.l d0,d2				
	lsl.l #4,d2				
	sub.l d1,d2				
	move.l d2,116(sp)			
						
	lea (a0,a1.l),a2			
	move.l a2,40(sp)			
						
	move.l a0,d1				
	sub.l a1,d1				
	asr.l d5,d1				
						
	move.l d1,d0				
	lsl.l #3,d0				
	add.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	sub.l d1,d0				
	move.l d0,d2				
	lsl.l #3,d2				
	sub.l d0,d2				
	lsl.l #4,d2				
	sub.l d1,d2				
	move.l d2,120(sp)			
						
	move.l 100(a6),d0			
						
	move.l 24(a6),d2			
	add.l d0,d2				
						
	move.l 24(a6),d1			
	sub.l d0,d1				
	moveq #12,d0				
	asr.l d0,d1				
						
	move.l d1,d0				
	lsl.l #4,d0				
	add.l d1,d0				
	lsl.l #3,d0				
	move.l d0,a0				
	add.l d1,a0				
	move.l a0,d0				
	add.l a0,d0				
	add.l d0,d0				
	sub.l a0,d0				
	lsl.l #3,d0				
	add.l d1,d0				
						
	move.l 88(a6),a0			
						
	move.l 36(a6),d1			
	add.l a0,d1				
						
	move.l 36(a6),d5			
	sub.l a0,d5				
	moveq #12,d3				
	asr.l d3,d5				
						
	move.l d5,d4				
	lsl.l #4,d4				
	add.l d5,d4				
	lsl.l #4,d4				
	sub.l d5,d4				
	move.l d4,d5				
	lsl.l #3,d5				
	move.l d4,a0				
	add.l d5,a0				
						
	move.l d0,d7				
	add.l a0,d7				
						
	sub.l a0,d0				
	asr.l d3,d0				
						
	move.l d0,d4				
	lsl.l #3,d4				
	add.l d0,d4				
	move.l d4,d5				
	lsl.l #5,d5				
	add.l d5,d4				
	add.l d4,d4				
	add.l d4,d4				
	add.l d4,d0				
						
	move.l d2,a3				
	add.l d1,a3				
						
	sub.l d1,d2				
	asr.l d3,d2				
						
	move.l d2,d1				
	lsl.l #3,d1				
	add.l d2,d1				
	move.l d1,d4				
	lsl.l #5,d4				
	add.l d4,d1				
	add.l d1,d1				
	add.l d1,d1				
	add.l d1,d2				
						
	move.l 116(a6),a0			
						
	move.l 8(a6),d1				
	add.l a0,d1				
						
	move.l 8(a6),d4				
	sub.l a0,d4				
	asr.l d3,d4				
						
	move.l d4,d5				
	lsl.l #5,d5				
	move.l d5,a0				
	sub.l d4,a0				
	move.l a0,d5				
	lsl.l #5,d5				
	move.l d5,a0				
	add.l d4,a0				
	add.l a0,a0				
	add.l a0,a0				
	lea (a0,d4.l),a1			
						
	move.l 72(a6),d5			
						
	move.l 52(a6),a0			
	add.l d5,a0				
						
	move.l 52(a6),d4			
	sub.l d5,d4				
	asr.l d3,d4				
						
	move.l d4,d5				
	lsl.l #5,d5				
	sub.l d4,d5				
	lsl.l #4,d5				
	add.l d4,d5				
	add.l d5,d5				
	add.l d4,d5				
						
	move.l a1,d4				
	add.l d5,d4				
						
	move.l a1,d6				
	sub.l d5,d6				
	asr.l d3,d6				
						
	move.l d6,d5				
	lsl.l #3,d5				
	sub.l d6,d5				
	move.l d5,d6				
	lsl.l #7,d6				
	add.l d6,d5				
	add.l d5,d5				
	add.l d5,d5				
	move.l d5,124(sp)			
						
	move.l d1,d5				
	add.l a0,d5				
						
	sub.l a0,d1				
	asr.l d3,d1				
						
	move.l d1,d6				
	lsl.l #3,d6				
	sub.l d1,d6				
	move.l d6,d1				
	lsl.l #7,d1				
	add.l d1,d6				
	move.l d6,d1				
	add.l d6,d1				
	add.l d1,d1				
	move.l d1,88(sp)			
						
	move.l 104(a6),a0			
						
	move.l 20(a6),a1			
	add.l a0,a1				
						
	move.l 20(a6),d6			
	sub.l a0,d6				
	moveq #12,d1				
	asr.l d1,d6				
						
	move.l d6,d3				
	lsl.l #3,d3				
	move.l d3,a0				
	sub.l d6,a0				
	move.l a0,d1				
	lsl.l #3,d1				
	move.l d1,a0				
	sub.l d6,a0				
	move.l a0,d3				
	lsl.l #3,d3				
	move.l d3,a0				
	sub.l d6,a0				
	move.l a0,d1				
	lsl.l #3,d1				
	move.l d1,a0				
	add.l d6,a0				
						
	move.l 40(a6),d6			
						
	move.l 84(a6),a2			
						
	lea (a2,d6.l),a6			
						
	sub.l a2,d6				
	moveq #12,d3				
	asr.l d3,d6				
						
	move.l d6,d1				
	lsl.l #5,d1				
	move.l d1,a2				
	add.l d6,a2				
	move.l a2,d3				
	lsl.l #3,d3				
	move.l d3,a2				
	sub.l d6,a2				
	move.l a2,d1				
	lsl.l #3,d1				
	move.l d1,a2				
	add.l d6,a2				
						
	move.l a0,d6				
	add.l a2,d6				
						
	sub.l a2,a0				
	move.l a0,d3				
	moveq #12,d1				
	asr.l d1,d3				
	move.l d3,a0				
						
	lea (a0,d3.l),a2			
	add.l d3,a2				
	move.l a2,d3				
	lsl.l #6,d3				
	move.l d3,a2				
	lea (a2,a0.l),a0			
	lea (a0,a0.l),a2			
	add.l a2,a2				
	add.l a2,a0				
	add.l a0,a0				
						
	lea (a1,a6.l),a2			
						
	sub.l a6,a1				
	move.l a1,d3				
	asr.l d1,d3				
	move.l d3,a1				
						
	lea (a1,d3.l),a6			
	add.l d3,a6				
	move.l a6,d1				
	lsl.l #6,d1				
	move.l d1,a6				
	lea (a6,d3.l),a1			
	lea (a1,a1.l),a6			
	add.l a6,a6				
	add.l a6,a1				
	add.l a1,a1				
						
	move.l 48(sp),d3			
	add.l a5,d3				
	move.l d3,80(sp)			
						
	move.l 48(sp),a6			
	sub.l a5,a6				
	move.l a6,d1				
	moveq #12,d3				
	asr.l d3,d1				
	move.l d1,a6				
						
	lsl.l #6,d1				
	move.l d1,a5				
	sub.l a6,a5				
	add.l a5,a5				
	add.l a5,a5				
	sub.l a6,a5				
	move.l a5,d1				
	lsl.l #4,d1				
	move.l d1,a5				
	add.l a6,a5				
	move.l a5,148(sp)			
						
	move.l 60(sp),d3			
	add.l a4,d3				
	move.l d3,48(sp)			
						
	move.l 60(sp),a5			
	sub.l a4,a5				
	move.l a5,d1				
	moveq #12,d3				
	asr.l d3,d1				
	move.l d1,a4				
						
	lea (a4,d1.l),a5			
	add.l d1,a5				
	move.l a5,d1				
	lsl.l #3,d1				
	move.l d1,a5				
	add.l a4,a5				
	move.l a5,d3				
	lsl.l #5,d3				
	move.l d3,a5				
	sub.l a4,a5				
	move.l a5,152(sp)			
						
	move.l 40(sp),d1			
	add.l a3,d1				
	move.l d1,60(sp)			
						
	move.l 40(sp),d3			
	sub.l a3,d3				
	moveq #12,d1				
	asr.l d1,d3				
	move.l d3,a3				
						
	lsl.l #3,d3				
	sub.l a3,d3				
	lsl.l #3,d3				
	add.l a3,d3				
	add.l d3,d3				
	add.l d3,d3				
	sub.l a3,d3				
	move.l d3,d1				
	lsl.l #4,d1				
	move.l d1,a3				
	sub.l d3,a3				
	move.l a3,156(sp)			
						
	lea (a2,d5.l),a6			
						
	sub.l a2,d5				
	moveq #12,d3				
	asr.l d3,d5				
						
	move.l d5,d3				
	lsl.l #3,d3				
	add.l d5,d3				
	add.l d3,d3				
	add.l d3,d3				
	sub.l d5,d3				
	move.l d3,d5				
	lsl.l #6,d5				
	add.l d5,d3				
	move.l d3,160(sp)			
						
	move.l 44(sp),d5			
	add.l 52(sp),d5				
	move.l d5,84(sp)			
						
	move.l 44(sp),d5			
	sub.l 52(sp),d5				
	moveq #12,d1				
	asr.l d1,d5				
						
	move.l d5,d3				
	lsl.l #6,d3				
	sub.l d5,d3				
	add.l d3,d3				
	add.l d3,d3				
	sub.l d5,d3				
	lsl.l #4,d3				
	add.l d5,d3				
	move.l d3,164(sp)			
						
	move.l 56(sp),d3			
	add.l 64(sp),d3				
	move.l d3,44(sp)			
						
	move.l 56(sp),d3			
	sub.l 64(sp),d3				
	asr.l d1,d3				
						
	move.l d3,d5				
	add.l d3,d5				
	add.l d3,d5				
	lsl.l #3,d5				
	add.l d3,d5				
	lsl.l #5,d5				
	sub.l d3,d5				
	move.l d5,168(sp)			
						
	move.l 68(sp),d5			
	add.l d7,d5				
	move.l d5,52(sp)			
						
	move.l 68(sp),d5			
	sub.l d7,d5				
	asr.l d1,d5				
						
	move.l d5,d3				
	lsl.l #3,d3				
	sub.l d5,d3				
	lsl.l #3,d3				
	add.l d5,d3				
	add.l d3,d3				
	add.l d3,d3				
	sub.l d5,d3				
	move.l d3,d5				
	lsl.l #4,d5				
	sub.l d3,d5				
	move.l d5,172(sp)			
						
	move.l d4,d7				
	add.l d6,d7				
	move.l d7,56(sp)			
						
	sub.l d6,d4				
	asr.l d1,d4				
						
	move.l d4,d3				
	lsl.l #3,d3				
	add.l d4,d3				
	add.l d3,d3				
	add.l d3,d3				
	sub.l d4,d3				
	move.l d3,d4				
	lsl.l #6,d4				
	add.l d4,d3				
	move.l d3,176(sp)			
						
	move.l 72(sp),d1			
	add.l 96(sp),d1				
	move.l d1,64(sp)			
						
	move.l 72(sp),d4			
	sub.l 96(sp),d4				
	moveq #12,d3				
	asr.l d3,d4				
						
	move.l d4,d3				
	lsl.l #6,d3				
	sub.l d4,d3				
	add.l d3,d3				
	add.l d3,d3				
	sub.l d4,d3				
	lsl.l #4,d3				
	add.l d4,d3				
	move.l d3,180(sp)			
						
	move.l 104(sp),a5			
	add.l 112(sp),a5			
						
	move.l 104(sp),d3			
	sub.l 112(sp),d3			
	moveq #12,d4				
	asr.l d4,d3				
						
	move.l d3,d4				
	add.l d3,d4				
	add.l d3,d4				
	lsl.l #3,d4				
	add.l d3,d4				
	lsl.l #5,d4				
	sub.l d3,d4				
	move.l d4,184(sp)			
						
	move.l 120(sp),d5			
	add.l d2,d5				
	move.l d5,68(sp)			
						
	move.l 120(sp),d3			
	sub.l d2,d3				
	moveq #12,d6				
	asr.l d6,d3				
						
	move.l d3,d2				
	lsl.l #3,d2				
	sub.l d3,d2				
	lsl.l #3,d2				
	add.l d3,d2				
	add.l d2,d2				
	add.l d2,d2				
	sub.l d3,d2				
	move.l d2,d3				
	lsl.l #4,d3				
	sub.l d2,d3				
	move.l d3,188(sp)			
						
	move.l 88(sp),a4			
	add.l a1,a4				
						
	move.l 88(sp),d1			
	sub.l a1,d1				
	asr.l d6,d1				
						
	move.l d1,d2				
	lsl.l #3,d2				
	add.l d1,d2				
	add.l d2,d2				
	add.l d2,d2				
	sub.l d1,d2				
	move.l d2,d1				
	lsl.l #6,d1				
	add.l d1,d2				
	move.l d2,192(sp)			
						
	move.l 76(sp),d7			
	add.l 92(sp),d7				
	move.l d7,72(sp)			
						
	move.l 76(sp),d2			
	sub.l 92(sp),d2				
	asr.l d6,d2				
						
	move.l d2,d1				
	lsl.l #6,d1				
	sub.l d2,d1				
	add.l d1,d1				
	add.l d1,d1				
	sub.l d2,d1				
	lsl.l #4,d1				
	add.l d2,d1				
	move.l d1,196(sp)			
						
	move.l 100(sp),a3			
	add.l 108(sp),a3			
						
	move.l 100(sp),d1			
	sub.l 108(sp),d1			
	asr.l d6,d1				
						
	move.l d1,a1				
	add.l d1,a1				
	move.l a1,d2				
	add.l d1,d2				
	lsl.l #3,d2				
	add.l d1,d2				
	lsl.l #5,d2				
	sub.l d1,d2				
	move.l d2,200(sp)			
						
	move.l 116(sp),d1			
	add.l d0,d1				
	move.l d1,76(sp)			
						
	move.l 116(sp),d1			
	sub.l d0,d1				
	asr.l d6,d1				
						
	move.l d1,d0				
	lsl.l #3,d0				
	sub.l d1,d0				
	lsl.l #3,d0				
	add.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	sub.l d1,d0				
	move.l d0,d1				
	lsl.l #4,d1				
	sub.l d0,d1				
	move.l d1,204(sp)			
						
	move.l 124(sp),a2			
	add.l a0,a2				
						
	move.l 124(sp),d1			
	sub.l a0,d1				
	asr.l d6,d1				
						
	move.l d1,d0				
	lsl.l #3,d0				
	add.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	sub.l d1,d0				
	move.l d0,d1				
	lsl.l #6,d1				
	add.l d1,d0				
	move.l d0,208(sp)			
						
	move.l 80(sp),d0			
	add.l 48(sp),d0				
						
	move.l 60(sp),d1			
	add.l a6,d1				
	move.l 220(sp),a0			
	add.l a0,a0				
	add.l a0,a0				
	move.l 228(sp),a1			
	add.l a0,a1				
						
	move.l d0,d2				
	add.l d1,d2				
	add.l #2048,d2				
	moveq #12,d3				
	asr.l d3,d2				
						
	move.l d2,480(a1)			
	add.l 224(sp),a0			
						
	sub.l d1,d0				
	asr.l d3,d0				
	move.l d0,d1				
	add.l d0,d1				
	add.l d0,d1				
	lsl.l #6,d1				
	add.l d0,d1				
	move.l d1,d2				
	lsl.l #4,d2				
	sub.l d1,d2				
	add.l d2,d0				
	add.l #2048,d0				
	asr.l d3,d0				
						
	move.l d0,(a0)				
						
	move.l 84(sp),d4			
	add.l 44(sp),d4				
	move.l d4,88(sp)			
						
	move.l 52(sp),d5			
	add.l 56(sp),d5				
	move.l d5,92(sp)			
						
	move.l d4,d0				
	add.l d5,d0				
						
	move.l d0,d1				
	add.l #2048,d1				
	asr.l d3,d1				
						
	move.l d1,448(a1)			
						
	move.l 64(sp),d6			
	add.l a5,d6				
	move.l d6,96(sp)			
						
	move.l 68(sp),d7			
	add.l a4,d7				
	move.l d7,100(sp)			
						
	move.l d6,d3				
	add.l d7,d3				
						
	move.l d3,d1				
	add.l #2048,d1				
	moveq #12,d2				
	asr.l d2,d1				
						
	move.l d1,416(a1)			
						
	move.l 72(sp),d4			
	add.l a3,d4				
	move.l d4,104(sp)			
						
	move.l 76(sp),d5			
	add.l a2,d5				
	move.l d5,108(sp)			
						
	move.l d4,d2				
	add.l d5,d2				
						
	move.l d2,d4				
	add.l d2,d4				
						
	sub.l d0,d4				
						
	move.l d4,d0				
	add.l #2048,d0				
	moveq #12,d6				
	asr.l d6,d0				
						
	move.l d0,384(a1)			
						
	move.l 148(sp),d7			
	add.l 152(sp),d7			
	move.l d7,36(sp)			
						
	move.l 156(sp),d6			
	add.l 160(sp),d6			
						
	add.l d6,d7				
	move.l d7,112(sp)			
						
	move.l d7,d1				
	add.l #2048,d1				
	moveq #12,d0				
	asr.l d0,d1				
						
	move.l d1,352(a1)			
						
	move.l 164(sp),d1			
	add.l 168(sp),d1			
	move.l d1,116(sp)			
						
	move.l 172(sp),d5			
	add.l 176(sp),d5			
	move.l d5,120(sp)			
						
	move.l d1,d5				
	add.l 120(sp),d5			
						
	move.l d5,d1				
	add.l d5,d1				
						
	sub.l d4,d1				
						
	move.l d1,d4				
	add.l #2048,d4				
	asr.l d0,d4				
						
	move.l d4,320(a1)			
						
	move.l 180(sp),d7			
	add.l 184(sp),d7			
	move.l d7,124(sp)			
						
	move.l 188(sp),d0			
	add.l 192(sp),d0			
	move.l d0,128(sp)			
						
	move.l d7,d4				
	add.l d0,d4				
						
	move.l d4,d7				
	add.l d4,d7				
						
	sub.l d3,d7				
	move.l d7,132(sp)			
						
	move.l d7,d3				
	add.l #2048,d3				
	moveq #12,d7				
	asr.l d7,d3				
						
	move.l d3,288(a1)			
						
	move.l 196(sp),d0			
	add.l 200(sp),d0			
	move.l d0,136(sp)			
						
	move.l 204(sp),d3			
	add.l 208(sp),d3			
	move.l d3,140(sp)			
						
	add.l d3,d0				
	move.l d0,40(sp)			
						
	move.l d0,d3				
	add.l d0,d3				
						
	move.l d3,d7				
	sub.l d2,d7				
						
	move.l d7,d2				
	add.l d7,d2				
						
	sub.l d1,d2				
	move.l d2,144(sp)			
						
	move.l d2,d1				
	add.l #2048,d1				
	moveq #12,d0				
	asr.l d0,d1				
						
	move.l d1,256(a1)			
						
	move.l 80(sp),d3			
	sub.l 48(sp),d3				
	asr.l d0,d3				
						
	move.l d3,d2				
	lsl.l #4,d2				
	sub.l d3,d2				
	add.l d2,d2				
	move.l d2,d1				
	add.l d2,d1				
	sub.l d3,d1				
	lsl.l #3,d1				
	add.l d3,d1				
	lsl.l #3,d1				
						
	move.l 60(sp),d3			
	sub.l a6,d3				
	asr.l d0,d3				
						
	move.l d3,d2				
	add.l d3,d2				
	add.l d3,d2				
	lsl.l #4,d2				
	add.l d3,d2				
	lsl.l #5,d2				
	sub.l d3,d2				
						
	move.l d1,d3				
	add.l d2,d3				
	move.l d3,48(sp)			
						
	move.l d3,a6				
	lea (2048,a6),a6			
	move.l a6,d3				
	asr.l d0,d3				
						
	move.l d3,224(a1)			
						
	sub.l d2,d1				
	asr.l d0,d1				
	move.l d1,d2				
	add.l d1,d2				
	move.l d2,a6				
	add.l d1,a6				
	move.l a6,d2				
	lsl.l #4,d2				
	sub.l a6,d2				
	add.l d2,d2				
	add.l d2,d2				
	add.l d2,d1				
	lsl.l #5,d1				
	sub.l 48(sp),d1				
	add.l #2048,d1				
	asr.l d0,d1				
						
	move.l d1,256(a0)			
						
	move.l 84(sp),d2			
	sub.l 44(sp),d2				
	asr.l d0,d2				
						
	move.l d2,d1				
	lsl.l #4,d1				
	sub.l d2,d1				
	add.l d1,d1				
	add.l d1,d1				
	sub.l d2,d1				
	lsl.l #3,d1				
	add.l d2,d1				
	lsl.l #3,d1				
	move.l d1,80(sp)			
						
	move.l 52(sp),d1			
	sub.l 56(sp),d1				
	asr.l d0,d1				
						
	move.l d1,d2				
	add.l d1,d2				
	add.l d1,d2				
	lsl.l #4,d2				
	add.l d1,d2				
	lsl.l #5,d2				
	sub.l d1,d2				
	move.l d2,84(sp)			
						
	move.l 80(sp),d0			
	add.l d2,d0				
	move.l d0,44(sp)			
						
	move.l d0,d1				
	add.l d0,d1				
						
	sub.l 144(sp),d1			
	move.l d1,56(sp)			
						
	move.l d1,d2				
	add.l #2048,d2				
	moveq #12,d1				
	asr.l d1,d2				
						
	move.l d2,192(a1)			
						
	move.l 64(sp),d3			
	sub.l a5,d3				
	asr.l d1,d3				
						
	move.l d3,d2				
	lsl.l #4,d2				
	sub.l d3,d2				
	add.l d2,d2				
	add.l d2,d2				
	sub.l d3,d2				
	lsl.l #3,d2				
	add.l d2,d3				
	lsl.l #3,d3				
						
	move.l 68(sp),d2			
	sub.l a4,d2				
	asr.l d1,d2				
						
	move.l d2,a4				
	add.l d2,a4				
	add.l d2,a4				
	move.l a4,d0				
	lsl.l #4,d0				
	move.l d0,a4				
	add.l d2,a4				
	move.l a4,d1				
	lsl.l #5,d1				
	move.l d1,a4				
	sub.l d2,a4				
	move.l a4,68(sp)			
						
	lea (a4,d3.l),a5			
						
	move.l a5,d2				
	add.l a5,d2				
						
	sub.l 132(sp),d2			
	move.l d2,60(sp)			
						
	add.l #2048,d2				
	moveq #12,d0				
	asr.l d0,d2				
						
	move.l d2,160(a1)			
						
	move.l 72(sp),d2			
	sub.l a3,d2				
	asr.l d0,d2				
						
	move.l d2,d1				
	lsl.l #4,d1				
	move.l d1,a3				
	sub.l d2,a3				
	add.l a3,a3				
	add.l a3,a3				
	sub.l d2,a3				
	move.l a3,d0				
	lsl.l #3,d0				
	add.l d0,d2				
	lsl.l #3,d2				
						
	move.l 76(sp),a3			
	sub.l a2,a3				
	move.l a3,d1				
	moveq #12,d0				
	asr.l d0,d1				
	move.l d1,a2				
						
	lea (a2,d1.l),a3			
	add.l d1,a3				
	move.l a3,d1				
	lsl.l #4,d1				
	move.l d1,a3				
	add.l a2,a3				
	move.l a3,d0				
	lsl.l #5,d0				
	move.l d0,a3				
	sub.l a2,a3				
	move.l a3,72(sp)			
						
	move.l a3,d1				
	add.l d2,d1				
	move.l d1,48(sp)			
						
	move.l d1,a2				
	add.l d1,a2				
						
	sub.l d7,a2				
	move.l a2,52(sp)			
						
	add.l a2,a2				
						
	sub.l 56(sp),a2				
	move.l a2,a6				
						
	move.l a2,d1				
	add.l #2048,d1				
	moveq #12,d7				
	asr.l d7,d1				
						
	move.l d1,128(a1)			
						
	move.l 148(sp),d1			
	sub.l 152(sp),d1			
	asr.l d7,d1				
						
	move.l d1,d0				
	lsl.l #4,d0				
	move.l d0,a2				
	sub.l d1,a2				
	add.l a2,a2				
	add.l a2,a2				
	sub.l d1,a2				
	move.l a2,d7				
	lsl.l #3,d7				
	add.l d7,d1				
	lsl.l #3,d1				
						
	move.l 156(sp),a3			
	sub.l 160(sp),a3			
	move.l a3,d0				
	moveq #12,d7				
	asr.l d7,d0				
	move.l d0,a3				
						
	lea (a3,d0.l),a2			
	add.l d0,a2				
	move.l a2,d0				
	lsl.l #4,d0				
	move.l d0,a2				
	add.l a3,a2				
	move.l a2,d7				
	lsl.l #5,d7				
	move.l d7,a2				
	sub.l a3,a2				
						
	lea (a2,d1.l),a4			
						
	lea (a4,a4.l),a3			
						
	sub.l 112(sp),a3			
						
	move.l a3,d7				
	add.l #2048,d7				
	moveq #12,d0				
	asr.l d0,d7				
						
	move.l d7,96(a1)			
						
	move.l 36(sp),d0			
	sub.l d6,d0				
	moveq #12,d6				
	asr.l d6,d0				
						
	move.l d0,d6				
	add.l d0,d6				
	move.l d6,d7				
	add.l d0,d7				
	move.l d7,d6				
	lsl.l #4,d6				
	sub.l d7,d6				
	add.l d6,d6				
	add.l d6,d6				
	add.l d6,d0				
	lsl.l #5,d0				
						
	sub.l a3,d0				
						
	move.l d0,d6				
	add.l #2048,d6				
	moveq #12,d7				
	asr.l d7,d6				
						
	move.l d6,128(a0)			
						
	sub.l a2,d1				
	asr.l d7,d1				
	move.l d1,d6				
	add.l d1,d6				
	move.l d6,d7				
	add.l d1,d7				
	move.l d7,d6				
	lsl.l #4,d6				
	sub.l d7,d6				
	add.l d6,d6				
	add.l d6,d6				
	add.l d6,d1				
	lsl.l #5,d1				
	sub.l a4,d1				
	add.l d1,d1				
	sub.l d0,d1				
	add.l #2048,d1				
	moveq #12,d0				
	asr.l d0,d1				
						
	move.l d1,384(a0)			
						
	move.l 164(sp),d6			
	sub.l 168(sp),d6			
	asr.l d0,d6				
						
	move.l d6,d0				
	lsl.l #4,d0				
	sub.l d6,d0				
	add.l d0,d0				
	move.l d0,d1				
	add.l d0,d1				
	sub.l d6,d1				
	lsl.l #3,d1				
	add.l d6,d1				
	lsl.l #3,d1				
						
	move.l 172(sp),d0			
	sub.l 176(sp),d0			
	moveq #12,d6				
	asr.l d6,d0				
						
	move.l d0,d6				
	add.l d0,d6				
	add.l d0,d6				
	lsl.l #4,d6				
	add.l d0,d6				
	lsl.l #5,d6				
	sub.l d0,d6				
	move.l d6,76(sp)			
						
	move.l d6,a3				
	add.l d1,a3				
						
	move.l a3,d6				
	add.l a3,d6				
						
	sub.l d5,d6				
						
	move.l d6,d0				
	add.l d6,d0				
						
	sub.l a6,d0				
	move.l d0,64(sp)			
						
	add.l #2048,d0				
	moveq #12,d7				
	asr.l d7,d0				
						
	move.l d0,64(a1)			
						
	move.l 116(sp),d0			
	sub.l 120(sp),d0			
	asr.l d7,d0				
						
	move.l d0,d5				
	add.l d0,d5				
	move.l d5,d7				
	add.l d0,d7				
	move.l d7,d5				
	lsl.l #4,d5				
	sub.l d7,d5				
	add.l d5,d5				
	add.l d5,d5				
	add.l d5,d0				
	lsl.l #5,d0				
						
	sub.l d6,d0				
	move.l d0,56(sp)			
						
	move.l 180(sp),d6			
	sub.l 184(sp),d6			
	moveq #12,d0				
	asr.l d0,d6				
						
	move.l d6,d5				
	lsl.l #4,d5				
	sub.l d6,d5				
	add.l d5,d5				
	move.l d5,d0				
	add.l d5,d0				
	sub.l d6,d0				
	lsl.l #3,d0				
	add.l d6,d0				
	lsl.l #3,d0				
						
	move.l 188(sp),d6			
	sub.l 192(sp),d6			
	moveq #12,d5				
	asr.l d5,d6				
						
	move.l d6,d5				
	add.l d6,d5				
	add.l d6,d5				
	lsl.l #4,d5				
	add.l d6,d5				
	lsl.l #5,d5				
	sub.l d6,d5				
						
	move.l d0,a4				
	add.l d5,a4				
						
	move.l a4,d7				
	add.l a4,d7				
						
	sub.l d4,d7				
						
	move.l d7,a6				
	add.l d7,a6				
						
	sub.l 60(sp),a6				
						
	move.l a6,d4				
	add.l #2048,d4				
	moveq #12,d6				
	asr.l d6,d4				
						
	move.l d4,32(a1)			
						
	move.l 96(sp),d4			
	sub.l 100(sp),d4			
	asr.l d6,d4				
						
	move.l d4,d6				
	add.l d4,d6				
	move.l d6,a2				
	add.l d4,a2				
	move.l a2,d6				
	lsl.l #4,d6				
	sub.l a2,d6				
	add.l d6,d6				
	add.l d6,d6				
	add.l d6,d4				
	lsl.l #5,d4				
						
	move.l d4,a2				
	sub.l a6,a2				
						
	move.l a2,d4				
	add.l #2048,d4				
	moveq #12,d6				
	asr.l d6,d4				
						
	move.l d4,64(a0)			
						
	move.l 124(sp),d4			
	sub.l 128(sp),d4			
	asr.l d6,d4				
						
	move.l d4,d6				
	add.l d4,d6				
	move.l d6,a6				
	add.l d4,a6				
	move.l a6,d6				
	lsl.l #4,d6				
	sub.l a6,d6				
	add.l d6,d6				
	add.l d6,d6				
	add.l d6,d4				
	lsl.l #5,d4				
						
	sub.l d7,d4				
						
	move.l d4,d6				
	add.l d4,d6				
						
	move.l d6,a6				
	sub.l a2,a6				
						
	move.l a6,d7				
	add.l #2048,d7				
	moveq #12,d6				
	asr.l d6,d7				
						
	move.l d7,192(a0)			
						
	sub.l 68(sp),d3				
	asr.l d6,d3				
						
	move.l d3,d7				
	add.l d3,d7				
	move.l d7,a2				
	add.l d3,a2				
	move.l a2,d7				
	lsl.l #4,d7				
	sub.l a2,d7				
	add.l d7,d7				
	add.l d7,d7				
	add.l d7,d3				
	lsl.l #5,d3				
						
	sub.l a5,d3				
						
	add.l d3,d3				
						
	sub.l a6,d3				
						
	move.l d3,d6				
	add.l #2048,d6				
	moveq #12,d7				
	asr.l d7,d6				
						
	move.l d6,320(a0)			
						
	sub.l d5,d0				
	asr.l d7,d0				
	move.l d0,d5				
	add.l d0,d5				
	move.l d5,d6				
	add.l d0,d6				
	move.l d6,d5				
	lsl.l #4,d5				
	sub.l d6,d5				
	add.l d5,d5				
	add.l d5,d5				
	add.l d5,d0				
	lsl.l #5,d0				
	sub.l a4,d0				
	add.l d0,d0				
	sub.l d4,d0				
	add.l d0,d0				
	sub.l d3,d0				
	add.l #2048,d0				
	asr.l d7,d0				
						
	move.l d0,448(a0)			
						
	move.l 196(sp),d4			
	sub.l 200(sp),d4			
	asr.l d7,d4				
						
	move.l d4,d3				
	lsl.l #4,d3				
	sub.l d4,d3				
	add.l d3,d3				
	move.l d3,d0				
	add.l d3,d0				
	sub.l d4,d0				
	lsl.l #3,d0				
	add.l d4,d0				
	lsl.l #3,d0				
						
	move.l 204(sp),d3			
	sub.l 208(sp),d3			
	asr.l d7,d3				
						
	move.l d3,d4				
	add.l d3,d4				
	add.l d3,d4				
	lsl.l #4,d4				
	add.l d3,d4				
	lsl.l #5,d4				
	move.l d4,a5				
	sub.l d3,a5				
						
	move.l d0,d6				
	add.l a5,d6				
						
	move.l d6,d5				
	add.l d6,d5				
						
	sub.l 40(sp),d5				
						
	move.l d5,a2				
	add.l d5,a2				
						
	sub.l 52(sp),a2				
						
	move.l 104(sp),d3			
	sub.l 108(sp),d3			
	asr.l d7,d3				
						
	move.l d3,d7				
	add.l d3,d7				
	move.l d7,a4				
	add.l d3,a4				
	move.l a4,d7				
	lsl.l #4,d7				
	sub.l a4,d7				
	add.l d7,d7				
	add.l d7,d7				
	add.l d3,d7				
	lsl.l #5,d7				
						
	sub.l a2,d7				
						
	add.l a2,a2				
						
	sub.l 64(sp),a2				
						
	move.l a2,d4				
	add.l #2048,d4				
	moveq #12,d3				
	asr.l d3,d4				
						
	move.l d4,(a1)				
						
	move.l 88(sp),d3			
	sub.l 92(sp),d3				
	moveq #12,d4				
	asr.l d4,d3				
						
	move.l d3,a1				
	add.l d3,a1				
	lea (a1,d3.l),a4			
	move.l a4,d4				
	lsl.l #4,d4				
	move.l d4,a1				
	sub.l a4,a1				
	add.l a1,a1				
	add.l a1,a1				
	add.l a1,d3				
	lsl.l #5,d3				
						
	move.l d3,a4				
	sub.l a2,a4				
						
	lea (2048,a4),a1			
	move.l a1,d3				
	moveq #12,d4				
	asr.l d4,d3				
						
	move.l d3,32(a0)			
						
	move.l d7,a1				
	add.l d7,a1				
						
	sub.l a4,a1				
						
	move.l a1,d3				
	add.l #2048,d3				
	asr.l d4,d3				
						
	move.l d3,96(a0)			
						
	move.l 56(sp),a2			
	add.l a2,a2				
						
	sub.l a1,a2				
						
	move.l a2,d3				
	add.l #2048,d3				
	asr.l d4,d3				
						
	move.l d3,160(a0)			
						
	move.l 136(sp),d3			
	sub.l 140(sp),d3			
	asr.l d4,d3				
						
	move.l d3,a1				
	add.l d3,a1				
	lea (a1,d3.l),a4			
	move.l a4,d4				
	lsl.l #4,d4				
	move.l d4,a1				
	sub.l a4,a1				
	add.l a1,a1				
	add.l a1,a1				
	add.l a1,d3				
	lsl.l #5,d3				
						
	sub.l d5,d3				
						
	move.l d3,a1				
	add.l d3,a1				
						
	sub.l d7,a1				
						
	move.l a1,d7				
	add.l a1,d7				
						
	sub.l a2,d7				
						
	move.l d7,d5				
	add.l #2048,d5				
	moveq #12,d4				
	asr.l d4,d5				
						
	move.l d5,224(a0)			
						
	move.l 80(sp),d5			
	sub.l 84(sp),d5				
	asr.l d4,d5				
						
	move.l d5,a2				
	add.l d5,a2				
	lea (a2,d5.l),a4			
	move.l a4,d4				
	lsl.l #4,d4				
	move.l d4,a2				
	sub.l a4,a2				
	add.l a2,a2				
	add.l a2,a2				
	add.l a2,d5				
	lsl.l #5,d5				
						
	sub.l 44(sp),d5				
						
	add.l d5,d5				
						
	sub.l d7,d5				
						
	move.l d5,d7				
	add.l #2048,d7				
	moveq #12,d4				
	asr.l d4,d7				
						
	move.l d7,288(a0)			
						
	sub.l 72(sp),d2				
	asr.l d4,d2				
						
	move.l d2,d7				
	add.l d2,d7				
	move.l d7,a2				
	add.l d2,a2				
	move.l a2,d7				
	lsl.l #4,d7				
	sub.l a2,d7				
	add.l d7,d7				
	add.l d7,d7				
	add.l d7,d2				
	lsl.l #5,d2				
						
	sub.l 48(sp),d2				
						
	add.l d2,d2				
						
	sub.l a1,d2				
						
	move.l d2,a1				
	add.l d2,a1				
						
	sub.l d5,a1				
						
	move.l a1,d5				
	add.l #2048,d5				
	asr.l d4,d5				
						
	move.l d5,352(a0)			
						
	sub.l 76(sp),d1				
	asr.l d4,d1				
						
	move.l d1,d5				
	add.l d1,d5				
	move.l d5,d7				
	add.l d1,d7				
	move.l d7,d5				
	lsl.l #4,d5				
	sub.l d7,d5				
	add.l d5,d5				
	add.l d5,d5				
	add.l d5,d1				
	lsl.l #5,d1				
						
	sub.l a3,d1				
						
	add.l d1,d1				
						
	sub.l 56(sp),d1				
						
	add.l d1,d1				
						
	sub.l a1,d1				
						
	move.l d1,d5				
	add.l #2048,d5				
	asr.l d4,d5				
						
	move.l d5,416(a0)			
						
	sub.l a5,d0				
	asr.l d4,d0				
	move.l d0,a1				
	add.l d0,a1				
	move.l a1,d4				
	add.l d0,d4				
	move.l d4,d5				
	lsl.l #4,d5				
	move.l d5,a1				
	sub.l d4,a1				
	add.l a1,a1				
	add.l a1,a1				
	add.l a1,d0				
	lsl.l #5,d0				
	sub.l d6,d0				
	add.l d0,d0				
	sub.l d3,d0				
	add.l d0,d0				
	sub.l d2,d0				
	add.l d0,d0				
	sub.l d1,d0				
	add.l #2048,d0				
	moveq #12,d5				
	asr.l d5,d0				
						
	move.l d0,480(a0)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (176,sp),sp				
	rts					
						
	.align	2				
						
_synth_full:					
	lea (-56,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 96(sp),a0			
	lea (4108,a0),a0			
	move.l a0,68(sp)			
	moveq #48,d1				
	add.l 100(sp),d1			
	move.l d1,64(sp)			
						
	clr.l 52(sp)				
						
	lea ___mulsi3,a3			
_?L3:						
						
	move.l 52(sp),a1			
	cmp.l 104(sp),a1			
	jbne _?L7				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (56,sp),sp				
	rts					
_?L7:						
						
	move.l 96(sp),a0			
	move.l 4096(a0),44(sp)			
	move.l 52(sp),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,56(sp)			
	move.w #124,a1				
	add.l 68(sp),a1				
	move.l a1,48(sp)			
						
	move.l 64(sp),72(sp)			
						
	clr.l 60(sp)				
						
	move.l d0,a0				
	addq.l #2,a0				
	move.l a0,88(sp)			
_?L4:						
						
	move.l 60(sp),a0			
	cmp.l 108(sp),a0			
	jbne _?L6				
						
	addq.l #1,52(sp)			
	add.l #4608,68(sp)			
	add.l #4608,64(sp)			
	jbra _?L3				
_?L6:						
						
	moveq #1,d5				
	and.l 44(sp),d5				
	move.l 56(sp),a1			
	lea 2(a1,d5.l),a1			
	move.l a1,d0				
	moveq #9,d1				
	lsl.l d1,d0				
						
	move.l d0,d1				
	add.l #-1024,d1				
	move.l 96(sp),a5			
	add.l d1,a5				
						
	move.l 96(sp),a0			
	pea (a0,d0.l)				
	move.l a5,-(sp)				
	move.l 52(sp),d0			
	lsr.l #1,d0				
	move.l d0,-(sp)				
	move.l 84(sp),-(sp)			
	jbsr _dct32				
	lea (16,sp),sp				
	move.l d5,d7				
	eor.w #1,d7				
						
	move.l 88(sp),d0			
	add.l d7,d0				
	moveq #9,d1				
	lsl.l d1,d0				
	move.l d0,a6				
	add.l 96(sp),a6				
						
	move.l 44(sp),d1			
	subq.l #1,d1				
						
	moveq #14,d0				
	and.l d0,d1				
						
	moveq #1,d0				
	or.l d0,d1				
						
	add.l d1,d1				
	add.l d1,d1				
						
	move.l d1,d3				
	add.l #_D,d3				
						
	moveq #-2,d0				
	and.l 44(sp),d0				
	move.l d0,a0				
						
	add.l d0,a0				
	add.l a0,a0				
						
	move.l a0,d4				
	add.l #_D,d4				
						
	add.l 56(sp),d5				
	moveq #9,d0				
	lsl.l d0,d5				
	move.l d4,a1				
	move.l (a1),-(sp)			
	move.l 100(sp),a1			
	move.l (a1,d5.l),-(sp)			
	move.l d1,48(sp)			
	move.l a0,44(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l 96(sp),a4			
	add.l d5,a4				
	move.l d4,a1				
	move.l 56(a1),-(sp)			
	move.l 4(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 40(a1),-(sp)			
	move.l 12(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 24(a1),-(sp)			
	move.l 20(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 8(a1),-(sp)			
	move.l 28(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d6,d4				
	add.l d0,d4				
						
	add.l 56(sp),d7				
	moveq #9,d0				
	lsl.l d0,d7				
	move.l 96(sp),a4			
	add.l d7,a4				
	move.l d3,a1				
	move.l 56(a1),-(sp)			
	move.l 4(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d4				
						
	move.l d3,a1				
	move.l (a1),-(sp)			
	move.l 100(sp),a1			
	move.l (a1,d7.l),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d4				
						
	move.l d3,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d4				
						
	move.l d3,a1				
	move.l 40(a1),-(sp)			
	move.l 12(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d4				
						
	move.l d3,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d4				
						
	move.l d3,a1				
	move.l 24(a1),-(sp)			
	move.l 20(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d4				
						
	move.l d3,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d4				
						
	move.w #-120,a1				
	add.l 48(sp),a1				
	move.l a1,76(sp)			
						
	move.l d3,a1				
	move.l 8(a1),-(sp)			
	move.l 28(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
						
	sub.l d0,d4				
						
	asr.l #2,d4				
						
	move.l 48(sp),a1			
	move.l d4,-124(a1)			
	move.l 40(sp),d1			
	move.l d1,d0				
	add.l #128,d0				
	move.l d0,84(sp)			
	move.l d1,d7				
	add.l #_D+128,d7			
	move.l 36(sp),a0			
	move.l a0,d6				
	add.l #_D+128,d6			
	move.l #_D+188,d5			
	sub.l a0,d5				
	move.l #_D+188,d4			
	sub.l d1,d4				
	lea (480,a6),a0				
	move.l a0,80(sp)			
	move.l a1,a0				
						
	move.l a6,a4				
_?L5:						
						
	lea (32,a5),a5				
						
	move.l d6,a1				
	move.l 8(a1),-(sp)			
	move.l 28(a5),-(sp)			
	move.l a0,44(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d3				
						
	move.l d6,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d6,a1				
	move.l 24(a1),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d6,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d6,a1				
	move.l 40(a1),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d6,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d6,a1				
	move.l 56(a1),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d6,a1				
	move.l (a1),-(sp)			
	move.l (a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d7,a1				
	move.l 56(a1),-(sp)			
	move.l 4(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l d7,a1				
	move.l (a1),-(sp)			
	move.l (a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l d7,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l d7,a1				
	move.l 40(a1),-(sp)			
	move.l 12(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l d7,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l d7,a1				
	move.l 24(a1),-(sp)			
	move.l 20(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l d7,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l d7,a1				
	move.l 8(a1),-(sp)			
	move.l 28(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
						
	sub.l d0,d3				
						
	asr.l #2,d3				
						
	move.l 76(sp),a1			
	addq.l #4,76(sp)			
	move.l d3,(a1)+				
						
	move.l d5,a1				
	move.l (a1),-(sp)			
	move.l (a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d3				
						
	move.l d5,a1				
	move.l 8(a1),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d5,a1				
	move.l 16(a1),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d5,a1				
	move.l 24(a1),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d5,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d5,a1				
	move.l 40(a1),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d5,a1				
	move.l 48(a1),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d5,a1				
	move.l 56(a1),-(sp)			
	move.l 28(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d4,a1				
	move.l 56(a1),-(sp)			
	move.l 28(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d4,a1				
	move.l 48(a1),-(sp)			
	move.l 24(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d4,a1				
	move.l 40(a1),-(sp)			
	move.l 20(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d4,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d4,a1				
	move.l 24(a1),-(sp)			
	move.l 12(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d4,a1				
	move.l 16(a1),-(sp)			
	move.l 8(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d4,a1				
	move.l 8(a1),-(sp)			
	move.l 4(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d3				
						
	move.l d4,a1				
	move.l (a1),-(sp)			
	move.l (a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d3,d0				
						
	asr.l #2,d0				
						
	move.l 36(sp),a0			
	move.l d0,(a0)				
						
	lea (32,a4),a4				
						
	subq.l #4,a0				
	add.l #128,d7				
	add.l #128,d6				
	add.l #128,d5				
	add.l #128,d4				
	cmp.l 80(sp),a4				
	jbne _?L5				
						
	move.l 84(sp),a4			
	add.l #_D+1920,a4			
						
	move.l (a4),-(sp)			
	move.l 480(a6),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
						
	move.l 56(a4),-(sp)			
	move.l 484(a6),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 48(a4),-(sp)			
	move.l 488(a6),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 40(a4),-(sp)			
	move.l 492(a6),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 32(a4),-(sp)			
	move.l 496(a6),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 24(a4),-(sp)			
	move.l 500(a6),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 16(a4),-(sp)			
	move.l 504(a6),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 8(a4),-(sp)			
	move.l 508(a6),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d4,d0				
						
	neg.l d0				
	asr.l #2,d0				
						
	move.l 48(sp),a0			
	move.l d0,-60(a0)			
						
	move.l 44(sp),d0			
	addq.l #1,d0				
						
	moveq #15,d1				
	and.l d0,d1				
	move.l d1,44(sp)			
						
	addq.l #1,60(sp)			
	add.l #128,48(sp)			
	add.l #128,72(sp)			
	jbra _?L4				
						
	.align	2				
						
_synth_half:					
	lea (-52,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 92(sp),a0			
	lea (4108,a0),a0			
	move.l a0,72(sp)			
	moveq #48,d1				
	add.l 96(sp),d1				
	move.l d1,68(sp)			
						
	clr.l 52(sp)				
						
	lea ___mulsi3,a3			
_?L10:						
						
	move.l 52(sp),a1			
	cmp.l 100(sp),a1			
	jbne _?L15				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (52,sp),sp				
	rts					
_?L15:						
						
	move.l 92(sp),a0			
	move.l 4096(a0),48(sp)			
						
	move.l 72(sp),d4			
	move.l 52(sp),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,56(sp)			
						
	move.l 68(sp),76(sp)			
						
	clr.l 60(sp)				
_?L11:						
						
	move.l 60(sp),a0			
	cmp.l 104(sp),a0			
	jbne _?L14				
						
	addq.l #1,52(sp)			
	add.l #4608,72(sp)			
	add.l #4608,68(sp)			
	jbra _?L10				
_?L14:						
						
	moveq #1,d5				
	and.l 48(sp),d5				
	move.l 56(sp),a1			
	lea 2(a1,d5.l),a1			
	move.l a1,d0				
	moveq #9,d1				
	lsl.l d1,d0				
						
	move.l d0,d1				
	add.l #-1024,d1				
	move.l 92(sp),a4			
	add.l d1,a4				
						
	move.l 92(sp),a0			
	pea (a0,d0.l)				
	move.l a4,-(sp)				
	move.l 56(sp),d0			
	lsr.l #1,d0				
	move.l d0,-(sp)				
	move.l 88(sp),-(sp)			
	jbsr _dct32				
	lea (16,sp),sp				
	move.l d5,d2				
	eor.w #1,d2				
						
	move.l 56(sp),a1			
	lea 2(a1,d2.l),a1			
	move.l a1,d0				
	moveq #9,d1				
	lsl.l d1,d0				
	add.l 92(sp),d0				
	move.l d0,44(sp)			
						
	move.l 48(sp),d7			
	subq.l #1,d7				
						
	moveq #14,d0				
	and.l d0,d7				
						
	moveq #1,d1				
	or.l d1,d7				
						
	add.l d7,d7				
	add.l d7,d7				
						
	move.l d7,a6				
	add.l #_D,a6				
						
	moveq #-2,d1				
	and.l 48(sp),d1				
						
	add.l d1,d1				
	add.l d1,d1				
						
	move.l d1,d3				
	add.l #_D,d3				
						
	add.l 56(sp),d5				
	moveq #9,d0				
	lsl.l d0,d5				
	move.l d3,a0				
	move.l (a0),-(sp)			
	move.l 96(sp),a1			
	move.l (a1,d5.l),-(sp)			
	move.l d1,44(sp)			
	move.l d2,48(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l 92(sp),a5			
	add.l d5,a5				
	move.l d3,a0				
	move.l 56(a0),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 40(a0),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 24(a0),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 8(a0),-(sp)			
	move.l 28(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d6,d3				
	add.l d0,d3				
						
	move.l 40(sp),d2			
	add.l 56(sp),d2				
	move.l d2,d5				
	moveq #9,d0				
	lsl.l d0,d5				
	move.l 92(sp),a5			
	add.l d5,a5				
	move.l 56(a6),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l (a6),-(sp)			
	move.l 96(sp),a0			
	move.l (a0,d5.l),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 48(a6),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 40(a6),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 32(a6),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 24(a6),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 16(a6),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 8(a6),-(sp)			
	move.l 28(a5),-(sp)			
	move.l d4,48(sp)			
	jbsr (a3)				
	addq.l #8,sp				
						
	sub.l d0,d3				
						
	asr.l #2,d3				
						
	move.l 40(sp),a0			
	move.l d3,(a0)+				
						
	move.w #60,a1				
	add.l d4,a1				
	move.l a1,64(sp)			
	move.l d7,d0				
	add.l #128,d0				
	move.l d0,84(sp)			
	move.l d7,d5				
	add.l #_D+128,d5			
	move.l 36(sp),d1			
	move.l d1,d4				
	add.l #_D+128,d4			
	move.l #_D+188,d3			
	sub.l d7,d3				
	lea _D+188,a6				
	sub.l d1,a6				
						
	move.l 44(sp),a5			
						
	moveq #1,d1				
_?L13:						
						
	lea (32,a4),a4				
						
	btst #0,d1				
	jbne _?L12				
						
	move.l d4,a1				
	move.l 8(a1),-(sp)			
	move.l 28(a4),-(sp)			
	move.l d1,44(sp)			
	move.l a0,48(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l d4,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 24(a1),-(sp)			
	move.l 20(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 40(a1),-(sp)			
	move.l 12(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 56(a1),-(sp)			
	move.l 4(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l (a1),-(sp)			
	move.l (a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d5,a1				
	move.l 56(a1),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l (a1),-(sp)			
	move.l (a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 40(a1),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 24(a1),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l 40(sp),a0			
	move.l a0,80(sp)			
						
	move.l d5,a0				
	move.l 8(a0),-(sp)			
	move.l 28(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
						
	sub.l d0,d6				
						
	asr.l #2,d6				
						
	move.l 80(sp),a1			
	addq.l #4,80(sp)			
	move.l d6,(a1)+				
						
	move.l d3,a0				
	move.l 56(a0),-(sp)			
	move.l 28(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l d3,a1				
	move.l 48(a1),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 40(a0),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 24(a0),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 16(a1),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 8(a0),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l (a1),-(sp)			
	move.l (a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l (a6),-(sp)			
	move.l (a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 8(a6),-(sp)			
	move.l 4(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 16(a6),-(sp)			
	move.l 8(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 24(a6),-(sp)			
	move.l 12(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 32(a6),-(sp)			
	move.l 16(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 40(a6),-(sp)			
	move.l 20(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 48(a6),-(sp)			
	move.l 24(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 64(sp),d7			
	subq.l #4,d7				
						
	move.l 56(a6),-(sp)			
	move.l 28(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d6,d0				
						
	asr.l #2,d0				
						
	move.l 64(sp),a0			
	move.l d0,(a0)				
						
	move.l d7,64(sp)			
						
	move.l 80(sp),a0			
	move.l 36(sp),d1			
_?L12:						
						
	lea (32,a5),a5				
						
	addq.l #1,d1				
						
	add.l #128,d5				
	add.l #128,d4				
	add.l #128,d3				
	lea (128,a6),a6				
	moveq #16,d0				
	cmp.l d1,d0				
	jbne _?L13				
						
	move.l 84(sp),a4			
	add.l #_D+1920,a4			
						
	move.l (a4),-(sp)			
	move.l 48(sp),a1			
	move.l 480(a1),-(sp)			
	move.l a0,48(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
						
	move.l 56(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 484(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 48(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 488(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 40(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 492(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 32(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 496(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 24(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 500(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 16(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 504(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 8(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 508(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d4,d0				
						
	neg.l d0				
	asr.l #2,d0				
						
	move.l 40(sp),a0			
	move.l d0,(a0)				
						
	moveq #32,d4				
	add.l a0,d4				
						
	move.l 48(sp),d0			
	addq.l #1,d0				
						
	moveq #15,d1				
	and.l d0,d1				
	move.l d1,48(sp)			
						
	addq.l #1,60(sp)			
	add.l #128,76(sp)			
	jbra _?L11				
						
	.align	2				
						
_synth_quarter:					
	lea (-52,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 92(sp),a0			
	lea (4108,a0),a0			
	move.l a0,72(sp)			
	moveq #48,d1				
	add.l 96(sp),d1				
	move.l d1,68(sp)			
						
	clr.l 52(sp)				
						
	lea ___mulsi3,a3			
_?L18:						
						
	move.l 52(sp),a1			
	cmp.l 100(sp),a1			
	jbne _?L23				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (52,sp),sp				
	rts					
_?L23:						
						
	move.l 92(sp),a0			
	move.l 4096(a0),48(sp)			
						
	move.l 72(sp),d4			
	move.l 52(sp),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,56(sp)			
						
	move.l 68(sp),76(sp)			
						
	clr.l 60(sp)				
_?L19:						
						
	move.l 60(sp),a0			
	cmp.l 104(sp),a0			
	jbne _?L22				
						
	addq.l #1,52(sp)			
	add.l #4608,72(sp)			
	add.l #4608,68(sp)			
	jbra _?L18				
_?L22:						
						
	moveq #1,d5				
	and.l 48(sp),d5				
	move.l 56(sp),a1			
	lea 2(a1,d5.l),a1			
	move.l a1,d0				
	moveq #9,d1				
	lsl.l d1,d0				
						
	move.l d0,d1				
	add.l #-1024,d1				
	move.l 92(sp),a4			
	add.l d1,a4				
						
	move.l 92(sp),a0			
	pea (a0,d0.l)				
	move.l a4,-(sp)				
	move.l 56(sp),d0			
	lsr.l #1,d0				
	move.l d0,-(sp)				
	move.l 88(sp),-(sp)			
	jbsr _dct32				
	lea (16,sp),sp				
	move.l d5,d2				
	eor.w #1,d2				
						
	move.l 56(sp),a1			
	lea 2(a1,d2.l),a1			
	move.l a1,d0				
	moveq #9,d1				
	lsl.l d1,d0				
	add.l 92(sp),d0				
	move.l d0,44(sp)			
						
	move.l 48(sp),d7			
	subq.l #1,d7				
						
	moveq #14,d0				
	and.l d0,d7				
						
	moveq #1,d1				
	or.l d1,d7				
						
	add.l d7,d7				
	add.l d7,d7				
						
	move.l d7,a6				
	add.l #_D,a6				
						
	moveq #-2,d1				
	and.l 48(sp),d1				
						
	add.l d1,d1				
	add.l d1,d1				
						
	move.l d1,d3				
	add.l #_D,d3				
						
	add.l 56(sp),d5				
	moveq #9,d0				
	lsl.l d0,d5				
	move.l d3,a0				
	move.l (a0),-(sp)			
	move.l 96(sp),a1			
	move.l (a1,d5.l),-(sp)			
	move.l d1,44(sp)			
	move.l d2,48(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l 92(sp),a5			
	add.l d5,a5				
	move.l d3,a0				
	move.l 56(a0),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 40(a0),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 24(a0),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 8(a0),-(sp)			
	move.l 28(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d6,d3				
	add.l d0,d3				
						
	move.l 40(sp),d2			
	add.l 56(sp),d2				
	move.l d2,d5				
	moveq #9,d0				
	lsl.l d0,d5				
	move.l 92(sp),a5			
	add.l d5,a5				
	move.l 56(a6),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l (a6),-(sp)			
	move.l 96(sp),a0			
	move.l (a0,d5.l),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 48(a6),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 40(a6),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 32(a6),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 24(a6),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 16(a6),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d3				
						
	move.l 8(a6),-(sp)			
	move.l 28(a5),-(sp)			
	move.l d4,48(sp)			
	jbsr (a3)				
	addq.l #8,sp				
						
	sub.l d0,d3				
						
	asr.l #2,d3				
						
	move.l 40(sp),a0			
	move.l d3,(a0)+				
						
	move.w #28,a1				
	add.l d4,a1				
	move.l a1,64(sp)			
	move.l d7,d0				
	add.l #128,d0				
	move.l d0,84(sp)			
	move.l d7,d5				
	add.l #_D+128,d5			
	move.l 36(sp),d1			
	move.l d1,d4				
	add.l #_D+128,d4			
	move.l #_D+188,d3			
	sub.l d7,d3				
	lea _D+188,a6				
	sub.l d1,a6				
						
	move.l 44(sp),a5			
						
	moveq #1,d1				
_?L21:						
						
	lea (32,a4),a4				
						
	moveq #3,d0				
	and.l d1,d0				
						
	jbne _?L20				
						
	move.l d4,a1				
	move.l 8(a1),-(sp)			
	move.l 28(a4),-(sp)			
	move.l d1,44(sp)			
	move.l a0,48(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l d4,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 24(a1),-(sp)			
	move.l 20(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 40(a1),-(sp)			
	move.l 12(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l 56(a1),-(sp)			
	move.l 4(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d4,a1				
	move.l (a1),-(sp)			
	move.l (a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d5,a1				
	move.l 56(a1),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l (a1),-(sp)			
	move.l (a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 48(a1),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 40(a1),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 24(a1),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l d5,a1				
	move.l 16(a1),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	sub.l d0,d6				
						
	move.l 40(sp),a0			
	move.l a0,80(sp)			
						
	move.l d5,a0				
	move.l 8(a0),-(sp)			
	move.l 28(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
						
	sub.l d0,d6				
						
	asr.l #2,d6				
						
	move.l 80(sp),a1			
	addq.l #4,80(sp)			
	move.l d6,(a1)+				
						
	move.l d3,a0				
	move.l 56(a0),-(sp)			
	move.l 28(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l d3,a1				
	move.l 48(a1),-(sp)			
	move.l 24(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 40(a0),-(sp)			
	move.l 20(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 32(a1),-(sp)			
	move.l 16(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 24(a0),-(sp)			
	move.l 12(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l 16(a1),-(sp)			
	move.l 8(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a0				
	move.l 8(a0),-(sp)			
	move.l 4(a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l d3,a1				
	move.l (a1),-(sp)			
	move.l (a5),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l (a6),-(sp)			
	move.l (a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 8(a6),-(sp)			
	move.l 4(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 16(a6),-(sp)			
	move.l 8(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 24(a6),-(sp)			
	move.l 12(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 32(a6),-(sp)			
	move.l 16(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 40(a6),-(sp)			
	move.l 20(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 48(a6),-(sp)			
	move.l 24(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d6				
						
	move.l 64(sp),d7			
	subq.l #4,d7				
						
	move.l 56(a6),-(sp)			
	move.l 28(a4),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d6,d0				
						
	asr.l #2,d0				
						
	move.l 64(sp),a0			
	move.l d0,(a0)				
						
	move.l d7,64(sp)			
						
	move.l 80(sp),a0			
	move.l 36(sp),d1			
_?L20:						
						
	lea (32,a5),a5				
						
	addq.l #1,d1				
						
	add.l #128,d5				
	add.l #128,d4				
	add.l #128,d3				
	lea (128,a6),a6				
	moveq #16,d0				
	cmp.l d1,d0				
	jbne _?L21				
						
	move.l 84(sp),a4			
	add.l #_D+1920,a4			
						
	move.l (a4),-(sp)			
	move.l 48(sp),a1			
	move.l 480(a1),-(sp)			
	move.l a0,48(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
						
	move.l 56(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 484(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 48(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 488(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 40(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 492(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 32(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 496(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 24(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 500(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 16(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 504(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d0,d4				
						
	move.l 8(a4),-(sp)			
	move.l 48(sp),a1			
	move.l 508(a1),-(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	add.l d4,d0				
						
	neg.l d0				
	asr.l #2,d0				
						
	move.l 40(sp),a0			
	move.l d0,(a0)				
						
	moveq #16,d4				
	add.l a0,d4				
						
	move.l 48(sp),d0			
	addq.l #1,d0				
						
	moveq #15,d1				
	and.l d0,d1				
	move.l d1,48(sp)			
						
	addq.l #1,60(sp)			
	add.l #128,76(sp)			
	jbra _?L19				
						
	.align	2				
	.globl	_mad_synth_mute			
						
_mad_synth_mute:				
	movem.l d3/a3/a4,-(sp)			
	move.l 16(sp),a4			
						
	move.l #2048,d3				
	move.l d3,-(sp)				
	clr.l -(sp)				
	move.l a4,-(sp)				
	lea _memset,a3				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d3,(sp)				
	clr.l -(sp)				
	pea 2048(a4)				
	jbsr (a3)				
	lea (12,sp),sp				
						
	movem.l (sp)+,d3/a3/a4			
	rts					
						
	.align	2				
	.globl	_mad_synth_init			
						
_mad_synth_init:				
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l a3,-(sp)				
	jbsr _mad_synth_mute			
	addq.l #4,sp				
						
	clr.l 4096(a3)				
						
	clr.l 4100(a3)				
						
	clr.w 4104(a3)				
						
	clr.w 4106(a3)				
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_mad_synth_frame		
						
_mad_synth_frame:				
	movem.l d3/d4/a3,-(sp)			
	move.l 16(sp),a3			
	move.l 20(sp),a0			
						
	tst.l 4(a0)				
	jbeq _?L32				
	moveq #2,d2				
_?L28:						
						
	move.l (a0),d0				
	moveq #1,d1				
	cmp.l d0,d1				
	jbeq _?L33				
						
	subq.l #3,d0				
	jbne _?L35				
						
	btst #4,30(a0)				
	jbeq _?L35				
						
	moveq #18,d3				
_?L29:						
						
	move.l 20(a0),d1			
						
	move.l d1,4100(a3)			
						
	move.w d2,4104(a3)			
						
	move.w d3,d0				
	lsl.w #5,d0				
	move.w d0,4106(a3)			
						
	move.l 44(a0),d4			
						
	btst #1,d4				
	jbeq _?L30				
						
	lsr.l #1,d1				
	move.l d1,4100(a3)			
						
	lsr.w #1,d0				
	move.w d0,4106(a3)			
						
	lea _synth_half,a1			
_?L31:						
						
	move.l d3,-(sp)				
	move.l d2,-(sp)				
	move.l a0,-(sp)				
	move.l a3,-(sp)				
	jbsr (a1)				
	lea (16,sp),sp				
						
	add.l 4096(a3),d3			
						
	moveq #15,d0				
	and.l d3,d0				
	move.l d0,4096(a3)			
						
	movem.l (sp)+,d3/d4/a3			
	rts					
_?L32:						
						
	moveq #1,d2				
	jbra _?L28				
_?L33:						
						
	moveq #12,d3				
	jbra _?L29				
_?L35:						
	moveq #36,d3				
	jbra _?L29				
_?L30:						
						
	lea _synth_full,a1			
						
	move.w d4,ccr				
	jbne _?L31				
						
	lsr.l #2,d1				
	move.l d1,4100(a3)			
						
	lsr.w #2,d0				
	move.w d0,4106(a3)			
						
	lea _synth_quarter,a1			
	jbra _?L31				
						
	.data					
	.align	2				
						
						
_D:						
	.dc.l	0				
	.dc.l	-7				
	.dc.l	53				
	.dc.l	-115				
	.dc.l	509				
	.dc.l	-1288				
	.dc.l	1644				
	.dc.l	-9372				
	.dc.l	18760				
	.dc.l	9372				
	.dc.l	1644				
	.dc.l	1288				
	.dc.l	509				
	.dc.l	115				
	.dc.l	53				
	.dc.l	7				
	.dc.l	0				
	.dc.l	-7				
	.dc.l	53				
	.dc.l	-115				
	.dc.l	509				
	.dc.l	-1288				
	.dc.l	1644				
	.dc.l	-9372				
	.dc.l	18760				
	.dc.l	9372				
	.dc.l	1644				
	.dc.l	1288				
	.dc.l	509				
	.dc.l	115				
	.dc.l	53				
	.dc.l	7				
	.dc.l	0				
	.dc.l	-8				
	.dc.l	55				
	.dc.l	-130				
	.dc.l	500				
	.dc.l	-1379				
	.dc.l	1490				
	.dc.l	-9834				
	.dc.l	18748				
	.dc.l	8910				
	.dc.l	1784				
	.dc.l	1197				
	.dc.l	516				
	.dc.l	100				
	.dc.l	52				
	.dc.l	7				
	.dc.l	0				
	.dc.l	-8				
	.dc.l	55				
	.dc.l	-130				
	.dc.l	500				
	.dc.l	-1379				
	.dc.l	1490				
	.dc.l	-9834				
	.dc.l	18748				
	.dc.l	8910				
	.dc.l	1784				
	.dc.l	1197				
	.dc.l	516				
	.dc.l	100				
	.dc.l	52				
	.dc.l	7				
	.dc.l	0				
	.dc.l	-9				
	.dc.l	56				
	.dc.l	-145				
	.dc.l	488				
	.dc.l	-1470				
	.dc.l	1322				
	.dc.l	-10294				
	.dc.l	18714				
	.dc.l	8448				
	.dc.l	1910				
	.dc.l	1106				
	.dc.l	520				
	.dc.l	87				
	.dc.l	51				
	.dc.l	6				
	.dc.l	0				
	.dc.l	-9				
	.dc.l	56				
	.dc.l	-145				
	.dc.l	488				
	.dc.l	-1470				
	.dc.l	1322				
	.dc.l	-10294				
	.dc.l	18714				
	.dc.l	8448				
	.dc.l	1910				
	.dc.l	1106				
	.dc.l	520				
	.dc.l	87				
	.dc.l	51				
	.dc.l	6				
	.dc.l	0				
	.dc.l	-10				
	.dc.l	56				
	.dc.l	-161				
	.dc.l	473				
	.dc.l	-1559				
	.dc.l	1140				
	.dc.l	-10752				
	.dc.l	18658				
	.dc.l	7987				
	.dc.l	2023				
	.dc.l	1016				
	.dc.l	522				
	.dc.l	74				
	.dc.l	49				
	.dc.l	5				
	.dc.l	0				
	.dc.l	-10				
	.dc.l	56				
	.dc.l	-161				
	.dc.l	473				
	.dc.l	-1559				
	.dc.l	1140				
	.dc.l	-10752				
	.dc.l	18658				
	.dc.l	7987				
	.dc.l	2023				
	.dc.l	1016				
	.dc.l	522				
	.dc.l	74				
	.dc.l	49				
	.dc.l	5				
	.dc.l	0				
	.dc.l	-10				
	.dc.l	57				
	.dc.l	-178				
	.dc.l	456				
	.dc.l	-1647				
	.dc.l	944				
	.dc.l	-11205				
	.dc.l	18578				
	.dc.l	7528				
	.dc.l	2123				
	.dc.l	926				
	.dc.l	521				
	.dc.l	61				
	.dc.l	48				
	.dc.l	5				
	.dc.l	0				
	.dc.l	-10				
	.dc.l	57				
	.dc.l	-178				
	.dc.l	456				
	.dc.l	-1647				
	.dc.l	944				
	.dc.l	-11205				
	.dc.l	18578				
	.dc.l	7528				
	.dc.l	2123				
	.dc.l	926				
	.dc.l	521				
	.dc.l	61				
	.dc.l	48				
	.dc.l	5				
	.dc.l	0				
	.dc.l	-11				
	.dc.l	57				
	.dc.l	-195				
	.dc.l	435				
	.dc.l	-1734				
	.dc.l	734				
	.dc.l	-11654				
	.dc.l	18477				
	.dc.l	7072				
	.dc.l	2210				
	.dc.l	838				
	.dc.l	519				
	.dc.l	49				
	.dc.l	46				
	.dc.l	4				
	.dc.l	0				
	.dc.l	-11				
	.dc.l	57				
	.dc.l	-195				
	.dc.l	435				
	.dc.l	-1734				
	.dc.l	734				
	.dc.l	-11654				
	.dc.l	18477				
	.dc.l	7072				
	.dc.l	2210				
	.dc.l	838				
	.dc.l	519				
	.dc.l	49				
	.dc.l	46				
	.dc.l	4				
	.dc.l	0				
	.dc.l	-12				
	.dc.l	57				
	.dc.l	-212				
	.dc.l	411				
	.dc.l	-1818				
	.dc.l	509				
	.dc.l	-12098				
	.dc.l	18354				
	.dc.l	6621				
	.dc.l	2285				
	.dc.l	751				
	.dc.l	514				
	.dc.l	38				
	.dc.l	44				
	.dc.l	4				
	.dc.l	0				
	.dc.l	-12				
	.dc.l	57				
	.dc.l	-212				
	.dc.l	411				
	.dc.l	-1818				
	.dc.l	509				
	.dc.l	-12098				
	.dc.l	18354				
	.dc.l	6621				
	.dc.l	2285				
	.dc.l	751				
	.dc.l	514				
	.dc.l	38				
	.dc.l	44				
	.dc.l	4				
	.dc.l	-1				
	.dc.l	-13				
	.dc.l	57				
	.dc.l	-230				
	.dc.l	384				
	.dc.l	-1899				
	.dc.l	271				
	.dc.l	-12534				
	.dc.l	18209				
	.dc.l	6174				
	.dc.l	2347				
	.dc.l	666				
	.dc.l	508				
	.dc.l	28				
	.dc.l	42				
	.dc.l	4				
	.dc.l	-1				
	.dc.l	-13				
	.dc.l	57				
	.dc.l	-230				
	.dc.l	384				
	.dc.l	-1899				
	.dc.l	271				
	.dc.l	-12534				
	.dc.l	18209				
	.dc.l	6174				
	.dc.l	2347				
	.dc.l	666				
	.dc.l	508				
	.dc.l	28				
	.dc.l	42				
	.dc.l	4				
	.dc.l	-1				
	.dc.l	-15				
	.dc.l	56				
	.dc.l	-248				
	.dc.l	354				
	.dc.l	-1978				
	.dc.l	18				
	.dc.l	-12963				
	.dc.l	18042				
	.dc.l	5732				
	.dc.l	2398				
	.dc.l	583				
	.dc.l	500				
	.dc.l	18				
	.dc.l	40				
	.dc.l	3				
	.dc.l	-1				
	.dc.l	-15				
	.dc.l	56				
	.dc.l	-248				
	.dc.l	354				
	.dc.l	-1978				
	.dc.l	18				
	.dc.l	-12963				
	.dc.l	18042				
	.dc.l	5732				
	.dc.l	2398				
	.dc.l	583				
	.dc.l	500				
	.dc.l	18				
	.dc.l	40				
	.dc.l	3				
	.dc.l	-1				
	.dc.l	-16				
	.dc.l	55				
	.dc.l	-266				
	.dc.l	320				
	.dc.l	-2052				
	.dc.l	-250				
	.dc.l	-13384				
	.dc.l	17855				
	.dc.l	5297				
	.dc.l	2438				
	.dc.l	502				
	.dc.l	491				
	.dc.l	9				
	.dc.l	39				
	.dc.l	3				
	.dc.l	-1				
	.dc.l	-16				
	.dc.l	55				
	.dc.l	-266				
	.dc.l	320				
	.dc.l	-2052				
	.dc.l	-250				
	.dc.l	-13384				
	.dc.l	17855				
	.dc.l	5297				
	.dc.l	2438				
	.dc.l	502				
	.dc.l	491				
	.dc.l	9				
	.dc.l	39				
	.dc.l	3				
	.dc.l	-1				
	.dc.l	-17				
	.dc.l	54				
	.dc.l	-284				
	.dc.l	283				
	.dc.l	-2123				
	.dc.l	-531				
	.dc.l	-13795				
	.dc.l	17648				
	.dc.l	4870				
	.dc.l	2466				
	.dc.l	423				
	.dc.l	480				
	.dc.l	1				
	.dc.l	37				
	.dc.l	3				
	.dc.l	-1				
	.dc.l	-17				
	.dc.l	54				
	.dc.l	-284				
	.dc.l	283				
	.dc.l	-2123				
	.dc.l	-531				
	.dc.l	-13795				
	.dc.l	17648				
	.dc.l	4870				
	.dc.l	2466				
	.dc.l	423				
	.dc.l	480				
	.dc.l	1				
	.dc.l	37				
	.dc.l	3				
	.dc.l	-1				
	.dc.l	-18				
	.dc.l	52				
	.dc.l	-303				
	.dc.l	243				
	.dc.l	-2189				
	.dc.l	-825				
	.dc.l	-14195				
	.dc.l	17420				
	.dc.l	4450				
	.dc.l	2484				
	.dc.l	347				
	.dc.l	468				
	.dc.l	-7				
	.dc.l	35				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-18				
	.dc.l	52				
	.dc.l	-303				
	.dc.l	243				
	.dc.l	-2189				
	.dc.l	-825				
	.dc.l	-14195				
	.dc.l	17420				
	.dc.l	4450				
	.dc.l	2484				
	.dc.l	347				
	.dc.l	468				
	.dc.l	-7				
	.dc.l	35				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-20				
	.dc.l	50				
	.dc.l	-321				
	.dc.l	199				
	.dc.l	-2250				
	.dc.l	-1133				
	.dc.l	-14583				
	.dc.l	17173				
	.dc.l	4039				
	.dc.l	2492				
	.dc.l	274				
	.dc.l	454				
	.dc.l	-14				
	.dc.l	33				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-20				
	.dc.l	50				
	.dc.l	-321				
	.dc.l	199				
	.dc.l	-2250				
	.dc.l	-1133				
	.dc.l	-14583				
	.dc.l	17173				
	.dc.l	4039				
	.dc.l	2492				
	.dc.l	274				
	.dc.l	454				
	.dc.l	-14				
	.dc.l	33				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-21				
	.dc.l	47				
	.dc.l	-339				
	.dc.l	151				
	.dc.l	-2305				
	.dc.l	-1455				
	.dc.l	-14960				
	.dc.l	16907				
	.dc.l	3637				
	.dc.l	2490				
	.dc.l	204				
	.dc.l	440				
	.dc.l	-21				
	.dc.l	31				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-21				
	.dc.l	47				
	.dc.l	-339				
	.dc.l	151				
	.dc.l	-2305				
	.dc.l	-1455				
	.dc.l	-14960				
	.dc.l	16907				
	.dc.l	3637				
	.dc.l	2490				
	.dc.l	204				
	.dc.l	440				
	.dc.l	-21				
	.dc.l	31				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-23				
	.dc.l	44				
	.dc.l	-357				
	.dc.l	101				
	.dc.l	-2354				
	.dc.l	-1789				
	.dc.l	-15322				
	.dc.l	16624				
	.dc.l	3245				
	.dc.l	2479				
	.dc.l	136				
	.dc.l	425				
	.dc.l	-27				
	.dc.l	29				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-23				
	.dc.l	44				
	.dc.l	-357				
	.dc.l	101				
	.dc.l	-2354				
	.dc.l	-1789				
	.dc.l	-15322				
	.dc.l	16624				
	.dc.l	3245				
	.dc.l	2479				
	.dc.l	136				
	.dc.l	425				
	.dc.l	-27				
	.dc.l	29				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-24				
	.dc.l	41				
	.dc.l	-375				
	.dc.l	46				
	.dc.l	-2396				
	.dc.l	-2135				
	.dc.l	-15671				
	.dc.l	16323				
	.dc.l	2864				
	.dc.l	2460				
	.dc.l	72				
	.dc.l	409				
	.dc.l	-32				
	.dc.l	28				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-24				
	.dc.l	41				
	.dc.l	-375				
	.dc.l	46				
	.dc.l	-2396				
	.dc.l	-2135				
	.dc.l	-15671				
	.dc.l	16323				
	.dc.l	2864				
	.dc.l	2460				
	.dc.l	72				
	.dc.l	409				
	.dc.l	-32				
	.dc.l	28				
	.dc.l	2				
	.dc.l	-1				
	.dc.l	-26				
	.dc.l	37				
	.dc.l	-392				
	.dc.l	-11				
	.dc.l	-2432				
	.dc.l	-2494				
	.dc.l	-16005				
	.dc.l	16005				
	.dc.l	2494				
	.dc.l	2432				
	.dc.l	11				
	.dc.l	392				
	.dc.l	-37				
	.dc.l	26				
	.dc.l	1				
	.dc.l	-1				
	.dc.l	-26				
	.dc.l	37				
	.dc.l	-392				
	.dc.l	-11				
	.dc.l	-2432				
	.dc.l	-2494				
	.dc.l	-16005				
	.dc.l	16005				
	.dc.l	2494				
	.dc.l	2432				
	.dc.l	11				
	.dc.l	392				
	.dc.l	-37				
	.dc.l	26				
	.dc.l	1				
						
