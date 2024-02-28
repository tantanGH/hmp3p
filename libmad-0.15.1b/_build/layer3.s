* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"layer3.c"			
						
						
						
						
						
	.text					
	.globl	___mulsi3			
	.align	2				
						
_III_requantize:				
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	move.l 16(sp),d2			
						
	move.l d2,d4				
	jbpl _?L2				
	addq.l #3,d4				
_?L2:						
	asr.l #2,d4				
						
	move.l 12(sp),d0			
	add.l d0,d0				
	add.l d0,d0				
	lea _rq_table,a0			
	move.l (a0,d0.l),d3			
	lsr.l #5,d3				
						
	lea _rq_table+2,a0			
	move.b 1(a0,d0.l),d1			
	and.b #31,d1				
	and.l #255,d1				
						
	add.l d4,d1				
						
	jbpl _?L3				
						
	moveq #-31,d0				
	cmp.l d1,d0				
	jbgt _?L7				
						
	move.l d1,d4				
	not.l d4				
						
	moveq #1,d0				
	lsl.l d4,d0				
						
	add.l d3,d0				
						
	neg.l d1				
						
	asr.l d1,d0				
_?L4:						
						
	moveq #3,d1				
	and.l d2,d1				
	jbeq _?L1				
						
	move.l d2,d1				
	and.l #-2147483645,d1			
	tst.l d2				
	jbge _?L6				
	subq.l #1,d1				
	moveq #-4,d2				
	or.l d2,d1				
	addq.l #1,d1				
_?L6:						
						
	addq.l #3,d1				
	add.l d1,d1				
	add.l d1,d1				
	moveq #12,d4				
	asr.l d4,d0				
						
	move.l d0,-(sp)				
	lea _root_table,a0			
	move.w (a0,d1.l),a0			
	move.l a0,-(sp)				
	jbsr ___mulsi3				
	addq.l #8,sp				
_?L1:						
						
	move.l (sp)+,d3				
	move.l (sp)+,d4				
	rts					
_?L3:						
						
	move.l #2147483647,d0			
						
	moveq #4,d4				
	cmp.l d1,d4				
	jblt _?L4				
						
	move.l d3,d0				
	lsl.l d1,d0				
	jbra _?L4				
_?L7:						
						
	moveq #0,d0				
	jbra _?L4				
						
	.align	2				
						
_III_aliasreduce:				
	subq.l #4,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 44(sp),a3			
						
	move.l 48(sp),d0			
	add.l d0,d0				
	add.l d0,d0				
						
	add.l a3,d0				
	move.l d0,36(sp)			
						
	lea (72,a3),a3				
						
	lea ___mulsi3,a4			
_?L13:						
						
	cmp.l 36(sp),a3				
	jbcs _?L15				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #4,sp				
	rts					
_?L15:						
	lea (-4,a3),a5				
						
	moveq #0,d3				
_?L14:						
						
	move.l (a3,d3.l),d4			
						
	move.l (a5),d1				
	move.l d1,d6				
	moveq #12,d0				
	asr.l d0,d6				
	lea _cs,a0				
	move.w (a0,d3.l),a6			
	move.l a6,-(sp)				
	move.l d6,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d5				
						
	lea _ca,a0				
	move.w (a0,d3.l),d7			
	ext.l d7				
	move.l d4,d0				
	neg.l d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.l d7,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	add.l d5,d0				
	move.l d0,(a5)				
						
	moveq #12,d0				
	asr.l d0,d4				
	move.l a6,-(sp)				
	move.l d4,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d4				
						
	move.l d7,-(sp)				
	move.l d6,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	add.l d4,d0				
	move.l d0,(a3,d3.l)			
						
	subq.l #4,a5				
	addq.l #4,d3				
	moveq #32,d1				
	cmp.l d3,d1				
	jbne _?L14				
						
	lea (72,a3),a3				
	jbra _?L13				
						
	.align	2				
						
_fastsdct:					
	lea (-28,sp),sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 68(sp),a4			
	move.l 72(sp),a3			
						
	move.l 20(a4),d0			
						
	move.l 12(a4),d5			
	add.l d0,d5				
						
	move.l 12(a4),d1			
	sub.l d0,d1				
	move.l d1,60(sp)			
						
	move.l 8(a4),d0				
						
	move.l 24(a4),a6			
	add.l d0,a6				
						
	move.l 24(a4),d7			
	sub.l d0,d7				
						
	move.l 4(a4),d4				
						
	move.l 28(a4),d2			
						
	move.l d4,a1				
	add.l d2,a1				
						
	move.l (a4),d0				
						
	move.l 32(a4),d1			
	add.l d0,d1				
						
	move.l 32(a4),d3			
	sub.l d0,d3				
	move.l d3,36(sp)			
						
	move.l d5,d0				
	add.l a6,d0				
						
	add.l d1,d0				
	move.l d0,56(sp)			
						
	move.l 60(sp),d0			
	add.l d7,d0				
						
	moveq #12,d6				
	asr.l d6,d0				
						
	lea ___mulsi3,a0			
	pea -5266.w				
	move.l d0,-(sp)				
	move.l d1,48(sp)			
	move.l d2,56(sp)			
	move.l a0,60(sp)			
	move.l a1,52(sp)			
	jbsr (a0)				
	addq.l #8,sp				
	move.l d0,a5				
						
	move.l 60(sp),d0			
	sub.l d3,d0				
						
	asr.l d6,d0				
						
	move.l d0,d3				
	lsl.l #6,d3				
	sub.l d0,d3				
	lsl.l #5,d3				
	add.l d0,d3				
	add.l d3,d3				
	add.l d3,d3				
	neg.l d3				
						
	move.l 36(sp),d6			
	add.l d7,d6				
						
	moveq #12,d0				
	asr.l d0,d6				
						
	pea -2802.w				
	move.l d6,-(sp)				
	move.l 60(sp),a0			
	jbsr (a0)				
	addq.l #8,sp				
	move.l d0,a2				
						
	move.l 48(sp),d2			
	move.l d4,d0				
	sub.l d2,d0				
						
	moveq #12,d2				
	asr.l d2,d0				
						
	move.l d0,d4				
	lsl.l #3,d4				
	sub.l d0,d4				
	lsl.l #3,d4				
	sub.l d0,d4				
	move.l d4,d0				
	lsl.l #7,d0				
	add.l d0,d4				
	move.l d4,d0				
	neg.l d0				
						
	move.l 40(sp),d1			
	move.l a6,d2				
	sub.l d1,d2				
						
	moveq #12,d6				
	asr.l d6,d2				
						
	move.l d2,d6				
	lsl.l #4,d6				
	move.l d6,a0				
	sub.l d2,a0				
	move.l a0,d6				
	lsl.l #5,d6				
	move.l d6,a0				
	add.l d2,a0				
	move.l a0,d6				
	lsl.l #4,d6				
	move.l d6,a0				
	add.l d2,a0				
						
	move.l d5,d2				
	sub.l d1,d2				
						
	moveq #12,d1				
	asr.l d1,d2				
						
	move.l d2,d1				
	add.l d2,d1				
	add.l d2,d1				
	add.l d1,d1				
	add.l d1,d1				
	sub.l d2,d1				
	lsl.l #3,d1				
	add.l d2,d1				
	lsl.l #4,d1				
	sub.l d1,d2				
						
	sub.l a6,d5				
						
	moveq #12,d6				
	asr.l d6,d5				
						
	move.l d5,d1				
	add.l d5,d1				
	add.l d5,d1				
	lsl.l #4,d1				
	add.l d5,d1				
	lsl.l #5,d1				
	add.l d5,d1				
	add.l d1,d1				
	add.l d1,d1				
	neg.l d1				
						
	move.l 16(a4),d5			
						
	move.l 44(sp),a1			
	lea (a1,d5.l),a4			
						
	add.l d5,d5				
						
	sub.l a1,d5				
						
	move.l 56(sp),d6			
	add.l a4,d6				
	move.l d6,(a3)				
						
	move.l d3,a1				
	sub.l d4,a1				
						
	move.l a5,d4				
	sub.l a1,d4				
	move.l d4,8(a3)				
						
	lea (a0,d5.l),a1			
						
	move.l d1,d6				
	sub.l a1,d6				
	move.l d6,16(a3)			
						
	move.l 60(sp),d4			
	sub.l d7,d4				
						
	add.l 36(sp),d4				
						
	moveq #12,d6				
	asr.l d6,d4				
						
	move.l d4,d6				
	lsl.l #3,d6				
	sub.l d4,d6				
	lsl.l #3,d6				
	sub.l d4,d6				
	move.l d6,d4				
	lsl.l #7,d4				
	add.l d4,d6				
	neg.l d6				
	move.l d6,24(a3)			
						
	move.l d5,a1				
	sub.l a0,a1				
						
	sub.l d2,a1				
	move.l a1,32(a3)			
						
	move.l d0,a0				
	sub.l a2,a0				
						
	sub.l d3,a0				
	move.l a0,40(a3)			
						
	add.l a4,a4				
						
	move.l 56(sp),d3			
	sub.l a4,d3				
	move.l d3,48(a3)			
						
	add.l a2,d0				
						
	add.l a5,d0				
	move.l d0,56(a3)			
						
	add.l d5,d2				
						
	add.l d1,d2				
	move.l d2,64(a3)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (28,sp),sp				
	rts					
						
	.align	2				
						
_III_imdct_l:					
	lea (-184,sp),sp			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 228(sp),a0			
	move.l 232(sp),d5			
	move.l 224(sp),a3			
	move.l #_scale?1,d3			
	lea (148,sp),a5				
	moveq #72,d4				
	add.l a3,d4				
						
	move.l a5,a6				
						
	lea ___mulsi3,a4			
_?L19:						
	move.l (a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.l d3,a1				
	move.w (a1),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	move.l a0,44(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a6)				
						
	move.l 4(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.l d3,a1				
	move.w 4(a1),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,4(a6)				
						
	move.l 8(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.l d3,a1				
	move.w 8(a1),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,8(a6)				
						
	lea (12,a3),a3				
	moveq #12,d0				
	add.l d0,d3				
	lea (12,a6),a6				
	move.l 36(sp),a0			
	cmp.l a3,d4				
	jbne _?L19				
	lea (208,sp),a6				
	moveq #40,d7				
	add.l sp,d7				
	moveq #36,d6				
	add.l a5,d6				
	move.l d7,a3				
	move.l a6,a1				
	move.l a5,a2				
_?L20:						
						
	move.l (a2),d1				
	add.l 8(a1),d1				
	move.l d1,(a3)				
						
	move.l 4(a2),d2				
	add.l 4(a1),d2				
	move.l d2,4(a3)				
						
	move.l 8(a2),d0				
	add.l (a1),d0				
	move.l d0,8(a3)				
						
	lea (12,a2),a2				
	lea (-12,a1),a1				
	lea (12,a3),a3				
	cmp.l d6,a2				
	jbne _?L20				
						
	lea (76,sp),a3				
	move.l a3,-(sp)				
	move.l d7,-(sp)				
	move.l #_fastsdct,d4			
	move.l a0,44(sp)			
	move.l d4,a1				
	jbsr (a1)				
	addq.l #8,sp				
	move.l #_scale?0,d3			
	move.l 36(sp),a0			
_?L21:						
						
	move.l (a5),d0				
	sub.l 8(a6),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.l d3,a1				
	move.w (a1),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	move.l a0,44(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d7,a1				
	move.l d0,(a1)				
						
	move.l 4(a5),d0				
	sub.l 4(a6),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.l d3,a1				
	move.w 4(a1),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d7,a1				
	move.l d0,4(a1)				
						
	move.l 8(a5),d0				
	sub.l (a6),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.l d3,a1				
	move.w 8(a1),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d7,a1				
	move.l d0,8(a1)				
						
	lea (12,a5),a5				
	lea (-12,a6),a6				
	moveq #12,d0				
	add.l d0,d3				
	add.l d0,d7				
	move.l 36(sp),a0			
	cmp.l d6,a5				
	jbne _?L21				
						
	pea 4(a3)				
	pea 44(sp)				
	move.l a0,44(sp)			
	move.l d4,a1				
	jbsr (a1)				
	addq.l #8,sp				
						
	move.l 88(sp),d0			
	sub.l 80(sp),d0				
	move.l d0,88(sp)			
						
	move.l 96(sp),d1			
	sub.l d0,d1				
	move.l d1,96(sp)			
						
	move.l 104(sp),d0			
	sub.l d1,d0				
	move.l d0,104(sp)			
						
	move.l 112(sp),d1			
	sub.l d0,d1				
	move.l d1,112(sp)			
						
	move.l 120(sp),d0			
	sub.l d1,d0				
	move.l d0,120(sp)			
						
	move.l 128(sp),d1			
	sub.l d0,d1				
	move.l d1,128(sp)			
						
	move.l 136(sp),d0			
	sub.l d1,d0				
	move.l d0,136(sp)			
						
	sub.l d0,144(sp)			
						
	move.l 76(sp),d0			
	jbpl _?L43				
	addq.l #1,d0				
_?L43:						
	asr.l #1,d0				
	move.l d0,76(sp)			
						
	move.w #1,a1				
	move.l 36(sp),a0			
_?L22:						
						
	move.l 4(a3),d0				
	jbpl _?L44				
	addq.l #1,d0				
_?L44:						
	asr.l #1,d0				
						
	sub.l (a3),d0				
						
	move.l d0,4(a3)				
						
	move.l 8(a3),d1				
	jbpl _?L45				
	addq.l #1,d1				
_?L45:						
	asr.l #1,d1				
						
	sub.l d0,d1				
						
	move.l d1,8(a3)				
						
	move.l 12(a3),d0			
	jbpl _?L46				
	addq.l #1,d0				
_?L46:						
	asr.l #1,d0				
						
	sub.l d1,d0				
						
	move.l d0,12(a3)			
						
	move.l 16(a3),d1			
	jbpl _?L47				
	addq.l #1,d1				
_?L47:						
	asr.l #1,d1				
						
	sub.l d0,d1				
	move.l d1,16(a3)			
						
	addq.l #4,a1				
						
	lea (16,a3),a3				
	moveq #17,d0				
	cmp.l a1,d0				
	jbne _?L22				
						
	move.l 140(sp),d1			
						
	move.l 144(sp),d0			
	jbpl _?L48				
	addq.l #1,d0				
_?L48:						
	asr.l #1,d0				
						
	sub.l d1,d0				
						
	move.l d0,144(sp)			
						
	move.l 112(sp),(a0)			
						
	move.l 116(sp),4(a0)			
						
	move.l 120(sp),8(a0)			
						
	move.l 124(sp),12(a0)			
						
	move.l 128(sp),16(a0)			
						
	move.l 132(sp),20(a0)			
						
	move.l 136(sp),24(a0)			
						
	move.l d1,28(a0)			
						
	move.l d0,32(a0)			
	lea (136,sp),a2				
	lea (36,a0),a1				
	move.l a0,a3				
	lea (108,a0),a5				
_?L23:						
						
	move.l 8(a2),d1				
	neg.l d1				
	move.l d1,(a1)				
						
	move.l 4(a2),d2				
	neg.l d2				
	move.l d2,4(a1)				
						
	move.l (a2),d0				
	neg.l d0				
	move.l d0,8(a1)				
						
	lea (-12,a2),a2				
	lea (12,a1),a1				
	cmp.l a5,a1				
	jbne _?L23				
						
	move.l 76(sp),d1			
	neg.l d1				
	move.l d1,108(a0)			
						
	move.l 80(sp),d2			
	neg.l d2				
	move.l d2,112(a0)			
						
	move.l 84(sp),d0			
	neg.l d0				
	move.l d0,116(a0)			
						
	move.l 88(sp),d1			
	neg.l d1				
	move.l d1,120(a0)			
						
	move.l 92(sp),d2			
	neg.l d2				
	move.l d2,124(a0)			
						
	move.l 96(sp),d0			
	neg.l d0				
	move.l d0,128(a0)			
						
	move.l 100(sp),d1			
	neg.l d1				
	move.l d1,132(a0)			
						
	move.l 104(sp),d2			
	neg.l d2				
	move.l d2,136(a0)			
						
	move.l 108(sp),d0			
	neg.l d0				
	move.l d0,140(a0)			
						
	moveq #1,d1				
	cmp.l d5,d1				
	jbeq _?L24				
	moveq #3,d2				
	cmp.l d5,d2				
	jbeq _?L25				
	tst.l d5				
	jbne _?L18				
	lea _window_l,a5			
	move.l a0,d3				
	add.l #144,d3				
_?L27:						
						
	move.l (a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w (a5),a0				
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a3)				
						
	move.l 4(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w 4(a5),a0				
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,4(a3)				
						
	move.l 8(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w 8(a5),a0				
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,8(a3)				
						
	move.l 12(a3),d0			
	moveq #12,d1				
	asr.l d1,d0				
	move.w 12(a5),a0			
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,12(a3)			
						
	lea (16,a3),a3				
	lea (16,a5),a5				
	cmp.l d3,a3				
	jbne _?L27				
_?L18:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (184,sp),sp				
	rts					
_?L24:						
	lea _window_l,a5			
	lea (72,a0),a6				
						
	move.l a0,a3				
_?L28:						
						
	move.l (a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w (a5),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	move.l a0,44(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a3)				
						
	move.l 4(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w 4(a5),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,4(a3)				
						
	move.l 8(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w 8(a5),a1				
	move.l a1,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,8(a3)				
						
	lea (12,a3),a3				
	lea (12,a5),a5				
	move.l 36(sp),a0			
	cmp.l a6,a3				
	jbne _?L28				
	lea (96,a0),a3				
	lea _window_s+24,a6			
	lea (120,a0),a5				
_?L29:						
						
	move.l (a3),d0				
	move.l (a6)+,d1				
	moveq #12,d2				
	asr.l d2,d0				
	swap d1					
	ext.l d1				
	move.l d1,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a3)+				
						
	cmp.l a5,a3				
	jbne _?L29				
						
	moveq #24,d0				
	move.l d0,232(sp)			
	clr.l 228(sp)				
	move.l a5,224(sp)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (184,sp),sp				
						
	jbra _memset				
_?L25:						
						
	pea 24.w				
	clr.l -(sp)				
	move.l a0,-(sp)				
	move.l a0,48(sp)			
	jbsr _memset				
	lea (12,sp),sp				
	move.l 36(sp),a0			
	lea (24,a0),a3				
	lea _window_s,a5			
	lea (48,a0),a6				
_?L30:						
						
	move.l (a3),d0				
	move.l (a5)+,d1				
	moveq #12,d2				
	asr.l d2,d0				
	swap d1					
	ext.l d1				
	move.l d1,-(sp)				
	move.l d0,-(sp)				
	move.l a0,44(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a3)+				
						
	move.l 36(sp),a0			
	cmp.l a6,a3				
	jbne _?L30				
	lea (72,a0),a3				
	lea _window_l+72,a5			
	move.l a0,d3				
	add.l #144,d3				
_?L31:						
						
	move.l (a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w (a5),a0				
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,(a3)				
						
	move.l 4(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w 4(a5),a0				
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,4(a3)				
						
	move.l 8(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w 8(a5),a0				
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,8(a3)				
						
	lea (12,a3),a3				
	lea (12,a5),a5				
	cmp.l d3,a3				
	jbne _?L31				
	jbra _?L18				
						
	.align	2				
						
_III_imdct_s:					
	lea (-172,sp),sp			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 212(sp),a0			
	lea (72,a0),a1				
	move.l a1,56(sp)			
						
	lea (64,sp),a5				
						
	lea ___mulsi3,a3			
_?L50:						
	move.l (a0),d7				
	moveq #12,d0				
	asr.l d0,d7				
						
	move.l 4(a0),d6				
	asr.l d0,d6				
						
	move.l 8(a0),d5				
	asr.l d0,d5				
						
	move.l 12(a0),d4			
	asr.l d0,d4				
						
	move.l 16(a0),d3			
	asr.l d0,d3				
						
	move.l 20(a0),d0			
	moveq #12,d1				
	asr.l d1,d0				
	move.l d0,52(sp)			
	lea (20,a5),a2				
	move.l a5,a1				
						
	lea _imdct_s,a4				
						
	lea (12,a5),a6				
	move.l a6,60(sp)			
_?L51:						
						
	move.l d7,-(sp)				
	move.w (a4),a6				
	move.l a6,-(sp)				
	move.l a0,48(sp)			
	move.l a1,56(sp)			
	move.l a2,52(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,36(sp)			
						
	move.l d6,-(sp)				
	move.w 4(a4),a6				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
	move.l d0,36(sp)			
						
	move.l d5,-(sp)				
	move.w 8(a4),a6				
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
	move.l d0,36(sp)			
						
	move.l d4,-(sp)				
	move.w 12(a4),a6			
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
	move.l d0,36(sp)			
						
	move.l d3,-(sp)				
	move.w 16(a4),a6			
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
	move.l d0,36(sp)			
						
	move.l 52(sp),-(sp)			
	move.w 20(a4),a6			
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
						
	move.l 48(sp),a1			
	move.l d0,(a1)+				
						
	move.l 44(sp),a2			
	neg.l d0				
	move.l d0,(a2)				
						
	move.l d7,-(sp)				
	move.w 24(a4),a6			
	move.l a6,-(sp)				
	move.l a1,56(sp)			
	move.l a2,52(sp)			
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,36(sp)			
						
	move.l d6,-(sp)				
	move.w 28(a4),a6			
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
	move.l d0,36(sp)			
						
	move.l d5,-(sp)				
	move.w 32(a4),a6			
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
	move.l d0,36(sp)			
						
	move.l d4,-(sp)				
	move.w 36(a4),a6			
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
	move.l d0,36(sp)			
						
	move.l d3,-(sp)				
	move.w 40(a4),a6			
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
	move.l d0,36(sp)			
						
	move.l 52(sp),-(sp)			
	move.w 44(a4),a6			
	move.l a6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l 36(sp),d0				
						
	move.l 48(sp),a1			
	move.l d0,20(a1)			
						
	move.l 44(sp),a2			
	move.l d0,24(a2)			
						
	lea (48,a4),a4				
						
	subq.l #4,a2				
	move.l 40(sp),a0			
	cmp.l 60(sp),a1				
	jbne _?L51				
						
	lea (48,a5),a5				
						
	lea (24,a0),a0				
						
	cmp.l 56(sp),a0				
	jbne _?L50				
						
	pea 24.w				
	clr.l -(sp)				
	move.l 224(sp),-(sp)			
	move.l #_memset,d4			
	move.l d4,a0				
	jbsr (a0)				
	lea (12,sp),sp				
	lea (64,sp),a6				
	lea _window_s,a4			
	move.w #24,a5				
	add.l 216(sp),a5			
	moveq #48,d5				
	add.l 216(sp),d5			
_?L53:						
						
	move.l (a6)+,d1				
	move.l (a4)+,d0				
	swap d0					
	ext.l d0				
	moveq #12,d2				
	asr.l d2,d1				
	move.l d1,-(sp)				
	move.l d0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	move.l d0,(a5)+				
						
	move.l 20(a6),d0			
	moveq #12,d1				
	asr.l d1,d0				
	move.l d0,-(sp)				
	move.w 20(a4),a0			
	move.l a0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l 44(a6),d0			
	moveq #12,d1				
	asr.l d1,d0				
	move.l d0,-(sp)				
	move.w -4(a4),a0			
	move.l a0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l d6,d0				
	move.l d0,20(a5)			
						
	move.l 68(a6),d0			
	moveq #12,d1				
	asr.l d1,d0				
	move.l d0,-(sp)				
	move.w 20(a4),a0			
	move.l a0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l 92(a6),d0			
	moveq #12,d1				
	asr.l d1,d0				
	move.l d0,-(sp)				
	move.w -4(a4),a0			
	move.l a0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	add.l d6,d0				
	move.l d0,44(a5)			
						
	move.l 116(a6),d0			
	moveq #12,d1				
	asr.l d1,d0				
	move.l d0,-(sp)				
	move.w 20(a4),a0			
	move.l a0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	move.l d0,68(a5)			
						
	cmp.l a5,d5				
	jbne _?L53				
						
	pea 24.w				
	clr.l -(sp)				
	move.l 224(sp),a1			
	pea 120(a1)				
	move.l d4,a6				
	jbsr (a6)				
	lea (12,sp),sp				
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (172,sp),sp				
	rts					
						
	.align	2				
						
_III_overlap:					
	move.l 4(sp),a2				
	move.l 8(sp),a1				
	move.l 16(sp),a0			
	add.l a0,a0				
	add.l a0,a0				
	add.l 12(sp),a0				
						
	moveq #0,d0				
_?L57:						
						
	move.l (a2,d0.l),d1			
	add.l (a1,d0.l),d1			
	move.l d1,(a0)				
						
	move.l 72(a2,d0.l),(a1,d0.l)		
						
	lea (128,a0),a0				
	addq.l #4,d0				
	moveq #72,d1				
	cmp.l d0,d1				
	jbne _?L57				
						
	rts					
						
	.align	2				
						
_III_freqinver:					
	move.l d3,-(sp)				
	move.l 8(sp),d1				
	move.l 12(sp),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d1,a0				
	add.l d0,a0				
						
	neg.l 128(a0)				
	move.l d0,a2				
	lea (640,a2),a2				
	add.l d1,a2				
						
	move.l (a2),d2				
						
	neg.l 384(a0)				
	move.l d0,a1				
	lea (896,a1),a1				
	add.l d1,a1				
						
	move.l (a1),d3				
						
	neg.l d2				
	move.l d2,(a2)				
	move.l d0,a2				
	lea (1152,a2),a2			
	add.l d1,a2				
						
	move.l (a2),d2				
						
	neg.l d3				
	move.l d3,(a1)				
	add.l #1408,d0				
	move.l d1,a1				
	add.l d0,a1				
						
	move.l (a1),d1				
						
	neg.l d2				
	move.l d2,(a2)				
						
	move.l 1664(a0),d0			
						
	neg.l d1				
	move.l d1,(a1)				
						
	neg.l d0				
	move.l d0,1664(a0)			
						
	neg.l 1920(a0)				
						
	neg.l 2176(a0)				
						
	move.l (sp)+,d3				
	rts					
						
	.globl	___udivsi3			
	.globl	___divsi3			
	.globl	___umodsi3			
	.globl	___modsi3			
	.align	2				
						
_III_decode:					
	link.w a6,#-7100			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
						
	move.l 12(a6),a0			
	move.l 20(a0),d0			
						
	move.l 28(a0),d2			
						
	btst #14,d2				
	jbne _?L61				
						
	move.l d0,d1				
	moveq #15,d3				
	lsr.l d3,d1				
						
	moveq #1,d4				
	and.l d4,d1				
						
	lsr.l #7,d0				
						
	and.l d3,d0				
						
	move.l d1,a1				
	lea -8(a1,d0.l),a0			
_?L62:						
						
	btst #12,d2				
	jbeq _?L251				
	moveq #1,d1				
	move.l d1,-7016(a6)			
_?L63:						
	move.w #18,a1				
	add.l 16(a6),a1				
	move.l a1,-7060(a6)			
	move.w #48,a2				
	add.l 12(a6),a2				
	move.l a2,-7020(a6)			
	clr.l -7024(a6)				
						
	clr.l -7052(a6)				
						
	move.l a0,d0				
	add.l a0,d0				
	add.l a0,d0				
	move.l d0,-7032(a6)			
						
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,-7008(a6)			
_?L249:						
	lea (-6996,a6),a4			
	move.l a4,-7044(a6)			
	move.w #-18,a3				
	add.l -7060(a6),a3			
	lea (-4608,a6),a5			
	move.l a5,-7072(a6)			
	move.w #34,a5				
	add.l 16(a6),a5				
						
	move.l -7072(a6),-7056(a6)		
						
	clr.l -7064(a6)				
						
	move.l -7032(a6),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,-7004(a6)			
						
	move.l -7052(a6),d0			
	lsl.l #3,d0				
	sub.l -7052(a6),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,-7012(a6)			
_?L168:						
						
	lea _sfbwidth_table,a0			
						
	move.l -7044(a6),a1			
	addq.l #4,-7044(a6)			
	move.l -7004(a6),a2			
	move.l (a2,a0.l),(a1)+			
						
	move.b 19(a3),d1			
						
	cmp.b #2,d1				
	jbne _?L64				
						
	btst #3,18(a3)				
	jbeq _?L65				
						
	move.l -7008(a6),a4			
	move.l 8(a0,a4.l),d0			
_?L66:						
						
	move.l -7044(a6),a0			
	move.l d0,-4(a0)			
_?L64:						
						
	move.l 12(a6),a1			
	btst #4,30(a1)				
	jbeq _?L67				
						
	move.l 8(a1),d0				
	tst.l -7064(a6)				
	jbeq _?L252				
						
	move.l 16(a6),a2			
	lea (184,a2),a2				
	move.l a2,-7084(a6)			
_?L68:						
						
	move.l 8(a6),a0				
	move.l (a0),d2				
	move.l 4(a0),d3				
	move.l d2,-6976(a6)			
	move.l d3,-6972(a6)			
						
	move.w 16(a3),d5			
						
	moveq #0,d4				
	move.w d5,d4				
						
	cmp.b #2,d1				
	jbne _?L253				
						
	btst #3,18(a3)				
	jbeq _?L254				
	moveq #2,d3				
_?L69:						
						
	btst #0,d0				
	jbeq _?L70				
						
	tst.l -7084(a6)				
	jbne _?L71				
_?L70:						
	lea ___udivsi3,a0			
						
	cmp.l #399,d4				
	jbhi _?L72				
						
	move.l d4,d6				
	lsr.l #4,d6				
						
	pea 5.w					
	move.l d6,-(sp)				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l d0,-6912(a6)			
						
	pea 5.w					
	move.l d6,-(sp)				
	jbsr ___umodsi3				
	addq.l #8,sp				
						
	move.l d0,-6908(a6)			
						
	lsr.l #2,d4				
	moveq #3,d0				
	and.l d4,d0				
	move.l d0,-6904(a6)			
						
	moveq #3,d1				
	and.l d5,d1				
	move.l d1,-6900(a6)			
						
	add.l d3,d3				
	add.l d3,d3				
	add.l #_nsfb_table,d3			
_?L73:						
						
	sub.l a4,a4				
						
	moveq #0,d6				
						
	move.l a3,d5				
	sub.l 16(a6),d5				
_?L75:						
	move.l d6,d4				
	add.l d6,d4				
	add.l d4,d4				
						
	moveq #0,d7				
						
	move.l d5,d0				
	add.l a4,d0				
	add.l 16(a6),d0				
	move.l d0,-7084(a6)			
	jbra _?L80				
_?L61:						
						
	add.l d0,d0				
						
	move.l d0,d1				
	moveq #15,d3				
	lsr.l d3,d1				
						
	moveq #1,d4				
	and.l d4,d1				
						
	lsr.l #7,d0				
						
	and.l d3,d0				
						
	move.l d1,a1				
	lea -5(a1,d0.l),a0			
	jbra _?L62				
_?L251:						
						
	moveq #2,d2				
	move.l d2,-7016(a6)			
	jbra _?L63				
_?L271:						
	move.l d0,-7056(a6)			
						
	move.l d1,-7064(a6)			
	jbra _?L168				
_?L65:						
						
	move.l -7008(a6),d2			
	move.l 4(a0,d2.l),d0			
	jbra _?L66				
_?L252:						
						
	clr.l -7084(a6)				
	jbra _?L68				
_?L253:						
						
	moveq #0,d3				
	jbra _?L69				
_?L254:						
	moveq #1,d3				
	jbra _?L69				
_?L72:						
						
	cmp.l #499,d4				
	jbhi _?L74				
						
	add.l #-400,d4				
						
	move.l d4,d5				
	lsr.l #2,d5				
						
	pea 5.w					
	move.l d5,-(sp)				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l d0,-6912(a6)			
						
	pea 5.w					
	move.l d5,-(sp)				
	jbsr ___umodsi3				
	addq.l #8,sp				
						
	move.l d0,-6908(a6)			
						
	moveq #3,d2				
	and.l d4,d2				
	move.l d2,-6904(a6)			
						
	clr.l -6900(a6)				
						
	lsl.l #2,d3				
	add.l #_nsfb_table+12,d3		
	jbra _?L73				
_?L74:						
						
	add.l #-500,d4				
						
	pea 3.w					
	move.l d4,-(sp)				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l d0,-6912(a6)			
						
	pea 3.w					
	move.l d4,-(sp)				
	jbsr ___umodsi3				
	addq.l #8,sp				
						
	move.l d0,-6908(a6)			
						
	clr.l -6904(a6)				
						
	clr.l -6900(a6)				
						
	or.b #4,18(a3)				
						
	lsl.l #2,d3				
	add.l #_nsfb_table+24,d3		
	jbra _?L73				
_?L76:						
						
	lea (-6912,a6),a0			
	move.l (a0,d4.l),-(sp)			
	move.l 8(a6),-(sp)			
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	move.l -7084(a6),a1			
	move.b d0,28(a1,d7.l)			
						
	addq.l #1,d7				
_?L80:						
						
	move.l d3,a2				
	moveq #0,d0				
	move.b (a2,d6.l),d0			
						
	cmp.l d7,d0				
	jbhi _?L76				
	add.l d7,a4				
						
	addq.l #1,d6				
						
	moveq #4,d0				
	cmp.l d6,d0				
	jbne _?L75				
						
	moveq #39,d1				
	cmp.l a4,d1				
	jbcs _?L77				
	moveq #39,d0				
	sub.l a4,d0				
_?L78:						
	move.l d0,-(sp)				
	clr.l -(sp)				
	pea 28(a3,a4.l)				
	jbsr _memset				
_?L358:						
						
	lea (12,sp),sp				
						
	move.l 8(a6),-(sp)			
	pea -6976(a6)				
_?L359:						
						
	jbsr _mad_bit_length			
	addq.l #8,sp				
						
	move.l -7044(a6),a0			
	move.l -4(a0),d3			
						
	moveq #0,d1				
	move.w 10(a3),d1			
						
	sub.l d0,d1				
	move.l d1,-7084(a6)			
						
	jbpl _?L108				
						
	move.l #566,d0				
_?L60:						
						
	movem.l -7132(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L77:						
						
	moveq #0,d0				
	jbra _?L78				
_?L71:						
						
	move.l d4,d5				
	lsr.l #1,d5				
						
	cmp.l #179,d5				
	jbhi _?L82				
						
	move.l #___udivsi3,d6			
	pea 36.w				
	move.l d5,-(sp)				
	move.l d6,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d0,d4				
						
	lea ___umodsi3,a4			
	pea 36.w				
	move.l d5,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d5				
						
	pea 6.w					
	move.l d0,-(sp)				
	move.l d6,a1				
	jbsr (a1)				
	addq.l #8,sp				
	move.l d0,d6				
						
	pea 6.w					
	move.l d5,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
	move.l d0,d5				
						
	lsl.l #2,d3				
	add.l #_nsfb_table+36,d3		
_?L83:						
						
	move.l d4,-6912(a6)			
						
	move.l d6,-6908(a6)			
						
	move.l d5,-6904(a6)			
						
	clr.l -6900(a6)				
	lea (-6912,a6),a0			
						
	sub.l a4,a4				
						
	moveq #0,d6				
						
	moveq #1,d7				
_?L87:						
						
	move.l (a0)+,d2				
						
	move.l d7,d4				
	lsl.l d2,d4				
						
	subq.l #1,d4				
						
	moveq #0,d5				
_?L85:						
						
	move.l d3,a2				
	moveq #0,d0				
	move.b (a2,d6.l),d0			
						
	cmp.l d5,d0				
	jbhi _?L86				
						
	addq.l #1,d6				
						
	moveq #4,d0				
	cmp.l d6,d0				
	jbne _?L87				
						
	moveq #39,d1				
	cmp.l a4,d1				
	jbcs _?L88				
	moveq #39,d3				
	sub.l a4,d3				
_?L89:						
	move.l d3,-(sp)				
	clr.l -(sp)				
	pea 28(a3,a4.l)				
	move.l #_memset,d4			
	move.l d4,a0				
	jbsr (a0)				
						
	addq.l #8,sp				
	move.l d3,(sp)				
	clr.l -(sp)				
	move.l -7084(a6),a1			
	pea 18(a1,a4.l)				
	move.l d4,a2				
	jbsr (a2)				
	jbra _?L358				
_?L82:						
						
	cmp.l #243,d5				
	jbhi _?L84				
						
	add.l #-180,d5				
						
	move.l d5,d4				
	lsr.l #4,d4				
						
	move.l d5,d6				
	lsr.l #2,d6				
	moveq #3,d0				
	and.l d0,d6				
						
	and.l d0,d5				
						
	lsl.l #2,d3				
	add.l #_nsfb_table+48,d3		
	jbra _?L83				
_?L84:						
						
	add.l #-244,d5				
						
	pea 3.w					
	move.l d5,-(sp)				
	jbsr ___udivsi3				
	addq.l #8,sp				
	move.l d0,d4				
						
	pea 3.w					
	move.l d5,-(sp)				
	jbsr ___umodsi3				
	addq.l #8,sp				
	move.l d0,d6				
						
	lsl.l #2,d3				
	add.l #_nsfb_table+60,d3		
	moveq #0,d5				
	jbra _?L83				
_?L86:						
						
	move.l d2,-(sp)				
	move.l 8(a6),-(sp)			
	move.l d2,-7088(a6)			
	move.l a0,-7096(a6)			
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	move.b d0,28(a3,a4.l)			
						
	addq.l #1,a4				
						
	cmp.l d4,d0				
	seq d0					
						
	neg.b d0				
	move.l -7084(a6),a1			
	move.b d0,17(a1,a4.l)			
						
	addq.l #1,d5				
	move.l -7096(a6),a0			
	move.l -7088(a6),d2			
	jbra _?L85				
_?L88:						
						
	moveq #0,d3				
	jbra _?L89				
_?L67:						
						
	tst.l -7052(a6)				
	jbeq _?L255				
						
	move.l 16(a6),a4			
	move.l -7064(a6),d2			
	moveq #0,d3				
	move.b 8(a4,d2.l),d3			
_?L90:						
						
	move.l 8(a6),a0				
	move.l (a0),d4				
	move.l 4(a0),d5				
	move.l d4,-6912(a6)			
	move.l d5,-6908(a6)			
						
	moveq #0,d0				
	move.w 16(a3),d0			
						
	lea _sflen_table,a0			
	add.l d0,d0				
						
	moveq #0,d5				
	move.b (a0,d0.l),d5			
						
	moveq #0,d4				
	move.b 1(a0,d0.l),d4			
						
	cmp.b #2,d1				
	jbne _?L91				
						
	btst #3,18(a3)				
	jbne _?L256				
						
	moveq #17,d3				
_?L92:						
	lea (28,a3),a1				
	move.l a1,-7084(a6)			
	move.l d3,d6				
						
	lea _mad_bit_read,a4			
_?L93:						
	move.l d5,-(sp)				
	move.l 8(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l -7084(a6),a2			
	addq.l #1,-7084(a6)			
	move.b d0,(a2)+				
						
	dbra d6,_?L93				
	clr.w d6				
	subq.l #1,d6				
	jbcc _?L93				
	clr.l -7084(a6)				
						
	lea _mad_bit_read,a4			
						
	move.l a3,d5				
	add.l d3,d5				
_?L94:						
						
	move.l d4,-(sp)				
	move.l 8(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l -7084(a6),a0			
	move.b d0,29(a0,d5.l)			
						
	addq.l #1,-7084(a6)			
	moveq #18,d0				
	cmp.l -7084(a6),d0			
	jbne _?L94				
						
	move.l -7064(a6),d0			
	lsl.l #3,d0				
	sub.l -7064(a6),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l -7064(a6),d1			
	add.l d0,d1				
	move.l -7012(a6),d0			
	add.l -7052(a6),d0			
	move.l d0,a0				
	add.l d0,a0				
	add.l a0,d1				
	add.l d1,d1				
	move.l d1,a0				
	add.l 16(a6),a0				
	add.l d3,a0				
	clr.b 47(a0)				
	clr.b 48(a0)				
	clr.b 49(a0)				
_?L95:						
						
	move.l 8(a6),-(sp)			
	pea -6912(a6)				
	jbra _?L359				
_?L255:						
						
	moveq #0,d3				
	jbra _?L90				
_?L256:						
						
	moveq #16,d3				
	jbra _?L92				
_?L91:						
						
	moveq #8,d6				
	and.l d3,d6				
						
	lea _mad_bit_read,a4			
						
	move.w d3,ccr				
	jbpl _?L96				
	lea (-6,a5),a0				
						
	moveq #0,d0				
_?L97:						
						
	move.b (a0)+,d1				
						
	move.l -7024(a6),d2			
	move.b d1,-1(a0,d2.l)			
						
	addq.l #1,d0				
						
	moveq #6,d1				
	cmp.l d0,d1				
	jbne _?L97				
_?L100:						
						
	move.w d3,ccr				
	jbeq _?L98				
						
	move.w #6,a0				
	move.l a0,-7084(a6)			
						
	lea _mad_bit_read,a4			
_?L99:						
	move.l d5,-(sp)				
	move.l 8(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l -7084(a6),a1			
	move.b d0,28(a3,a1.l)			
						
	addq.l #1,-7084(a6)			
						
	moveq #11,d0				
	cmp.l -7084(a6),d0			
	jbne _?L99				
	jbra _?L103				
_?L96:						
						
	move.l d5,-(sp)				
	move.l 8(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.b d0,28(a3,d6.l)			
						
	addq.l #1,d6				
						
	moveq #6,d0				
	cmp.l d6,d0				
	jbne _?L96				
	jbra _?L100				
_?L98:						
						
	move.b (a5),34(a3)			
	move.b 1(a5),35(a3)			
	move.b 2(a5),36(a3)			
	move.b 3(a5),37(a3)			
	move.b 4(a5),38(a3)			
_?L103:						
						
	btst #1,d3				
	jbne _?L101				
						
	move.w #11,a0				
	move.l a0,-7084(a6)			
						
	lea _mad_bit_read,a4			
_?L102:						
	move.l d4,-(sp)				
	move.l 8(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l -7084(a6),a1			
	move.b d0,28(a3,a1.l)			
						
	addq.l #1,-7084(a6)			
						
	moveq #16,d0				
	cmp.l -7084(a6),d0			
	jbne _?L102				
	jbra _?L106				
_?L101:						
						
	move.b 5(a5),39(a3)			
	move.b 6(a5),40(a3)			
	move.b 7(a5),41(a3)			
	move.b 8(a5),42(a3)			
	move.b 9(a5),43(a3)			
_?L106:						
						
	btst #0,d3				
	jbne _?L104				
						
	move.w #16,a0				
	move.l a0,-7084(a6)			
						
	lea _mad_bit_read,a4			
_?L105:						
	move.l d4,-(sp)				
	move.l 8(a6),-(sp)			
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l -7084(a6),d1			
	move.b d0,28(a3,d1.l)			
						
	addq.l #1,-7084(a6)			
						
	moveq #21,d2				
	cmp.l -7084(a6),d2			
	jbne _?L105				
	jbra _?L107				
_?L104:						
						
	move.b 10(a5),44(a3)			
	move.b 11(a5),45(a3)			
	move.b 12(a5),46(a3)			
	move.b 13(a5),47(a3)			
	move.b 14(a5),48(a3)			
_?L107:						
						
	clr.b 49(a3)				
	jbra _?L95				
_?L108:						
						
	moveq #0,d0				
	move.w 14(a3),d0			
						
	add.l #-210,d0				
						
	move.b 18(a3),d2			
						
	btst #1,d2				
	jbne _?L257				
	moveq #1,d1				
_?L110:						
						
	cmp.b #2,19(a3)				
	jbne _?L111				
						
	move.w d2,ccr				
	jbpl _?L258				
						
	lsr.b #2,d2				
	moveq #1,d4				
	and.l d4,d2				
	neg.l d2				
	lea (-6912,a6),a2			
						
	sub.l a1,a1				
						
	sub.l a0,a0				
						
	lea _pretab,a4				
_?L113:						
	moveq #0,d4				
	move.b (a4,a0.l),d4			
						
	and.l d2,d4				
						
	moveq #0,d5				
	move.b 28(a3,a0.l),d5			
						
	add.l d5,d4				
						
	lsl.l d1,d4				
						
	move.l d0,d5				
	sub.l d4,d5				
	move.l d5,(a2)+				
						
	addq.l #1,a0				
						
	moveq #0,d4				
	move.b -1(a0,d3.l),d4			
						
	add.l d4,a1				
						
	moveq #35,d4				
	cmp.l a1,d4				
	jbcc _?L113				
_?L112:						
						
	moveq #0,d2				
	move.b 23(a3),d2			
	lsl.l #3,d2				
						
	move.l d0,d6				
	sub.l d2,d6				
						
	moveq #0,d2				
	move.b 24(a3),d2			
	lsl.l #3,d2				
						
	move.l d0,d5				
	sub.l d2,d5				
						
	moveq #0,d2				
	move.b 25(a3),d2			
	lsl.l #3,d2				
						
	sub.l d2,d0				
	lea 28(a3,a0.l),a4			
	move.l a0,d2				
	add.l a0,d2				
	add.l d2,d2				
	lea (-6912,a6),a2			
	add.l d2,a2				
	add.l d3,a0				
_?L114:						
						
	moveq #0,d2				
	move.b (a4),d2				
						
	lsl.l d1,d2				
						
	move.l d6,d4				
	sub.l d2,d4				
	move.l d4,(a2)				
						
	moveq #0,d2				
	move.b 1(a4),d2				
						
	lsl.l d1,d2				
						
	move.l d5,d4				
	sub.l d2,d4				
	move.l d4,4(a2)				
						
	moveq #0,d2				
	move.b 2(a4),d2				
						
	lsl.l d1,d2				
						
	move.l d0,d4				
	sub.l d2,d4				
	move.l d4,8(a2)				
						
	moveq #0,d2				
	move.b (a0),d2				
	move.l d2,d4				
	add.l d2,d4				
	add.l d4,d2				
						
	add.l d2,a1				
						
	addq.l #3,a4				
	lea (12,a2),a2				
	addq.l #3,a0				
	cmp.w #575,a1				
	jbls _?L114				
_?L119:						
						
	move.l -7056(a6),a4			
						
	move.l 8(a6),a2				
	move.l (a2),a0				
	move.l 4(a2),a1				
	move.l a0,-6988(a6)			
	move.l a1,-6984(a6)			
						
	move.l -7084(a6),-(sp)			
	move.l a2,-(sp)				
	jbsr _mad_bit_skip			
	addq.l #8,sp				
						
	moveq #0,d5				
	move.w -6982(a6),d5			
						
	moveq #31,d0				
	sub.l d5,d0				
						
	moveq #-8,d1				
	and.l d1,d0				
						
	add.l d0,d5				
						
	move.l d5,-(sp)				
	pea -6988(a6)				
	jbsr _mad_bit_read			
	addq.l #8,sp				
	move.l d0,d7				
						
	move.l -7084(a6),a0			
	sub.l d5,a0				
	move.l a0,-7100(a6)			
						
	move.l d3,a1				
	addq.l #1,a1				
	move.l a1,-7080(a6)			
	subq.l #1,a1				
	moveq #0,d0				
	move.b (a1)+,d0				
	add.l d0,d0				
	add.l d0,d0				
						
	add.l -7056(a6),d0			
	move.l d0,-7076(a6)			
						
	moveq #0,d0				
	move.b 26(a3),d0			
						
	addq.l #1,d0				
	move.l d0,-7048(a6)			
						
	moveq #0,d0				
	move.b 20(a3),d0			
						
	lea _mad_huff_pair_table,a0		
	lsl.l #3,d0				
	move.l (a0,d0.l),-7068(a6)		
						
	add.l d0,a0				
						
	moveq #0,d6				
	move.w 4(a0),d6				
						
	moveq #0,d1				
	move.w 6(a0),d1				
	move.l d1,-7036(a6)			
						
	tst.l -7068(a6)				
	jbne _?L356				
_?L115:						
	move.l #567,d0				
	jbra _?L60				
_?L257:						
						
	moveq #2,d1				
	jbra _?L110				
_?L258:						
						
	sub.l a1,a1				
						
	sub.l a0,a0				
	jbra _?L112				
_?L111:						
	lea (-6912,a6),a0			
						
	sub.l a1,a1				
						
	move.w d2,ccr				
	jbne _?L120				
						
	lea _pretab,a2				
_?L118:						
						
	moveq #0,d2				
	move.b 28(a3,a1.l),d2			
						
	moveq #0,d4				
	move.b (a2,a1.l),d4			
						
	add.l d4,d2				
						
	lsl.l d1,d2				
						
	move.l d0,d4				
	sub.l d2,d4				
	move.l d4,(a0)+				
						
	addq.l #1,a1				
						
	moveq #22,d5				
	cmp.l a1,d5				
	jbne _?L118				
	jbra _?L119				
_?L120:						
						
	moveq #0,d2				
	move.b 28(a3,a1.l),d2			
						
	lsl.l d1,d2				
						
	move.l d0,d4				
	sub.l d2,d4				
	move.l d4,(a0)+				
						
	addq.l #1,a1				
						
	moveq #22,d5				
	cmp.l a1,d5				
	jbne _?L120				
	jbra _?L119				
_?L356:						
						
	move.l -6912(a6),d3			
						
	moveq #0,d1				
	move.w 12(a3),d1			
	move.l d1,-7028(a6)			
						
	moveq #0,d4				
						
	clr.l -7040(a6)				
						
	lea (-6908,a6),a0			
	move.l a0,-7084(a6)			
						
	move.l -7064(a6),d0			
	lsl.l #3,d0				
	sub.l -7064(a6),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,-7000(a6)			
_?L121:						
						
	move.l d5,d0				
	add.l -7100(a6),d0			
						
	tst.l -7028(a6)				
	jbeq _?L149				
	tst.l d0				
	jbgt _?L150				
_?L149:						
						
	tst.l d0				
	jbge _?L151				
						
	move.l #568,d0				
	jbra _?L60				
_?L150:						
						
	cmp.l -7076(a6),a4			
	jbne _?L122				
						
	move.l -7080(a6),a1			
						
	moveq #0,d0				
	move.b (a1)+,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l a4,d0				
	move.l d0,-7076(a6)			
						
	subq.l #1,-7048(a6)			
	jbne _?L123				
						
	tst.l -7040(a6)				
	jbne _?L124				
						
	moveq #0,d0				
	move.b 27(a3),d0			
						
	addq.l #1,d0				
	move.l d0,-7048(a6)			
_?L124:						
						
	addq.l #1,-7040(a6)			
						
	move.l -7012(a6),d0			
	add.l -7052(a6),d0			
	add.l d0,d0				
	move.l -7000(a6),a0			
	add.l -7064(a6),a0			
	add.l a0,d0				
	add.l d0,d0				
	add.l 16(a6),d0				
	move.l -7040(a6),a2			
	move.b 20(a2,d0.l),d0			
	and.l #255,d0				
						
	lea _mad_huff_pair_table,a0		
	lsl.l #3,d0				
	move.l (a0,d0.l),-7068(a6)		
						
	add.l d0,a0				
						
	moveq #0,d6				
	move.w 4(a0),d6				
						
	moveq #0,d1				
	move.w 6(a0),d1				
	move.l d1,-7036(a6)			
						
	tst.l -7068(a6)				
	jbeq _?L115				
_?L123:						
						
	move.l -7084(a6),a0			
	move.l (a0),d0				
						
	cmp.l d0,d3				
	jbeq _?L125				
						
	moveq #0,d4				
_?L125:						
						
	addq.l #4,-7084(a6)			
	move.l d0,d3				
						
	move.l a1,-7080(a6)			
_?L122:						
						
	moveq #20,d0				
	cmp.l d5,d0				
	jblt _?L126				
						
	moveq #31,d2				
	sub.l d5,d2				
						
	moveq #-8,d1				
	and.l d1,d2				
						
	lsl.l d2,d7				
						
	move.l d2,-(sp)				
	pea -6988(a6)				
	move.l d2,-7088(a6)			
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	or.l d0,d7				
						
	move.l -7088(a6),d2			
	add.l d2,d5				
						
	sub.l d2,-7100(a6)			
_?L126:						
						
	move.l d5,d2				
	sub.l -7036(a6),d2			
	move.l d7,d0				
	lsr.l d2,d0				
	moveq #1,d2				
	move.l -7036(a6),d1			
	lsl.l d1,d2				
	subq.l #1,d2				
	and.l d2,d0				
						
	add.l d0,d0				
						
	move.l -7068(a6),a0			
	add.l d0,a0				
						
	move.l d1,d2				
						
	move.w #1,a1				
_?L127:						
	move.b (a0),d0				
						
	jbpl _?L128				
						
	lsr.b #4,d0				
	moveq #7,d2				
	and.l d2,d0				
						
	sub.l d0,d5				
						
	move.b (a0),d0				
	and.b #15,d0				
						
	moveq #0,d2				
	move.b d0,d2				
						
	tst.l d6				
	jbeq _?L129				
						
	tst.b d0				
	jbeq _?L259				
	cmp.b #15,d0				
	jbne _?L131				
						
	move.l d6,d0				
	addq.l #2,d0				
						
	cmp.l d0,d5				
	jbcc _?L132				
						
	swap d7					
	clr.w d7				
						
	pea 16.w				
	pea -6988(a6)				
	move.l a0,-7096(a6)			
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	or.l d0,d7				
						
	moveq #16,d0				
	add.l d0,d5				
						
	moveq #-16,d1				
	add.l d1,-7100(a6)			
	move.l -7096(a6),a0			
_?L132:						
						
	sub.l d6,d5				
						
	move.l d3,-(sp)				
						
	moveq #1,d0				
	lsl.l d6,d0				
	subq.l #1,d0				
	move.l d7,d2				
	lsr.l d5,d2				
	and.l d2,d0				
						
	move.l d0,a1				
	pea 15(a1)				
	move.l a0,-7096(a6)			
	jbsr _III_requantize			
	addq.l #8,sp				
_?L360:						
						
	move.l -7096(a6),a0			
	jbra _?L133				
_?L128:						
						
	sub.l d2,d5				
						
	lsr.b #4,d0				
						
	moveq #7,d2				
	and.l d0,d2				
						
	move.l d5,d0				
	sub.l d2,d0				
	move.l d7,d1				
	lsr.l d0,d1				
	move.l a1,d0				
	lsl.l d2,d0				
	subq.l #1,d0				
	and.l d1,d0				
						
	move.w (a0),d1				
	and.w #4095,d1				
	move.w d1,a0				
	moveq #0,d1				
	move.w a0,d1				
	move.l d1,a0				
						
	add.l a0,d0				
						
	add.l d0,d0				
						
	move.l -7068(a6),a0			
	add.l d0,a0				
	jbra _?L127				
_?L131:						
						
	moveq #1,d0				
	lsl.l d2,d0				
						
	move.l d0,d1				
	and.l d4,d1				
						
	jbeq _?L134				
						
	add.l d2,d2				
	add.l d2,d2				
	lea (a6,d2.l),a1			
	move.l -6976(a1),d0			
_?L133:						
						
	subq.l #1,d5				
						
	btst d5,d7				
	jbeq _?L130				
	neg.l d0				
_?L130:						
						
	move.l d0,(a4)				
						
	move.b 1(a0),d2				
	lsr.b #4,d2				
						
	jbeq _?L262				
	cmp.b #15,d2				
	jbne _?L137				
						
	move.l d6,d0				
	addq.l #1,d0				
						
	cmp.l d0,d5				
	jbcc _?L138				
						
	swap d7					
	clr.w d7				
						
	pea 16.w				
	pea -6988(a6)				
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	or.l d0,d7				
						
	moveq #16,d0				
	add.l d0,d5				
						
	moveq #-16,d1				
	add.l d1,-7100(a6)			
_?L138:						
						
	sub.l d6,d5				
						
	move.l d3,-(sp)				
						
	moveq #1,d0				
	lsl.l d6,d0				
	subq.l #1,d0				
	move.l d7,d2				
	lsr.l d5,d2				
	and.l d2,d0				
						
	move.l d0,a0				
	pea 15(a0)				
	jbsr _III_requantize			
	addq.l #8,sp				
_?L147:						
						
	subq.l #1,d5				
						
	btst d5,d7				
	jbeq _?L136				
	neg.l d0				
_?L136:						
						
	move.l d0,4(a4)				
						
	addq.l #8,a4				
	subq.l #1,-7028(a6)			
	jbra _?L121				
_?L134:						
						
	or.l d0,d4				
						
	move.l d3,-(sp)				
	move.l d2,-(sp)				
	move.l d2,-7088(a6)			
	move.l a0,-7096(a6)			
	jbsr _III_requantize			
	addq.l #8,sp				
						
	move.l -7088(a6),d2			
	add.l d2,d2				
	add.l d2,d2				
	lea (a6,d2.l),a1			
	move.l d0,-6976(a1)			
	jbra _?L360				
_?L259:						
						
	moveq #0,d0				
	jbra _?L130				
_?L137:						
						
	and.l #255,d2				
						
	moveq #1,d0				
	lsl.l d2,d0				
						
	move.l d0,d1				
	and.l d4,d1				
						
	jbeq _?L140				
						
	add.l d2,d2				
	add.l d2,d2				
	lea (a6,d2.l),a0			
_?L365:						
						
	move.l -6976(a0),d0			
	jbra _?L147				
_?L140:						
						
	or.l d0,d4				
						
	move.l d3,-(sp)				
	move.l d2,-(sp)				
	move.l d2,-7088(a6)			
	jbsr _III_requantize			
	addq.l #8,sp				
						
	move.l -7088(a6),d2			
	add.l d2,d2				
	add.l d2,d2				
	lea (a6,d2.l),a0			
_?L364:						
						
	move.l d0,-6976(a0)			
	jbra _?L147				
_?L139:						
_?L129:						
						
	tst.b d0				
	jbeq _?L261				
						
	moveq #1,d0				
	lsl.l d2,d0				
						
	move.l d4,d1				
	and.l d0,d1				
						
	jbeq _?L143				
						
	add.l d2,d2				
	add.l d2,d2				
	lea (a6,d2.l),a1			
	move.l -6976(a1),d0			
_?L144:						
						
	subq.l #1,d5				
						
	btst d5,d7				
	jbeq _?L142				
	neg.l d0				
_?L142:						
						
	move.l d0,(a4)				
						
	move.b 1(a0),d0				
	lsr.b #4,d0				
						
	and.l #255,d0				
	move.l d0,a0				
						
	tst.l d0				
	jbeq _?L262				
						
	moveq #1,d0				
	move.l a0,d1				
	lsl.l d1,d0				
						
	move.l d0,d2				
	and.l d4,d2				
						
	jbeq _?L146				
						
	add.l a0,a0				
	add.l a0,a0				
	lea (a6,a0.l),a0			
	jbra _?L365				
_?L143:						
						
	or.l d0,d4				
						
	move.l d3,-(sp)				
	move.l d2,-(sp)				
	move.l d2,-7088(a6)			
	move.l a0,-7096(a6)			
	jbsr _III_requantize			
	addq.l #8,sp				
						
	move.l -7088(a6),d2			
	add.l d2,d2				
	add.l d2,d2				
	lea (a6,d2.l),a1			
	move.l d0,-6976(a1)			
	move.l -7096(a6),a0			
	jbra _?L144				
_?L261:						
	moveq #0,d0				
	jbra _?L142				
_?L146:						
						
	or.l d0,d4				
						
	move.l d3,-(sp)				
	move.l a0,-(sp)				
	move.l a0,-7096(a6)			
	jbsr _III_requantize			
	addq.l #8,sp				
						
	move.l -7096(a6),a0			
	add.l a0,a0				
	add.l a0,a0				
	lea (a6,a0.l),a0			
	jbra _?L364				
_?L262:						
	moveq #0,d0				
	jbra _?L136				
_?L151:						
						
	move.b 18(a3),d0			
	and.b #1,d0				
	and.l #255,d0				
						
	add.l d0,d0				
	add.l d0,d0				
	lea _mad_huff_quad_table,a0		
	move.l (a0,d0.l),-7068(a6)		
						
	move.l d3,-(sp)				
	pea 1.w					
	move.l #_III_requantize,d4		
	move.l d4,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d0,d2				
						
	move.l -7056(a6),d1			
	add.l #2288,d1				
	move.l d1,-7040(a6)			
_?L152:						
						
	move.l d5,d0				
	add.l -7100(a6),d0			
						
	tst.l d0				
	jble _?L163				
	cmp.l -7040(a6),a4			
	jbls _?L164				
_?L165:						
						
	moveq #-64,d0				
	cmp.l -7100(a6),d0			
	jbgt _?L357				
	move.l -7056(a6),d0			
	add.l #2304,d0				
_?L166:						
						
	cmp.l a4,d0				
	jbhi _?L167				
						
	move.l -7064(a6),d1			
	addq.l #1,d1				
						
	lea (58,a3),a3				
	lea (58,a5),a5				
	cmp.l 20(a6),d1				
	jbne _?L271				
						
	move.l -7060(a6),a0			
	move.b 1(a0),d0				
						
	moveq #2,d1				
	move.l 12(a6),a0			
	cmp.l 4(a0),d1				
	jbne _?L169				
						
	move.l 8(a0),-7080(a6)			
						
	jbeq _?L169				
						
	move.l -6996(a6),-7084(a6)		
						
	move.l -7060(a6),a1			
	move.b 59(a1),d1			
						
	cmp.b d1,d0				
	jbeq _?L170				
_?L171:						
						
	move.l #569,d0				
	jbra _?L60				
_?L164:						
						
	moveq #9,d0				
	cmp.l d5,d0				
	jblt _?L153				
						
	swap d7					
	clr.w d7				
						
	pea 16.w				
	pea -6988(a6)				
	move.l d2,-7088(a6)			
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	or.l d0,d7				
						
	moveq #16,d1				
	add.l d1,d5				
						
	moveq #-16,d0				
	add.l d0,-7100(a6)			
	move.l -7088(a6),d2			
_?L153:						
						
	move.l d5,d6				
	subq.l #4,d6				
	move.l d7,d0				
	lsr.l d6,d0				
	moveq #15,d1				
	and.l d1,d0				
						
	add.l d0,d0				
						
	move.l -7068(a6),a0			
	add.l d0,a0				
						
	tst.b (a0)				
	jblt _?L154				
						
	move.b (a0),d1				
	lsr.b #4,d1				
	moveq #7,d5				
	and.l d5,d1				
	move.l d6,d0				
	sub.l d1,d0				
	move.l d7,d5				
	lsr.l d0,d5				
	moveq #1,d0				
	lsl.l d1,d0				
	subq.l #1,d0				
	and.l d5,d0				
						
	move.w (a0),d1				
	and.w #4095,d1				
	and.l #65535,d1				
						
	add.l d1,d0				
						
	add.l d0,d0				
						
	move.l -7068(a6),a0			
	add.l d0,a0				
						
	move.l d6,d5				
_?L154:						
						
	move.b (a0),d0				
	lsr.b #4,d0				
	moveq #7,d1				
	and.l d1,d0				
						
	sub.l d0,d5				
						
	cmp.l -7076(a6),a4			
	jbne _?L155				
						
	move.l -7080(a6),d6			
						
	move.l d6,a1				
	moveq #0,d0				
	move.b (a1)+,d0				
	move.l a1,d6				
	add.l d0,d0				
	add.l d0,d0				
	add.l a4,d0				
	move.l d0,-7076(a6)			
						
	move.l -7084(a6),a2			
	move.l (a2),a1				
						
	cmp.l a1,d3				
	jbeq _?L156				
						
	move.l a1,-(sp)				
	pea 1.w					
	move.l a0,-7096(a6)			
	move.l a1,-7088(a6)			
	move.l d4,a2				
	jbsr (a2)				
	addq.l #8,sp				
	move.l d0,d2				
	move.l -7088(a6),a1			
	move.l -7096(a6),a0			
_?L156:						
						
	addq.l #4,-7084(a6)			
	move.l a1,d3				
						
	move.l d6,-7080(a6)			
_?L155:						
						
	move.b (a0),d6				
						
	move.w d6,ccr				
	jbpl _?L263				
						
	subq.l #1,d5				
						
	move.l d2,d0				
	btst d5,d7				
	jbeq _?L157				
	neg.l d0				
_?L157:						
						
	move.l d0,(a4)				
						
	move.w d6,ccr				
	jbne _?L265				
						
	subq.l #1,d5				
						
	move.l d2,d0				
	btst d5,d7				
	jbeq _?L158				
	neg.l d0				
_?L158:						
						
	move.l d0,4(a4)				
	move.l a4,d0				
	addq.l #8,d0				
						
	cmp.l -7076(a6),d0			
	jbne _?L159				
						
	move.l -7080(a6),a0			
						
	moveq #0,d0				
	move.b (a0)+,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l d0,-7076(a6)			
						
	move.l -7084(a6),a2			
	move.l (a2),a1				
						
	cmp.l a1,d3				
	jbeq _?L160				
						
	move.l a1,-(sp)				
	pea 1.w					
	move.l a0,-7096(a6)			
	move.l a1,-7088(a6)			
	move.l d4,a2				
	jbsr (a2)				
	addq.l #8,sp				
	move.l d0,d2				
	move.l -7088(a6),a1			
	move.l -7096(a6),a0			
_?L160:						
						
	addq.l #4,-7084(a6)			
	move.l a1,d3				
						
	move.l a0,-7080(a6)			
_?L159:						
						
	btst #1,d6				
	jbeq _?L267				
						
	subq.l #1,d5				
						
	move.l d2,d0				
	btst d5,d7				
	jbeq _?L161				
	neg.l d0				
_?L161:						
						
	move.l d0,8(a4)				
						
	btst #0,d6				
	jbeq _?L269				
						
	subq.l #1,d5				
						
	move.l d2,d0				
	btst d5,d7				
	jbeq _?L162				
	neg.l d0				
_?L162:						
						
	move.l d0,12(a4)			
						
	lea (16,a4),a4				
	jbra _?L152				
_?L263:						
						
	moveq #0,d0				
	jbra _?L157				
_?L265:						
						
	moveq #0,d0				
	jbra _?L158				
_?L267:						
						
	moveq #0,d0				
	jbra _?L161				
_?L269:						
						
	moveq #0,d0				
	jbra _?L162				
_?L163:						
						
	tst.l d0				
	jbeq _?L165				
						
	lea (-16,a4),a4				
	jbra _?L165				
_?L357:						
						
	jbsr _abort				
_?L167:						
						
	clr.l (a4)				
						
	clr.l 4(a4)				
						
	addq.l #8,a4				
	jbra _?L166				
_?L170:						
						
	move.l -7060(a6),a2			
	move.b 58(a2),d0			
						
	move.b (a2),d2				
	eor.b d0,d2				
						
	move.w d2,ccr				
	jbmi _?L171				
	lea (-6912,a6),a4			
	move.l a4,-7068(a6)			
	move.w #78,a1				
	add.l a4,a1				
	move.l a4,a0				
						
	move.w -7078(a6),d6			
_?L172:						
	move.w -7078(a6),(a0)+			
						
	cmp.l a1,a0				
	jbne _?L172				
						
	btst #0,-7077(a6)			
	jbne _?L173				
_?L210:						
						
	btst #1,-7077(a6)			
	jbne _?L174				
_?L169:						
						
	move.l -7060(a6),-7068(a6)		
	move.l -7020(a6),d3			
	move.l -7060(a6),-7080(a6)		
	moveq #111,d7				
	not.b d7				
	clr.l -7084(a6)				
						
	lea (-6912,a6),a3			
_?L248:						
						
	move.l -7080(a6),a0			
	move.b 1(a0),-7056(a6)			
	move.l d7,d1				
	add.l #-144,d1				
	move.l d1,-7076(a6)			
						
	cmp.b #2,-7056(a6)			
	jbne _?L222				
						
	move.l -7084(a6),d0			
	add.l d0,d0				
	add.l d0,d0				
	lea (-6996,a6),a0			
	move.l (a0,d0.l),a0			
						
	move.l -7068(a6),a1			
	btst #3,(a1)				
	jbeq _?L276				
						
	moveq #0,d0				
_?L224:						
						
	moveq #0,d1				
	move.b (a0)+,d1				
						
	add.l d1,d0				
						
	moveq #35,d1				
	cmp.l d0,d1				
	jbcc _?L224				
						
	moveq #2,d5				
_?L223:						
						
	move.l d5,-6988(a6)			
						
	clr.l -6976(a6)				
						
	move.l d5,-6984(a6)			
						
	clr.l -6972(a6)				
						
	move.l d5,-6980(a6)			
						
	clr.l -6968(a6)				
						
	moveq #0,d6				
	move.b (a0)+,d6				
						
	move.l d5,d4				
	lsl.l #3,d4				
	add.l d5,d4				
	add.l d4,d4				
						
	sub.l a2,a2				
_?L228:						
						
	tst.l d6				
	jbeq _?L225				
						
	subq.l #1,d6				
_?L226:						
						
	move.l a2,d1				
	add.l a2,d1				
	move.l d1,a1				
	add.l d1,a1				
	lea (a6,a1.l),a1			
	lea (-6988,a1),a4			
	move.l a4,-7040(a6)			
	move.l (a4),d0				
						
	lea (-6976,a1),a1			
	move.l (a1),a4				
						
	move.l a4,d2				
	addq.l #1,d2				
	move.l d2,(a1)				
						
	lea (a2,d1.l),a5			
	move.l d0,d1				
	lsl.l #3,d1				
	add.l d0,d1				
	add.l a5,d1				
	add.l d1,d1				
	add.l a4,d1				
	add.l d1,d1				
	add.l d1,d1				
	add.l a6,d1				
	move.l d1,-7048(a6)			
						
	move.l d4,d1				
	add.l d4,d1				
	add.l d1,d1				
						
	move.l -7048(a6),a5			
	move.l -7072(a6),a4			
	move.l (a4,d1.l),-6912(a5)		
						
	subq.l #6,d2				
	jbne _?L227				
						
	clr.l (a1)				
						
	addq.l #1,d0				
	move.l -7040(a6),a1			
	move.l d0,(a1)				
_?L227:						
						
	addq.l #1,d4				
						
	cmp.l #576,d4				
	jbne _?L228				
						
	move.l d5,d0				
	lsl.l #3,d0				
	add.l d5,d0				
	lsl.l #3,d0				
	move.l #2304,d1				
	sub.l d0,d1				
	move.l d1,-(sp)				
	pea (a3,d0.l)				
	move.l -7072(a6),a0			
	pea (a0,d0.l)				
	jbsr _memcpy				
	lea (12,sp),sp				
						
	move.l -7080(a6),a1			
	btst #3,(a1)				
	jbeq _?L229				
						
	pea 36.w				
	move.l -7072(a6),-(sp)			
	jbsr _III_aliasreduce			
	addq.l #8,sp				
_?L230:						
						
	moveq #0,d4				
_?L232:						
						
	move.l d4,-(sp)				
	move.l a3,-(sp)				
	move.l -7072(a6),-(sp)			
	jbsr _III_imdct_l			
	lea (12,sp),sp				
						
	move.l 12(a6),a1			
	move.l 9264(a1),a5			
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l -7076(a6),a2			
	pea (a5,a2.l)				
	move.l a3,-(sp)				
	lea _III_overlap,a4			
	jbsr (a4)				
						
	lea (12,sp),sp				
	move.l d4,(sp)				
	move.l a3,-(sp)				
	move.l -7072(a6),a0			
	pea 72(a0)				
	jbsr _III_imdct_l			
	lea (12,sp),sp				
	jbra _?L362				
_?L173:						
						
	move.l 12(a6),a5			
	move.l 28(a5),-7076(a6)			
						
	move.l -7076(a6),d2			
	or.w #256,d2				
	move.l d2,28(a5)			
						
	cmp.b #2,d1				
	jbne _?L272				
						
	clr.l -6968(a6)				
						
	clr.l -6972(a6)				
						
	clr.l -6976(a6)				
						
	sub.l a5,a5				
						
	move.w d0,ccr				
	jbpl _?L273				
						
	moveq #0,d5				
						
	move.l a6,d4				
	add.l #-2304,d4				
						
	moveq #0,d3				
_?L181:						
						
	addq.l #1,d3				
						
	move.l -7084(a6),a0			
	move.b -1(a0,d3.l),d0			
						
	moveq #0,d2				
	move.b d0,d2				
	move.l d4,a0				
						
	moveq #0,d1				
_?L178:						
						
	cmp.l d2,d1				
	jbcs _?L180				
_?L179:						
						
	and.l #255,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l d0,d4				
						
	add.l d2,d5				
						
	moveq #35,d0				
	cmp.l d5,d0				
	jbcc _?L181				
_?L177:						
						
	move.l d3,a4				
						
	moveq #0,d7				
						
	sub.l a0,a0				
						
	lea ___umodsi3,a3			
_?L186:						
						
	addq.l #1,a4				
						
	move.l -7084(a6),a1			
	move.b -1(a1,a4.l),d1			
						
	moveq #0,d2				
	move.b d1,d2				
	move.l d4,a1				
						
	moveq #0,d0				
_?L182:						
						
	cmp.l d2,d0				
	jbcc _?L184				
						
	tst.l (a1)+				
	jbeq _?L183				
						
	move.l a0,d0				
	add.l a0,d0				
	add.l d0,d0				
	lea (a6,d0.l),a1			
	move.l a4,-6976(a1)			
						
	move.l a4,d7				
_?L184:						
						
	and.l #255,d1				
	add.l d1,d1				
	add.l d1,d1				
	add.l d1,d4				
						
	add.l d2,d5				
						
	pea 3.w					
	pea 1(a0)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,a0				
						
	cmp.l #575,d5				
	jbls _?L186				
						
	tst.l d7				
	jbeq _?L187				
	move.l d3,a5				
_?L187:						
						
	move.l -7068(a6),a0			
						
	moveq #0,d0				
_?L188:						
						
	cmp.l d0,a5				
	jbne _?L189				
						
	sub.l a1,a1				
						
	lea (-6912,a6),a4			
						
	lea ___umodsi3,a3			
_?L190:						
						
	cmp.l d3,d7				
	jbhi _?L192				
_?L193:						
	move.w #68,a3				
	add.l -7060(a6),a3			
						
	btst #4,-7074(a6)			
	jbeq _?L199				
	move.l -7060(a6),a0			
	move.w 56(a0),d5			
	and.w #1,d5				
	mulu.w #60,d5				
	move.l -7084(a6),a0			
						
	move.l -7068(a6),a5			
						
	moveq #0,d3				
_?L209:						
						
	moveq #0,d4				
	move.b (a0)+,d4				
						
	move.w (a5)+,d0				
						
	btst #0,d0				
	jbeq _?L201				
						
	tst.b 116(a3)				
	jbeq _?L202				
						
	and.w #-2,d0				
	move.w d0,-2(a5)			
_?L201:						
						
	add.l d4,d3				
						
	addq.l #1,a3				
	cmp.l #575,d3				
	jbls _?L209				
	jbra _?L210				
_?L180:						
						
	tst.l (a0)+				
	jbne _?L274				
						
	addq.l #1,d1				
	jbra _?L178				
_?L274:						
						
	move.l d3,a5				
	jbra _?L179				
_?L273:						
						
	move.l a6,d4				
	add.l #-2304,d4				
						
	moveq #0,d5				
						
	moveq #0,d3				
	jbra _?L177				
_?L183:						
						
	addq.l #1,d0				
	jbra _?L182				
_?L189:						
						
	move.w d6,d1				
	and.w #-2,d1				
	move.w d1,(a0)+				
						
	addq.l #1,d0				
	jbra _?L188				
_?L192:						
						
	move.l a1,d1				
	add.l a1,d1				
	add.l d1,d1				
	lea (a6,d1.l),a0			
						
	cmp.l -6976(a0),d3			
	jbcc _?L191				
						
	move.l d3,d0				
	add.l d3,d0				
						
	move.w d6,d2				
	and.w #-2,d2				
	move.w d2,(a4,d0.l)			
_?L191:						
						
	pea 3.w					
	pea 1(a1)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,a1				
						
	addq.l #1,d3				
	jbra _?L190				
_?L272:						
						
	moveq #0,d3				
						
	sub.l a0,a0				
						
	lea (-2304,a6),a1			
						
	moveq #0,d1				
_?L176:						
						
	addq.l #1,d1				
						
	move.l -7084(a6),a2			
	move.b -1(a2,d1.l),d0			
						
	moveq #0,d4				
	move.b d0,d4				
	move.l a1,a2				
						
	moveq #0,d2				
_?L194:						
						
	cmp.l d4,d2				
	jbcs _?L196				
_?L195:						
						
	and.l #255,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l d0,a1				
						
	add.l d4,a0				
						
	cmp.w #575,a0				
	jbls _?L176				
	move.l -7068(a6),a0			
						
	moveq #0,d0				
_?L197:						
						
	cmp.l d0,d3				
	jbeq _?L193				
						
	move.w d6,d1				
	and.w #-2,d1				
	move.w d1,(a0)+				
						
	addq.l #1,d0				
	jbra _?L197				
_?L196:						
						
	tst.l (a2)+				
	jbne _?L275				
						
	addq.l #1,d2				
	jbra _?L194				
_?L275:						
						
	move.l d1,d3				
	jbra _?L195				
_?L202:						
						
	moveq #0,d1				
	move.b (a3),d1				
						
	move.l d1,d0				
	subq.l #1,d0				
	moveq #-2,d2				
	and.l d2,d0				
	add.l d0,d0				
	move.l d0,d7				
	add.l d5,d7				
	move.l d7,a1				
	add.l #_is_lsf_table,a1			
	move.l d3,d0				
	add.l d3,d0				
	add.l d0,d0				
	lea (-4608,a6),a4			
	add.l d0,a4				
						
	moveq #0,d6				
						
	move.b (a3),d0				
	and.b #1,d0				
	move.b d0,-7076(a6)			
_?L203:						
						
	cmp.l d4,d6				
	jbcc _?L201				
						
	move.l (a4)+,d7				
						
	tst.l d1				
	jbne _?L204				
_?L206:						
						
	move.l d7,a2				
_?L205:						
						
	move.l a2,2300(a4)			
						
	addq.l #1,d6				
	jbra _?L203				
_?L204:						
						
	move.l d7,d0				
	moveq #12,d2				
	asr.l d2,d0				
						
	move.l d0,-(sp)				
	move.w (a1),a2				
	move.l a2,-(sp)				
	move.l d1,-7092(a6)			
	move.l a0,-7096(a6)			
	move.l a1,-7088(a6)			
	jbsr ___mulsi3				
	addq.l #8,sp				
	move.l d0,a2				
						
	move.l -7092(a6),d1			
	move.l -7096(a6),a0			
	move.l -7088(a6),a1			
	tst.b -7076(a6)				
	jbeq _?L205				
						
	move.l d0,-4(a4)			
	jbra _?L206				
_?L199:						
	move.l -7084(a6),a0			
						
	move.l -7068(a6),d7			
						
	moveq #0,d4				
						
	lea _is_table,a5			
_?L217:						
						
	moveq #0,d2				
	move.b (a0)+,d2				
						
	move.l d7,a4				
	move.w (a4)+,d1				
	move.l a4,d7				
						
	btst #0,d1				
	jbeq _?L212				
						
	moveq #0,d0				
	move.b (a3),d0				
						
	moveq #6,d3				
	cmp.l d0,d3				
	jbcs _?L213				
	move.l d4,d1				
	add.l d4,d1				
	add.l d1,d1				
	lea (-4608,a6),a4			
	add.l d1,a4				
						
	moveq #0,d1				
						
	move.l d0,d5				
	add.l d0,d5				
	add.l d5,d5				
						
	sub.l d0,d3				
	add.l d3,d3				
	add.l d3,d3				
_?L214:						
						
	cmp.l d2,d1				
	jbcc _?L212				
						
	move.l (a4),d6				
						
	moveq #12,d0				
	asr.l d0,d6				
	move.l d6,-(sp)				
	move.w (a5,d5.l),a1			
	move.l a1,-(sp)				
	move.l d1,-7092(a6)			
	move.l d2,-7088(a6)			
	move.l a0,-7096(a6)			
	jbsr ___mulsi3				
	addq.l #8,sp				
						
	move.l d0,(a4)+				
						
	move.l d6,-(sp)				
	move.w (a5,d3.l),a2			
	move.l a2,-(sp)				
	jbsr ___mulsi3				
	addq.l #8,sp				
						
	move.l d0,2300(a4)			
						
	move.l -7092(a6),d1			
	addq.l #1,d1				
	move.l -7096(a6),a0			
	move.l -7088(a6),d2			
	jbra _?L214				
_?L213:						
						
	and.w #-2,d1				
	move.w d1,-2(a4)			
_?L212:						
						
	add.l d2,d4				
						
	addq.l #1,a3				
	cmp.l #575,d4				
	jbls _?L217				
	jbra _?L210				
_?L174:						
						
	move.l 12(a6),a4			
	or.w #512,30(a4)			
	move.l -7084(a6),a2			
						
	sub.l a0,a0				
_?L220:						
						
	moveq #0,d5				
	move.b (a2)+,d5				
						
	move.l -7068(a6),a5			
	addq.l #2,-7068(a6)			
	cmp.w #2,(a5)+				
	jbne _?L218				
	move.l a0,d0				
	add.l a0,d0				
	add.l d0,d0				
	lea (-4608,a6),a1			
	add.l d0,a1				
						
	moveq #0,d3				
_?L219:						
						
	cmp.l d5,d3				
	jbcs _?L221				
_?L218:						
						
	add.l d5,a0				
						
	cmp.w #575,a0				
	jbls _?L220				
	jbra _?L169				
_?L221:						
						
	move.l (a1)+,d0				
						
	move.l 2300(a1),d6			
						
	move.l d0,d1				
	add.l d6,d1				
	moveq #12,d2				
	asr.l d2,d1				
	move.l d1,d2				
	add.l d1,d2				
	add.l d1,d2				
	lsl.l #6,d2				
	add.l d1,d2				
	move.l d2,d4				
	lsl.l #4,d4				
	sub.l d2,d4				
	add.l d1,d4				
	move.l d4,-4(a1)			
						
	sub.l d6,d0				
	moveq #12,d4				
	asr.l d4,d0				
	move.l d0,d1				
	add.l d0,d1				
	add.l d0,d1				
	lsl.l #6,d1				
	add.l d0,d1				
	move.l d1,d2				
	lsl.l #4,d2				
	sub.l d1,d2				
	add.l d0,d2				
	move.l d2,2300(a1)			
						
	addq.l #1,d3				
	jbra _?L219				
_?L279:						
						
	move.l d0,-7084(a6)			
	jbra _?L248				
_?L276:						
						
	moveq #0,d5				
	jbra _?L223				
_?L225:						
						
	move.l a0,a5				
						
	moveq #0,d6				
	move.b (a5)+,d6				
						
	subq.l #1,d6				
						
	pea 3.w					
	pea 1(a2)				
	jbsr ___umodsi3				
	addq.l #8,sp				
	move.l d0,a2				
						
	move.l a5,a0				
	jbra _?L226				
_?L222:						
						
	pea 576.w				
	move.l -7072(a6),-(sp)			
	jbsr _III_aliasreduce			
	addq.l #8,sp				
						
	move.l -7080(a6),a2			
	btst #3,(a2)				
	jbne _?L230				
						
	moveq #0,d4				
	move.b -7056(a6),d4			
	jbra _?L232				
_?L229:						
						
	move.l a3,-(sp)				
	move.l -7072(a6),-(sp)			
	jbsr _III_imdct_s			
	addq.l #8,sp				
						
	move.l 12(a6),a4			
	move.l 9264(a4),a5			
						
	clr.l -(sp)				
	move.l d3,-(sp)				
	move.l -7076(a6),d1			
	pea (a5,d1.l)				
	move.l a3,-(sp)				
	lea _III_overlap,a4			
	jbsr (a4)				
						
	lea (12,sp),sp				
	move.l a3,(sp)				
	move.l -7072(a6),a0			
	pea 72(a0)				
	jbsr _III_imdct_s			
	addq.l #8,sp				
_?L362:						
						
	pea 1.w					
	move.l d3,-(sp)				
	pea -72(a5,d7.l)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (16,sp),sp				
						
	pea 1.w					
	move.l d3,-(sp)				
	jbsr _III_freqinver			
	addq.l #8,sp				
						
	move.l -7072(a6),a0			
	lea (2296,a0),a0			
						
	move.l #575,d0				
						
	tst.l 4(a0)				
	jbeq _?L234				
						
	move.l #576,d0				
_?L235:						
						
	pea 18.w				
	move.l #576,d2				
	sub.l d0,d2				
	move.l d2,-(sp)				
	jbsr ___udivsi3				
	addq.l #8,sp				
						
	moveq #32,d5				
	sub.l d0,d5				
	move.l d7,a4				
						
	moveq #2,d6				
						
	cmp.b #2,-7056(a6)			
	jbne _?L278				
						
	move.l -7072(a6),a5			
	sub.l -7076(a6),a5			
						
	move.l #_III_overlap,d4			
_?L238:						
						
	cmp.l d6,d5				
	jbeq _?L246				
						
	move.l a3,-(sp)				
	pea (a5,a4.l)				
	jbsr _III_imdct_s			
						
	addq.l #4,sp				
	move.l d6,(sp)				
	move.l d3,-(sp)				
	move.l 12(a6),a0			
	move.l 9264(a0),d0			
	add.l a4,d0				
	move.l d0,-(sp)				
	move.l a3,-(sp)				
	move.l d4,a1				
	jbsr (a1)				
	lea (16,sp),sp				
						
	btst #0,d6				
	jbeq _?L242				
						
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	jbsr _III_freqinver			
	addq.l #8,sp				
_?L242:						
						
	addq.l #1,d6				
	lea (72,a4),a4				
	jbra _?L238				
_?L236:						
						
	moveq #36,d1				
	cmp.l d0,d1				
	jbeq _?L235				
_?L234:						
	move.l d0,d1				
						
	subq.l #1,d0				
						
	subq.l #4,a0				
	tst.l 4(a0)				
	jbeq _?L236				
	move.l d1,d0				
	jbra _?L235				
_?L240:						
						
	move.l d4,-(sp)				
	move.l a3,-(sp)				
	pea (a5,a4.l)				
	jbsr _III_imdct_l			
						
	addq.l #8,sp				
	move.l d6,(sp)				
	move.l d3,-(sp)				
	move.l 12(a6),a0			
	move.l 9264(a0),d0			
	add.l a4,d0				
	move.l d0,-(sp)				
	move.l a3,-(sp)				
	jbsr _III_overlap			
	lea (16,sp),sp				
						
	btst #0,d6				
	jbeq _?L239				
						
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	jbsr _III_freqinver			
	addq.l #8,sp				
_?L239:						
						
	addq.l #1,d6				
	lea (72,a4),a4				
_?L237:						
						
	cmp.l d6,d5				
	jbne _?L240				
_?L246:						
						
	moveq #32,d0				
	cmp.l d5,d0				
	jbne _?L247				
						
	move.l -7084(a6),d0			
	addq.l #1,d0				
						
	moveq #58,d1				
	add.l d1,-7080(a6)			
	add.l #4608,d3				
	add.l #2304,d7				
	add.l #2304,-7072(a6)			
	add.l d1,-7068(a6)			
	move.l -7064(a6),d2			
	cmp.l -7084(a6),d2			
	jbne _?L279				
						
	addq.l #1,-7052(a6)			
						
	moveq #116,d3				
	add.l d3,-7024(a6)			
	add.l d3,-7060(a6)			
	add.l #2304,-7020(a6)			
	move.l -7052(a6),d4			
	cmp.l -7016(a6),d4			
	jbne _?L249				
						
	moveq #0,d0				
	jbra _?L60				
_?L278:						
						
	moveq #0,d4				
	move.b -7056(a6),d4			
						
	move.l -7072(a6),a5			
	sub.l -7076(a6),a5			
	jbra _?L237				
_?L247:						
						
	move.l d5,d0				
	lsl.l #3,d0				
	move.l d0,a0				
	add.l d5,a0				
	move.l a0,d0				
	lsl.l #3,d0				
	move.l d0,a0				
	add.l -7076(a6),a0			
	move.l 12(a6),a1			
	add.l 9264(a1),a0			
	move.l d5,a1				
	add.l d5,a1				
	add.l a1,a1				
	add.l d3,a1				
	lea (72,a0),a2				
_?L244:						
						
	move.l (a0),(a1)			
						
	clr.l (a0)+				
						
	lea (128,a1),a1				
	cmp.l a0,a2				
	jbne _?L244				
						
	btst #0,d5				
	jbeq _?L245				
						
	move.l d5,-(sp)				
	move.l d3,-(sp)				
	jbsr _III_freqinver			
	addq.l #8,sp				
_?L245:						
						
	addq.l #1,d5				
	jbra _?L246				
						
	.align	2				
	.globl	_mad_layer_III			
						
_mad_layer_III:					
	link.w a6,#-304				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 8(a6),a3				
	move.l 12(a6),a5			
						
	tst.l 48(a3)				
	jbne _?L367				
						
	pea 1.w					
	pea 2567.w				
	jbsr _himem_malloc			
	addq.l #8,sp				
						
	move.l d0,48(a3)			
						
	jbne _?L367				
_?L370:						
						
	moveq #49,d0				
	move.l d0,60(a3)			
_?L368:						
						
	moveq #-1,d1				
	move.l d1,-294(a6)			
_?L366:						
						
	move.l -294(a6),d0			
	movem.l -336(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L367:						
						
	tst.l 9264(a5)				
	jbne _?L369				
						
	pea 4.w					
	pea 1152.w				
	jbsr _calloc				
	addq.l #8,sp				
						
	move.l d0,9264(a5)			
						
	jbeq _?L370				
_?L369:						
						
	move.l 28(a5),d0			
	and.l #4096,d0				
						
	tst.l 4(a5)				
	jbeq _?L371				
	moveq #2,d1				
	move.l d1,-286(a6)			
						
	tst.l d0				
	jbne _?L417				
	moveq #32,d3				
_?L372:						
						
	move.l 24(a3),d4			
						
	lea (28,a3),a4				
						
	move.l a4,-(sp)				
	jbsr _mad_bit_nextbyte			
	addq.l #4,sp				
						
	sub.l d0,d4				
						
	cmp.l d4,d3				
	jble _?L373				
						
	move.l #561,60(a3)			
						
	clr.l 52(a3)				
						
	jbra _?L368				
_?L371:						
						
	moveq #1,d1				
	move.l d1,-286(a6)			
						
	tst.l d0				
	jbeq _?L417				
	moveq #9,d3				
	jbra _?L372				
_?L417:						
	moveq #17,d3				
	jbra _?L372				
_?L373:						
						
	btst #4,31(a5)				
	jbne _?L375				
_?L377:						
						
	clr.l -294(a6)				
_?L376:						
						
	move.l 28(a5),d1			
	and.l #4096,d1				
	move.l d1,-282(a6)			
						
	jbne _?L418				
	moveq #1,d0				
	cmp.l -286(a6),d0			
	jbne _?L419				
	moveq #5,d6				
_?L439:						
						
	moveq #9,d0				
	jbra _?L378				
_?L375:						
						
	moveq #0,d0				
	move.w 24(a5),d0			
	move.l d0,-(sp)				
	lsl.l #3,d3				
	move.l d3,-(sp)				
	move.l 32(a3),-(sp)			
	move.l 28(a3),-(sp)			
	jbsr _mad_bit_crc			
	lea (16,sp),sp				
						
	move.w d0,24(a5)			
						
	cmp.w 26(a5),d0				
	jbeq _?L377				
						
	btst #0,47(a5)				
	jbne _?L377				
						
	move.l #513,60(a3)			
						
	moveq #-1,d1				
	move.l d1,-294(a6)			
	jbra _?L376				
_?L418:						
						
	move.l -286(a6),d6			
						
	moveq #8,d0				
_?L378:						
	move.l d0,-(sp)				
	move.l a4,-(sp)				
	jbsr _mad_bit_read			
	addq.l #8,sp				
	move.l d0,d7				
						
	move.l d0,-242(a6)			
						
	move.l d6,-(sp)				
	move.l a4,-(sp)				
	jbsr _mad_bit_read			
	addq.l #8,sp				
	move.l d0,-266(a6)			
						
	move.l d0,-238(a6)			
						
	tst.l -282(a6)				
	jbne _?L420				
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	move.b d0,-234(a6)			
						
	moveq #2,d1				
	cmp.l -286(a6),d1			
	jbne _?L380				
						
	pea 4.w					
	move.l a4,-(sp)				
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	move.b d0,-233(a6)			
_?L380:						
						
	moveq #2,d1				
	move.l d1,-262(a6)			
	moveq #4,d1				
	move.l d1,-258(a6)			
	moveq #3,d1				
_?L440:						
	move.l d1,-254(a6)			
						
	clr.l -270(a6)				
						
	clr.l -274(a6)				
						
	moveq #0,d4				
						
	clr.l -278(a6)				
						
	move.l #_mad_bit_read,d3		
_?L385:						
	lea (-242,a6),a0			
	add.l -270(a6),a0			
	move.l a0,-302(a6)			
						
	clr.l -290(a6)				
_?L395:						
						
	pea 12.w				
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.w d0,10(a0)			
						
	pea 9.w					
	move.l a4,-(sp)				
	move.l d0,-298(a6)			
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.w d0,d5				
	move.l -302(a6),a0			
	move.w d0,12(a0)			
						
	pea 8.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.w d0,14(a0)			
						
	move.l -258(a6),-(sp)			
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.w d0,16(a0)			
						
	move.l -298(a6),d1			
	and.l #65535,d1				
	add.l d1,-274(a6)			
						
	cmp.w #288,d5				
	jbls _?L386				
						
	tst.l d4				
	jbne _?L386				
						
	move.l #562,d4				
_?L386:						
						
	move.l -302(a6),a0			
	clr.b 18(a0)				
						
	pea 1.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d0,d5				
						
	jbeq _?L387				
						
	pea 2.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.b d0,d5				
	move.l -302(a6),a0			
	move.b d0,19(a0)			
						
	jbne _?L388				
						
	tst.l d4				
	jbne _?L389				
						
	move.l #563,d4				
_?L389:						
						
	move.l -302(a6),a0			
	move.b #7,26(a0)			
						
	move.b #36,27(a0)			
						
	pea 1.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	tst.l d0				
	jbeq _?L390				
						
	move.l -302(a6),a0			
	move.b #8,18(a0)			
_?L391:						
						
	pea 5.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.b d0,20(a0)			
						
	pea 5.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.b d0,21(a0)			
						
	moveq #0,d5				
_?L392:						
						
	pea 3.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.b d0,23(a0,d5.l)			
						
	addq.l #1,d5				
						
	moveq #3,d0				
	cmp.l d5,d0				
	jbne _?L392				
_?L393:						
						
	move.l -254(a6),-(sp)			
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	or.b d0,18(a0)				
						
	addq.l #1,-290(a6)			
						
	moveq #58,d0				
	add.l d0,-302(a6)			
	move.l -290(a6),d1			
	cmp.l -286(a6),d1			
	jbne _?L395				
						
	addq.l #1,-278(a6)			
						
	moveq #116,d0				
	add.l d0,-270(a6)			
	move.l -278(a6),d1			
	cmp.l -262(a6),d1			
	jbne _?L385				
						
	tst.l d4				
	jbeq _?L397				
						
	tst.l -294(a6)				
	jbne _?L398				
						
	move.l d4,60(a3)			
_?L398:						
						
	moveq #-1,d1				
	move.l d1,-294(a6)			
_?L397:						
						
	or.l d6,28(a5)				
						
	move.l -266(a6),d1			
	or.l d1,32(a5)				
						
	move.l 24(a3),-(sp)			
	move.l a6,d6				
	add.l #-250,d6				
	move.l d6,-(sp)				
	jbsr _mad_bit_init			
	addq.l #8,sp				
						
	pea 32.w				
	move.l d6,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d0,d4				
						
	and.l #-1703936,d0			
						
	cmp.l #-1966080,d0			
	jbeq _?L399				
						
	move.l 24(a3),d4			
						
	move.l a4,-(sp)				
	jbsr _mad_bit_nextbyte			
	addq.l #4,sp				
						
	sub.l d0,d4				
						
	move.l d7,d1				
	add.l d4,d1				
	move.l d1,-290(a6)			
_?L441:						
						
	moveq #0,d3				
	jbra _?L400				
_?L419:						
						
	moveq #3,d6				
	jbra _?L439				
_?L420:						
						
	moveq #1,d1				
	move.l d1,-262(a6)			
	moveq #9,d1				
	move.l d1,-258(a6)			
	moveq #2,d1				
	jbra _?L440				
_?L388:						
						
	tst.l -282(a6)				
	jbne _?L389				
						
	cmp.b #2,d0				
	jbne _?L389				
						
	lea (-234,a6),a0			
	move.l -290(a6),d1			
	tst.b (a0,d1.l)				
	jbeq _?L389				
						
	tst.l d4				
	jbne _?L389				
						
	move.l #564,d4				
	jbra _?L389				
_?L390:						
						
	cmp.b #2,d5				
	jbne _?L391				
						
	move.l -302(a6),a0			
	move.b #8,26(a0)			
	jbra _?L391				
_?L387:						
						
	move.l -302(a6),a0			
	clr.b 19(a0)				
_?L394:						
						
	pea 5.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.b d0,20(a0,d5.l)			
						
	addq.l #1,d5				
						
	moveq #3,d0				
	cmp.l d5,d0				
	jbne _?L394				
						
	pea 4.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.b d0,26(a0)			
						
	pea 3.w					
	move.l a4,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l -302(a6),a0			
	move.b d0,27(a0)			
	jbra _?L393				
_?L399:						
						
	btst #16,d4				
	jbne _?L401				
						
	pea 16.w				
	move.l d6,-(sp)				
	jbsr _mad_bit_skip			
	addq.l #8,sp				
_?L401:						
						
	btst #19,d4				
	jbeq _?L421				
	moveq #9,d0				
_?L402:						
						
	move.l d0,-(sp)				
	move.l d6,-(sp)				
	move.l d3,a0				
	jbsr (a0)				
	addq.l #8,sp				
	move.l d0,d3				
						
	move.l 24(a3),d4			
						
	move.l a4,-(sp)				
	jbsr _mad_bit_nextbyte			
	addq.l #4,sp				
						
	sub.l d0,d4				
						
	move.l d4,d1				
	add.l d7,d1				
	move.l d1,-290(a6)			
						
	cmp.l d1,d3				
	jbhi _?L441				
_?L400:						
						
	move.l -290(a6),d1			
	sub.l d3,d1				
	move.l d1,-282(a6)			
						
	tst.l d7				
	jbne _?L403				
						
	move.l 28(a3),d0			
	move.l 32(a3),d1			
	move.l d0,-250(a6)			
	move.l d1,-246(a6)			
						
	clr.l 52(a3)				
						
	move.l -282(a6),d5			
_?L404:						
						
	move.l d4,a4				
	sub.l d5,a4				
						
	tst.l -294(a6)				
	jbne _?L423				
						
	move.l -286(a6),-(sp)			
	pea -242(a6)				
	move.l a5,-(sp)				
	move.l d6,-(sp)				
	jbsr _III_decode			
	lea (16,sp),sp				
						
	tst.l d0				
	jbeq _?L410				
						
	move.l d0,60(a3)			
						
	moveq #-1,d1				
	move.l d1,-294(a6)			
_?L410:						
						
	move.l -250(a6),d0			
	move.l -246(a6),d1			
	move.l d0,36(a3)			
	move.l d1,40(a3)			
						
	move.l -282(a6),d0			
	lsl.l #3,d0				
						
	sub.l -274(a6),d0			
	move.l d0,44(a3)			
_?L407:						
						
	move.l 48(a3),a0			
	lea _memcpy,a5				
						
	cmp.l d3,a4				
	jbcs _?L411				
						
	move.l d3,-(sp)				
	move.l 24(a3),d0			
	sub.l d3,d0				
	move.l d0,-(sp)				
	move.l a0,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
_?L415:						
						
	move.l d3,52(a3)			
	jbra _?L366				
_?L421:						
						
	moveq #8,d0				
	jbra _?L402				
_?L403:						
						
	move.l 52(a3),d0			
						
	move.l 48(a3),a0			
						
	cmp.l d0,d7				
	jbls _?L405				
						
	tst.l -294(a6)				
	jbeq _?L406				
_?L408:						
						
	move.l d4,a4				
						
	moveq #0,d5				
_?L423:						
	moveq #-1,d1				
	move.l d1,-294(a6)			
	jbra _?L407				
_?L406:						
						
	move.l #565,60(a3)			
	jbra _?L408				
_?L405:						
						
	sub.l d7,d0				
						
	pea (a0,d0.l)				
	move.l d6,-(sp)				
	jbsr _mad_bit_init			
	addq.l #8,sp				
						
	cmp.l -282(a6),d7			
	jbcc _?L422				
						
	move.l 52(a3),d0			
	sub.l d7,d0				
	add.l -282(a6),d0			
	cmp.l #2567,d0				
	jbls _?L409				
						
	jbsr _abort				
_?L409:						
						
	move.l -282(a6),d5			
	sub.l d7,d5				
						
	move.l a4,-(sp)				
	jbsr _mad_bit_nextbyte			
						
	move.l d5,(sp)				
	move.l d0,-(sp)				
	move.l 48(a3),d0			
	add.l 52(a3),d0				
	move.l d0,-(sp)				
	jbsr _memcpy				
	lea (12,sp),sp				
						
	add.l d5,52(a3)				
	jbra _?L404				
_?L422:						
						
	moveq #0,d5				
	jbra _?L404				
_?L411:						
						
	move.l -242(a6),d6			
						
	cmp.l -282(a6),d6			
	jbls _?L412				
						
	add.l d3,d6				
	sub.l -290(a6),d6			
						
	move.l d6,d0				
	add.l a4,d0				
						
	cmp.l d0,d3				
	jbcc _?L413				
						
	sub.l d4,d3				
	move.l d3,d6				
	add.l d5,d6				
_?L413:						
						
	move.l 52(a3),d0			
						
	cmp.l d0,d6				
	jbcc _?L414				
						
	move.l d6,-(sp)				
						
	sub.l d6,d0				
						
	pea (a0,d0.l)				
	move.l a0,-(sp)				
	jbsr _memmove				
	lea (12,sp),sp				
						
	move.l d6,52(a3)			
_?L414:						
						
	sub.l d4,d5				
						
	move.l a4,-(sp)				
	add.l 24(a3),d5				
	move.l d5,-(sp)				
	move.l 48(a3),d1			
	add.l 52(a3),d1				
	move.l d1,-(sp)				
	jbsr (a5)				
	lea (12,sp),sp				
						
	move.l a4,d3				
	add.l 52(a3),d3				
	jbra _?L415				
_?L412:						
						
	clr.l 52(a3)				
	jbra _?L414				
						
	.data					
	.align	2				
						
						
_scale?0:					
	.dc.l	534827956			
	.dc.l	518577479			
	.dc.l	486570288			
	.dc.l	439778905			
	.dc.l	379625062			
	.dc.l	307936504			
	.dc.l	226891452			
	.dc.l	138952417			
	.dc.l	46791383			
	.align	2				
						
						
_scale?1:					
	.dc.l	536359930			
	.dc.l	532277907			
	.dc.l	524144928			
	.dc.l	512022889			
	.dc.l	496004047			
	.dc.l	476210315			
	.dc.l	452792335			
	.dc.l	425928331			
	.dc.l	395822756			
	.dc.l	362704731			
	.dc.l	326826304			
	.dc.l	288460531			
	.dc.l	247899399			
	.dc.l	205451603			
	.dc.l	161440197			
	.dc.l	116200133			
	.dc.l	70075716			
	.dc.l	23417980			
	.align	2				
						
						
_is_lsf_table:					
	.dc.l	225726413			
	.dc.l	189812531			
	.dc.l	159612677			
	.dc.l	134217728			
	.dc.l	112863206			
	.dc.l	94906266			
	.dc.l	79806339			
	.dc.l	67108864			
	.dc.l	56431603			
	.dc.l	47453133			
	.dc.l	39903169			
	.dc.l	33554432			
	.dc.l	28215802			
	.dc.l	23726566			
	.dc.l	19951585			
	.dc.l	189812531			
	.dc.l	134217728			
	.dc.l	94906266			
	.dc.l	67108864			
	.dc.l	47453133			
	.dc.l	33554432			
	.dc.l	23726566			
	.dc.l	16777216			
	.dc.l	11863283			
	.dc.l	8388608				
	.dc.l	5931642				
	.dc.l	4194304				
	.dc.l	2965821				
	.dc.l	2097152				
	.dc.l	1482910				
	.align	2				
						
						
_is_table:					
	.dc.l	0				
	.dc.l	56727087			
	.dc.l	98254196			
	.dc.l	134217728			
	.dc.l	170181260			
	.dc.l	211708369			
	.dc.l	268435456			
	.align	2				
						
						
_window_s:					
	.dc.l	35037858			
	.dc.l	102725802			
	.dc.l	163413152			
	.dc.l	212964166			
	.dc.l	248002024			
	.dc.l	266138953			
	.dc.l	266138953			
	.dc.l	248002024			
	.dc.l	212964166			
	.dc.l	163413152			
	.dc.l	102725802			
	.dc.l	35037858			
	.align	2				
						
						
_window_l:					
	.dc.l	11708990			
	.dc.l	35037858			
	.dc.l	58100066			
	.dc.l	80720098			
	.dc.l	102725802			
	.dc.l	123949700			
	.dc.l	144230265			
	.dc.l	163413152			
	.dc.l	181352365			
	.dc.l	197911378			
	.dc.l	212964166			
	.dc.l	226396167			
	.dc.l	238105157			
	.dc.l	248002024			
	.dc.l	256011445			
	.dc.l	262072464			
	.dc.l	266138953			
	.dc.l	268179965			
	.dc.l	268179965			
	.dc.l	266138953			
	.dc.l	262072464			
	.dc.l	256011445			
	.dc.l	248002024			
	.dc.l	238105157			
	.dc.l	226396167			
	.dc.l	212964166			
	.dc.l	197911378			
	.dc.l	181352365			
	.dc.l	163413152			
	.dc.l	144230265			
	.dc.l	123949700			
	.dc.l	102725802			
	.dc.l	80720098			
	.dc.l	58100066			
	.dc.l	35037858			
	.dc.l	11708990			
	.align	2				
						
						
_imdct_s:					
	.dc.l	163413152			
	.dc.l	-248002024			
	.dc.l	-35037858			
	.dc.l	266138953			
	.dc.l	-102725802			
	.dc.l	-212964166			
	.dc.l	-212964166			
	.dc.l	102725802			
	.dc.l	266138953			
	.dc.l	35037858			
	.dc.l	-248002024			
	.dc.l	-163413152			
	.dc.l	102725802			
	.dc.l	-248002024			
	.dc.l	248002024			
	.dc.l	-102725802			
	.dc.l	-102725802			
	.dc.l	248002024			
	.dc.l	-248002024			
	.dc.l	-102725802			
	.dc.l	102725802			
	.dc.l	248002024			
	.dc.l	248002024			
	.dc.l	102725802			
	.dc.l	35037858			
	.dc.l	-102725802			
	.dc.l	163413152			
	.dc.l	-212964166			
	.dc.l	248002024			
	.dc.l	-266138953			
	.dc.l	-266138953			
	.dc.l	-248002024			
	.dc.l	-212964166			
	.dc.l	-163413152			
	.dc.l	-102725802			
	.dc.l	-35037858			
	.align	2				
						
						
_ca:						
	.dc.l	-138108903			
	.dc.l	-126629586			
	.dc.l	-84121620			
	.dc.l	-48831953			
	.dc.l	-25387066			
	.dc.l	-10996615			
	.dc.l	-3811399			
	.dc.l	-993204				
	.align	2				
						
						
_cs:						
	.dc.l	230181505			
	.dc.l	236690815			
	.dc.l	254913999			
	.dc.l	263956501			
	.dc.l	267232279			
	.dc.l	268210120			
	.dc.l	268408396			
	.dc.l	268433619			
	.align	2				
						
						
_root_table:					
	.dc.l	159612677			
	.dc.l	189812531			
	.dc.l	225726413			
	.dc.l	268435456			
	.dc.l	319225354			
	.dc.l	379625062			
	.dc.l	451452825			
	.align	2				
						
						
_rq_table:					
						
	.dc.b	0				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	0				
						
	.dc.b	128				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	2				
						
	.dc.b	161				
	.dc.b	69				
	.dc.b	23				
						
	.dc.b	195				
						
	.dc.b	138				
	.dc.b	116				
	.dc.b	185				
						
	.dc.b	164				
						
	.dc.b	203				
	.dc.b	47				
	.dc.b	245				
						
	.dc.b	36				
						
	.dc.b	136				
	.dc.b	204				
	.dc.b	78				
						
	.dc.b	165				
						
	.dc.b	174				
	.dc.b	113				
	.dc.b	142				
						
	.dc.b	69				
						
	.dc.b	214				
	.dc.b	63				
	.dc.b	144				
						
	.dc.b	37				
						
	.dc.b	128				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	6				
						
	.dc.b	149				
	.dc.b	196				
	.dc.b	26				
						
	.dc.b	230				
						
	.dc.b	172				
	.dc.b	90				
	.dc.b	210				
						
	.dc.b	134				
						
	.dc.b	195				
	.dc.b	181				
	.dc.b	210				
						
	.dc.b	198				
						
	.dc.b	219				
	.dc.b	200				
	.dc.b	254				
						
	.dc.b	134				
						
	.dc.b	244				
	.dc.b	137				
	.dc.b	239				
						
	.dc.b	70				
						
	.dc.b	134				
	.dc.b	247				
	.dc.b	204				
						
	.dc.b	167				
						
	.dc.b	147				
	.dc.b	249				
	.dc.b	4				
						
	.dc.b	135				
						
	.dc.b	161				
	.dc.b	69				
	.dc.b	23				
						
	.dc.b	199				
						
	.dc.b	174				
	.dc.b	216				
	.dc.b	222				
						
	.dc.b	167				
						
	.dc.b	188				
	.dc.b	177				
	.dc.b	129				
						
	.dc.b	103				
						
	.dc.b	202				
	.dc.b	204				
	.dc.b	108				
						
	.dc.b	39				
						
	.dc.b	217				
	.dc.b	39				
	.dc.b	69				
						
	.dc.b	199				
						
	.dc.b	231				
	.dc.b	191				
	.dc.b	231				
						
	.dc.b	199				
						
	.dc.b	246				
	.dc.b	148				
	.dc.b	87				
						
	.dc.b	135				
						
	.dc.b	130				
	.dc.b	209				
	.dc.b	96				
						
	.dc.b	168				
						
	.dc.b	138				
	.dc.b	116				
	.dc.b	185				
						
	.dc.b	168				
						
	.dc.b	146				
	.dc.b	51				
	.dc.b	109				
						
	.dc.b	72				
						
	.dc.b	154				
	.dc.b	12				
	.dc.b	191				
						
	.dc.b	104				
						
	.dc.b	162				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	8				
						
	.dc.b	170				
	.dc.b	12				
	.dc.b	138				
						
	.dc.b	40				
						
	.dc.b	178				
	.dc.b	49				
	.dc.b	194				
						
	.dc.b	168				
						
	.dc.b	186				
	.dc.b	111				
	.dc.b	23				
						
	.dc.b	104				
						
	.dc.b	194				
	.dc.b	195				
	.dc.b	254				
						
	.dc.b	104				
						
	.dc.b	203				
	.dc.b	47				
	.dc.b	245				
						
	.dc.b	40				
						
	.dc.b	211				
	.dc.b	178				
	.dc.b	128				
						
	.dc.b	8				
						
	.dc.b	220				
	.dc.b	75				
	.dc.b	41				
						
	.dc.b	136				
						
	.dc.b	228				
	.dc.b	249				
	.dc.b	130				
						
	.dc.b	40				
						
	.dc.b	237				
	.dc.b	189				
	.dc.b	31				
						
	.dc.b	136				
						
	.dc.b	246				
	.dc.b	149				
	.dc.b	156				
						
	.dc.b	104				
						
	.dc.b	255				
	.dc.b	130				
	.dc.b	151				
						
	.dc.b	232				
						
	.dc.b	132				
	.dc.b	65				
	.dc.b	218				
						
	.dc.b	233				
						
	.dc.b	136				
	.dc.b	204				
	.dc.b	78				
						
	.dc.b	169				
						
	.dc.b	141				
	.dc.b	96				
	.dc.b	124				
						
	.dc.b	233				
						
	.dc.b	145				
	.dc.b	254				
	.dc.b	61				
						
	.dc.b	9				
						
	.dc.b	150				
	.dc.b	165				
	.dc.b	103				
						
	.dc.b	233				
						
	.dc.b	155				
	.dc.b	85				
	.dc.b	216				
						
	.dc.b	9				
						
	.dc.b	160				
	.dc.b	15				
	.dc.b	105				
						
	.dc.b	41				
						
	.dc.b	164				
	.dc.b	209				
	.dc.b	248				
						
	.dc.b	201				
						
	.dc.b	169				
	.dc.b	157				
	.dc.b	101				
						
	.dc.b	73				
						
	.dc.b	174				
	.dc.b	113				
	.dc.b	142				
						
	.dc.b	73				
						
	.dc.b	179				
	.dc.b	78				
	.dc.b	84				
						
	.dc.b	169				
						
	.dc.b	184				
	.dc.b	51				
	.dc.b	154				
						
	.dc.b	105				
						
	.dc.b	189				
	.dc.b	33				
	.dc.b	66				
						
	.dc.b	73				
						
	.dc.b	194				
	.dc.b	23				
	.dc.b	48				
						
	.dc.b	73				
						
	.dc.b	199				
	.dc.b	21				
	.dc.b	73				
						
	.dc.b	9				
						
	.dc.b	204				
	.dc.b	27				
	.dc.b	114				
						
	.dc.b	41				
						
	.dc.b	209				
	.dc.b	41				
	.dc.b	146				
						
	.dc.b	9				
						
	.dc.b	214				
	.dc.b	63				
	.dc.b	144				
						
	.dc.b	41				
						
	.dc.b	219				
	.dc.b	93				
	.dc.b	84				
						
	.dc.b	41				
						
	.dc.b	224				
	.dc.b	130				
	.dc.b	198				
						
	.dc.b	201				
						
	.dc.b	229				
	.dc.b	175				
	.dc.b	209				
						
	.dc.b	105				
						
	.dc.b	234				
	.dc.b	228				
	.dc.b	93				
						
	.dc.b	233				
						
	.dc.b	240				
	.dc.b	32				
	.dc.b	87				
						
	.dc.b	9				
						
	.dc.b	245				
	.dc.b	99				
	.dc.b	167				
						
	.dc.b	201				
						
	.dc.b	250				
	.dc.b	174				
	.dc.b	60				
						
	.dc.b	9				
						
	.dc.b	128				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	10				
						
	.dc.b	130				
	.dc.b	172				
	.dc.b	112				
						
	.dc.b	42				
						
	.dc.b	133				
	.dc.b	92				
	.dc.b	101				
						
	.dc.b	74				
						
	.dc.b	136				
	.dc.b	15				
	.dc.b	214				
						
	.dc.b	42				
						
	.dc.b	138				
	.dc.b	198				
	.dc.b	185				
						
	.dc.b	234				
						
	.dc.b	141				
	.dc.b	129				
	.dc.b	7				
						
	.dc.b	202				
						
	.dc.b	144				
	.dc.b	62				
	.dc.b	183				
						
	.dc.b	106				
						
	.dc.b	146				
	.dc.b	255				
	.dc.b	192				
						
	.dc.b	106				
						
	.dc.b	149				
	.dc.b	196				
	.dc.b	26				
						
	.dc.b	234				
						
	.dc.b	152				
	.dc.b	139				
	.dc.b	190				
						
	.dc.b	202				
						
	.dc.b	155				
	.dc.b	86				
	.dc.b	164				
						
	.dc.b	138				
						
	.dc.b	158				
	.dc.b	36				
	.dc.b	196				
						
	.dc.b	138				
						
	.dc.b	160				
	.dc.b	246				
	.dc.b	23				
						
	.dc.b	138				
						
	.dc.b	163				
	.dc.b	202				
	.dc.b	150				
						
	.dc.b	42				
						
	.dc.b	166				
	.dc.b	162				
	.dc.b	57				
						
	.dc.b	106				
						
	.dc.b	169				
	.dc.b	124				
	.dc.b	250				
						
	.dc.b	138				
						
	.dc.b	172				
	.dc.b	90				
	.dc.b	210				
						
	.dc.b	138				
						
	.dc.b	175				
	.dc.b	59				
	.dc.b	187				
						
	.dc.b	10				
						
	.dc.b	178				
	.dc.b	31				
	.dc.b	173				
						
	.dc.b	138				
						
	.dc.b	181				
	.dc.b	6				
	.dc.b	163				
						
	.dc.b	138				
						
	.dc.b	183				
	.dc.b	240				
	.dc.b	151				
						
	.dc.b	10				
						
	.dc.b	186				
	.dc.b	221				
	.dc.b	129				
						
	.dc.b	202				
						
	.dc.b	189				
	.dc.b	205				
	.dc.b	93				
						
	.dc.b	234				
						
	.dc.b	192				
	.dc.b	192				
	.dc.b	37				
						
	.dc.b	106				
						
	.dc.b	195				
	.dc.b	181				
	.dc.b	210				
						
	.dc.b	202				
						
	.dc.b	198				
	.dc.b	174				
	.dc.b	96				
						
	.dc.b	74				
						
	.dc.b	201				
	.dc.b	169				
	.dc.b	200				
						
	.dc.b	106				
						
	.dc.b	204				
	.dc.b	168				
	.dc.b	5				
						
	.dc.b	170				
						
	.dc.b	207				
	.dc.b	169				
	.dc.b	18				
						
	.dc.b	202				
						
	.dc.b	210				
	.dc.b	172				
	.dc.b	234				
						
	.dc.b	106				
						
	.dc.b	213				
	.dc.b	179				
	.dc.b	135				
						
	.dc.b	170				
						
	.dc.b	216				
	.dc.b	188				
	.dc.b	229				
						
	.dc.b	106				
						
	.dc.b	219				
	.dc.b	200				
	.dc.b	254				
						
	.dc.b	138				
						
	.dc.b	222				
	.dc.b	215				
	.dc.b	206				
						
	.dc.b	106				
						
	.dc.b	225				
	.dc.b	233				
	.dc.b	80				
						
	.dc.b	10				
						
	.dc.b	228				
	.dc.b	253				
	.dc.b	126				
						
	.dc.b	234				
						
	.dc.b	232				
	.dc.b	20				
	.dc.b	86				
						
	.dc.b	74				
						
	.dc.b	235				
	.dc.b	45				
	.dc.b	209				
						
	.dc.b	170				
						
	.dc.b	238				
	.dc.b	73				
	.dc.b	236				
						
	.dc.b	138				
						
	.dc.b	241				
	.dc.b	104				
	.dc.b	162				
						
	.dc.b	138				
						
	.dc.b	244				
	.dc.b	137				
	.dc.b	239				
						
	.dc.b	74				
						
	.dc.b	247				
	.dc.b	173				
	.dc.b	206				
						
	.dc.b	170				
						
	.dc.b	250				
	.dc.b	212				
	.dc.b	60				
						
	.dc.b	74				
						
	.dc.b	253				
	.dc.b	253				
	.dc.b	52				
						
	.dc.b	42				
						
	.dc.b	128				
	.dc.b	148				
	.dc.b	89				
						
	.dc.b	43				
						
	.dc.b	130				
	.dc.b	43				
	.dc.b	89				
						
	.dc.b	75				
						
	.dc.b	131				
	.dc.b	195				
	.dc.b	152				
						
	.dc.b	139				
						
	.dc.b	133				
	.dc.b	93				
	.dc.b	20				
						
	.dc.b	235				
						
	.dc.b	134				
	.dc.b	247				
	.dc.b	204				
						
	.dc.b	171				
						
	.dc.b	136				
	.dc.b	147				
	.dc.b	189				
						
	.dc.b	203				
						
	.dc.b	138				
	.dc.b	48				
	.dc.b	230				
						
	.dc.b	107				
						
	.dc.b	139				
	.dc.b	207				
	.dc.b	68				
						
	.dc.b	203				
						
	.dc.b	141				
	.dc.b	110				
	.dc.b	215				
						
	.dc.b	43				
						
	.dc.b	143				
	.dc.b	15				
	.dc.b	155				
						
	.dc.b	139				
						
	.dc.b	144				
	.dc.b	177				
	.dc.b	144				
						
	.dc.b	107				
						
	.dc.b	146				
	.dc.b	84				
	.dc.b	179				
						
	.dc.b	235				
						
	.dc.b	147				
	.dc.b	249				
	.dc.b	4				
						
	.dc.b	139				
						
	.dc.b	149				
	.dc.b	158				
	.dc.b	128				
						
	.dc.b	75				
						
	.dc.b	151				
	.dc.b	69				
	.dc.b	37				
						
	.dc.b	203				
						
	.dc.b	152				
	.dc.b	236				
	.dc.b	243				
						
	.dc.b	75				
						
	.dc.b	154				
	.dc.b	149				
	.dc.b	231				
						
	.dc.b	75				
						
	.dc.b	156				
	.dc.b	64				
	.dc.b	0				
						
	.dc.b	11				
						
	.dc.b	157				
	.dc.b	235				
	.dc.b	60				
						
	.dc.b	11				
						
	.dc.b	159				
	.dc.b	151				
	.dc.b	153				
						
	.dc.b	203				
						
	.dc.b	161				
	.dc.b	69				
	.dc.b	23				
						
	.dc.b	203				
						
	.dc.b	162				
	.dc.b	243				
	.dc.b	180				
						
	.dc.b	139				
						
	.dc.b	164				
	.dc.b	163				
	.dc.b	110				
						
	.dc.b	107				
						
	.dc.b	166				
	.dc.b	84				
	.dc.b	68				
						
	.dc.b	11				
						
	.dc.b	168				
	.dc.b	6				
	.dc.b	52				
						
	.dc.b	11				
						
	.dc.b	169				
	.dc.b	185				
	.dc.b	60				
						
	.dc.b	235				
						
	.dc.b	171				
	.dc.b	109				
	.dc.b	93				
						
	.dc.b	43				
						
	.dc.b	173				
	.dc.b	34				
	.dc.b	147				
						
	.dc.b	139				
						
	.dc.b	174				
	.dc.b	216				
	.dc.b	222				
						
	.dc.b	171				
						
	.dc.b	176				
	.dc.b	144				
	.dc.b	61				
						
	.dc.b	43				
						
	.dc.b	178				
	.dc.b	72				
	.dc.b	173				
						
	.dc.b	171				
						
	.dc.b	180				
	.dc.b	2				
	.dc.b	46				
						
	.dc.b	203				
						
	.dc.b	181				
	.dc.b	188				
	.dc.b	191				
						
	.dc.b	75				
						
	.dc.b	183				
	.dc.b	120				
	.dc.b	93				
						
	.dc.b	235				
						
	.dc.b	185				
	.dc.b	53				
	.dc.b	9				
						
	.dc.b	75				
						
	.dc.b	186				
	.dc.b	242				
	.dc.b	192				
						
	.dc.b	43				
						
	.dc.b	188				
	.dc.b	177				
	.dc.b	129				
						
	.dc.b	107				
						
	.dc.b	190				
	.dc.b	113				
	.dc.b	75				
						
	.dc.b	171				
						
	.dc.b	192				
	.dc.b	50				
	.dc.b	29				
						
	.dc.b	203				
						
	.dc.b	193				
	.dc.b	243				
	.dc.b	246				
						
	.dc.b	107				
						
	.dc.b	195				
	.dc.b	182				
	.dc.b	212				
						
	.dc.b	171				
						
	.dc.b	197				
	.dc.b	122				
	.dc.b	183				
						
	.dc.b	11				
						
	.dc.b	199				
	.dc.b	63				
	.dc.b	156				
						
	.dc.b	139				
						
	.dc.b	201				
	.dc.b	5				
	.dc.b	131				
						
	.dc.b	235				
						
	.dc.b	202				
	.dc.b	204				
	.dc.b	108				
						
	.dc.b	43				
						
	.dc.b	204				
	.dc.b	148				
	.dc.b	84				
						
	.dc.b	11				
						
	.dc.b	206				
	.dc.b	93				
	.dc.b	58				
						
	.dc.b	139				
						
	.dc.b	208				
	.dc.b	39				
	.dc.b	30				
						
	.dc.b	107				
						
	.dc.b	209				
	.dc.b	241				
	.dc.b	254				
						
	.dc.b	171				
						
	.dc.b	211				
	.dc.b	189				
	.dc.b	218				
						
	.dc.b	43				
						
	.dc.b	213				
	.dc.b	138				
	.dc.b	175				
						
	.dc.b	235				
						
	.dc.b	215				
	.dc.b	88				
	.dc.b	126				
						
	.dc.b	203				
						
	.dc.b	217				
	.dc.b	39				
	.dc.b	69				
						
	.dc.b	203				
						
	.dc.b	218				
	.dc.b	247				
	.dc.b	3				
						
	.dc.b	235				
						
	.dc.b	220				
	.dc.b	199				
	.dc.b	184				
						
	.dc.b	11				
						
	.dc.b	222				
	.dc.b	153				
	.dc.b	97				
						
	.dc.b	43				
						
	.dc.b	224				
	.dc.b	107				
	.dc.b	254				
						
	.dc.b	107				
						
	.dc.b	226				
	.dc.b	63				
	.dc.b	142				
						
	.dc.b	171				
						
	.dc.b	228				
	.dc.b	20				
	.dc.b	16				
						
	.dc.b	235				
						
	.dc.b	229				
	.dc.b	233				
	.dc.b	132				
						
	.dc.b	75				
						
	.dc.b	231				
	.dc.b	191				
	.dc.b	231				
						
	.dc.b	203				
						
	.dc.b	233				
	.dc.b	151				
	.dc.b	58				
						
	.dc.b	107				
						
	.dc.b	235				
	.dc.b	111				
	.dc.b	123				
						
	.dc.b	107				
						
	.dc.b	237				
	.dc.b	72				
	.dc.b	169				
						
	.dc.b	139				
						
	.dc.b	239				
	.dc.b	34				
	.dc.b	196				
						
	.dc.b	11				
						
	.dc.b	240				
	.dc.b	253				
	.dc.b	202				
						
	.dc.b	11				
						
	.dc.b	242				
	.dc.b	217				
	.dc.b	186				
						
	.dc.b	139				
						
	.dc.b	244				
	.dc.b	182				
	.dc.b	148				
						
	.dc.b	171				
						
	.dc.b	246				
	.dc.b	148				
	.dc.b	87				
						
	.dc.b	139				
						
	.dc.b	248				
	.dc.b	115				
	.dc.b	2				
						
	.dc.b	75				
						
	.dc.b	250				
	.dc.b	82				
	.dc.b	148				
						
	.dc.b	11				
						
	.dc.b	252				
	.dc.b	51				
	.dc.b	11				
						
	.dc.b	235				
						
	.dc.b	254				
	.dc.b	20				
	.dc.b	105				
						
	.dc.b	11				
						
	.dc.b	255				
	.dc.b	246				
	.dc.b	170				
						
	.dc.b	139				
						
	.dc.b	128				
	.dc.b	236				
	.dc.b	231				
						
	.dc.b	236				
						
	.dc.b	129				
	.dc.b	222				
	.dc.b	235				
						
	.dc.b	204				
						
	.dc.b	130				
	.dc.b	209				
	.dc.b	96				
						
	.dc.b	172				
						
	.dc.b	131				
	.dc.b	196				
	.dc.b	70				
						
	.dc.b	12				
						
	.dc.b	132				
	.dc.b	183				
	.dc.b	155				
						
	.dc.b	172				
						
	.dc.b	133				
	.dc.b	171				
	.dc.b	96				
						
	.dc.b	236				
						
	.dc.b	134				
	.dc.b	159				
	.dc.b	149				
						
	.dc.b	172				
						
	.dc.b	135				
	.dc.b	148				
	.dc.b	57				
						
	.dc.b	44				
						
	.dc.b	136				
	.dc.b	137				
	.dc.b	75				
						
	.dc.b	76				
						
	.dc.b	137				
	.dc.b	126				
	.dc.b	203				
						
	.dc.b	172				
						
	.dc.b	138				
	.dc.b	116				
	.dc.b	185				
						
	.dc.b	172				
						
	.dc.b	139				
	.dc.b	107				
	.dc.b	21				
						
	.dc.b	44				
						
	.dc.b	140				
	.dc.b	97				
	.dc.b	221				
						
	.dc.b	172				
						
	.dc.b	141				
	.dc.b	89				
	.dc.b	18				
						
	.dc.b	204				
						
	.dc.b	142				
	.dc.b	80				
	.dc.b	180				
						
	.dc.b	76				
						
	.dc.b	143				
	.dc.b	72				
	.dc.b	193				
						
	.dc.b	140				
						
	.dc.b	144				
	.dc.b	65				
	.dc.b	58				
						
	.dc.b	108				
						
	.dc.b	145				
	.dc.b	58				
	.dc.b	30				
						
	.dc.b	140				
						
	.dc.b	146				
	.dc.b	51				
	.dc.b	109				
						
	.dc.b	76				
						
	.dc.b	147				
	.dc.b	45				
	.dc.b	38				
						
	.dc.b	172				
						
	.dc.b	148				
	.dc.b	39				
	.dc.b	74				
						
	.dc.b	12				
						
	.dc.b	149				
	.dc.b	33				
	.dc.b	215				
						
	.dc.b	76				
						
	.dc.b	150				
	.dc.b	28				
	.dc.b	205				
						
	.dc.b	204				
						
	.dc.b	151				
	.dc.b	24				
	.dc.b	45				
						
	.dc.b	140				
						
	.dc.b	152				
	.dc.b	19				
	.dc.b	245				
						
	.dc.b	236				
						
	.dc.b	153				
	.dc.b	16				
	.dc.b	38				
						
	.dc.b	172				
						
	.dc.b	154				
	.dc.b	12				
	.dc.b	191				
						
	.dc.b	108				
						
	.dc.b	155				
	.dc.b	9				
	.dc.b	191				
						
	.dc.b	236				
						
	.dc.b	156				
	.dc.b	7				
	.dc.b	39				
						
	.dc.b	204				
						
	.dc.b	157				
	.dc.b	4				
	.dc.b	246				
						
	.dc.b	204				
						
	.dc.b	158				
	.dc.b	3				
	.dc.b	44				
						
	.dc.b	108				
						
	.dc.b	159				
	.dc.b	1				
	.dc.b	200				
						
	.dc.b	140				
						
	.dc.b	160				
	.dc.b	0				
	.dc.b	202				
						
	.dc.b	172				
						
	.dc.b	161				
	.dc.b	0				
	.dc.b	50				
						
	.dc.b	172				
						
	.dc.b	162				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	12				
						
	.dc.b	163				
	.dc.b	0				
	.dc.b	50				
						
	.dc.b	140				
						
	.dc.b	164				
	.dc.b	0				
	.dc.b	201				
						
	.dc.b	236				
						
	.dc.b	165				
	.dc.b	1				
	.dc.b	197				
						
	.dc.b	172				
						
	.dc.b	166				
	.dc.b	3				
	.dc.b	37				
						
	.dc.b	204				
						
	.dc.b	167				
	.dc.b	4				
	.dc.b	233				
						
	.dc.b	204				
						
	.dc.b	168				
	.dc.b	7				
	.dc.b	17				
						
	.dc.b	76				
						
	.dc.b	169				
	.dc.b	9				
	.dc.b	156				
						
	.dc.b	76				
						
	.dc.b	170				
	.dc.b	12				
	.dc.b	138				
						
	.dc.b	44				
						
	.dc.b	171				
	.dc.b	15				
	.dc.b	218				
						
	.dc.b	172				
						
	.dc.b	172				
	.dc.b	19				
	.dc.b	141				
						
	.dc.b	204				
						
	.dc.b	173				
	.dc.b	23				
	.dc.b	162				
						
	.dc.b	236				
						
	.dc.b	174				
	.dc.b	28				
	.dc.b	25				
						
	.dc.b	236				
						
	.dc.b	175				
	.dc.b	32				
	.dc.b	242				
						
	.dc.b	108				
						
	.dc.b	176				
	.dc.b	38				
	.dc.b	44				
						
	.dc.b	76				
						
	.dc.b	177				
	.dc.b	43				
	.dc.b	199				
						
	.dc.b	44				
						
	.dc.b	178				
	.dc.b	49				
	.dc.b	194				
						
	.dc.b	172				
						
	.dc.b	179				
	.dc.b	56				
	.dc.b	30				
						
	.dc.b	140				
						
	.dc.b	180				
	.dc.b	62				
	.dc.b	218				
						
	.dc.b	172				
						
	.dc.b	181				
	.dc.b	69				
	.dc.b	246				
						
	.dc.b	172				
						
	.dc.b	182				
	.dc.b	77				
	.dc.b	114				
						
	.dc.b	76				
						
	.dc.b	183				
	.dc.b	85				
	.dc.b	77				
						
	.dc.b	44				
						
	.dc.b	184				
	.dc.b	93				
	.dc.b	135				
						
	.dc.b	44				
						
	.dc.b	185				
	.dc.b	102				
	.dc.b	32				
						
	.dc.b	12				
						
	.dc.b	186				
	.dc.b	111				
	.dc.b	23				
						
	.dc.b	108				
						
	.dc.b	187				
	.dc.b	120				
	.dc.b	109				
						
	.dc.b	12				
						
	.dc.b	188				
	.dc.b	130				
	.dc.b	32				
						
	.dc.b	172				
						
	.dc.b	189				
	.dc.b	140				
	.dc.b	50				
						
	.dc.b	12				
						
	.dc.b	190				
	.dc.b	150				
	.dc.b	160				
						
	.dc.b	236				
						
	.dc.b	191				
	.dc.b	161				
	.dc.b	109				
						
	.dc.b	12				
						
	.dc.b	192				
	.dc.b	172				
	.dc.b	150				
						
	.dc.b	44				
						
	.dc.b	193				
	.dc.b	184				
	.dc.b	28				
						
	.dc.b	12				
						
	.dc.b	194				
	.dc.b	195				
	.dc.b	254				
						
	.dc.b	108				
						
	.dc.b	195				
	.dc.b	208				
	.dc.b	61				
						
	.dc.b	12				
						
	.dc.b	196				
	.dc.b	220				
	.dc.b	215				
						
	.dc.b	140				
						
	.dc.b	197				
	.dc.b	233				
	.dc.b	205				
						
	.dc.b	236				
						
	.dc.b	198				
	.dc.b	247				
	.dc.b	31				
						
	.dc.b	172				
						
	.dc.b	200				
	.dc.b	4				
	.dc.b	204				
						
	.dc.b	204				
						
	.dc.b	201				
	.dc.b	18				
	.dc.b	212				
						
	.dc.b	236				
						
	.dc.b	202				
	.dc.b	33				
	.dc.b	55				
						
	.dc.b	204				
						
	.dc.b	203				
	.dc.b	47				
	.dc.b	245				
						
	.dc.b	44				
						
	.dc.b	204				
	.dc.b	63				
	.dc.b	12				
						
	.dc.b	236				
						
	.dc.b	205				
	.dc.b	78				
	.dc.b	126				
						
	.dc.b	172				
						
	.dc.b	206				
	.dc.b	94				
	.dc.b	74				
						
	.dc.b	76				
						
	.dc.b	207				
	.dc.b	110				
	.dc.b	111				
						
	.dc.b	140				
						
	.dc.b	208				
	.dc.b	126				
	.dc.b	238				
						
	.dc.b	44				
						
	.dc.b	209				
	.dc.b	143				
	.dc.b	197				
						
	.dc.b	236				
						
	.dc.b	210				
	.dc.b	160				
	.dc.b	246				
						
	.dc.b	172				
						
	.dc.b	211				
	.dc.b	178				
	.dc.b	128				
						
	.dc.b	12				
						
	.dc.b	212				
	.dc.b	196				
	.dc.b	97				
						
	.dc.b	236				
						
	.dc.b	213				
	.dc.b	214				
	.dc.b	156				
						
	.dc.b	12				
						
	.dc.b	214				
	.dc.b	233				
	.dc.b	46				
						
	.dc.b	44				
						
	.dc.b	215				
	.dc.b	252				
	.dc.b	24				
						
	.dc.b	12				
						
	.dc.b	217				
	.dc.b	15				
	.dc.b	89				
						
	.dc.b	140				
						
	.dc.b	218				
	.dc.b	34				
	.dc.b	242				
						
	.dc.b	140				
						
	.dc.b	219				
	.dc.b	54				
	.dc.b	226				
						
	.dc.b	140				
						
	.dc.b	220				
	.dc.b	75				
	.dc.b	41				
						
	.dc.b	140				
						
	.dc.b	221				
	.dc.b	95				
	.dc.b	199				
						
	.dc.b	76				
						
	.dc.b	222				
	.dc.b	116				
	.dc.b	187				
						
	.dc.b	140				
						
	.dc.b	223				
	.dc.b	138				
	.dc.b	6				
						
	.dc.b	12				
						
	.dc.b	224				
	.dc.b	159				
	.dc.b	166				
						
	.dc.b	172				
						
	.dc.b	225				
	.dc.b	181				
	.dc.b	157				
						
	.dc.b	76				
						
	.dc.b	226				
	.dc.b	203				
	.dc.b	233				
						
	.dc.b	108				
						
	.dc.b	227				
	.dc.b	226				
	.dc.b	139				
						
	.dc.b	44				
						
	.dc.b	228				
	.dc.b	249				
	.dc.b	130				
						
	.dc.b	44				
						
	.dc.b	230				
	.dc.b	16				
	.dc.b	206				
						
	.dc.b	44				
						
	.dc.b	231				
	.dc.b	40				
	.dc.b	111				
						
	.dc.b	12				
						
	.dc.b	232				
	.dc.b	64				
	.dc.b	100				
						
	.dc.b	172				
						
	.dc.b	233				
	.dc.b	88				
	.dc.b	174				
						
	.dc.b	172				
						
	.dc.b	234				
	.dc.b	113				
	.dc.b	76				
						
	.dc.b	236				
						
	.dc.b	235				
	.dc.b	138				
	.dc.b	63				
						
	.dc.b	76				
						
	.dc.b	236				
	.dc.b	163				
	.dc.b	133				
						
	.dc.b	140				
						
	.dc.b	237				
	.dc.b	189				
	.dc.b	31				
						
	.dc.b	140				
						
	.dc.b	238				
	.dc.b	215				
	.dc.b	12				
						
	.dc.b	236				
						
	.dc.b	239				
	.dc.b	241				
	.dc.b	77				
						
	.dc.b	172				
						
	.dc.b	241				
	.dc.b	11				
	.dc.b	225				
						
	.dc.b	108				
						
	.dc.b	242				
	.dc.b	38				
	.dc.b	200				
						
	.dc.b	44				
						
	.dc.b	243				
	.dc.b	66				
	.dc.b	1				
						
	.dc.b	140				
						
	.dc.b	244				
	.dc.b	93				
	.dc.b	141				
						
	.dc.b	140				
						
	.dc.b	245				
	.dc.b	121				
	.dc.b	107				
						
	.dc.b	236				
						
	.dc.b	246				
	.dc.b	149				
	.dc.b	156				
						
	.dc.b	108				
						
	.dc.b	247				
	.dc.b	178				
	.dc.b	30				
						
	.dc.b	204				
						
	.dc.b	248				
	.dc.b	206				
	.dc.b	243				
						
	.dc.b	12				
						
	.dc.b	249				
	.dc.b	236				
	.dc.b	24				
						
	.dc.b	236				
						
	.dc.b	251				
	.dc.b	9				
	.dc.b	144				
						
	.dc.b	44				
						
	.dc.b	252				
	.dc.b	39				
	.dc.b	88				
						
	.dc.b	172				
						
	.dc.b	253				
	.dc.b	69				
	.dc.b	114				
						
	.dc.b	76				
						
	.dc.b	254				
	.dc.b	99				
	.dc.b	220				
						
	.dc.b	204				
						
	.dc.b	255				
	.dc.b	130				
	.dc.b	151				
						
	.dc.b	236				
						
	.dc.b	128				
	.dc.b	80				
	.dc.b	209				
						
	.dc.b	205				
						
	.dc.b	128				
	.dc.b	224				
	.dc.b	127				
						
	.dc.b	237				
						
	.dc.b	129				
	.dc.b	112				
	.dc.b	86				
						
	.dc.b	13				
						
	.dc.b	130				
	.dc.b	0				
	.dc.b	84				
						
	.dc.b	45				
						
	.dc.b	130				
	.dc.b	144				
	.dc.b	122				
						
	.dc.b	45				
						
	.dc.b	131				
	.dc.b	32				
	.dc.b	200				
						
	.dc.b	13				
						
	.dc.b	131				
	.dc.b	177				
	.dc.b	61				
						
	.dc.b	173				
						
	.dc.b	132				
	.dc.b	65				
	.dc.b	218				
						
	.dc.b	237				
						
	.dc.b	132				
	.dc.b	210				
	.dc.b	159				
						
	.dc.b	205				
						
	.dc.b	133				
	.dc.b	99				
	.dc.b	140				
						
	.dc.b	13				
						
	.dc.b	133				
	.dc.b	244				
	.dc.b	159				
						
	.dc.b	205				
						
	.dc.b	134				
	.dc.b	133				
	.dc.b	218				
						
	.dc.b	237				
						
	.dc.b	135				
	.dc.b	23				
	.dc.b	61				
						
	.dc.b	45				
						
	.dc.b	135				
	.dc.b	168				
	.dc.b	198				
						
	.dc.b	173				
						
	.dc.b	136				
	.dc.b	58				
	.dc.b	119				
						
	.dc.b	45				
						
	.dc.b	136				
	.dc.b	204				
	.dc.b	78				
						
	.dc.b	173				
						
	.dc.b	137				
	.dc.b	94				
	.dc.b	77				
						
	.dc.b	45				
						
	.dc.b	137				
	.dc.b	240				
	.dc.b	114				
						
	.dc.b	109				
						
	.dc.b	138				
	.dc.b	130				
	.dc.b	190				
						
	.dc.b	109				
						
	.dc.b	139				
	.dc.b	21				
	.dc.b	49				
						
	.dc.b	45				
						
	.dc.b	139				
	.dc.b	167				
	.dc.b	202				
						
	.dc.b	109				
						
	.dc.b	140				
	.dc.b	58				
	.dc.b	138				
						
	.dc.b	45				
						
	.dc.b	140				
	.dc.b	205				
	.dc.b	112				
						
	.dc.b	109				
						
	.dc.b	141				
	.dc.b	96				
	.dc.b	124				
						
	.dc.b	237				
						
	.dc.b	141				
	.dc.b	243				
	.dc.b	175				
						
	.dc.b	205				
						
	.dc.b	142				
	.dc.b	135				
	.dc.b	8				
						
	.dc.b	237				
						
	.dc.b	143				
	.dc.b	26				
	.dc.b	136				
						
	.dc.b	13				
						
	.dc.b	143				
	.dc.b	174				
	.dc.b	45				
						
	.dc.b	77				
						
	.dc.b	144				
	.dc.b	65				
	.dc.b	248				
						
	.dc.b	109				
						
	.dc.b	144				
	.dc.b	213				
	.dc.b	233				
						
	.dc.b	141				
						
	.dc.b	145				
	.dc.b	106				
	.dc.b	0				
						
	.dc.b	109				
						
	.dc.b	145				
	.dc.b	254				
	.dc.b	61				
						
	.dc.b	13				
						
	.dc.b	146				
	.dc.b	146				
	.dc.b	159				
						
	.dc.b	109				
						
	.dc.b	147				
	.dc.b	39				
	.dc.b	39				
						
	.dc.b	77				
						
	.dc.b	147				
	.dc.b	187				
	.dc.b	212				
						
	.dc.b	173				
						
	.dc.b	148				
	.dc.b	80				
	.dc.b	167				
						
	.dc.b	141				
						
	.dc.b	148				
	.dc.b	229				
	.dc.b	159				
						
	.dc.b	205				
						
	.dc.b	149				
	.dc.b	122				
	.dc.b	189				
						
	.dc.b	77				
						
	.dc.b	150				
	.dc.b	16				
	.dc.b	0				
						
	.dc.b	13				
						
	.dc.b	150				
	.dc.b	165				
	.dc.b	103				
						
	.dc.b	237				
						
	.dc.b	151				
	.dc.b	58				
	.dc.b	244				
						
	.dc.b	237				
						
	.dc.b	151				
	.dc.b	208				
	.dc.b	166				
						
	.dc.b	237				
						
	.dc.b	152				
	.dc.b	102				
	.dc.b	125				
						
	.dc.b	205				
						
	.dc.b	152				
	.dc.b	252				
	.dc.b	121				
						
	.dc.b	141				
						
	.dc.b	153				
	.dc.b	146				
	.dc.b	154				
						
	.dc.b	45				
						
	.dc.b	154				
	.dc.b	40				
	.dc.b	223				
						
	.dc.b	109				
						
	.dc.b	154				
	.dc.b	191				
	.dc.b	73				
						
	.dc.b	109				
						
	.dc.b	155				
	.dc.b	85				
	.dc.b	216				
						
	.dc.b	13				
						
	.dc.b	155				
	.dc.b	236				
	.dc.b	139				
						
	.dc.b	13				
						
	.dc.b	156				
	.dc.b	131				
	.dc.b	98				
						
	.dc.b	141				
						
	.dc.b	157				
	.dc.b	26				
	.dc.b	94				
						
	.dc.b	109				
						
	.dc.b	157				
	.dc.b	177				
	.dc.b	126				
						
	.dc.b	173				
						
	.dc.b	158				
	.dc.b	72				
	.dc.b	195				
						
	.dc.b	13				
						
	.dc.b	158				
	.dc.b	224				
	.dc.b	43				
						
	.dc.b	173				
						
	.dc.b	159				
	.dc.b	119				
	.dc.b	184				
						
	.dc.b	109				
						
	.dc.b	160				
	.dc.b	15				
	.dc.b	105				
						
	.dc.b	45				
						
	.dc.b	160				
	.dc.b	167				
	.dc.b	61				
						
	.dc.b	237				
						
	.dc.b	161				
	.dc.b	63				
	.dc.b	54				
						
	.dc.b	141				
						
	.dc.b	161				
	.dc.b	215				
	.dc.b	83				
						
	.dc.b	13				
						
	.dc.b	162				
	.dc.b	111				
	.dc.b	147				
						
	.dc.b	77				
						
	.dc.b	163				
	.dc.b	7				
	.dc.b	247				
						
	.dc.b	77				
						
	.dc.b	163				
	.dc.b	160				
	.dc.b	126				
						
	.dc.b	237				
						
	.dc.b	164				
	.dc.b	57				
	.dc.b	42				
						
	.dc.b	13				
						
	.dc.b	164				
	.dc.b	209				
	.dc.b	248				
						
	.dc.b	205				
						
	.dc.b	165				
	.dc.b	106				
	.dc.b	234				
						
	.dc.b	237				
						
	.dc.b	166				
	.dc.b	4				
	.dc.b	0				
						
	.dc.b	109				
						
	.dc.b	166				
	.dc.b	157				
	.dc.b	57				
						
	.dc.b	77				
						
	.dc.b	167				
	.dc.b	54				
	.dc.b	149				
						
	.dc.b	109				
						
	.dc.b	167				
	.dc.b	208				
	.dc.b	20				
						
	.dc.b	205				
						
	.dc.b	168				
	.dc.b	105				
	.dc.b	183				
						
	.dc.b	45				
						
	.dc.b	169				
	.dc.b	3				
	.dc.b	124				
						
	.dc.b	173				
						
	.dc.b	169				
	.dc.b	157				
	.dc.b	101				
						
	.dc.b	77				
						
	.dc.b	170				
	.dc.b	55				
	.dc.b	112				
						
	.dc.b	173				
						
	.dc.b	170				
	.dc.b	209				
	.dc.b	159				
						
	.dc.b	13				
						
	.dc.b	171				
	.dc.b	107				
	.dc.b	240				
						
	.dc.b	45				
						
	.dc.b	172				
	.dc.b	6				
	.dc.b	100				
						
	.dc.b	45				
						
	.dc.b	172				
	.dc.b	160				
	.dc.b	250				
						
	.dc.b	205				
						
	.dc.b	173				
	.dc.b	59				
	.dc.b	180				
						
	.dc.b	13				
						
	.dc.b	173				
	.dc.b	214				
	.dc.b	143				
						
	.dc.b	237				
						
	.dc.b	174				
	.dc.b	113				
	.dc.b	142				
						
	.dc.b	77				
						
	.dc.b	175				
	.dc.b	12				
	.dc.b	175				
						
	.dc.b	13				
						
	.dc.b	175				
	.dc.b	167				
	.dc.b	242				
						
	.dc.b	77				
						
	.dc.b	176				
	.dc.b	67				
	.dc.b	87				
						
	.dc.b	237				
						
	.dc.b	176				
	.dc.b	222				
	.dc.b	223				
						
	.dc.b	173				
						
	.dc.b	177				
	.dc.b	122				
	.dc.b	137				
						
	.dc.b	205				
						
	.dc.b	178				
	.dc.b	22				
	.dc.b	86				
						
	.dc.b	13				
						
	.dc.b	178				
	.dc.b	178				
	.dc.b	68				
						
	.dc.b	77				
						
	.dc.b	179				
	.dc.b	78				
	.dc.b	84				
						
	.dc.b	173				
						
	.dc.b	179				
	.dc.b	234				
	.dc.b	135				
						
	.dc.b	13				
						
	.dc.b	180				
	.dc.b	134				
	.dc.b	219				
						
	.dc.b	77				
						
	.dc.b	181				
	.dc.b	35				
	.dc.b	81				
						
	.dc.b	141				
						
	.dc.b	181				
	.dc.b	191				
	.dc.b	233				
						
	.dc.b	141				
						
	.dc.b	182				
	.dc.b	92				
	.dc.b	163				
						
	.dc.b	77				
						
	.dc.b	182				
	.dc.b	249				
	.dc.b	126				
						
	.dc.b	173				
						
	.dc.b	183				
	.dc.b	150				
	.dc.b	123				
						
	.dc.b	205				
						
	.dc.b	184				
	.dc.b	51				
	.dc.b	154				
						
	.dc.b	109				
						
	.dc.b	184				
	.dc.b	208				
	.dc.b	218				
						
	.dc.b	173				
						
	.dc.b	185				
	.dc.b	110				
	.dc.b	60				
						
	.dc.b	77				
						
	.dc.b	186				
	.dc.b	11				
	.dc.b	191				
						
	.dc.b	109				
						
	.dc.b	186				
	.dc.b	169				
	.dc.b	99				
						
	.dc.b	237				
						
	.dc.b	187				
	.dc.b	71				
	.dc.b	41				
						
	.dc.b	173				
						
	.dc.b	187				
	.dc.b	229				
	.dc.b	16				
						
	.dc.b	173				
						
	.dc.b	188				
	.dc.b	131				
	.dc.b	24				
						
	.dc.b	237				
						
	.dc.b	189				
	.dc.b	33				
	.dc.b	66				
						
	.dc.b	77				
						
	.dc.b	189				
	.dc.b	191				
	.dc.b	140				
						
	.dc.b	205				
						
	.dc.b	190				
	.dc.b	93				
	.dc.b	248				
						
	.dc.b	77				
						
	.dc.b	190				
	.dc.b	252				
	.dc.b	132				
						
	.dc.b	205				
						
	.dc.b	191				
	.dc.b	155				
	.dc.b	50				
						
	.dc.b	77				
						
	.dc.b	192				
	.dc.b	58				
	.dc.b	0				
						
	.dc.b	141				
						
	.dc.b	192				
	.dc.b	216				
	.dc.b	239				
						
	.dc.b	173				
						
	.dc.b	193				
	.dc.b	119				
	.dc.b	255				
						
	.dc.b	173				
						
	.dc.b	194				
	.dc.b	23				
	.dc.b	48				
						
	.dc.b	77				
						
	.dc.b	194				
	.dc.b	182				
	.dc.b	129				
						
	.dc.b	141				
						
	.dc.b	195				
	.dc.b	85				
	.dc.b	243				
						
	.dc.b	141				
						
	.dc.b	195				
	.dc.b	245				
	.dc.b	133				
						
	.dc.b	237				
						
	.dc.b	196				
	.dc.b	149				
	.dc.b	56				
						
	.dc.b	237				
						
	.dc.b	197				
	.dc.b	53				
	.dc.b	12				
						
	.dc.b	109				
						
	.dc.b	197				
	.dc.b	213				
	.dc.b	0				
						
	.dc.b	77				
						
	.dc.b	198				
	.dc.b	117				
	.dc.b	20				
						
	.dc.b	109				
						
	.dc.b	199				
	.dc.b	21				
	.dc.b	73				
						
	.dc.b	13				
						
	.dc.b	199				
	.dc.b	181				
	.dc.b	157				
						
	.dc.b	205				
						
	.dc.b	200				
	.dc.b	86				
	.dc.b	18				
						
	.dc.b	205				
						
	.dc.b	200				
	.dc.b	246				
	.dc.b	167				
						
	.dc.b	237				
						
	.dc.b	201				
	.dc.b	151				
	.dc.b	93				
						
	.dc.b	45				
						
	.dc.b	202				
	.dc.b	56				
	.dc.b	50				
						
	.dc.b	109				
						
	.dc.b	202				
	.dc.b	217				
	.dc.b	39				
						
	.dc.b	173				
						
	.dc.b	203				
	.dc.b	122				
	.dc.b	60				
						
	.dc.b	237				
						
	.dc.b	204				
	.dc.b	27				
	.dc.b	114				
						
	.dc.b	45				
						
	.dc.b	204				
	.dc.b	188				
	.dc.b	199				
						
	.dc.b	45				
						
	.dc.b	205				
	.dc.b	94				
	.dc.b	59				
						
	.dc.b	237				
						
	.dc.b	205				
	.dc.b	255				
	.dc.b	208				
						
	.dc.b	141				
						
	.dc.b	206				
	.dc.b	161				
	.dc.b	132				
						
	.dc.b	205				
						
	.dc.b	207				
	.dc.b	67				
	.dc.b	88				
						
	.dc.b	205				
						
	.dc.b	207				
	.dc.b	229				
	.dc.b	76				
						
	.dc.b	77				
						
	.dc.b	208				
	.dc.b	135				
	.dc.b	95				
						
	.dc.b	109				
						
	.dc.b	209				
	.dc.b	41				
	.dc.b	146				
						
	.dc.b	13				
						
	.dc.b	209				
	.dc.b	203				
	.dc.b	228				
						
	.dc.b	45				
						
	.dc.b	210				
	.dc.b	110				
	.dc.b	85				
						
	.dc.b	205				
						
	.dc.b	211				
	.dc.b	16				
	.dc.b	230				
						
	.dc.b	173				
						
	.dc.b	211				
	.dc.b	179				
	.dc.b	150				
						
	.dc.b	237				
						
	.dc.b	212				
	.dc.b	86				
	.dc.b	102				
						
	.dc.b	109				
						
	.dc.b	212				
	.dc.b	249				
	.dc.b	85				
						
	.dc.b	45				
						
	.dc.b	213				
	.dc.b	156				
	.dc.b	99				
						
	.dc.b	13				
						
	.dc.b	214				
	.dc.b	63				
	.dc.b	144				
						
	.dc.b	45				
						
	.dc.b	214				
	.dc.b	226				
	.dc.b	220				
						
	.dc.b	77				
						
	.dc.b	215				
	.dc.b	134				
	.dc.b	71				
						
	.dc.b	109				
						
	.dc.b	216				
	.dc.b	41				
	.dc.b	209				
						
	.dc.b	173				
						
	.dc.b	216				
	.dc.b	205				
	.dc.b	122				
						
	.dc.b	205				
						
	.dc.b	217				
	.dc.b	113				
	.dc.b	66				
						
	.dc.b	237				
						
	.dc.b	218				
	.dc.b	21				
	.dc.b	41				
						
	.dc.b	205				
						
	.dc.b	218				
	.dc.b	185				
	.dc.b	47				
						
	.dc.b	141				
						
	.dc.b	219				
	.dc.b	93				
	.dc.b	84				
						
	.dc.b	45				
						
	.dc.b	220				
	.dc.b	1				
	.dc.b	151				
						
	.dc.b	109				
						
	.dc.b	220				
	.dc.b	165				
	.dc.b	249				
						
	.dc.b	77				
						
	.dc.b	221				
	.dc.b	74				
	.dc.b	121				
						
	.dc.b	237				
						
	.dc.b	221				
	.dc.b	239				
	.dc.b	25				
						
	.dc.b	13				
						
	.dc.b	222				
	.dc.b	147				
	.dc.b	214				
						
	.dc.b	205				
						
	.dc.b	223				
	.dc.b	56				
	.dc.b	178				
						
	.dc.b	237				
						
	.dc.b	223				
	.dc.b	221				
	.dc.b	173				
						
	.dc.b	173				
						
	.dc.b	224				
	.dc.b	130				
	.dc.b	198				
						
	.dc.b	205				
						
	.dc.b	225				
	.dc.b	39				
	.dc.b	254				
						
	.dc.b	77				
						
	.dc.b	225				
	.dc.b	205				
	.dc.b	84				
						
	.dc.b	13				
						
	.dc.b	226				
	.dc.b	114				
	.dc.b	200				
						
	.dc.b	45				
						
	.dc.b	227				
	.dc.b	24				
	.dc.b	90				
						
	.dc.b	109				
						
	.dc.b	227				
	.dc.b	190				
	.dc.b	11				
						
	.dc.b	13				
						
	.dc.b	228				
	.dc.b	99				
	.dc.b	217				
						
	.dc.b	173				
						
	.dc.b	229				
	.dc.b	9				
	.dc.b	198				
						
	.dc.b	141				
						
	.dc.b	229				
	.dc.b	175				
	.dc.b	209				
						
	.dc.b	109				
						
	.dc.b	230				
	.dc.b	85				
	.dc.b	250				
						
	.dc.b	77				
						
	.dc.b	230				
	.dc.b	252				
	.dc.b	65				
						
	.dc.b	45				
						
	.dc.b	231				
	.dc.b	162				
	.dc.b	166				
						
	.dc.b	13				
						
	.dc.b	232				
	.dc.b	73				
	.dc.b	40				
						
	.dc.b	205				
						
	.dc.b	232				
	.dc.b	239				
	.dc.b	201				
						
	.dc.b	109				
						
	.dc.b	233				
	.dc.b	150				
	.dc.b	135				
						
	.dc.b	205				
						
	.dc.b	234				
	.dc.b	61				
	.dc.b	100				
						
	.dc.b	13				
						
	.dc.b	234				
	.dc.b	228				
	.dc.b	93				
						
	.dc.b	237				
						
	.dc.b	235				
	.dc.b	139				
	.dc.b	117				
						
	.dc.b	141				
						
	.dc.b	236				
	.dc.b	50				
	.dc.b	170				
						
	.dc.b	237				
						
	.dc.b	236				
	.dc.b	217				
	.dc.b	253				
						
	.dc.b	205				
						
	.dc.b	237				
	.dc.b	129				
	.dc.b	110				
						
	.dc.b	77				
						
	.dc.b	238				
	.dc.b	40				
	.dc.b	252				
						
	.dc.b	77				
						
	.dc.b	238				
	.dc.b	208				
	.dc.b	167				
						
	.dc.b	205				
						
	.dc.b	239				
	.dc.b	120				
	.dc.b	112				
						
	.dc.b	173				
						
	.dc.b	240				
	.dc.b	32				
	.dc.b	87				
						
	.dc.b	13				
						
	.dc.b	240				
	.dc.b	200				
	.dc.b	90				
						
	.dc.b	205				
						
	.dc.b	241				
	.dc.b	112				
	.dc.b	123				
						
	.dc.b	205				
						
	.dc.b	242				
	.dc.b	24				
	.dc.b	186				
						
	.dc.b	45				
						
	.dc.b	242				
	.dc.b	193				
	.dc.b	21				
						
	.dc.b	205				
						
	.dc.b	243				
	.dc.b	105				
	.dc.b	142				
						
	.dc.b	141				
						
	.dc.b	244				
	.dc.b	18				
	.dc.b	36				
						
	.dc.b	141				
						
	.dc.b	244				
	.dc.b	186				
	.dc.b	215				
						
	.dc.b	173				
						
	.dc.b	245				
	.dc.b	99				
	.dc.b	167				
						
	.dc.b	205				
						
	.dc.b	246				
	.dc.b	12				
	.dc.b	149				
						
	.dc.b	13				
						
	.dc.b	246				
	.dc.b	181				
	.dc.b	159				
						
	.dc.b	109				
						
	.dc.b	247				
	.dc.b	94				
	.dc.b	198				
						
	.dc.b	173				
						
	.dc.b	248				
	.dc.b	8				
	.dc.b	10				
						
	.dc.b	205				
						
	.dc.b	248				
	.dc.b	177				
	.dc.b	107				
						
	.dc.b	237				
						
	.dc.b	249				
	.dc.b	90				
	.dc.b	233				
						
	.dc.b	205				
						
	.dc.b	250				
	.dc.b	4				
	.dc.b	132				
						
	.dc.b	141				
						
	.dc.b	250				
	.dc.b	174				
	.dc.b	60				
						
	.dc.b	13				
						
	.dc.b	251				
	.dc.b	88				
	.dc.b	16				
						
	.dc.b	109				
						
	.dc.b	252				
	.dc.b	2				
	.dc.b	1				
						
	.dc.b	77				
						
	.dc.b	252				
	.dc.b	172				
	.dc.b	15				
						
	.dc.b	13				
						
	.dc.b	253				
	.dc.b	86				
	.dc.b	57				
						
	.dc.b	77				
						
	.dc.b	254				
	.dc.b	0				
	.dc.b	128				
						
	.dc.b	45				
						
	.dc.b	254				
	.dc.b	170				
	.dc.b	227				
						
	.dc.b	173				
						
	.dc.b	255				
	.dc.b	85				
	.dc.b	99				
						
	.dc.b	141				
						
	.dc.b	128				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	14				
						
	.dc.b	128				
	.dc.b	85				
	.dc.b	92				
						
	.dc.b	110				
						
	.dc.b	128				
	.dc.b	170				
	.dc.b	199				
						
	.dc.b	14				
						
	.dc.b	129				
	.dc.b	0				
	.dc.b	63				
						
	.dc.b	238				
						
	.dc.b	129				
	.dc.b	85				
	.dc.b	198				
						
	.dc.b	238				
						
	.dc.b	129				
	.dc.b	171				
	.dc.b	92				
						
	.dc.b	14				
						
	.dc.b	130				
	.dc.b	0				
	.dc.b	255				
						
	.dc.b	78				
						
	.dc.b	130				
	.dc.b	86				
	.dc.b	176				
						
	.dc.b	206				
						
	.dc.b	130				
	.dc.b	172				
	.dc.b	112				
						
	.dc.b	46				
						
	.dc.b	131				
	.dc.b	2				
	.dc.b	61				
						
	.dc.b	206				
						
	.dc.b	131				
	.dc.b	88				
	.dc.b	25				
						
	.dc.b	110				
						
	.dc.b	131				
	.dc.b	174				
	.dc.b	3				
						
	.dc.b	14				
						
	.dc.b	132				
	.dc.b	3				
	.dc.b	250				
						
	.dc.b	174				
						
	.dc.b	132				
	.dc.b	90				
	.dc.b	0				
						
	.dc.b	110				
						
	.dc.b	132				
	.dc.b	176				
	.dc.b	20				
						
	.dc.b	14				
						
	.dc.b	133				
	.dc.b	6				
	.dc.b	53				
						
	.dc.b	174				
						
	.dc.b	133				
	.dc.b	92				
	.dc.b	101				
						
	.dc.b	78				
						
	.dc.b	133				
	.dc.b	178				
	.dc.b	162				
						
	.dc.b	206				
						
	.dc.b	134				
	.dc.b	8				
	.dc.b	238				
						
	.dc.b	78				
						
	.dc.b	134				
	.dc.b	95				
	.dc.b	71				
						
	.dc.b	174				
						
	.dc.b	134				
	.dc.b	181				
	.dc.b	174				
						
	.dc.b	206				
						
	.dc.b	135				
	.dc.b	12				
	.dc.b	35				
						
	.dc.b	238				
						
	.dc.b	135				
	.dc.b	98				
	.dc.b	166				
						
	.dc.b	206				
						
	.dc.b	135				
	.dc.b	185				
	.dc.b	55				
						
	.dc.b	142				
						
	.dc.b	136				
	.dc.b	15				
	.dc.b	214				
						
	.dc.b	46				
						
	.dc.b	136				
	.dc.b	102				
	.dc.b	130				
						
	.dc.b	142				
						
	.dc.b	136				
	.dc.b	189				
	.dc.b	60				
						
	.dc.b	174				
						
	.dc.b	137				
	.dc.b	20				
	.dc.b	4				
						
	.dc.b	142				
						
	.dc.b	137				
	.dc.b	106				
	.dc.b	218				
						
	.dc.b	46				
						
	.dc.b	137				
	.dc.b	193				
	.dc.b	189				
						
	.dc.b	142				
						
	.dc.b	138				
	.dc.b	24				
	.dc.b	174				
						
	.dc.b	174				
						
	.dc.b	138				
	.dc.b	111				
	.dc.b	173				
						
	.dc.b	110				
						
	.dc.b	138				
	.dc.b	198				
	.dc.b	185				
						
	.dc.b	238				
						
	.dc.b	139				
	.dc.b	29				
	.dc.b	211				
						
	.dc.b	238				
						
	.dc.b	139				
	.dc.b	116				
	.dc.b	251				
						
	.dc.b	174				
						
	.dc.b	139				
	.dc.b	204				
	.dc.b	49				
						
	.dc.b	14				
						
	.dc.b	140				
	.dc.b	35				
	.dc.b	116				
						
	.dc.b	14				
						
	.dc.b	140				
	.dc.b	122				
	.dc.b	196				
						
	.dc.b	174				
						
	.dc.b	140				
	.dc.b	210				
	.dc.b	34				
						
	.dc.b	206				
						
	.dc.b	141				
	.dc.b	41				
	.dc.b	142				
						
	.dc.b	142				
						
	.dc.b	141				
	.dc.b	129				
	.dc.b	7				
						
	.dc.b	206				
						
	.dc.b	141				
	.dc.b	216				
	.dc.b	142				
						
	.dc.b	142				
						
	.dc.b	142				
	.dc.b	48				
	.dc.b	34				
						
	.dc.b	206				
						
	.dc.b	142				
	.dc.b	135				
	.dc.b	196				
						
	.dc.b	174				
						
	.dc.b	142				
	.dc.b	223				
	.dc.b	115				
						
	.dc.b	238				
						
	.dc.b	143				
	.dc.b	55				
	.dc.b	48				
						
	.dc.b	142				
						
	.dc.b	143				
	.dc.b	142				
	.dc.b	250				
						
	.dc.b	206				
						
	.dc.b	143				
	.dc.b	230				
	.dc.b	210				
						
	.dc.b	110				
						
	.dc.b	144				
	.dc.b	62				
	.dc.b	183				
						
	.dc.b	110				
						
	.dc.b	144				
	.dc.b	150				
	.dc.b	169				
						
	.dc.b	206				
						
	.dc.b	144				
	.dc.b	238				
	.dc.b	169				
						
	.dc.b	142				
						
	.dc.b	145				
	.dc.b	70				
	.dc.b	182				
						
	.dc.b	206				
						
	.dc.b	145				
	.dc.b	158				
	.dc.b	209				
						
	.dc.b	78				
						
	.dc.b	145				
	.dc.b	246				
	.dc.b	249				
						
	.dc.b	14				
						
	.dc.b	146				
	.dc.b	79				
	.dc.b	46				
						
	.dc.b	78				
						
	.dc.b	146				
	.dc.b	167				
	.dc.b	112				
						
	.dc.b	174				
						
	.dc.b	146				
	.dc.b	255				
	.dc.b	192				
						
	.dc.b	110				
						
	.dc.b	147				
	.dc.b	88				
	.dc.b	29				
						
	.dc.b	110				
						
	.dc.b	147				
	.dc.b	176				
	.dc.b	135				
						
	.dc.b	206				
						
	.dc.b	148				
	.dc.b	8				
	.dc.b	255				
						
	.dc.b	78				
						
	.dc.b	148				
	.dc.b	97				
	.dc.b	132				
						
	.dc.b	14				
						
	.dc.b	148				
	.dc.b	186				
	.dc.b	21				
						
	.dc.b	238				
						
	.dc.b	149				
	.dc.b	18				
	.dc.b	181				
						
	.dc.b	14				
						
	.dc.b	149				
	.dc.b	107				
	.dc.b	97				
						
	.dc.b	110				
						
	.dc.b	149				
	.dc.b	196				
	.dc.b	26				
						
	.dc.b	238				
						
	.dc.b	150				
	.dc.b	28				
	.dc.b	225				
						
	.dc.b	142				
						
	.dc.b	150				
	.dc.b	117				
	.dc.b	181				
						
	.dc.b	78				
						
	.dc.b	150				
	.dc.b	206				
	.dc.b	150				
						
	.dc.b	46				
						
	.dc.b	151				
	.dc.b	39				
	.dc.b	132				
						
	.dc.b	46				
						
	.dc.b	151				
	.dc.b	128				
	.dc.b	127				
						
	.dc.b	78				
						
	.dc.b	151				
	.dc.b	217				
	.dc.b	135				
						
	.dc.b	110				
						
	.dc.b	152				
	.dc.b	50				
	.dc.b	156				
						
	.dc.b	142				
						
	.dc.b	152				
	.dc.b	139				
	.dc.b	190				
						
	.dc.b	206				
						
	.dc.b	152				
	.dc.b	228				
	.dc.b	238				
						
	.dc.b	46				
						
	.dc.b	153				
	.dc.b	62				
	.dc.b	42				
						
	.dc.b	110				
						
	.dc.b	153				
	.dc.b	151				
	.dc.b	115				
						
	.dc.b	174				
						
	.dc.b	153				
	.dc.b	240				
	.dc.b	201				
						
	.dc.b	238				
						
	.dc.b	154				
	.dc.b	74				
	.dc.b	45				
						
	.dc.b	46				
						
	.dc.b	154				
	.dc.b	163				
	.dc.b	157				
						
	.dc.b	110				
						
	.dc.b	154				
	.dc.b	253				
	.dc.b	26				
						
	.dc.b	142				
						
	.dc.b	155				
	.dc.b	86				
	.dc.b	164				
						
	.dc.b	142				
						
	.dc.b	155				
	.dc.b	176				
	.dc.b	59				
						
	.dc.b	142				
						
	.dc.b	156				
	.dc.b	9				
	.dc.b	223				
						
	.dc.b	110				
						
	.dc.b	156				
	.dc.b	99				
	.dc.b	144				
						
	.dc.b	46				
						
	.dc.b	156				
	.dc.b	189				
	.dc.b	77				
						
	.dc.b	206				
						
	.dc.b	157				
	.dc.b	23				
	.dc.b	24				
						
	.dc.b	78				
						
	.dc.b	157				
	.dc.b	112				
	.dc.b	239				
						
	.dc.b	142				
						
	.dc.b	157				
	.dc.b	202				
	.dc.b	211				
						
	.dc.b	174				
						
	.dc.b	158				
	.dc.b	36				
	.dc.b	196				
						
	.dc.b	142				
						
	.dc.b	158				
	.dc.b	126				
	.dc.b	194				
						
	.dc.b	78				
						
	.dc.b	158				
	.dc.b	216				
	.dc.b	204				
						
	.dc.b	206				
						
	.dc.b	159				
	.dc.b	50				
	.dc.b	228				
						
	.dc.b	46				
						
	.dc.b	159				
	.dc.b	141				
	.dc.b	8				
						
	.dc.b	46				
						
	.dc.b	159				
	.dc.b	231				
	.dc.b	56				
						
	.dc.b	238				
						
	.dc.b	160				
	.dc.b	65				
	.dc.b	118				
						
	.dc.b	110				
						
	.dc.b	160				
	.dc.b	155				
	.dc.b	192				
						
	.dc.b	174				
						
	.dc.b	160				
	.dc.b	246				
	.dc.b	23				
						
	.dc.b	142				
						
	.dc.b	161				
	.dc.b	80				
	.dc.b	123				
						
	.dc.b	14				
						
	.dc.b	161				
	.dc.b	170				
	.dc.b	235				
						
	.dc.b	110				
						
	.dc.b	162				
	.dc.b	5				
	.dc.b	104				
						
	.dc.b	78				
						
	.dc.b	162				
	.dc.b	95				
	.dc.b	241				
						
	.dc.b	206				
						
	.dc.b	162				
	.dc.b	186				
	.dc.b	136				
						
	.dc.b	14				
						
	.dc.b	163				
	.dc.b	21				
	.dc.b	42				
						
	.dc.b	206				
						
	.dc.b	163				
	.dc.b	111				
	.dc.b	218				
						
	.dc.b	46				
						
	.dc.b	163				
	.dc.b	202				
	.dc.b	150				
						
	.dc.b	46				
						
	.dc.b	164				
	.dc.b	37				
	.dc.b	94				
						
	.dc.b	174				
						
	.dc.b	164				
	.dc.b	128				
	.dc.b	51				
						
	.dc.b	206				
						
	.dc.b	164				
	.dc.b	219				
	.dc.b	21				
						
	.dc.b	110				
						
	.dc.b	165				
	.dc.b	54				
	.dc.b	3				
						
	.dc.b	174				
						
	.dc.b	165				
	.dc.b	144				
	.dc.b	254				
						
	.dc.b	78				
						
	.dc.b	165				
	.dc.b	236				
	.dc.b	5				
						
	.dc.b	142				
						
	.dc.b	166				
	.dc.b	71				
	.dc.b	25				
						
	.dc.b	78				
						
	.dc.b	166				
	.dc.b	162				
	.dc.b	57				
						
	.dc.b	110				
						
	.dc.b	166				
	.dc.b	253				
	.dc.b	102				
						
	.dc.b	14				
						
	.dc.b	167				
	.dc.b	88				
	.dc.b	159				
						
	.dc.b	46				
						
	.dc.b	167				
	.dc.b	179				
	.dc.b	228				
						
	.dc.b	174				
						
	.dc.b	168				
	.dc.b	15				
	.dc.b	54				
						
	.dc.b	174				
						
	.dc.b	168				
	.dc.b	106				
	.dc.b	149				
						
	.dc.b	14				
						
	.dc.b	168				
	.dc.b	197				
	.dc.b	255				
						
	.dc.b	206				
						
	.dc.b	169				
	.dc.b	33				
	.dc.b	118				
						
	.dc.b	238				
						
	.dc.b	169				
	.dc.b	124				
	.dc.b	250				
						
	.dc.b	142				
						
	.dc.b	169				
	.dc.b	216				
	.dc.b	138				
						
	.dc.b	110				
						
	.dc.b	170				
	.dc.b	52				
	.dc.b	38				
						
	.dc.b	142				
						
	.dc.b	170				
	.dc.b	143				
	.dc.b	207				
						
	.dc.b	46				
						
	.dc.b	170				
	.dc.b	235				
	.dc.b	132				
						
	.dc.b	14				
						
	.dc.b	171				
	.dc.b	71				
	.dc.b	69				
						
	.dc.b	78				
						
	.dc.b	171				
	.dc.b	163				
	.dc.b	18				
						
	.dc.b	206				
						
	.dc.b	171				
	.dc.b	254				
	.dc.b	236				
						
	.dc.b	142				
						
	.dc.b	172				
	.dc.b	90				
	.dc.b	210				
						
	.dc.b	142				
						
	.dc.b	172				
	.dc.b	182				
	.dc.b	196				
						
	.dc.b	238				
						
	.dc.b	173				
	.dc.b	18				
	.dc.b	195				
						
	.dc.b	110				
						
	.dc.b	173				
	.dc.b	110				
	.dc.b	206				
						
	.dc.b	46				
						
	.dc.b	173				
	.dc.b	202				
	.dc.b	229				
						
	.dc.b	46				
						
	.dc.b	174				
	.dc.b	39				
	.dc.b	8				
						
	.dc.b	110				
						
	.dc.b	174				
	.dc.b	131				
	.dc.b	55				
						
	.dc.b	206				
						
	.dc.b	174				
	.dc.b	223				
	.dc.b	115				
						
	.dc.b	78				
						
	.dc.b	175				
	.dc.b	59				
	.dc.b	187				
						
	.dc.b	14				
						
	.dc.b	175				
	.dc.b	152				
	.dc.b	14				
						
	.dc.b	238				
						
	.dc.b	175				
	.dc.b	244				
	.dc.b	111				
						
	.dc.b	14				
						
	.dc.b	176				
	.dc.b	80				
	.dc.b	219				
						
	.dc.b	46				
						
	.dc.b	176				
	.dc.b	173				
	.dc.b	83				
						
	.dc.b	110				
						
	.dc.b	177				
	.dc.b	9				
	.dc.b	215				
						
	.dc.b	206				
						
	.dc.b	177				
	.dc.b	102				
	.dc.b	104				
						
	.dc.b	78				
						
	.dc.b	177				
	.dc.b	195				
	.dc.b	4				
						
	.dc.b	238				
						
	.dc.b	178				
	.dc.b	31				
	.dc.b	173				
						
	.dc.b	142				
						
	.dc.b	178				
	.dc.b	124				
	.dc.b	98				
						
	.dc.b	46				
						
	.dc.b	178				
	.dc.b	217				
	.dc.b	34				
						
	.dc.b	238				
						
	.dc.b	179				
	.dc.b	53				
	.dc.b	239				
						
	.dc.b	174				
						
	.dc.b	179				
	.dc.b	146				
	.dc.b	200				
						
	.dc.b	110				
						
	.dc.b	179				
	.dc.b	239				
	.dc.b	173				
						
	.dc.b	78				
						
	.dc.b	180				
	.dc.b	76				
	.dc.b	158				
						
	.dc.b	14				
						
	.dc.b	180				
	.dc.b	169				
	.dc.b	154				
						
	.dc.b	206				
						
	.dc.b	181				
	.dc.b	6				
	.dc.b	163				
						
	.dc.b	142				
						
	.dc.b	181				
	.dc.b	99				
	.dc.b	184				
						
	.dc.b	78				
						
	.dc.b	181				
	.dc.b	192				
	.dc.b	216				
						
	.dc.b	238				
						
	.dc.b	182				
	.dc.b	30				
	.dc.b	5				
						
	.dc.b	110				
						
	.dc.b	182				
	.dc.b	123				
	.dc.b	62				
						
	.dc.b	14				
						
	.dc.b	182				
	.dc.b	216				
	.dc.b	130				
						
	.dc.b	110				
						
	.dc.b	183				
	.dc.b	53				
	.dc.b	210				
						
	.dc.b	174				
						
	.dc.b	183				
	.dc.b	147				
	.dc.b	46				
						
	.dc.b	238				
						
	.dc.b	183				
	.dc.b	240				
	.dc.b	151				
						
	.dc.b	14				
						
	.dc.b	184				
	.dc.b	78				
	.dc.b	10				
						
	.dc.b	238				
						
	.dc.b	184				
	.dc.b	171				
	.dc.b	138				
						
	.dc.b	206				
						
	.dc.b	185				
	.dc.b	9				
	.dc.b	22				
						
	.dc.b	110				
						
	.dc.b	185				
	.dc.b	102				
	.dc.b	173				
						
	.dc.b	206				
						
	.dc.b	185				
	.dc.b	196				
	.dc.b	81				
						
	.dc.b	46				
						
	.dc.b	186				
	.dc.b	34				
	.dc.b	0				
						
	.dc.b	46				
						
	.dc.b	186				
	.dc.b	127				
	.dc.b	187				
						
	.dc.b	14				
						
	.dc.b	186				
	.dc.b	221				
	.dc.b	129				
						
	.dc.b	206				
						
	.dc.b	187				
	.dc.b	59				
	.dc.b	84				
						
	.dc.b	46				
						
	.dc.b	187				
	.dc.b	153				
	.dc.b	50				
						
	.dc.b	110				
						
	.dc.b	187				
	.dc.b	247				
	.dc.b	28				
						
	.dc.b	78				
						
	.dc.b	188				
	.dc.b	85				
	.dc.b	18				
						
	.dc.b	14				
						
	.dc.b	188				
	.dc.b	179				
	.dc.b	19				
						
	.dc.b	110				
						
	.dc.b	189				
	.dc.b	17				
	.dc.b	32				
						
	.dc.b	142				
						
	.dc.b	189				
	.dc.b	111				
	.dc.b	57				
						
	.dc.b	110				
						
	.dc.b	189				
	.dc.b	205				
	.dc.b	93				
						
	.dc.b	238				
						
	.dc.b	190				
	.dc.b	43				
	.dc.b	142				
						
	.dc.b	14				
						
	.dc.b	190				
	.dc.b	137				
	.dc.b	201				
						
	.dc.b	238				
						
	.dc.b	190				
	.dc.b	232				
	.dc.b	17				
						
	.dc.b	110				
						
	.dc.b	191				
	.dc.b	70				
	.dc.b	100				
						
	.dc.b	142				
						
	.dc.b	191				
	.dc.b	164				
	.dc.b	195				
						
	.dc.b	110				
						
	.dc.b	192				
	.dc.b	3				
	.dc.b	45				
						
	.dc.b	206				
						
	.dc.b	192				
	.dc.b	97				
	.dc.b	163				
						
	.dc.b	206				
						
	.dc.b	192				
	.dc.b	192				
	.dc.b	37				
						
	.dc.b	110				
						
	.dc.b	193				
	.dc.b	30				
	.dc.b	178				
						
	.dc.b	174				
						
	.dc.b	193				
	.dc.b	125				
	.dc.b	75				
						
	.dc.b	142				
						
	.dc.b	193				
	.dc.b	219				
	.dc.b	239				
						
	.dc.b	238				
						
	.dc.b	194				
	.dc.b	58				
	.dc.b	159				
						
	.dc.b	206				
						
	.dc.b	194				
	.dc.b	153				
	.dc.b	91				
						
	.dc.b	78				
						
	.dc.b	194				
	.dc.b	248				
	.dc.b	34				
						
	.dc.b	78				
						
	.dc.b	195				
	.dc.b	86				
	.dc.b	244				
						
	.dc.b	206				
						
	.dc.b	195				
	.dc.b	181				
	.dc.b	210				
						
	.dc.b	206				
						
	.dc.b	196				
	.dc.b	20				
	.dc.b	188				
						
	.dc.b	110				
						
	.dc.b	196				
	.dc.b	115				
	.dc.b	177				
						
	.dc.b	110				
						
	.dc.b	196				
	.dc.b	210				
	.dc.b	177				
						
	.dc.b	238				
						
	.dc.b	197				
	.dc.b	49				
	.dc.b	189				
						
	.dc.b	238				
						
	.dc.b	197				
	.dc.b	144				
	.dc.b	213				
						
	.dc.b	78				
						
	.dc.b	197				
	.dc.b	239				
	.dc.b	248				
						
	.dc.b	46				
						
	.dc.b	198				
	.dc.b	79				
	.dc.b	38				
						
	.dc.b	142				
						
	.dc.b	198				
	.dc.b	174				
	.dc.b	96				
						
	.dc.b	78				
						
	.dc.b	199				
	.dc.b	13				
	.dc.b	165				
						
	.dc.b	110				
						
	.dc.b	199				
	.dc.b	108				
	.dc.b	246				
						
	.dc.b	14				
						
	.dc.b	199				
	.dc.b	204				
	.dc.b	82				
						
	.dc.b	14				
						
	.dc.b	200				
	.dc.b	43				
	.dc.b	185				
						
	.dc.b	110				
						
	.dc.b	200				
	.dc.b	139				
	.dc.b	44				
						
	.dc.b	14				
						
	.dc.b	200				
	.dc.b	234				
	.dc.b	170				
						
	.dc.b	46				
						
	.dc.b	201				
	.dc.b	74				
	.dc.b	51				
						
	.dc.b	142				
						
	.dc.b	201				
	.dc.b	169				
	.dc.b	200				
						
	.dc.b	110				
						
	.dc.b	202				
	.dc.b	9				
	.dc.b	104				
						
	.dc.b	142				
						
	.dc.b	202				
	.dc.b	105				
	.dc.b	19				
						
	.dc.b	238				
						
	.dc.b	202				
	.dc.b	200				
	.dc.b	202				
						
	.dc.b	174				
						
	.dc.b	203				
	.dc.b	40				
	.dc.b	140				
						
	.dc.b	174				
						
	.dc.b	203				
	.dc.b	136				
	.dc.b	90				
						
	.dc.b	14				
						
	.dc.b	203				
	.dc.b	232				
	.dc.b	50				
						
	.dc.b	174				
						
	.dc.b	204				
	.dc.b	72				
	.dc.b	22				
						
	.dc.b	142				
						
	.dc.b	204				
	.dc.b	168				
	.dc.b	5				
						
	.dc.b	174				
						
	.dc.b	205				
	.dc.b	8				
	.dc.b	0				
						
	.dc.b	14				
						
	.dc.b	205				
	.dc.b	104				
	.dc.b	5				
						
	.dc.b	174				
						
	.dc.b	205				
	.dc.b	200				
	.dc.b	22				
						
	.dc.b	110				
						
	.dc.b	206				
	.dc.b	40				
	.dc.b	50				
						
	.dc.b	142				
						
	.dc.b	206				
	.dc.b	136				
	.dc.b	89				
						
	.dc.b	206				
						
	.dc.b	206				
	.dc.b	232				
	.dc.b	140				
						
	.dc.b	78				
						
	.dc.b	207				
	.dc.b	72				
	.dc.b	201				
						
	.dc.b	238				
						
	.dc.b	207				
	.dc.b	169				
	.dc.b	18				
						
	.dc.b	206				
						
	.dc.b	208				
	.dc.b	9				
	.dc.b	102				
						
	.dc.b	206				
						
	.dc.b	208				
	.dc.b	105				
	.dc.b	197				
						
	.dc.b	238				
						
	.dc.b	208				
	.dc.b	202				
	.dc.b	48				
						
	.dc.b	46				
						
	.dc.b	209				
	.dc.b	42				
	.dc.b	165				
						
	.dc.b	142				
						
	.dc.b	209				
	.dc.b	139				
	.dc.b	38				
						
	.dc.b	46				
						
	.dc.b	209				
	.dc.b	235				
	.dc.b	177				
						
	.dc.b	206				
						
	.dc.b	210				
	.dc.b	76				
	.dc.b	72				
						
	.dc.b	174				
						
	.dc.b	210				
	.dc.b	172				
	.dc.b	234				
						
	.dc.b	110				
						
	.dc.b	211				
	.dc.b	13				
	.dc.b	151				
						
	.dc.b	110				
						
	.dc.b	211				
	.dc.b	110				
	.dc.b	79				
						
	.dc.b	110				
						
	.dc.b	211				
	.dc.b	207				
	.dc.b	18				
						
	.dc.b	142				
						
	.dc.b	212				
	.dc.b	47				
	.dc.b	224				
						
	.dc.b	174				
						
	.dc.b	212				
	.dc.b	144				
	.dc.b	185				
						
	.dc.b	238				
						
	.dc.b	212				
	.dc.b	241				
	.dc.b	158				
						
	.dc.b	46				
						
	.dc.b	213				
	.dc.b	82				
	.dc.b	141				
						
	.dc.b	110				
						
	.dc.b	213				
	.dc.b	179				
	.dc.b	135				
						
	.dc.b	174				
						
	.dc.b	214				
	.dc.b	20				
	.dc.b	141				
						
	.dc.b	14				
						
	.dc.b	214				
	.dc.b	117				
	.dc.b	157				
						
	.dc.b	78				
						
	.dc.b	214				
	.dc.b	214				
	.dc.b	184				
						
	.dc.b	142				
						
	.dc.b	215				
	.dc.b	55				
	.dc.b	222				
						
	.dc.b	206				
						
	.dc.b	215				
	.dc.b	153				
	.dc.b	16				
						
	.dc.b	14				
						
	.dc.b	215				
	.dc.b	250				
	.dc.b	76				
						
	.dc.b	46				
						
	.dc.b	216				
	.dc.b	91				
	.dc.b	147				
						
	.dc.b	78				
						
	.dc.b	216				
	.dc.b	188				
	.dc.b	229				
						
	.dc.b	110				
						
	.dc.b	217				
	.dc.b	30				
	.dc.b	66				
						
	.dc.b	110				
						
	.dc.b	217				
	.dc.b	127				
	.dc.b	170				
						
	.dc.b	78				
						
	.dc.b	217				
	.dc.b	225				
	.dc.b	29				
						
	.dc.b	46				
						
	.dc.b	218				
	.dc.b	66				
	.dc.b	154				
						
	.dc.b	238				
						
	.dc.b	218				
	.dc.b	164				
	.dc.b	35				
						
	.dc.b	142				
						
	.dc.b	219				
	.dc.b	5				
	.dc.b	183				
						
	.dc.b	14				
						
	.dc.b	219				
	.dc.b	103				
	.dc.b	85				
						
	.dc.b	78				
						
	.dc.b	219				
	.dc.b	200				
	.dc.b	254				
						
	.dc.b	142				
						
	.dc.b	220				
	.dc.b	42				
	.dc.b	178				
						
	.dc.b	174				
						
	.dc.b	220				
	.dc.b	140				
	.dc.b	113				
						
	.dc.b	174				
						
	.dc.b	220				
	.dc.b	238				
	.dc.b	59				
						
	.dc.b	110				
						
	.dc.b	221				
	.dc.b	80				
	.dc.b	15				
						
	.dc.b	238				
						
	.dc.b	221				
	.dc.b	177				
	.dc.b	239				
						
	.dc.b	110				
						
	.dc.b	222				
	.dc.b	19				
	.dc.b	217				
						
	.dc.b	142				
						
	.dc.b	222				
	.dc.b	117				
	.dc.b	206				
						
	.dc.b	174				
						
	.dc.b	222				
	.dc.b	215				
	.dc.b	206				
						
	.dc.b	110				
						
	.dc.b	223				
	.dc.b	57				
	.dc.b	217				
						
	.dc.b	14				
						
	.dc.b	223				
	.dc.b	155				
	.dc.b	238				
						
	.dc.b	78				
						
	.dc.b	223				
	.dc.b	254				
	.dc.b	14				
						
	.dc.b	110				
						
	.dc.b	224				
	.dc.b	96				
	.dc.b	57				
						
	.dc.b	78				
						
	.dc.b	224				
	.dc.b	194				
	.dc.b	110				
						
	.dc.b	238				
						
	.dc.b	225				
	.dc.b	36				
	.dc.b	175				
						
	.dc.b	78				
						
	.dc.b	225				
	.dc.b	134				
	.dc.b	250				
						
	.dc.b	78				
						
	.dc.b	225				
	.dc.b	233				
	.dc.b	80				
						
	.dc.b	14				
						
	.dc.b	226				
	.dc.b	75				
	.dc.b	176				
						
	.dc.b	142				
						
	.dc.b	226				
	.dc.b	174				
	.dc.b	27				
						
	.dc.b	206				
						
	.dc.b	227				
	.dc.b	16				
	.dc.b	145				
						
	.dc.b	174				
						
	.dc.b	227				
	.dc.b	115				
	.dc.b	18				
						
	.dc.b	46				
						
	.dc.b	227				
	.dc.b	213				
	.dc.b	157				
						
	.dc.b	110				
						
	.dc.b	228				
	.dc.b	56				
	.dc.b	51				
						
	.dc.b	78				
						
	.dc.b	228				
	.dc.b	154				
	.dc.b	211				
						
	.dc.b	206				
						
	.dc.b	228				
	.dc.b	253				
	.dc.b	126				
						
	.dc.b	238				
						
	.dc.b	229				
	.dc.b	96				
	.dc.b	52				
						
	.dc.b	206				
						
	.dc.b	229				
	.dc.b	194				
	.dc.b	245				
						
	.dc.b	46				
						
	.dc.b	230				
	.dc.b	37				
	.dc.b	192				
						
	.dc.b	46				
						
	.dc.b	230				
	.dc.b	136				
	.dc.b	149				
						
	.dc.b	206				
						
	.dc.b	230				
	.dc.b	235				
	.dc.b	118				
						
	.dc.b	14				
						
	.dc.b	231				
	.dc.b	78				
	.dc.b	96				
						
	.dc.b	238				
						
	.dc.b	231				
	.dc.b	177				
	.dc.b	86				
						
	.dc.b	78				
						
	.dc.b	232				
	.dc.b	20				
	.dc.b	86				
						
	.dc.b	78				
						
	.dc.b	232				
	.dc.b	119				
	.dc.b	96				
						
	.dc.b	206				
						
	.dc.b	232				
	.dc.b	218				
	.dc.b	117				
						
	.dc.b	238				
						
	.dc.b	233				
	.dc.b	61				
	.dc.b	149				
						
	.dc.b	142				
						
	.dc.b	233				
	.dc.b	160				
	.dc.b	191				
						
	.dc.b	206				
						
	.dc.b	234				
	.dc.b	3				
	.dc.b	244				
						
	.dc.b	110				
						
	.dc.b	234				
	.dc.b	103				
	.dc.b	51				
						
	.dc.b	174				
						
	.dc.b	234				
	.dc.b	202				
	.dc.b	125				
						
	.dc.b	110				
						
	.dc.b	235				
	.dc.b	45				
	.dc.b	209				
						
	.dc.b	174				
						
	.dc.b	235				
	.dc.b	145				
	.dc.b	48				
						
	.dc.b	110				
						
	.dc.b	235				
	.dc.b	244				
	.dc.b	153				
						
	.dc.b	142				
						
	.dc.b	236				
	.dc.b	88				
	.dc.b	13				
						
	.dc.b	78				
						
	.dc.b	236				
	.dc.b	187				
	.dc.b	139				
						
	.dc.b	110				
						
	.dc.b	237				
	.dc.b	31				
	.dc.b	20				
						
	.dc.b	14				
						
	.dc.b	237				
	.dc.b	130				
	.dc.b	167				
						
	.dc.b	14				
						
	.dc.b	237				
	.dc.b	230				
	.dc.b	68				
						
	.dc.b	142				
						
	.dc.b	238				
	.dc.b	73				
	.dc.b	236				
						
	.dc.b	142				
						
	.dc.b	238				
	.dc.b	173				
	.dc.b	158				
						
	.dc.b	238				
						
	.dc.b	239				
	.dc.b	17				
	.dc.b	91				
						
	.dc.b	174				
						
	.dc.b	239				
	.dc.b	117				
	.dc.b	34				
						
	.dc.b	206				
						
	.dc.b	239				
	.dc.b	216				
	.dc.b	244				
						
	.dc.b	110				
						
	.dc.b	240				
	.dc.b	60				
	.dc.b	208				
						
	.dc.b	110				
						
	.dc.b	240				
	.dc.b	160				
	.dc.b	182				
						
	.dc.b	174				
						
	.dc.b	241				
	.dc.b	4				
	.dc.b	167				
						
	.dc.b	110				
						
	.dc.b	241				
	.dc.b	104				
	.dc.b	162				
						
	.dc.b	142				
						
	.dc.b	241				
	.dc.b	204				
	.dc.b	167				
						
	.dc.b	238				
						
	.dc.b	242				
	.dc.b	48				
	.dc.b	183				
						
	.dc.b	206				
						
	.dc.b	242				
	.dc.b	148				
	.dc.b	209				
						
	.dc.b	238				
						
	.dc.b	242				
	.dc.b	248				
	.dc.b	246				
						
	.dc.b	78				
						
	.dc.b	243				
	.dc.b	93				
	.dc.b	37				
						
	.dc.b	46				
						
	.dc.b	243				
	.dc.b	193				
	.dc.b	94				
						
	.dc.b	46				
						
	.dc.b	244				
	.dc.b	37				
	.dc.b	161				
						
	.dc.b	142				
						
	.dc.b	244				
	.dc.b	137				
	.dc.b	239				
						
	.dc.b	78				
						
	.dc.b	244				
	.dc.b	238				
	.dc.b	71				
						
	.dc.b	78				
						
	.dc.b	245				
	.dc.b	82				
	.dc.b	169				
						
	.dc.b	142				
						
	.dc.b	245				
	.dc.b	183				
	.dc.b	22				
						
	.dc.b	14				
						
	.dc.b	246				
	.dc.b	27				
	.dc.b	140				
						
	.dc.b	238				
						
	.dc.b	246				
	.dc.b	128				
	.dc.b	13				
						
	.dc.b	238				
						
	.dc.b	246				
	.dc.b	228				
	.dc.b	153				
						
	.dc.b	78				
						
	.dc.b	247				
	.dc.b	73				
	.dc.b	46				
						
	.dc.b	206				
						
	.dc.b	247				
	.dc.b	173				
	.dc.b	206				
						
	.dc.b	174				
						
	.dc.b	248				
	.dc.b	18				
	.dc.b	120				
						
	.dc.b	174				
						
	.dc.b	248				
	.dc.b	119				
	.dc.b	44				
						
	.dc.b	238				
						
	.dc.b	248				
	.dc.b	219				
	.dc.b	235				
						
	.dc.b	78				
						
	.dc.b	249				
	.dc.b	64				
	.dc.b	179				
						
	.dc.b	238				
						
	.dc.b	249				
	.dc.b	165				
	.dc.b	134				
						
	.dc.b	206				
						
	.dc.b	250				
	.dc.b	10				
	.dc.b	99				
						
	.dc.b	206				
						
	.dc.b	250				
	.dc.b	111				
	.dc.b	74				
						
	.dc.b	238				
						
	.dc.b	250				
	.dc.b	212				
	.dc.b	60				
						
	.dc.b	78				
						
	.dc.b	251				
	.dc.b	57				
	.dc.b	55				
						
	.dc.b	206				
						
	.dc.b	251				
	.dc.b	158				
	.dc.b	61				
						
	.dc.b	142				
						
	.dc.b	252				
	.dc.b	3				
	.dc.b	77				
						
	.dc.b	78				
						
	.dc.b	252				
	.dc.b	104				
	.dc.b	103				
						
	.dc.b	78				
						
	.dc.b	252				
	.dc.b	205				
	.dc.b	139				
						
	.dc.b	78				
						
	.dc.b	253				
	.dc.b	50				
	.dc.b	185				
						
	.dc.b	142				
						
	.dc.b	253				
	.dc.b	151				
	.dc.b	241				
						
	.dc.b	206				
						
	.dc.b	253				
	.dc.b	253				
	.dc.b	52				
						
	.dc.b	46				
						
	.dc.b	254				
	.dc.b	98				
	.dc.b	128				
						
	.dc.b	174				
						
	.dc.b	254				
	.dc.b	199				
	.dc.b	215				
						
	.dc.b	78				
						
	.dc.b	255				
	.dc.b	45				
	.dc.b	56				
						
	.dc.b	14				
						
	.dc.b	255				
	.dc.b	146				
	.dc.b	162				
						
	.dc.b	206				
						
	.dc.b	255				
	.dc.b	248				
	.dc.b	23				
						
	.dc.b	142				
						
	.dc.b	128				
	.dc.b	46				
	.dc.b	203				
						
	.dc.b	47				
						
	.dc.b	128				
	.dc.b	97				
	.dc.b	143				
						
	.dc.b	175				
						
	.dc.b	128				
	.dc.b	148				
	.dc.b	89				
						
	.dc.b	47				
						
	.dc.b	128				
	.dc.b	199				
	.dc.b	39				
						
	.dc.b	175				
						
	.dc.b	128				
	.dc.b	249				
	.dc.b	251				
						
	.dc.b	47				
						
	.dc.b	129				
	.dc.b	44				
	.dc.b	211				
						
	.dc.b	175				
						
	.dc.b	129				
	.dc.b	95				
	.dc.b	177				
						
	.dc.b	47				
						
	.dc.b	129				
	.dc.b	146				
	.dc.b	147				
						
	.dc.b	207				
						
	.dc.b	129				
	.dc.b	197				
	.dc.b	123				
						
	.dc.b	79				
						
	.dc.b	129				
	.dc.b	248				
	.dc.b	103				
						
	.dc.b	207				
						
	.dc.b	130				
	.dc.b	43				
	.dc.b	89				
						
	.dc.b	79				
						
	.dc.b	130				
	.dc.b	94				
	.dc.b	79				
						
	.dc.b	207				
						
	.dc.b	130				
	.dc.b	145				
	.dc.b	75				
						
	.dc.b	79				
						
	.dc.b	130				
	.dc.b	196				
	.dc.b	75				
						
	.dc.b	175				
						
	.dc.b	130				
	.dc.b	247				
	.dc.b	81				
						
	.dc.b	47				
						
	.dc.b	131				
	.dc.b	42				
	.dc.b	91				
						
	.dc.b	143				
						
	.dc.b	131				
	.dc.b	93				
	.dc.b	106				
						
	.dc.b	239				
						
	.dc.b	131				
	.dc.b	144				
	.dc.b	127				
						
	.dc.b	79				
						
	.dc.b	131				
	.dc.b	195				
	.dc.b	152				
						
	.dc.b	143				
						
	.dc.b	131				
	.dc.b	246				
	.dc.b	182				
						
	.dc.b	207				
						
	.dc.b	132				
	.dc.b	41				
	.dc.b	218				
						
	.dc.b	15				
						
	.dc.b	132				
	.dc.b	93				
	.dc.b	2				
						
	.dc.b	47				
						
	.dc.b	132				
	.dc.b	144				
	.dc.b	47				
						
	.dc.b	47				
						
	.dc.b	132				
	.dc.b	195				
	.dc.b	97				
						
	.dc.b	79				
						
	.dc.b	132				
	.dc.b	246				
	.dc.b	152				
						
	.dc.b	79				
						
	.dc.b	133				
	.dc.b	41				
	.dc.b	212				
						
	.dc.b	47				
						
	.dc.b	133				
	.dc.b	93				
	.dc.b	20				
						
	.dc.b	239				
						
	.dc.b	133				
	.dc.b	144				
	.dc.b	90				
						
	.dc.b	207				
						
	.dc.b	133				
	.dc.b	195				
	.dc.b	165				
						
	.dc.b	111				
						
	.dc.b	133				
	.dc.b	246				
	.dc.b	245				
						
	.dc.b	15				
						
	.dc.b	134				
	.dc.b	42				
	.dc.b	73				
						
	.dc.b	143				
						
	.dc.b	134				
	.dc.b	93				
	.dc.b	162				
						
	.dc.b	239				
						
	.dc.b	134				
	.dc.b	145				
	.dc.b	1				
						
	.dc.b	79				
						
	.dc.b	134				
	.dc.b	196				
	.dc.b	100				
						
	.dc.b	143				
						
	.dc.b	134				
	.dc.b	247				
	.dc.b	204				
						
	.dc.b	175				
						
	.dc.b	135				
	.dc.b	43				
	.dc.b	57				
						
	.dc.b	175				
						
	.dc.b	135				
	.dc.b	94				
	.dc.b	171				
						
	.dc.b	175				
						
	.dc.b	135				
	.dc.b	146				
	.dc.b	34				
						
	.dc.b	111				
						
	.dc.b	135				
	.dc.b	197				
	.dc.b	158				
						
	.dc.b	47				
						
	.dc.b	135				
	.dc.b	249				
	.dc.b	30				
						
	.dc.b	207				
						
	.dc.b	136				
	.dc.b	44				
	.dc.b	164				
						
	.dc.b	79				
						
	.dc.b	136				
	.dc.b	96				
	.dc.b	46				
						
	.dc.b	143				
						
	.dc.b	136				
	.dc.b	147				
	.dc.b	189				
						
	.dc.b	207				
						
	.dc.b	136				
	.dc.b	199				
	.dc.b	81				
						
	.dc.b	239				
						
	.dc.b	136				
	.dc.b	250				
	.dc.b	234				
						
	.dc.b	207				
						
	.dc.b	137				
	.dc.b	46				
	.dc.b	136				
						
	.dc.b	175				
						
	.dc.b	137				
	.dc.b	98				
	.dc.b	43				
						
	.dc.b	79				
						
	.dc.b	137				
	.dc.b	149				
	.dc.b	210				
						
	.dc.b	207				
						
	.dc.b	137				
	.dc.b	201				
	.dc.b	127				
						
	.dc.b	47				
						
	.dc.b	137				
	.dc.b	253				
	.dc.b	48				
						
	.dc.b	111				
						
	.dc.b	138				
	.dc.b	48				
	.dc.b	230				
						
	.dc.b	111				
						
	.dc.b	138				
	.dc.b	100				
	.dc.b	161				
						
	.dc.b	79				
						
	.dc.b	138				
	.dc.b	152				
	.dc.b	97				
						
	.dc.b	15				
						
	.dc.b	138				
	.dc.b	204				
	.dc.b	37				
						
	.dc.b	175				
						
	.dc.b	138				
	.dc.b	255				
	.dc.b	239				
						
	.dc.b	15				
						
	.dc.b	139				
	.dc.b	51				
	.dc.b	189				
						
	.dc.b	79				
						
	.dc.b	139				
	.dc.b	103				
	.dc.b	144				
						
	.dc.b	79				
						
	.dc.b	139				
	.dc.b	155				
	.dc.b	104				
						
	.dc.b	47				
						
	.dc.b	139				
	.dc.b	207				
	.dc.b	68				
						
	.dc.b	207				
						
	.dc.b	140				
	.dc.b	3				
	.dc.b	38				
						
	.dc.b	79				
						
	.dc.b	140				
	.dc.b	55				
	.dc.b	12				
						
	.dc.b	143				
						
	.dc.b	140				
	.dc.b	106				
	.dc.b	247				
						
	.dc.b	175				
						
	.dc.b	140				
	.dc.b	158				
	.dc.b	231				
						
	.dc.b	143				
						
	.dc.b	140				
	.dc.b	210				
	.dc.b	220				
						
	.dc.b	79				
						
	.dc.b	141				
	.dc.b	6				
	.dc.b	213				
						
	.dc.b	207				
						
	.dc.b	141				
	.dc.b	58				
	.dc.b	212				
						
	.dc.b	15				
						
	.dc.b	141				
	.dc.b	110				
	.dc.b	215				
						
	.dc.b	47				
						
	.dc.b	141				
	.dc.b	162				
	.dc.b	222				
						
	.dc.b	239				
						
	.dc.b	141				
	.dc.b	214				
	.dc.b	235				
						
	.dc.b	143				
						
	.dc.b	142				
	.dc.b	10				
	.dc.b	253				
						
	.dc.b	15				
						
	.dc.b	142				
	.dc.b	63				
	.dc.b	19				
						
	.dc.b	47				
						
	.dc.b	142				
	.dc.b	115				
	.dc.b	46				
						
	.dc.b	47				
						
	.dc.b	142				
	.dc.b	167				
	.dc.b	77				
						
	.dc.b	239				
						
	.dc.b	142				
	.dc.b	219				
	.dc.b	114				
						
	.dc.b	79				
						
	.dc.b	143				
	.dc.b	15				
	.dc.b	155				
						
	.dc.b	143				
						
	.dc.b	143				
	.dc.b	67				
	.dc.b	201				
						
	.dc.b	143				
						
	.dc.b	143				
	.dc.b	119				
	.dc.b	252				
						
	.dc.b	79				
						
	.dc.b	143				
	.dc.b	172				
	.dc.b	51				
						
	.dc.b	207				
						
	.dc.b	143				
	.dc.b	224				
	.dc.b	112				
						
	.dc.b	15				
						
	.dc.b	144				
	.dc.b	20				
	.dc.b	177				
						
	.dc.b	15				
						
	.dc.b	144				
	.dc.b	72				
	.dc.b	246				
						
	.dc.b	207				
						
	.dc.b	144				
	.dc.b	125				
	.dc.b	65				
						
	.dc.b	79				
						
	.dc.b	144				
	.dc.b	177				
	.dc.b	144				
						
	.dc.b	111				
						
	.dc.b	144				
	.dc.b	229				
	.dc.b	228				
						
	.dc.b	79				
						
	.dc.b	145				
	.dc.b	26				
	.dc.b	61				
						
	.dc.b	15				
						
	.dc.b	145				
	.dc.b	78				
	.dc.b	154				
						
	.dc.b	111				
						
	.dc.b	145				
	.dc.b	130				
	.dc.b	252				
						
	.dc.b	111				
						
	.dc.b	145				
	.dc.b	183				
	.dc.b	99				
						
	.dc.b	79				
						
	.dc.b	145				
	.dc.b	235				
	.dc.b	206				
						
	.dc.b	207				
						
	.dc.b	146				
	.dc.b	32				
	.dc.b	63				
						
	.dc.b	15				
						
	.dc.b	146				
	.dc.b	84				
	.dc.b	179				
						
	.dc.b	239				
						
	.dc.b	146				
	.dc.b	137				
	.dc.b	45				
						
	.dc.b	143				
						
	.dc.b	146				
	.dc.b	189				
	.dc.b	171				
						
	.dc.b	239				
						
	.dc.b	146				
	.dc.b	242				
	.dc.b	46				
						
	.dc.b	239				
						
	.dc.b	147				
	.dc.b	38				
	.dc.b	182				
						
	.dc.b	175				
						
	.dc.b	147				
	.dc.b	91				
	.dc.b	67				
						
	.dc.b	47				
						
	.dc.b	147				
	.dc.b	143				
	.dc.b	212				
						
	.dc.b	47				
						
	.dc.b	147				
	.dc.b	196				
	.dc.b	106				
						
	.dc.b	15				
						
	.dc.b	147				
	.dc.b	249				
	.dc.b	4				
						
	.dc.b	143				
						
	.dc.b	148				
	.dc.b	45				
	.dc.b	163				
						
	.dc.b	175				
						
	.dc.b	148				
	.dc.b	98				
	.dc.b	71				
						
	.dc.b	111				
						
	.dc.b	148				
	.dc.b	150				
	.dc.b	239				
						
	.dc.b	239				
						
	.dc.b	148				
	.dc.b	203				
	.dc.b	157				
						
	.dc.b	15				
						
	.dc.b	149				
	.dc.b	0				
	.dc.b	78				
						
	.dc.b	239				
						
	.dc.b	149				
	.dc.b	53				
	.dc.b	5				
						
	.dc.b	111				
						
	.dc.b	149				
	.dc.b	105				
	.dc.b	192				
						
	.dc.b	143				
						
	.dc.b	149				
	.dc.b	158				
	.dc.b	128				
						
	.dc.b	79				
						
	.dc.b	149				
	.dc.b	211				
	.dc.b	68				
						
	.dc.b	207				
						
	.dc.b	150				
	.dc.b	8				
	.dc.b	13				
						
	.dc.b	207				
						
	.dc.b	150				
	.dc.b	60				
	.dc.b	219				
						
	.dc.b	143				
						
	.dc.b	150				
	.dc.b	113				
	.dc.b	173				
						
	.dc.b	239				
						
	.dc.b	150				
	.dc.b	166				
	.dc.b	132				
						
	.dc.b	239				
						
	.dc.b	150				
	.dc.b	219				
	.dc.b	96				
						
	.dc.b	175				
						
	.dc.b	151				
	.dc.b	16				
	.dc.b	64				
						
	.dc.b	239				
						
	.dc.b	151				
	.dc.b	69				
	.dc.b	37				
						
	.dc.b	207				
						
	.dc.b	151				
	.dc.b	122				
	.dc.b	15				
						
	.dc.b	79				
						
	.dc.b	151				
	.dc.b	174				
	.dc.b	253				
						
	.dc.b	143				
						
	.dc.b	151				
	.dc.b	227				
	.dc.b	240				
						
	.dc.b	79				
						
	.dc.b	152				
	.dc.b	24				
	.dc.b	231				
						
	.dc.b	175				
						
	.dc.b	152				
	.dc.b	77				
	.dc.b	227				
						
	.dc.b	175				
						
	.dc.b	152				
	.dc.b	130				
	.dc.b	228				
						
	.dc.b	79				
						
	.dc.b	152				
	.dc.b	183				
	.dc.b	233				
						
	.dc.b	143				
						
	.dc.b	152				
	.dc.b	236				
	.dc.b	243				
						
	.dc.b	79				
						
	.dc.b	153				
	.dc.b	34				
	.dc.b	1				
						
	.dc.b	175				
						
	.dc.b	153				
	.dc.b	87				
	.dc.b	20				
						
	.dc.b	207				
						
	.dc.b	153				
	.dc.b	140				
	.dc.b	44				
						
	.dc.b	111				
						
	.dc.b	153				
	.dc.b	193				
	.dc.b	72				
						
	.dc.b	143				
						
	.dc.b	153				
	.dc.b	246				
	.dc.b	105				
						
	.dc.b	111				
						
	.dc.b	154				
	.dc.b	43				
	.dc.b	142				
						
	.dc.b	207				
						
	.dc.b	154				
	.dc.b	96				
	.dc.b	184				
						
	.dc.b	175				
						
	.dc.b	154				
	.dc.b	149				
	.dc.b	231				
						
	.dc.b	79				
						
	.dc.b	154				
	.dc.b	203				
	.dc.b	26				
						
	.dc.b	79				
						
	.dc.b	155				
	.dc.b	0				
	.dc.b	82				
						
	.dc.b	15				
						
	.dc.b	155				
	.dc.b	53				
	.dc.b	142				
						
	.dc.b	79				
						
	.dc.b	155				
	.dc.b	106				
	.dc.b	207				
						
	.dc.b	47				
						
	.dc.b	155				
	.dc.b	160				
	.dc.b	20				
						
	.dc.b	143				
						
	.dc.b	155				
	.dc.b	213				
	.dc.b	94				
						
	.dc.b	111				
						
	.dc.b	156				
	.dc.b	10				
	.dc.b	172				
						
	.dc.b	239				
						
	.dc.b	156				
	.dc.b	64				
	.dc.b	0				
						
	.dc.b	15				
						
	.dc.b	156				
	.dc.b	117				
	.dc.b	87				
						
	.dc.b	175				
						
	.dc.b	156				
	.dc.b	170				
	.dc.b	179				
						
	.dc.b	207				
						
	.dc.b	156				
	.dc.b	224				
	.dc.b	20				
						
	.dc.b	111				
						
	.dc.b	157				
	.dc.b	21				
	.dc.b	121				
						
	.dc.b	175				
						
	.dc.b	157				
	.dc.b	74				
	.dc.b	227				
						
	.dc.b	143				
						
	.dc.b	157				
	.dc.b	128				
	.dc.b	81				
						
	.dc.b	207				
						
	.dc.b	157				
	.dc.b	181				
	.dc.b	196				
						
	.dc.b	175				
						
	.dc.b	157				
	.dc.b	235				
	.dc.b	60				
						
	.dc.b	15				
						
	.dc.b	158				
	.dc.b	32				
	.dc.b	183				
						
	.dc.b	239				
						
	.dc.b	158				
	.dc.b	86				
	.dc.b	56				
						
	.dc.b	111				
						
	.dc.b	158				
	.dc.b	139				
	.dc.b	189				
						
	.dc.b	79				
						
	.dc.b	158				
	.dc.b	193				
	.dc.b	70				
						
	.dc.b	207				
						
	.dc.b	158				
	.dc.b	246				
	.dc.b	212				
						
	.dc.b	207				
						
	.dc.b	159				
	.dc.b	44				
	.dc.b	103				
						
	.dc.b	79				
						
	.dc.b	159				
	.dc.b	97				
	.dc.b	254				
						
	.dc.b	79				
						
	.dc.b	159				
	.dc.b	151				
	.dc.b	153				
						
	.dc.b	207				
						
	.dc.b	159				
	.dc.b	205				
	.dc.b	57				
						
	.dc.b	207				
						
	.dc.b	160				
	.dc.b	2				
	.dc.b	222				
						
	.dc.b	111				
						
	.dc.b	160				
	.dc.b	56				
	.dc.b	135				
						
	.dc.b	111				
						
	.dc.b	160				
	.dc.b	110				
	.dc.b	52				
						
	.dc.b	239				
						
	.dc.b	160				
	.dc.b	163				
	.dc.b	230				
						
	.dc.b	239				
						
	.dc.b	160				
	.dc.b	217				
	.dc.b	157				
						
	.dc.b	111				
						
	.dc.b	161				
	.dc.b	15				
	.dc.b	88				
						
	.dc.b	79				
						
	.dc.b	161				
	.dc.b	69				
	.dc.b	23				
						
	.dc.b	207				
						
	.dc.b	161				
	.dc.b	122				
	.dc.b	219				
						
	.dc.b	207				
						
	.dc.b	161				
	.dc.b	176				
	.dc.b	164				
						
	.dc.b	47				
						
	.dc.b	161				
	.dc.b	230				
	.dc.b	113				
						
	.dc.b	15				
						
	.dc.b	162				
	.dc.b	28				
	.dc.b	66				
						
	.dc.b	111				
						
	.dc.b	162				
	.dc.b	82				
	.dc.b	24				
						
	.dc.b	79				
						
	.dc.b	162				
	.dc.b	135				
	.dc.b	242				
						
	.dc.b	143				
						
	.dc.b	162				
	.dc.b	189				
	.dc.b	209				
						
	.dc.b	79				
						
	.dc.b	162				
	.dc.b	243				
	.dc.b	180				
						
	.dc.b	143				
						
	.dc.b	163				
	.dc.b	41				
	.dc.b	156				
						
	.dc.b	47				
						
	.dc.b	163				
	.dc.b	95				
	.dc.b	136				
						
	.dc.b	79				
						
	.dc.b	163				
	.dc.b	149				
	.dc.b	120				
						
	.dc.b	239				
						
	.dc.b	163				
	.dc.b	203				
	.dc.b	109				
						
	.dc.b	239				
						
	.dc.b	164				
	.dc.b	1				
	.dc.b	103				
						
	.dc.b	79				
						
	.dc.b	164				
	.dc.b	55				
	.dc.b	101				
						
	.dc.b	79				
						
	.dc.b	164				
	.dc.b	109				
	.dc.b	103				
						
	.dc.b	175				
						
	.dc.b	164				
	.dc.b	163				
	.dc.b	110				
						
	.dc.b	111				
						
	.dc.b	164				
	.dc.b	217				
	.dc.b	121				
						
	.dc.b	175				
						
	.dc.b	165				
	.dc.b	15				
	.dc.b	137				
						
	.dc.b	79				
						
	.dc.b	165				
	.dc.b	69				
	.dc.b	157				
						
	.dc.b	79				
						
	.dc.b	165				
	.dc.b	123				
	.dc.b	181				
						
	.dc.b	207				
						
	.dc.b	165				
	.dc.b	177				
	.dc.b	210				
						
	.dc.b	207				
						
	.dc.b	165				
	.dc.b	231				
	.dc.b	244				
						
	.dc.b	47				
						
	.dc.b	166				
	.dc.b	30				
	.dc.b	25				
						
	.dc.b	239				
						
	.dc.b	166				
	.dc.b	84				
	.dc.b	68				
						
	.dc.b	15				
						
	.dc.b	166				
	.dc.b	138				
	.dc.b	114				
						
	.dc.b	175				
						
	.dc.b	166				
	.dc.b	192				
	.dc.b	165				
						
	.dc.b	175				
						
	.dc.b	166				
	.dc.b	246				
	.dc.b	221				
						
	.dc.b	15				
						
	.dc.b	167				
	.dc.b	45				
	.dc.b	24				
						
	.dc.b	207				
						
	.dc.b	167				
	.dc.b	99				
	.dc.b	89				
						
	.dc.b	15				
						
	.dc.b	167				
	.dc.b	153				
	.dc.b	157				
						
	.dc.b	175				
						
	.dc.b	167				
	.dc.b	207				
	.dc.b	230				
						
	.dc.b	175				
						
	.dc.b	168				
	.dc.b	6				
	.dc.b	52				
						
	.dc.b	15				
						
	.dc.b	168				
	.dc.b	60				
	.dc.b	133				
						
	.dc.b	207				
						
	.dc.b	168				
	.dc.b	114				
	.dc.b	219				
						
	.dc.b	239				
						
	.dc.b	168				
	.dc.b	169				
	.dc.b	54				
						
	.dc.b	143				
						
	.dc.b	168				
	.dc.b	223				
	.dc.b	149				
						
	.dc.b	111				
						
	.dc.b	169				
	.dc.b	21				
	.dc.b	248				
						
	.dc.b	207				
						
	.dc.b	169				
	.dc.b	76				
	.dc.b	96				
						
	.dc.b	111				
						
	.dc.b	169				
	.dc.b	130				
	.dc.b	204				
						
	.dc.b	111				
						
	.dc.b	169				
	.dc.b	185				
	.dc.b	60				
						
	.dc.b	239				
						
	.dc.b	169				
	.dc.b	239				
	.dc.b	177				
						
	.dc.b	175				
						
	.dc.b	170				
	.dc.b	38				
	.dc.b	42				
						
	.dc.b	207				
						
	.dc.b	170				
	.dc.b	92				
	.dc.b	168				
						
	.dc.b	79				
						
	.dc.b	170				
	.dc.b	147				
	.dc.b	42				
						
	.dc.b	47				
						
	.dc.b	170				
	.dc.b	201				
	.dc.b	176				
						
	.dc.b	111				
						
	.dc.b	171				
	.dc.b	0				
	.dc.b	59				
						
	.dc.b	15				
						
	.dc.b	171				
	.dc.b	54				
	.dc.b	201				
						
	.dc.b	239				
						
	.dc.b	171				
	.dc.b	109				
	.dc.b	93				
						
	.dc.b	47				
						
	.dc.b	171				
	.dc.b	163				
	.dc.b	244				
						
	.dc.b	207				
						
	.dc.b	171				
	.dc.b	218				
	.dc.b	144				
						
	.dc.b	207				
						
	.dc.b	172				
	.dc.b	17				
	.dc.b	49				
						
	.dc.b	15				
						
	.dc.b	172				
	.dc.b	71				
	.dc.b	213				
						
	.dc.b	175				
						
	.dc.b	172				
	.dc.b	126				
	.dc.b	126				
						
	.dc.b	175				
						
	.dc.b	172				
	.dc.b	181				
	.dc.b	44				
						
	.dc.b	15				
						
	.dc.b	172				
	.dc.b	235				
	.dc.b	221				
						
	.dc.b	175				
						
	.dc.b	173				
	.dc.b	34				
	.dc.b	147				
						
	.dc.b	143				
						
	.dc.b	173				
	.dc.b	89				
	.dc.b	77				
						
	.dc.b	239				
						
	.dc.b	173				
	.dc.b	144				
	.dc.b	12				
						
	.dc.b	143				
						
	.dc.b	173				
	.dc.b	198				
	.dc.b	207				
						
	.dc.b	111				
						
	.dc.b	173				
	.dc.b	253				
	.dc.b	150				
						
	.dc.b	175				
						
	.dc.b	174				
	.dc.b	52				
	.dc.b	98				
						
	.dc.b	47				
						
	.dc.b	174				
	.dc.b	107				
	.dc.b	50				
						
	.dc.b	15				
						
	.dc.b	174				
	.dc.b	162				
	.dc.b	6				
						
	.dc.b	79				
						
	.dc.b	174				
	.dc.b	216				
	.dc.b	222				
						
	.dc.b	175				
						
	.dc.b	175				
	.dc.b	15				
	.dc.b	187				
						
	.dc.b	143				
						
	.dc.b	175				
	.dc.b	70				
	.dc.b	156				
						
	.dc.b	143				
						
	.dc.b	175				
	.dc.b	125				
	.dc.b	129				
						
	.dc.b	239				
						
	.dc.b	175				
	.dc.b	180				
	.dc.b	107				
						
	.dc.b	175				
						
	.dc.b	175				
	.dc.b	235				
	.dc.b	89				
						
	.dc.b	143				
						
	.dc.b	176				
	.dc.b	34				
	.dc.b	75				
						
	.dc.b	207				
						
	.dc.b	176				
	.dc.b	89				
	.dc.b	66				
						
	.dc.b	79				
						
	.dc.b	176				
	.dc.b	144				
	.dc.b	61				
						
	.dc.b	47				
						
	.dc.b	176				
	.dc.b	199				
	.dc.b	60				
						
	.dc.b	79				
						
	.dc.b	176				
	.dc.b	254				
	.dc.b	63				
						
	.dc.b	175				
						
	.dc.b	177				
	.dc.b	53				
	.dc.b	71				
						
	.dc.b	79				
						
	.dc.b	177				
	.dc.b	108				
	.dc.b	83				
						
	.dc.b	79				
						
	.dc.b	177				
	.dc.b	163				
	.dc.b	99				
						
	.dc.b	111				
						
	.dc.b	177				
	.dc.b	218				
	.dc.b	119				
						
	.dc.b	239				
						
	.dc.b	178				
	.dc.b	17				
	.dc.b	144				
						
	.dc.b	175				
						
	.dc.b	178				
	.dc.b	72				
	.dc.b	173				
						
	.dc.b	175				
						
	.dc.b	178				
	.dc.b	127				
	.dc.b	206				
						
	.dc.b	239				
						
	.dc.b	178				
	.dc.b	182				
	.dc.b	244				
						
	.dc.b	111				
						
	.dc.b	178				
	.dc.b	238				
	.dc.b	30				
						
	.dc.b	47				
						
	.dc.b	179				
	.dc.b	37				
	.dc.b	76				
						
	.dc.b	47				
						
	.dc.b	179				
	.dc.b	92				
	.dc.b	126				
						
	.dc.b	111				
						
	.dc.b	179				
	.dc.b	147				
	.dc.b	181				
						
	.dc.b	15				
						
	.dc.b	179				
	.dc.b	202				
	.dc.b	239				
						
	.dc.b	207				
						
	.dc.b	180				
	.dc.b	2				
	.dc.b	46				
						
	.dc.b	207				
						
	.dc.b	180				
	.dc.b	57				
	.dc.b	114				
						
	.dc.b	15				
						
	.dc.b	180				
	.dc.b	112				
	.dc.b	185				
						
	.dc.b	143				
						
	.dc.b	180				
	.dc.b	168				
	.dc.b	5				
						
	.dc.b	79				
						
	.dc.b	180				
	.dc.b	223				
	.dc.b	85				
						
	.dc.b	47				
						
	.dc.b	181				
	.dc.b	22				
	.dc.b	169				
						
	.dc.b	111				
						
	.dc.b	181				
	.dc.b	78				
	.dc.b	1				
						
	.dc.b	207				
						
	.dc.b	181				
	.dc.b	133				
	.dc.b	94				
						
	.dc.b	111				
						
	.dc.b	181				
	.dc.b	188				
	.dc.b	191				
						
	.dc.b	79				
						
	.dc.b	181				
	.dc.b	244				
	.dc.b	36				
						
	.dc.b	111				
						
	.dc.b	182				
	.dc.b	43				
	.dc.b	141				
						
	.dc.b	175				
						
	.dc.b	182				
	.dc.b	98				
	.dc.b	251				
						
	.dc.b	47				
						
	.dc.b	182				
	.dc.b	154				
	.dc.b	108				
						
	.dc.b	239				
						
	.dc.b	182				
	.dc.b	209				
	.dc.b	226				
						
	.dc.b	207				
						
	.dc.b	183				
	.dc.b	9				
	.dc.b	92				
						
	.dc.b	239				
						
	.dc.b	183				
	.dc.b	64				
	.dc.b	219				
						
	.dc.b	79				
						
	.dc.b	183				
	.dc.b	120				
	.dc.b	93				
						
	.dc.b	239				
						
	.dc.b	183				
	.dc.b	175				
	.dc.b	228				
						
	.dc.b	175				
						
	.dc.b	183				
	.dc.b	231				
	.dc.b	111				
						
	.dc.b	143				
						
	.dc.b	184				
	.dc.b	30				
	.dc.b	254				
						
	.dc.b	175				
						
	.dc.b	184				
	.dc.b	86				
	.dc.b	146				
						
	.dc.b	15				
						
	.dc.b	184				
	.dc.b	142				
	.dc.b	41				
						
	.dc.b	143				
						
	.dc.b	184				
	.dc.b	197				
	.dc.b	197				
						
	.dc.b	79				
						
	.dc.b	184				
	.dc.b	253				
	.dc.b	101				
						
	.dc.b	47				
						
	.dc.b	185				
	.dc.b	53				
	.dc.b	9				
						
	.dc.b	79				
						
	.dc.b	185				
	.dc.b	108				
	.dc.b	177				
						
	.dc.b	143				
						
	.dc.b	185				
	.dc.b	164				
	.dc.b	93				
						
	.dc.b	239				
						
	.dc.b	185				
	.dc.b	220				
	.dc.b	14				
						
	.dc.b	143				
						
	.dc.b	186				
	.dc.b	19				
	.dc.b	195				
						
	.dc.b	111				
						
	.dc.b	186				
	.dc.b	75				
	.dc.b	124				
						
	.dc.b	79				
						
	.dc.b	186				
	.dc.b	131				
	.dc.b	57				
						
	.dc.b	111				
						
	.dc.b	186				
	.dc.b	186				
	.dc.b	250				
						
	.dc.b	175				
						
	.dc.b	186				
	.dc.b	242				
	.dc.b	192				
						
	.dc.b	47				
						
	.dc.b	187				
	.dc.b	42				
	.dc.b	137				
						
	.dc.b	207				
						
	.dc.b	187				
	.dc.b	98				
	.dc.b	87				
						
	.dc.b	143				
						
	.dc.b	187				
	.dc.b	154				
	.dc.b	41				
						
	.dc.b	143				
						
	.dc.b	187				
	.dc.b	209				
	.dc.b	255				
						
	.dc.b	143				
						
	.dc.b	188				
	.dc.b	9				
	.dc.b	217				
						
	.dc.b	207				
						
	.dc.b	188				
	.dc.b	65				
	.dc.b	184				
						
	.dc.b	47				
						
	.dc.b	188				
	.dc.b	121				
	.dc.b	154				
						
	.dc.b	175				
						
	.dc.b	188				
	.dc.b	177				
	.dc.b	129				
						
	.dc.b	111				
						
	.dc.b	188				
	.dc.b	233				
	.dc.b	108				
						
	.dc.b	47				
						
	.dc.b	189				
	.dc.b	33				
	.dc.b	91				
						
	.dc.b	47				
						
	.dc.b	189				
	.dc.b	89				
	.dc.b	78				
						
	.dc.b	79				
						
	.dc.b	189				
	.dc.b	145				
	.dc.b	69				
						
	.dc.b	111				
						
	.dc.b	189				
	.dc.b	201				
	.dc.b	64				
						
	.dc.b	207				
						
	.dc.b	190				
	.dc.b	1				
	.dc.b	64				
						
	.dc.b	79				
						
	.dc.b	190				
	.dc.b	57				
	.dc.b	67				
						
	.dc.b	239				
						
	.dc.b	190				
	.dc.b	113				
	.dc.b	75				
						
	.dc.b	175				
						
	.dc.b	190				
	.dc.b	169				
	.dc.b	87				
						
	.dc.b	143				
						
	.dc.b	190				
	.dc.b	225				
	.dc.b	103				
						
	.dc.b	143				
						
	.dc.b	191				
	.dc.b	25				
	.dc.b	123				
						
	.dc.b	143				
						
	.dc.b	191				
	.dc.b	81				
	.dc.b	147				
						
	.dc.b	207				
						
	.dc.b	191				
	.dc.b	137				
	.dc.b	176				
						
	.dc.b	47				
						
	.dc.b	191				
	.dc.b	193				
	.dc.b	208				
						
	.dc.b	143				
						
	.dc.b	191				
	.dc.b	249				
	.dc.b	245				
						
	.dc.b	15				
						
	.dc.b	192				
	.dc.b	50				
	.dc.b	29				
						
	.dc.b	207				
						
	.dc.b	192				
	.dc.b	106				
	.dc.b	74				
						
	.dc.b	143				
						
	.dc.b	192				
	.dc.b	162				
	.dc.b	123				
						
	.dc.b	79				
						
	.dc.b	192				
	.dc.b	218				
	.dc.b	176				
						
	.dc.b	79				
						
	.dc.b	193				
	.dc.b	18				
	.dc.b	233				
						
	.dc.b	79				
						
	.dc.b	193				
	.dc.b	75				
	.dc.b	38				
						
	.dc.b	143				
						
	.dc.b	193				
	.dc.b	131				
	.dc.b	103				
						
	.dc.b	175				
						
	.dc.b	193				
	.dc.b	187				
	.dc.b	173				
						
	.dc.b	15				
						
	.dc.b	193				
	.dc.b	243				
	.dc.b	246				
						
	.dc.b	111				
						
	.dc.b	194				
	.dc.b	44				
	.dc.b	67				
						
	.dc.b	239				
						
	.dc.b	194				
	.dc.b	100				
	.dc.b	149				
						
	.dc.b	143				
						
	.dc.b	194				
	.dc.b	156				
	.dc.b	235				
						
	.dc.b	47				
						
	.dc.b	194				
	.dc.b	213				
	.dc.b	68				
						
	.dc.b	239				
						
	.dc.b	195				
	.dc.b	13				
	.dc.b	162				
						
	.dc.b	207				
						
	.dc.b	195				
	.dc.b	70				
	.dc.b	4				
						
	.dc.b	175				
						
	.dc.b	195				
	.dc.b	126				
	.dc.b	106				
						
	.dc.b	143				
						
	.dc.b	195				
	.dc.b	182				
	.dc.b	212				
						
	.dc.b	175				
						
	.dc.b	195				
	.dc.b	239				
	.dc.b	66				
						
	.dc.b	175				
						
	.dc.b	196				
	.dc.b	39				
	.dc.b	180				
						
	.dc.b	239				
						
	.dc.b	196				
	.dc.b	96				
	.dc.b	43				
						
	.dc.b	15				
						
	.dc.b	196				
	.dc.b	152				
	.dc.b	165				
						
	.dc.b	79				
						
	.dc.b	196				
	.dc.b	209				
	.dc.b	35				
						
	.dc.b	175				
						
	.dc.b	197				
	.dc.b	9				
	.dc.b	166				
						
	.dc.b	15				
						
	.dc.b	197				
	.dc.b	66				
	.dc.b	44				
						
	.dc.b	143				
						
	.dc.b	197				
	.dc.b	122				
	.dc.b	183				
						
	.dc.b	15				
						
	.dc.b	197				
	.dc.b	179				
	.dc.b	69				
						
	.dc.b	143				
						
	.dc.b	197				
	.dc.b	235				
	.dc.b	216				
						
	.dc.b	47				
						
	.dc.b	198				
	.dc.b	36				
	.dc.b	110				
						
	.dc.b	207				
						
	.dc.b	198				
	.dc.b	93				
	.dc.b	9				
						
	.dc.b	111				
						
	.dc.b	198				
	.dc.b	149				
	.dc.b	168				
						
	.dc.b	47				
						
	.dc.b	198				
	.dc.b	206				
	.dc.b	74				
						
	.dc.b	239				
						
	.dc.b	199				
	.dc.b	6				
	.dc.b	241				
						
	.dc.b	175				
						
	.dc.b	199				
	.dc.b	63				
	.dc.b	156				
						
	.dc.b	143				
						
	.dc.b	199				
	.dc.b	120				
	.dc.b	75				
						
	.dc.b	111				
						
	.dc.b	199				
	.dc.b	176				
	.dc.b	254				
						
	.dc.b	79				
						
	.dc.b	199				
	.dc.b	233				
	.dc.b	181				
						
	.dc.b	47				
						
	.dc.b	200				
	.dc.b	34				
	.dc.b	112				
						
	.dc.b	15				
						
	.dc.b	200				
	.dc.b	91				
	.dc.b	47				
						
	.dc.b	15				
						
	.dc.b	200				
	.dc.b	147				
	.dc.b	241				
						
	.dc.b	239				
						
	.dc.b	200				
	.dc.b	204				
	.dc.b	184				
						
	.dc.b	239				
						
	.dc.b	201				
	.dc.b	5				
	.dc.b	131				
						
	.dc.b	239				
						
	.dc.b	201				
	.dc.b	62				
	.dc.b	82				
						
	.dc.b	239				
						
	.dc.b	201				
	.dc.b	119				
	.dc.b	37				
						
	.dc.b	239				
						
	.dc.b	201				
	.dc.b	175				
	.dc.b	253				
						
	.dc.b	15				
						
	.dc.b	201				
	.dc.b	232				
	.dc.b	216				
						
	.dc.b	15				
						
	.dc.b	202				
	.dc.b	33				
	.dc.b	183				
						
	.dc.b	15				
						
	.dc.b	202				
	.dc.b	90				
	.dc.b	154				
						
	.dc.b	15				
						
	.dc.b	202				
	.dc.b	147				
	.dc.b	129				
						
	.dc.b	47				
						
	.dc.b	202				
	.dc.b	204				
	.dc.b	108				
						
	.dc.b	47				
						
	.dc.b	203				
	.dc.b	5				
	.dc.b	91				
						
	.dc.b	47				
						
	.dc.b	203				
	.dc.b	62				
	.dc.b	78				
						
	.dc.b	47				
						
	.dc.b	203				
	.dc.b	119				
	.dc.b	69				
						
	.dc.b	47				
						
	.dc.b	203				
	.dc.b	176				
	.dc.b	64				
						
	.dc.b	47				
						
	.dc.b	203				
	.dc.b	233				
	.dc.b	63				
						
	.dc.b	47				
						
	.dc.b	204				
	.dc.b	34				
	.dc.b	66				
						
	.dc.b	47				
						
	.dc.b	204				
	.dc.b	91				
	.dc.b	73				
						
	.dc.b	47				
						
	.dc.b	204				
	.dc.b	148				
	.dc.b	84				
						
	.dc.b	15				
						
	.dc.b	204				
	.dc.b	205				
	.dc.b	98				
						
	.dc.b	239				
						
	.dc.b	205				
	.dc.b	6				
	.dc.b	117				
						
	.dc.b	207				
						
	.dc.b	205				
	.dc.b	63				
	.dc.b	140				
						
	.dc.b	175				
						
	.dc.b	205				
	.dc.b	120				
	.dc.b	167				
						
	.dc.b	143				
						
	.dc.b	205				
	.dc.b	177				
	.dc.b	198				
						
	.dc.b	79				
						
	.dc.b	205				
	.dc.b	234				
	.dc.b	233				
						
	.dc.b	15				
						
	.dc.b	206				
	.dc.b	36				
	.dc.b	15				
						
	.dc.b	207				
						
	.dc.b	206				
	.dc.b	93				
	.dc.b	58				
						
	.dc.b	143				
						
	.dc.b	206				
	.dc.b	150				
	.dc.b	105				
						
	.dc.b	47				
						
	.dc.b	206				
	.dc.b	207				
	.dc.b	155				
						
	.dc.b	207				
						
	.dc.b	207				
	.dc.b	8				
	.dc.b	210				
						
	.dc.b	79				
						
	.dc.b	207				
	.dc.b	66				
	.dc.b	12				
						
	.dc.b	207				
						
	.dc.b	207				
	.dc.b	123				
	.dc.b	75				
						
	.dc.b	79				
						
	.dc.b	207				
	.dc.b	180				
	.dc.b	141				
						
	.dc.b	175				
						
	.dc.b	207				
	.dc.b	237				
	.dc.b	212				
						
	.dc.b	15				
						
	.dc.b	208				
	.dc.b	39				
	.dc.b	30				
						
	.dc.b	111				
						
	.dc.b	208				
	.dc.b	96				
	.dc.b	108				
						
	.dc.b	175				
						
	.dc.b	208				
	.dc.b	153				
	.dc.b	190				
						
	.dc.b	207				
						
	.dc.b	208				
	.dc.b	211				
	.dc.b	21				
						
	.dc.b	15				
						
	.dc.b	209				
	.dc.b	12				
	.dc.b	111				
						
	.dc.b	15				
						
	.dc.b	209				
	.dc.b	69				
	.dc.b	205				
						
	.dc.b	15				
						
	.dc.b	209				
	.dc.b	127				
	.dc.b	47				
						
	.dc.b	15				
						
	.dc.b	209				
	.dc.b	184				
	.dc.b	148				
						
	.dc.b	239				
						
	.dc.b	209				
	.dc.b	241				
	.dc.b	254				
						
	.dc.b	175				
						
	.dc.b	210				
	.dc.b	43				
	.dc.b	108				
						
	.dc.b	111				
						
	.dc.b	210				
	.dc.b	100				
	.dc.b	222				
						
	.dc.b	15				
						
	.dc.b	210				
	.dc.b	158				
	.dc.b	83				
						
	.dc.b	143				
						
	.dc.b	210				
	.dc.b	215				
	.dc.b	205				
						
	.dc.b	15				
						
	.dc.b	211				
	.dc.b	17				
	.dc.b	74				
						
	.dc.b	143				
						
	.dc.b	211				
	.dc.b	74				
	.dc.b	203				
						
	.dc.b	207				
						
	.dc.b	211				
	.dc.b	132				
	.dc.b	81				
						
	.dc.b	15				
						
	.dc.b	211				
	.dc.b	189				
	.dc.b	218				
						
	.dc.b	47				
						
	.dc.b	211				
	.dc.b	247				
	.dc.b	103				
						
	.dc.b	79				
						
	.dc.b	212				
	.dc.b	48				
	.dc.b	248				
						
	.dc.b	47				
						
	.dc.b	212				
	.dc.b	106				
	.dc.b	141				
						
	.dc.b	15				
						
	.dc.b	212				
	.dc.b	164				
	.dc.b	37				
						
	.dc.b	239				
						
	.dc.b	212				
	.dc.b	221				
	.dc.b	194				
						
	.dc.b	143				
						
	.dc.b	213				
	.dc.b	23				
	.dc.b	99				
						
	.dc.b	15				
						
	.dc.b	213				
	.dc.b	81				
	.dc.b	7				
						
	.dc.b	143				
						
	.dc.b	213				
	.dc.b	138				
	.dc.b	175				
						
	.dc.b	239				
						
	.dc.b	213				
	.dc.b	196				
	.dc.b	92				
						
	.dc.b	47				
						
	.dc.b	213				
	.dc.b	254				
	.dc.b	12				
						
	.dc.b	79				
						
	.dc.b	214				
	.dc.b	55				
	.dc.b	192				
						
	.dc.b	111				
						
	.dc.b	214				
	.dc.b	113				
	.dc.b	120				
						
	.dc.b	79				
						
	.dc.b	214				
	.dc.b	171				
	.dc.b	52				
						
	.dc.b	47				
						
	.dc.b	214				
	.dc.b	228				
	.dc.b	243				
						
	.dc.b	207				
						
	.dc.b	215				
	.dc.b	30				
	.dc.b	183				
						
	.dc.b	111				
						
	.dc.b	215				
	.dc.b	88				
	.dc.b	126				
						
	.dc.b	207				
						
	.dc.b	215				
	.dc.b	146				
	.dc.b	74				
						
	.dc.b	47				
						
	.dc.b	215				
	.dc.b	204				
	.dc.b	25				
						
	.dc.b	111				
						
	.dc.b	216				
	.dc.b	5				
	.dc.b	236				
						
	.dc.b	111				
						
	.dc.b	216				
	.dc.b	63				
	.dc.b	195				
						
	.dc.b	111				
						
	.dc.b	216				
	.dc.b	121				
	.dc.b	158				
						
	.dc.b	47				
						
	.dc.b	216				
	.dc.b	179				
	.dc.b	124				
						
	.dc.b	239				
						
	.dc.b	216				
	.dc.b	237				
	.dc.b	95				
						
	.dc.b	111				
						
	.dc.b	217				
	.dc.b	39				
	.dc.b	69				
						
	.dc.b	207				
						
	.dc.b	217				
	.dc.b	97				
	.dc.b	48				
						
	.dc.b	47				
						
	.dc.b	217				
	.dc.b	155				
	.dc.b	30				
						
	.dc.b	79				
						
	.dc.b	217				
	.dc.b	213				
	.dc.b	16				
						
	.dc.b	47				
						
	.dc.b	218				
	.dc.b	15				
	.dc.b	6				
						
	.dc.b	15				
						
	.dc.b	218				
	.dc.b	72				
	.dc.b	255				
						
	.dc.b	207				
						
	.dc.b	218				
	.dc.b	130				
	.dc.b	253				
						
	.dc.b	79				
						
	.dc.b	218				
	.dc.b	188				
	.dc.b	254				
						
	.dc.b	175				
						
	.dc.b	218				
	.dc.b	247				
	.dc.b	3				
						
	.dc.b	239				
						
	.dc.b	219				
	.dc.b	49				
	.dc.b	13				
						
	.dc.b	15				
						
	.dc.b	219				
	.dc.b	107				
	.dc.b	25				
						
	.dc.b	239				
						
	.dc.b	219				
	.dc.b	165				
	.dc.b	42				
						
	.dc.b	175				
						
	.dc.b	219				
	.dc.b	223				
	.dc.b	63				
						
	.dc.b	79				
						
	.dc.b	220				
	.dc.b	25				
	.dc.b	87				
						
	.dc.b	207				
						
	.dc.b	220				
	.dc.b	83				
	.dc.b	116				
						
	.dc.b	15				
						
	.dc.b	220				
	.dc.b	141				
	.dc.b	148				
						
	.dc.b	47				
						
	.dc.b	220				
	.dc.b	199				
	.dc.b	184				
						
	.dc.b	15				
						
	.dc.b	221				
	.dc.b	1				
	.dc.b	223				
						
	.dc.b	207				
						
	.dc.b	221				
	.dc.b	60				
	.dc.b	11				
						
	.dc.b	111				
						
	.dc.b	221				
	.dc.b	118				
	.dc.b	58				
						
	.dc.b	207				
						
	.dc.b	221				
	.dc.b	176				
	.dc.b	110				
						
	.dc.b	15				
						
	.dc.b	221				
	.dc.b	234				
	.dc.b	165				
						
	.dc.b	47				
						
	.dc.b	222				
	.dc.b	36				
	.dc.b	224				
						
	.dc.b	15				
						
	.dc.b	222				
	.dc.b	95				
	.dc.b	30				
						
	.dc.b	175				
						
	.dc.b	222				
	.dc.b	153				
	.dc.b	97				
						
	.dc.b	47				
						
	.dc.b	222				
	.dc.b	211				
	.dc.b	167				
						
	.dc.b	143				
						
	.dc.b	223				
	.dc.b	13				
	.dc.b	241				
						
	.dc.b	175				
						
	.dc.b	223				
	.dc.b	72				
	.dc.b	63				
						
	.dc.b	175				
						
	.dc.b	223				
	.dc.b	130				
	.dc.b	145				
						
	.dc.b	111				
						
	.dc.b	223				
	.dc.b	188				
	.dc.b	230				
						
	.dc.b	239				
						
	.dc.b	223				
	.dc.b	247				
	.dc.b	64				
						
	.dc.b	79				
						
	.dc.b	224				
	.dc.b	49				
	.dc.b	157				
						
	.dc.b	111				
						
	.dc.b	224				
	.dc.b	107				
	.dc.b	254				
						
	.dc.b	111				
						
	.dc.b	224				
	.dc.b	166				
	.dc.b	99				
						
	.dc.b	47				
						
	.dc.b	224				
	.dc.b	224				
	.dc.b	203				
						
	.dc.b	175				
						
	.dc.b	225				
	.dc.b	27				
	.dc.b	56				
						
	.dc.b	15				
						
	.dc.b	225				
	.dc.b	85				
	.dc.b	168				
						
	.dc.b	47				
						
	.dc.b	225				
	.dc.b	144				
	.dc.b	28				
						
	.dc.b	47				
						
	.dc.b	225				
	.dc.b	202				
	.dc.b	147				
						
	.dc.b	239				
						
	.dc.b	226				
	.dc.b	5				
	.dc.b	15				
						
	.dc.b	111				
						
	.dc.b	226				
	.dc.b	63				
	.dc.b	142				
						
	.dc.b	175				
						
	.dc.b	226				
	.dc.b	122				
	.dc.b	17				
						
	.dc.b	175				
						
	.dc.b	226				
	.dc.b	180				
	.dc.b	152				
						
	.dc.b	143				
						
	.dc.b	226				
	.dc.b	239				
	.dc.b	35				
						
	.dc.b	47				
						
	.dc.b	227				
	.dc.b	41				
	.dc.b	177				
						
	.dc.b	143				
						
	.dc.b	227				
	.dc.b	100				
	.dc.b	67				
						
	.dc.b	207				
						
	.dc.b	227				
	.dc.b	158				
	.dc.b	217				
						
	.dc.b	207				
						
	.dc.b	227				
	.dc.b	217				
	.dc.b	115				
						
	.dc.b	111				
						
	.dc.b	228				
	.dc.b	20				
	.dc.b	16				
						
	.dc.b	239				
						
	.dc.b	228				
	.dc.b	78				
	.dc.b	178				
						
	.dc.b	47				
						
	.dc.b	228				
	.dc.b	137				
	.dc.b	87				
						
	.dc.b	47				
						
	.dc.b	228				
	.dc.b	196				
	.dc.b	0				
						
	.dc.b	15				
						
	.dc.b	228				
	.dc.b	254				
	.dc.b	172				
						
	.dc.b	143				
						
	.dc.b	229				
	.dc.b	57				
	.dc.b	92				
						
	.dc.b	239				
						
	.dc.b	229				
	.dc.b	116				
	.dc.b	16				
						
	.dc.b	239				
						
	.dc.b	229				
	.dc.b	174				
	.dc.b	200				
						
	.dc.b	207				
						
	.dc.b	229				
	.dc.b	233				
	.dc.b	132				
						
	.dc.b	79				
						
	.dc.b	230				
	.dc.b	36				
	.dc.b	67				
						
	.dc.b	175				
						
	.dc.b	230				
	.dc.b	95				
	.dc.b	6				
						
	.dc.b	175				
						
	.dc.b	230				
	.dc.b	153				
	.dc.b	205				
						
	.dc.b	143				
						
	.dc.b	230				
	.dc.b	212				
	.dc.b	152				
						
	.dc.b	47				
						
	.dc.b	231				
	.dc.b	15				
	.dc.b	102				
						
	.dc.b	111				
						
	.dc.b	231				
	.dc.b	74				
	.dc.b	56				
						
	.dc.b	143				
						
	.dc.b	231				
	.dc.b	133				
	.dc.b	14				
						
	.dc.b	79				
						
	.dc.b	231				
	.dc.b	191				
	.dc.b	231				
						
	.dc.b	207				
						
	.dc.b	231				
	.dc.b	250				
	.dc.b	197				
						
	.dc.b	15				
						
	.dc.b	232				
	.dc.b	53				
	.dc.b	166				
						
	.dc.b	15				
						
	.dc.b	232				
	.dc.b	112				
	.dc.b	138				
						
	.dc.b	207				
						
	.dc.b	232				
	.dc.b	171				
	.dc.b	115				
						
	.dc.b	79				
						
	.dc.b	232				
	.dc.b	230				
	.dc.b	95				
						
	.dc.b	143				
						
	.dc.b	233				
	.dc.b	33				
	.dc.b	79				
						
	.dc.b	111				
						
	.dc.b	233				
	.dc.b	92				
	.dc.b	67				
						
	.dc.b	15				
						
	.dc.b	233				
	.dc.b	151				
	.dc.b	58				
						
	.dc.b	111				
						
	.dc.b	233				
	.dc.b	210				
	.dc.b	53				
						
	.dc.b	143				
						
	.dc.b	234				
	.dc.b	13				
	.dc.b	52				
						
	.dc.b	111				
						
	.dc.b	234				
	.dc.b	72				
	.dc.b	54				
						
	.dc.b	239				
						
	.dc.b	234				
	.dc.b	131				
	.dc.b	61				
						
	.dc.b	47				
						
	.dc.b	234				
	.dc.b	190				
	.dc.b	71				
						
	.dc.b	47				
						
	.dc.b	234				
	.dc.b	249				
	.dc.b	84				
						
	.dc.b	239				
						
	.dc.b	235				
	.dc.b	52				
	.dc.b	102				
						
	.dc.b	79				
						
	.dc.b	235				
	.dc.b	111				
	.dc.b	123				
						
	.dc.b	111				
						
	.dc.b	235				
	.dc.b	170				
	.dc.b	148				
						
	.dc.b	47				
						
	.dc.b	235				
	.dc.b	229				
	.dc.b	176				
						
	.dc.b	175				
						
	.dc.b	236				
	.dc.b	32				
	.dc.b	208				
						
	.dc.b	239				
						
	.dc.b	236				
	.dc.b	91				
	.dc.b	244				
						
	.dc.b	207				
						
	.dc.b	236				
	.dc.b	151				
	.dc.b	28				
						
	.dc.b	111				
						
	.dc.b	236				
	.dc.b	210				
	.dc.b	71				
						
	.dc.b	207				
						
	.dc.b	237				
	.dc.b	13				
	.dc.b	118				
						
	.dc.b	207				
						
	.dc.b	237				
	.dc.b	72				
	.dc.b	169				
						
	.dc.b	143				
						
	.dc.b	237				
	.dc.b	131				
	.dc.b	223				
						
	.dc.b	239				
						
	.dc.b	237				
	.dc.b	191				
	.dc.b	26				
						
	.dc.b	15				
						
	.dc.b	237				
	.dc.b	250				
	.dc.b	87				
						
	.dc.b	207				
						
	.dc.b	238				
	.dc.b	53				
	.dc.b	153				
						
	.dc.b	79				
						
	.dc.b	238				
	.dc.b	112				
	.dc.b	222				
						
	.dc.b	111				
						
	.dc.b	238				
	.dc.b	172				
	.dc.b	39				
						
	.dc.b	79				
						
	.dc.b	238				
	.dc.b	231				
	.dc.b	115				
						
	.dc.b	207				
						
	.dc.b	239				
	.dc.b	34				
	.dc.b	196				
						
	.dc.b	15				
						
	.dc.b	239				
	.dc.b	94				
	.dc.b	23				
						
	.dc.b	239				
						
	.dc.b	239				
	.dc.b	153				
	.dc.b	111				
						
	.dc.b	143				
						
	.dc.b	239				
	.dc.b	212				
	.dc.b	202				
						
	.dc.b	207				
						
	.dc.b	240				
	.dc.b	16				
	.dc.b	41				
						
	.dc.b	175				
						
	.dc.b	240				
	.dc.b	75				
	.dc.b	140				
						
	.dc.b	79				
						
	.dc.b	240				
	.dc.b	134				
	.dc.b	242				
						
	.dc.b	143				
						
	.dc.b	240				
	.dc.b	194				
	.dc.b	92				
						
	.dc.b	111				
						
	.dc.b	240				
	.dc.b	253				
	.dc.b	202				
						
	.dc.b	15				
						
	.dc.b	241				
	.dc.b	57				
	.dc.b	59				
						
	.dc.b	79				
						
	.dc.b	241				
	.dc.b	116				
	.dc.b	176				
						
	.dc.b	47				
						
	.dc.b	241				
	.dc.b	176				
	.dc.b	40				
						
	.dc.b	207				
						
	.dc.b	241				
	.dc.b	235				
	.dc.b	165				
						
	.dc.b	15				
						
	.dc.b	242				
	.dc.b	39				
	.dc.b	36				
						
	.dc.b	239				
						
	.dc.b	242				
	.dc.b	98				
	.dc.b	168				
						
	.dc.b	111				
						
	.dc.b	242				
	.dc.b	158				
	.dc.b	47				
						
	.dc.b	175				
						
	.dc.b	242				
	.dc.b	217				
	.dc.b	186				
						
	.dc.b	143				
						
	.dc.b	243				
	.dc.b	21				
	.dc.b	73				
						
	.dc.b	15				
						
	.dc.b	243				
	.dc.b	80				
	.dc.b	219				
						
	.dc.b	47				
						
	.dc.b	243				
	.dc.b	140				
	.dc.b	113				
						
	.dc.b	15				
						
	.dc.b	243				
	.dc.b	200				
	.dc.b	10				
						
	.dc.b	111				
						
	.dc.b	244				
	.dc.b	3				
	.dc.b	167				
						
	.dc.b	143				
						
	.dc.b	244				
	.dc.b	63				
	.dc.b	72				
						
	.dc.b	79				
						
	.dc.b	244				
	.dc.b	122				
	.dc.b	236				
						
	.dc.b	175				
						
	.dc.b	244				
	.dc.b	182				
	.dc.b	148				
						
	.dc.b	175				
						
	.dc.b	244				
	.dc.b	242				
	.dc.b	64				
						
	.dc.b	79				
						
	.dc.b	245				
	.dc.b	45				
	.dc.b	239				
						
	.dc.b	175				
						
	.dc.b	245				
	.dc.b	105				
	.dc.b	162				
						
	.dc.b	143				
						
	.dc.b	245				
	.dc.b	165				
	.dc.b	89				
						
	.dc.b	15				
						
	.dc.b	245				
	.dc.b	225				
	.dc.b	19				
						
	.dc.b	79				
						
	.dc.b	246				
	.dc.b	28				
	.dc.b	209				
						
	.dc.b	15				
						
	.dc.b	246				
	.dc.b	88				
	.dc.b	146				
						
	.dc.b	143				
						
	.dc.b	246				
	.dc.b	148				
	.dc.b	87				
						
	.dc.b	143				
						
	.dc.b	246				
	.dc.b	208				
	.dc.b	32				
						
	.dc.b	79				
						
	.dc.b	247				
	.dc.b	11				
	.dc.b	236				
						
	.dc.b	143				
						
	.dc.b	247				
	.dc.b	71				
	.dc.b	188				
						
	.dc.b	143				
						
	.dc.b	247				
	.dc.b	131				
	.dc.b	144				
						
	.dc.b	15				
						
	.dc.b	247				
	.dc.b	191				
	.dc.b	103				
						
	.dc.b	47				
						
	.dc.b	247				
	.dc.b	251				
	.dc.b	65				
						
	.dc.b	239				
						
	.dc.b	248				
	.dc.b	55				
	.dc.b	32				
						
	.dc.b	79				
						
	.dc.b	248				
	.dc.b	115				
	.dc.b	2				
						
	.dc.b	79				
						
	.dc.b	248				
	.dc.b	174				
	.dc.b	231				
						
	.dc.b	239				
						
	.dc.b	248				
	.dc.b	234				
	.dc.b	209				
						
	.dc.b	47				
						
	.dc.b	249				
	.dc.b	38				
	.dc.b	189				
						
	.dc.b	239				
						
	.dc.b	249				
	.dc.b	98				
	.dc.b	174				
						
	.dc.b	111				
						
	.dc.b	249				
	.dc.b	158				
	.dc.b	162				
						
	.dc.b	111				
						
	.dc.b	249				
	.dc.b	218				
	.dc.b	154				
						
	.dc.b	15				
						
	.dc.b	250				
	.dc.b	22				
	.dc.b	149				
						
	.dc.b	79				
						
	.dc.b	250				
	.dc.b	82				
	.dc.b	148				
						
	.dc.b	15				
						
	.dc.b	250				
	.dc.b	142				
	.dc.b	150				
						
	.dc.b	111				
						
	.dc.b	250				
	.dc.b	202				
	.dc.b	156				
						
	.dc.b	143				
						
	.dc.b	251				
	.dc.b	6				
	.dc.b	166				
						
	.dc.b	15				
						
	.dc.b	251				
	.dc.b	66				
	.dc.b	179				
						
	.dc.b	79				
						
	.dc.b	251				
	.dc.b	126				
	.dc.b	196				
						
	.dc.b	15				
						
	.dc.b	251				
	.dc.b	186				
	.dc.b	216				
						
	.dc.b	111				
						
	.dc.b	251				
	.dc.b	246				
	.dc.b	240				
						
	.dc.b	111				
						
	.dc.b	252				
	.dc.b	51				
	.dc.b	11				
						
	.dc.b	239				
						
	.dc.b	252				
	.dc.b	111				
	.dc.b	43				
						
	.dc.b	15				
						
	.dc.b	252				
	.dc.b	171				
	.dc.b	77				
						
	.dc.b	207				
						
	.dc.b	252				
	.dc.b	231				
	.dc.b	116				
						
	.dc.b	15				
						
	.dc.b	253				
	.dc.b	35				
	.dc.b	157				
						
	.dc.b	239				
						
	.dc.b	253				
	.dc.b	95				
	.dc.b	203				
						
	.dc.b	79				
						
	.dc.b	253				
	.dc.b	155				
	.dc.b	252				
						
	.dc.b	79				
						
	.dc.b	253				
	.dc.b	216				
	.dc.b	48				
						
	.dc.b	239				
						
	.dc.b	254				
	.dc.b	20				
	.dc.b	105				
						
	.dc.b	15				
						
	.dc.b	254				
	.dc.b	80				
	.dc.b	164				
						
	.dc.b	207				
						
	.dc.b	254				
	.dc.b	140				
	.dc.b	228				
						
	.dc.b	15				
						
	.dc.b	254				
	.dc.b	201				
	.dc.b	38				
						
	.dc.b	239				
						
	.dc.b	255				
	.dc.b	5				
	.dc.b	109				
						
	.dc.b	79				
						
	.dc.b	255				
	.dc.b	65				
	.dc.b	183				
						
	.dc.b	79				
						
	.dc.b	255				
	.dc.b	126				
	.dc.b	4				
						
	.dc.b	207				
						
	.dc.b	255				
	.dc.b	186				
	.dc.b	85				
						
	.dc.b	239				
						
	.dc.b	255				
	.dc.b	246				
	.dc.b	170				
						
	.dc.b	143				
						
	.dc.b	128				
	.dc.b	25				
	.dc.b	129				
						
	.dc.b	112				
						
	.dc.b	128				
	.dc.b	55				
	.dc.b	175				
						
	.dc.b	80				
						
	.dc.b	128				
	.dc.b	85				
	.dc.b	222				
						
	.dc.b	240				
						
	.dc.b	128				
	.dc.b	116				
	.dc.b	16				
						
	.dc.b	112				
						
	.dc.b	128				
	.dc.b	146				
	.dc.b	67				
						
	.dc.b	144				
						
	.dc.b	128				
	.dc.b	176				
	.dc.b	120				
						
	.dc.b	144				
						
	.dc.b	128				
	.dc.b	206				
	.dc.b	175				
						
	.dc.b	80				
						
	.dc.b	128				
	.dc.b	236				
	.dc.b	231				
						
	.dc.b	240				
						
	.dc.b	129				
	.dc.b	11				
	.dc.b	34				
						
	.dc.b	48				
						
	.dc.b	129				
	.dc.b	41				
	.dc.b	94				
						
	.dc.b	48				
						
	.dc.b	129				
	.dc.b	71				
	.dc.b	156				
						
	.dc.b	16				
						
	.dc.b	129				
	.dc.b	101				
	.dc.b	219				
						
	.dc.b	176				
						
	.dc.b	129				
	.dc.b	132				
	.dc.b	29				
						
	.dc.b	16				
						
	.dc.b	129				
	.dc.b	162				
	.dc.b	96				
						
	.dc.b	48				
						
	.dc.b	129				
	.dc.b	192				
	.dc.b	165				
						
	.dc.b	48				
						
	.dc.b	129				
	.dc.b	222				
	.dc.b	235				
						
	.dc.b	208				
						
	.dc.b	129				
	.dc.b	253				
	.dc.b	52				
						
	.dc.b	48				
						
	.dc.b	130				
	.dc.b	27				
	.dc.b	126				
						
	.dc.b	112				
						
	.dc.b	130				
	.dc.b	57				
	.dc.b	202				
						
	.dc.b	112				
						
	.dc.b	130				
	.dc.b	88				
	.dc.b	24				
						
	.dc.b	48				
						
	.dc.b	130				
	.dc.b	118				
	.dc.b	103				
						
	.dc.b	176				
						
	.dc.b	130				
	.dc.b	148				
	.dc.b	184				
						
	.dc.b	240				
						
	.dc.b	130				
	.dc.b	179				
	.dc.b	11				
						
	.dc.b	240				
						
	.dc.b	130				
	.dc.b	209				
	.dc.b	96				
						
	.dc.b	176				
						
	.dc.b	130				
	.dc.b	239				
	.dc.b	183				
						
	.dc.b	48				
						
	.dc.b	131				
	.dc.b	14				
	.dc.b	15				
						
	.dc.b	144				
						
	.dc.b	131				
	.dc.b	44				
	.dc.b	105				
						
	.dc.b	144				
						
	.dc.b	131				
	.dc.b	74				
	.dc.b	197				
						
	.dc.b	80				
						
	.dc.b	131				
	.dc.b	105				
	.dc.b	34				
						
	.dc.b	240				
						
	.dc.b	131				
	.dc.b	135				
	.dc.b	130				
						
	.dc.b	48				
						
	.dc.b	131				
	.dc.b	165				
	.dc.b	227				
						
	.dc.b	80				
						
	.dc.b	131				
	.dc.b	196				
	.dc.b	70				
						
	.dc.b	16				
						
	.dc.b	131				
	.dc.b	226				
	.dc.b	170				
						
	.dc.b	176				
						
	.dc.b	132				
	.dc.b	1				
	.dc.b	17				
						
	.dc.b	16				
						
	.dc.b	132				
	.dc.b	31				
	.dc.b	121				
						
	.dc.b	16				
						
	.dc.b	132				
	.dc.b	61				
	.dc.b	226				
						
	.dc.b	240				
						
	.dc.b	132				
	.dc.b	92				
	.dc.b	78				
						
	.dc.b	112				
						
	.dc.b	132				
	.dc.b	122				
	.dc.b	187				
						
	.dc.b	208				
						
	.dc.b	132				
	.dc.b	153				
	.dc.b	42				
						
	.dc.b	208				
						
	.dc.b	132				
	.dc.b	183				
	.dc.b	155				
						
	.dc.b	176				
						
	.dc.b	132				
	.dc.b	214				
	.dc.b	14				
						
	.dc.b	48				
						
	.dc.b	132				
	.dc.b	244				
	.dc.b	130				
						
	.dc.b	144				
						
	.dc.b	133				
	.dc.b	18				
	.dc.b	248				
						
	.dc.b	144				
						
	.dc.b	133				
	.dc.b	49				
	.dc.b	112				
						
	.dc.b	112				
						
	.dc.b	133				
	.dc.b	79				
	.dc.b	233				
						
	.dc.b	240				
						
	.dc.b	133				
	.dc.b	110				
	.dc.b	101				
						
	.dc.b	48				
						
	.dc.b	133				
	.dc.b	140				
	.dc.b	226				
						
	.dc.b	48				
						
	.dc.b	133				
	.dc.b	171				
	.dc.b	96				
						
	.dc.b	240				
						
	.dc.b	133				
	.dc.b	201				
	.dc.b	225				
						
	.dc.b	112				
						
	.dc.b	133				
	.dc.b	232				
	.dc.b	99				
						
	.dc.b	176				
						
	.dc.b	134				
	.dc.b	6				
	.dc.b	231				
						
	.dc.b	176				
						
	.dc.b	134				
	.dc.b	37				
	.dc.b	109				
						
	.dc.b	112				
						
	.dc.b	134				
	.dc.b	67				
	.dc.b	244				
						
	.dc.b	208				
						
	.dc.b	134				
	.dc.b	98				
	.dc.b	126				
						
	.dc.b	16				
						
	.dc.b	134				
	.dc.b	129				
	.dc.b	8				
						
	.dc.b	240				
						
	.dc.b	134				
	.dc.b	159				
	.dc.b	149				
						
	.dc.b	176				
						
	.dc.b	134				
	.dc.b	190				
	.dc.b	36				
						
	.dc.b	16				
						
	.dc.b	134				
	.dc.b	220				
	.dc.b	180				
						
	.dc.b	48				
						
	.dc.b	134				
	.dc.b	251				
	.dc.b	69				
						
	.dc.b	240				
						
	.dc.b	135				
	.dc.b	25				
	.dc.b	217				
						
	.dc.b	144				
						
	.dc.b	135				
	.dc.b	56				
	.dc.b	110				
						
	.dc.b	240				
						
	.dc.b	135				
	.dc.b	87				
	.dc.b	5				
						
	.dc.b	240				
						
	.dc.b	135				
	.dc.b	117				
	.dc.b	158				
						
	.dc.b	176				
						
	.dc.b	135				
	.dc.b	148				
	.dc.b	57				
						
	.dc.b	48				
						
	.dc.b	135				
	.dc.b	178				
	.dc.b	213				
						
	.dc.b	112				
						
	.dc.b	135				
	.dc.b	209				
	.dc.b	115				
						
	.dc.b	112				
						
	.dc.b	135				
	.dc.b	240				
	.dc.b	19				
						
	.dc.b	16				
						
	.dc.b	136				
	.dc.b	14				
	.dc.b	180				
						
	.dc.b	112				
						
	.dc.b	136				
	.dc.b	45				
	.dc.b	87				
						
	.dc.b	144				
						
	.dc.b	136				
	.dc.b	75				
	.dc.b	252				
						
	.dc.b	112				
						
	.dc.b	136				
	.dc.b	106				
	.dc.b	163				
						
	.dc.b	16				
						
	.dc.b	136				
	.dc.b	137				
	.dc.b	75				
						
	.dc.b	80				
						
	.dc.b	136				
	.dc.b	167				
	.dc.b	245				
						
	.dc.b	112				
						
	.dc.b	136				
	.dc.b	198				
	.dc.b	161				
						
	.dc.b	16				
						
	.dc.b	136				
	.dc.b	229				
	.dc.b	78				
						
	.dc.b	144				
						
	.dc.b	137				
	.dc.b	3				
	.dc.b	253				
						
	.dc.b	208				
						
	.dc.b	137				
	.dc.b	34				
	.dc.b	174				
						
	.dc.b	176				
						
	.dc.b	137				
	.dc.b	65				
	.dc.b	97				
						
	.dc.b	80				
						
	.dc.b	137				
	.dc.b	96				
	.dc.b	21				
						
	.dc.b	144				
						
	.dc.b	137				
	.dc.b	126				
	.dc.b	203				
						
	.dc.b	176				
						
	.dc.b	137				
	.dc.b	157				
	.dc.b	131				
						
	.dc.b	112				
						
	.dc.b	137				
	.dc.b	188				
	.dc.b	60				
						
	.dc.b	240				
						
	.dc.b	137				
	.dc.b	218				
	.dc.b	248				
						
	.dc.b	16				
						
	.dc.b	137				
	.dc.b	249				
	.dc.b	181				
						
	.dc.b	16				
						
	.dc.b	138				
	.dc.b	24				
	.dc.b	115				
						
	.dc.b	144				
						
	.dc.b	138				
	.dc.b	55				
	.dc.b	51				
						
	.dc.b	240				
						
	.dc.b	138				
	.dc.b	85				
	.dc.b	245				
						
	.dc.b	240				
						
	.dc.b	138				
	.dc.b	116				
	.dc.b	185				
						
	.dc.b	176				
						
	.dc.b	138				
	.dc.b	147				
	.dc.b	127				
						
	.dc.b	48				
						
	.dc.b	138				
	.dc.b	178				
	.dc.b	70				
						
	.dc.b	80				
						
	.dc.b	138				
	.dc.b	209				
	.dc.b	15				
						
	.dc.b	48				
						
	.dc.b	138				
	.dc.b	239				
	.dc.b	217				
						
	.dc.b	208				
						
	.dc.b	139				
	.dc.b	14				
	.dc.b	166				
						
	.dc.b	16				
						
	.dc.b	139				
	.dc.b	45				
	.dc.b	116				
						
	.dc.b	16				
						
	.dc.b	139				
	.dc.b	76				
	.dc.b	67				
						
	.dc.b	208				
						
	.dc.b	139				
	.dc.b	107				
	.dc.b	21				
						
	.dc.b	48				
						
	.dc.b	139				
	.dc.b	137				
	.dc.b	232				
						
	.dc.b	80				
						
	.dc.b	139				
	.dc.b	168				
	.dc.b	189				
						
	.dc.b	48				
						
	.dc.b	139				
	.dc.b	199				
	.dc.b	147				
						
	.dc.b	176				
						
	.dc.b	139				
	.dc.b	230				
	.dc.b	107				
						
	.dc.b	208				
						
	.dc.b	140				
	.dc.b	5				
	.dc.b	69				
						
	.dc.b	208				
						
	.dc.b	140				
	.dc.b	36				
	.dc.b	33				
						
	.dc.b	112				
						
	.dc.b	140				
	.dc.b	66				
	.dc.b	254				
						
	.dc.b	176				
						
	.dc.b	140				
	.dc.b	97				
	.dc.b	221				
						
	.dc.b	176				
						
	.dc.b	140				
	.dc.b	128				
	.dc.b	190				
						
	.dc.b	112				
						
	.dc.b	140				
	.dc.b	159				
	.dc.b	160				
						
	.dc.b	208				
						
	.dc.b	140				
	.dc.b	190				
	.dc.b	132				
						
	.dc.b	240				
						
	.dc.b	140				
	.dc.b	221				
	.dc.b	106				
						
	.dc.b	176				
						
	.dc.b	140				
	.dc.b	252				
	.dc.b	82				
						
	.dc.b	48				
						
	.dc.b	141				
	.dc.b	27				
	.dc.b	59				
						
	.dc.b	112				
						
	.dc.b	141				
	.dc.b	58				
	.dc.b	38				
						
	.dc.b	80				
						
	.dc.b	141				
	.dc.b	89				
	.dc.b	18				
						
	.dc.b	208				
						
	.dc.b	141				
	.dc.b	120				
	.dc.b	1				
						
	.dc.b	48				
						
	.dc.b	141				
	.dc.b	150				
	.dc.b	241				
						
	.dc.b	16				
						
	.dc.b	141				
	.dc.b	181				
	.dc.b	226				
						
	.dc.b	176				
						
	.dc.b	141				
	.dc.b	212				
	.dc.b	214				
						
	.dc.b	16				
						
	.dc.b	141				
	.dc.b	243				
	.dc.b	203				
						
	.dc.b	16				
						
	.dc.b	142				
	.dc.b	18				
	.dc.b	193				
						
	.dc.b	208				
						
	.dc.b	142				
	.dc.b	49				
	.dc.b	186				
						
	.dc.b	48				
						
	.dc.b	142				
	.dc.b	80				
	.dc.b	180				
						
	.dc.b	80				
						
	.dc.b	142				
	.dc.b	111				
	.dc.b	176				
						
	.dc.b	16				
						
	.dc.b	142				
	.dc.b	142				
	.dc.b	173				
						
	.dc.b	144				
						
	.dc.b	142				
	.dc.b	173				
	.dc.b	172				
						
	.dc.b	176				
						
	.dc.b	142				
	.dc.b	204				
	.dc.b	173				
						
	.dc.b	112				
						
	.dc.b	142				
	.dc.b	235				
	.dc.b	175				
						
	.dc.b	240				
						
	.dc.b	143				
	.dc.b	10				
	.dc.b	180				
						
	.dc.b	48				
						
	.dc.b	143				
	.dc.b	41				
	.dc.b	186				
						
	.dc.b	16				
						
	.dc.b	143				
	.dc.b	72				
	.dc.b	193				
						
	.dc.b	144				
						
	.dc.b	143				
	.dc.b	103				
	.dc.b	202				
						
	.dc.b	208				
						
	.dc.b	143				
	.dc.b	134				
	.dc.b	213				
						
	.dc.b	208				
						
	.dc.b	143				
	.dc.b	165				
	.dc.b	226				
						
	.dc.b	80				
						
	.dc.b	143				
	.dc.b	196				
	.dc.b	240				
						
	.dc.b	144				
						
	.dc.b	143				
	.dc.b	228				
	.dc.b	0				
						
	.dc.b	144				
						
	.dc.b	144				
	.dc.b	3				
	.dc.b	18				
						
	.dc.b	48				
						
	.dc.b	144				
	.dc.b	34				
	.dc.b	37				
						
	.dc.b	112				
						
	.dc.b	144				
	.dc.b	65				
	.dc.b	58				
						
	.dc.b	112				
						
	.dc.b	144				
	.dc.b	96				
	.dc.b	81				
						
	.dc.b	16				
						
	.dc.b	144				
	.dc.b	127				
	.dc.b	105				
						
	.dc.b	112				
						
	.dc.b	144				
	.dc.b	158				
	.dc.b	131				
						
	.dc.b	112				
						
	.dc.b	144				
	.dc.b	189				
	.dc.b	159				
						
	.dc.b	16				
						
	.dc.b	144				
	.dc.b	220				
	.dc.b	188				
						
	.dc.b	112				
						
	.dc.b	144				
	.dc.b	251				
	.dc.b	219				
						
	.dc.b	112				
						
	.dc.b	145				
	.dc.b	26				
	.dc.b	252				
						
	.dc.b	48				
						
	.dc.b	145				
	.dc.b	58				
	.dc.b	30				
						
	.dc.b	144				
						
	.dc.b	145				
	.dc.b	89				
	.dc.b	66				
						
	.dc.b	144				
						
	.dc.b	145				
	.dc.b	120				
	.dc.b	104				
						
	.dc.b	48				
						
	.dc.b	145				
	.dc.b	151				
	.dc.b	143				
						
	.dc.b	144				
						
	.dc.b	145				
	.dc.b	182				
	.dc.b	184				
						
	.dc.b	144				
						
	.dc.b	145				
	.dc.b	213				
	.dc.b	227				
						
	.dc.b	80				
						
	.dc.b	145				
	.dc.b	245				
	.dc.b	15				
						
	.dc.b	176				
						
	.dc.b	146				
	.dc.b	20				
	.dc.b	61				
						
	.dc.b	176				
						
	.dc.b	146				
	.dc.b	51				
	.dc.b	109				
						
	.dc.b	80				
						
	.dc.b	146				
	.dc.b	82				
	.dc.b	158				
						
	.dc.b	176				
						
	.dc.b	146				
	.dc.b	113				
	.dc.b	209				
						
	.dc.b	176				
						
	.dc.b	146				
	.dc.b	145				
	.dc.b	6				
						
	.dc.b	112				
						
	.dc.b	146				
	.dc.b	176				
	.dc.b	60				
						
	.dc.b	176				
						
	.dc.b	146				
	.dc.b	207				
	.dc.b	116				
						
	.dc.b	176				
						
	.dc.b	146				
	.dc.b	238				
	.dc.b	174				
						
	.dc.b	112				
						
	.dc.b	147				
	.dc.b	13				
	.dc.b	233				
						
	.dc.b	176				
						
	.dc.b	147				
	.dc.b	45				
	.dc.b	38				
						
	.dc.b	176				
						
	.dc.b	147				
	.dc.b	76				
	.dc.b	101				
						
	.dc.b	80				
						
	.dc.b	147				
	.dc.b	107				
	.dc.b	165				
						
	.dc.b	144				
						
	.dc.b	147				
	.dc.b	138				
	.dc.b	231				
						
	.dc.b	144				
						
	.dc.b	147				
	.dc.b	170				
	.dc.b	43				
						
	.dc.b	48				
						
	.dc.b	147				
	.dc.b	201				
	.dc.b	112				
						
	.dc.b	112				
						
	.dc.b	147				
	.dc.b	232				
	.dc.b	183				
						
	.dc.b	80				
						
	.dc.b	148				
	.dc.b	7				
	.dc.b	255				
						
	.dc.b	208				
						
	.dc.b	148				
	.dc.b	39				
	.dc.b	74				
						
	.dc.b	16				
						
	.dc.b	148				
	.dc.b	70				
	.dc.b	149				
						
	.dc.b	240				
						
	.dc.b	148				
	.dc.b	101				
	.dc.b	227				
						
	.dc.b	112				
						
	.dc.b	148				
	.dc.b	133				
	.dc.b	50				
						
	.dc.b	176				
						
	.dc.b	148				
	.dc.b	164				
	.dc.b	131				
						
	.dc.b	112				
						
	.dc.b	148				
	.dc.b	195				
	.dc.b	213				
						
	.dc.b	240				
						
	.dc.b	148				
	.dc.b	227				
	.dc.b	42				
						
	.dc.b	16				
						
	.dc.b	149				
	.dc.b	2				
	.dc.b	127				
						
	.dc.b	208				
						
	.dc.b	149				
	.dc.b	33				
	.dc.b	215				
						
	.dc.b	80				
						
	.dc.b	149				
	.dc.b	65				
	.dc.b	48				
						
	.dc.b	80				
						
	.dc.b	149				
	.dc.b	96				
	.dc.b	139				
						
	.dc.b	16				
						
	.dc.b	149				
	.dc.b	127				
	.dc.b	231				
						
	.dc.b	112				
						
	.dc.b	149				
	.dc.b	159				
	.dc.b	69				
						
	.dc.b	112				
						
	.dc.b	149				
	.dc.b	190				
	.dc.b	165				
						
	.dc.b	16				
						
	.dc.b	149				
	.dc.b	222				
	.dc.b	6				
						
	.dc.b	80				
						
	.dc.b	149				
	.dc.b	253				
	.dc.b	105				
						
	.dc.b	80				
						
	.dc.b	150				
	.dc.b	28				
	.dc.b	205				
						
	.dc.b	208				
						
	.dc.b	150				
	.dc.b	60				
	.dc.b	52				
						
	.dc.b	16				
						
	.dc.b	150				
	.dc.b	91				
	.dc.b	155				
						
	.dc.b	240				
						
	.dc.b	150				
	.dc.b	123				
	.dc.b	5				
						
	.dc.b	112				
						
	.dc.b	150				
	.dc.b	154				
	.dc.b	112				
						
	.dc.b	144				
						
	.dc.b	150				
	.dc.b	185				
	.dc.b	221				
						
	.dc.b	80				
						
	.dc.b	150				
	.dc.b	217				
	.dc.b	75				
						
	.dc.b	208				
						
	.dc.b	150				
	.dc.b	248				
	.dc.b	187				
						
	.dc.b	208				
						
	.dc.b	151				
	.dc.b	24				
	.dc.b	45				
						
	.dc.b	144				
						
	.dc.b	151				
	.dc.b	55				
	.dc.b	160				
						
	.dc.b	208				
						
	.dc.b	151				
	.dc.b	87				
	.dc.b	21				
						
	.dc.b	208				
						
	.dc.b	151				
	.dc.b	118				
	.dc.b	140				
						
	.dc.b	112				
						
	.dc.b	151				
	.dc.b	150				
	.dc.b	4				
						
	.dc.b	144				
						
	.dc.b	151				
	.dc.b	181				
	.dc.b	126				
						
	.dc.b	112				
						
	.dc.b	151				
	.dc.b	212				
	.dc.b	249				
						
	.dc.b	240				
						
	.dc.b	151				
	.dc.b	244				
	.dc.b	119				
						
	.dc.b	16				
						
	.dc.b	152				
	.dc.b	19				
	.dc.b	245				
						
	.dc.b	240				
						
	.dc.b	152				
	.dc.b	51				
	.dc.b	118				
						
	.dc.b	80				
						
	.dc.b	152				
	.dc.b	82				
	.dc.b	248				
						
	.dc.b	80				
						
	.dc.b	152				
	.dc.b	114				
	.dc.b	123				
						
	.dc.b	240				
						
	.dc.b	152				
	.dc.b	146				
	.dc.b	1				
						
	.dc.b	48				
						
	.dc.b	152				
	.dc.b	177				
	.dc.b	136				
						
	.dc.b	48				
						
	.dc.b	152				
	.dc.b	209				
	.dc.b	16				
						
	.dc.b	176				
						
	.dc.b	152				
	.dc.b	240				
	.dc.b	154				
						
	.dc.b	208				
						
	.dc.b	153				
	.dc.b	16				
	.dc.b	38				
						
	.dc.b	176				
						
	.dc.b	153				
	.dc.b	47				
	.dc.b	180				
						
	.dc.b	16				
						
	.dc.b	153				
	.dc.b	79				
	.dc.b	67				
						
	.dc.b	16				
						
	.dc.b	153				
	.dc.b	110				
	.dc.b	211				
						
	.dc.b	208				
						
	.dc.b	153				
	.dc.b	142				
	.dc.b	102				
						
	.dc.b	16				
						
	.dc.b	153				
	.dc.b	173				
	.dc.b	249				
						
	.dc.b	240				
						
	.dc.b	153				
	.dc.b	205				
	.dc.b	143				
						
	.dc.b	112				
						
	.dc.b	153				
	.dc.b	237				
	.dc.b	38				
						
	.dc.b	176				
						
	.dc.b	154				
	.dc.b	12				
	.dc.b	191				
						
	.dc.b	112				
						
	.dc.b	154				
	.dc.b	44				
	.dc.b	89				
						
	.dc.b	208				
						
	.dc.b	154				
	.dc.b	75				
	.dc.b	245				
						
	.dc.b	208				
						
	.dc.b	154				
	.dc.b	107				
	.dc.b	147				
						
	.dc.b	112				
						
	.dc.b	154				
	.dc.b	139				
	.dc.b	50				
						
	.dc.b	176				
						
	.dc.b	154				
	.dc.b	170				
	.dc.b	211				
						
	.dc.b	144				
						
	.dc.b	154				
	.dc.b	202				
	.dc.b	118				
						
	.dc.b	16				
						
	.dc.b	154				
	.dc.b	234				
	.dc.b	26				
						
	.dc.b	48				
						
	.dc.b	155				
	.dc.b	9				
	.dc.b	191				
						
	.dc.b	240				
						
	.dc.b	155				
	.dc.b	41				
	.dc.b	103				
						
	.dc.b	80				
						
	.dc.b	155				
	.dc.b	73				
	.dc.b	16				
						
	.dc.b	48				
						
	.dc.b	155				
	.dc.b	104				
	.dc.b	186				
						
	.dc.b	208				
						
	.dc.b	155				
	.dc.b	136				
	.dc.b	102				
						
	.dc.b	240				
						
	.dc.b	155				
	.dc.b	168				
	.dc.b	20				
						
	.dc.b	208				
						
	.dc.b	155				
	.dc.b	199				
	.dc.b	196				
						
	.dc.b	48				
						
	.dc.b	155				
	.dc.b	231				
	.dc.b	117				
						
	.dc.b	48				
						
	.dc.b	156				
	.dc.b	7				
	.dc.b	39				
						
	.dc.b	208				
						
	.dc.b	156				
	.dc.b	38				
	.dc.b	220				
						
	.dc.b	16				
						
	.dc.b	156				
	.dc.b	70				
	.dc.b	145				
						
	.dc.b	240				
						
	.dc.b	156				
	.dc.b	102				
	.dc.b	73				
						
	.dc.b	112				
						
	.dc.b	156				
	.dc.b	134				
	.dc.b	2				
						
	.dc.b	112				
						
	.dc.b	156				
	.dc.b	165				
	.dc.b	189				
						
	.dc.b	48				
						
	.dc.b	156				
	.dc.b	197				
	.dc.b	121				
						
	.dc.b	112				
						
	.dc.b	156				
	.dc.b	229				
	.dc.b	55				
						
	.dc.b	80				
						
	.dc.b	157				
	.dc.b	4				
	.dc.b	246				
						
	.dc.b	208				
						
	.dc.b	157				
	.dc.b	36				
	.dc.b	183				
						
	.dc.b	240				
						
	.dc.b	157				
	.dc.b	68				
	.dc.b	122				
						
	.dc.b	144				
						
	.dc.b	157				
	.dc.b	100				
	.dc.b	62				
						
	.dc.b	240				
						
	.dc.b	157				
	.dc.b	132				
	.dc.b	4				
						
	.dc.b	208				
						
	.dc.b	157				
	.dc.b	163				
	.dc.b	204				
						
	.dc.b	80				
						
	.dc.b	157				
	.dc.b	195				
	.dc.b	149				
						
	.dc.b	112				
						
	.dc.b	157				
	.dc.b	227				
	.dc.b	96				
						
	.dc.b	48				
						
	.dc.b	158				
	.dc.b	3				
	.dc.b	44				
						
	.dc.b	112				
						
	.dc.b	158				
	.dc.b	34				
	.dc.b	250				
						
	.dc.b	112				
						
	.dc.b	158				
	.dc.b	66				
	.dc.b	201				
						
	.dc.b	240				
						
	.dc.b	158				
	.dc.b	98				
	.dc.b	155				
						
	.dc.b	16				
						
	.dc.b	158				
	.dc.b	130				
	.dc.b	109				
						
	.dc.b	176				
						
	.dc.b	158				
	.dc.b	162				
	.dc.b	66				
						
	.dc.b	16				
						
	.dc.b	158				
	.dc.b	194				
	.dc.b	23				
						
	.dc.b	240				
						
	.dc.b	158				
	.dc.b	225				
	.dc.b	239				
						
	.dc.b	112				
						
	.dc.b	159				
	.dc.b	1				
	.dc.b	200				
						
	.dc.b	144				
						
	.dc.b	159				
	.dc.b	33				
	.dc.b	163				
						
	.dc.b	48				
						
	.dc.b	159				
	.dc.b	65				
	.dc.b	127				
						
	.dc.b	144				
						
	.dc.b	159				
	.dc.b	97				
	.dc.b	93				
						
	.dc.b	112				
						
	.dc.b	159				
	.dc.b	129				
	.dc.b	60				
						
	.dc.b	240				
						
	.dc.b	159				
	.dc.b	161				
	.dc.b	29				
						
	.dc.b	240				
						
	.dc.b	159				
	.dc.b	193				
	.dc.b	0				
						
	.dc.b	176				
						
	.dc.b	159				
	.dc.b	224				
	.dc.b	228				
						
	.dc.b	240				
						
	.dc.b	160				
	.dc.b	0				
	.dc.b	202				
						
	.dc.b	176				
						
	.dc.b	160				
	.dc.b	32				
	.dc.b	178				
						
	.dc.b	48				
						
	.dc.b	160				
	.dc.b	64				
	.dc.b	155				
						
	.dc.b	48				
						
	.dc.b	160				
	.dc.b	96				
	.dc.b	133				
						
	.dc.b	208				
						
	.dc.b	160				
	.dc.b	128				
	.dc.b	113				
						
	.dc.b	240				
						
	.dc.b	160				
	.dc.b	160				
	.dc.b	95				
						
	.dc.b	208				
						
	.dc.b	160				
	.dc.b	192				
	.dc.b	79				
						
	.dc.b	48				
						
	.dc.b	160				
	.dc.b	224				
	.dc.b	64				
						
	.dc.b	16				
						
	.dc.b	161				
	.dc.b	0				
	.dc.b	50				
						
	.dc.b	176				
						
	.dc.b	161				
	.dc.b	32				
	.dc.b	38				
						
	.dc.b	208				
						
	.dc.b	161				
	.dc.b	64				
	.dc.b	28				
						
	.dc.b	112				
						
	.dc.b	161				
	.dc.b	96				
	.dc.b	19				
						
	.dc.b	208				
						
	.dc.b	161				
	.dc.b	128				
	.dc.b	12				
						
	.dc.b	176				
						
	.dc.b	161				
	.dc.b	160				
	.dc.b	7				
						
	.dc.b	48				
						
	.dc.b	161				
	.dc.b	192				
	.dc.b	3				
						
	.dc.b	48				
						
	.dc.b	161				
	.dc.b	224				
	.dc.b	0				
						
	.dc.b	208				
						
	.dc.b	162				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	16				
						
	.dc.b	162				
	.dc.b	32				
	.dc.b	0				
						
	.dc.b	208				
						
	.dc.b	162				
	.dc.b	64				
	.dc.b	3				
						
	.dc.b	48				
						
	.dc.b	162				
	.dc.b	96				
	.dc.b	7				
						
	.dc.b	48				
						
	.dc.b	162				
	.dc.b	128				
	.dc.b	12				
						
	.dc.b	176				
						
	.dc.b	162				
	.dc.b	160				
	.dc.b	19				
						
	.dc.b	208				
						
	.dc.b	162				
	.dc.b	192				
	.dc.b	28				
						
	.dc.b	112				
						
	.dc.b	162				
	.dc.b	224				
	.dc.b	38				
						
	.dc.b	176				
						
	.dc.b	163				
	.dc.b	0				
	.dc.b	50				
						
	.dc.b	144				
						
	.dc.b	163				
	.dc.b	32				
	.dc.b	63				
						
	.dc.b	240				
						
	.dc.b	163				
	.dc.b	64				
	.dc.b	78				
						
	.dc.b	240				
						
	.dc.b	163				
	.dc.b	96				
	.dc.b	95				
						
	.dc.b	144				
						
	.dc.b	163				
	.dc.b	128				
	.dc.b	113				
						
	.dc.b	176				
						
	.dc.b	163				
	.dc.b	160				
	.dc.b	133				
						
	.dc.b	80				
						
	.dc.b	163				
	.dc.b	192				
	.dc.b	154				
						
	.dc.b	144				
						
	.dc.b	163				
	.dc.b	224				
	.dc.b	177				
						
	.dc.b	112				
						
	.dc.b	164				
	.dc.b	0				
	.dc.b	201				
						
	.dc.b	240				
						
	.dc.b	164				
	.dc.b	32				
	.dc.b	227				
						
	.dc.b	240				
						
	.dc.b	164				
	.dc.b	64				
	.dc.b	255				
						
	.dc.b	112				
						
	.dc.b	164				
	.dc.b	97				
	.dc.b	28				
						
	.dc.b	144				
						
	.dc.b	164				
	.dc.b	129				
	.dc.b	59				
						
	.dc.b	80				
						
	.dc.b	164				
	.dc.b	161				
	.dc.b	91				
						
	.dc.b	144				
						
	.dc.b	164				
	.dc.b	193				
	.dc.b	125				
						
	.dc.b	80				
						
	.dc.b	164				
	.dc.b	225				
	.dc.b	160				
						
	.dc.b	208				
						
	.dc.b	165				
	.dc.b	1				
	.dc.b	197				
						
	.dc.b	176				
						
	.dc.b	165				
	.dc.b	33				
	.dc.b	236				
						
	.dc.b	80				
						
	.dc.b	165				
	.dc.b	66				
	.dc.b	20				
						
	.dc.b	112				
						
	.dc.b	165				
	.dc.b	98				
	.dc.b	62				
						
	.dc.b	16				
						
	.dc.b	165				
	.dc.b	130				
	.dc.b	105				
						
	.dc.b	80				
						
	.dc.b	165				
	.dc.b	162				
	.dc.b	150				
						
	.dc.b	16				
						
	.dc.b	165				
	.dc.b	194				
	.dc.b	196				
						
	.dc.b	112				
						
	.dc.b	165				
	.dc.b	226				
	.dc.b	244				
						
	.dc.b	80				
						
	.dc.b	166				
	.dc.b	3				
	.dc.b	37				
						
	.dc.b	208				
						
	.dc.b	166				
	.dc.b	35				
	.dc.b	88				
						
	.dc.b	208				
						
	.dc.b	166				
	.dc.b	67				
	.dc.b	141				
						
	.dc.b	112				
						
	.dc.b	166				
	.dc.b	99				
	.dc.b	195				
						
	.dc.b	144				
						
	.dc.b	166				
	.dc.b	131				
	.dc.b	251				
						
	.dc.b	80				
						
	.dc.b	166				
	.dc.b	164				
	.dc.b	52				
						
	.dc.b	144				
						
	.dc.b	166				
	.dc.b	196				
	.dc.b	111				
						
	.dc.b	112				
						
	.dc.b	166				
	.dc.b	228				
	.dc.b	171				
						
	.dc.b	208				
						
	.dc.b	167				
	.dc.b	4				
	.dc.b	233				
						
	.dc.b	208				
						
	.dc.b	167				
	.dc.b	37				
	.dc.b	41				
						
	.dc.b	80				
						
	.dc.b	167				
	.dc.b	69				
	.dc.b	106				
						
	.dc.b	80				
						
	.dc.b	167				
	.dc.b	101				
	.dc.b	172				
						
	.dc.b	240				
						
	.dc.b	167				
	.dc.b	133				
	.dc.b	241				
						
	.dc.b	48				
						
	.dc.b	167				
	.dc.b	166				
	.dc.b	54				
						
	.dc.b	208				
						
	.dc.b	167				
	.dc.b	198				
	.dc.b	126				
						
	.dc.b	48				
						
	.dc.b	167				
	.dc.b	230				
	.dc.b	198				
						
	.dc.b	240				
						
	.dc.b	168				
	.dc.b	7				
	.dc.b	17				
						
	.dc.b	80				
						
	.dc.b	168				
	.dc.b	39				
	.dc.b	93				
						
	.dc.b	80				
						
	.dc.b	168				
	.dc.b	71				
	.dc.b	170				
						
	.dc.b	208				
						
	.dc.b	168				
	.dc.b	103				
	.dc.b	249				
						
	.dc.b	208				
						
	.dc.b	168				
	.dc.b	136				
	.dc.b	74				
						
	.dc.b	112				
						
	.dc.b	168				
	.dc.b	168				
	.dc.b	156				
						
	.dc.b	144				
						
	.dc.b	168				
	.dc.b	200				
	.dc.b	240				
						
	.dc.b	48				
						
	.dc.b	168				
	.dc.b	233				
	.dc.b	69				
						
	.dc.b	112				
						
	.dc.b	169				
	.dc.b	9				
	.dc.b	156				
						
	.dc.b	80				
						
	.dc.b	169				
	.dc.b	41				
	.dc.b	244				
						
	.dc.b	144				
						
	.dc.b	169				
	.dc.b	74				
	.dc.b	78				
						
	.dc.b	112				
						
	.dc.b	169				
	.dc.b	106				
	.dc.b	169				
						
	.dc.b	208				
						
	.dc.b	169				
	.dc.b	139				
	.dc.b	6				
						
	.dc.b	208				
						
	.dc.b	169				
	.dc.b	171				
	.dc.b	101				
						
	.dc.b	80				
						
	.dc.b	169				
	.dc.b	203				
	.dc.b	197				
						
	.dc.b	112				
						
	.dc.b	169				
	.dc.b	236				
	.dc.b	39				
						
	.dc.b	16				
						
	.dc.b	170				
	.dc.b	12				
	.dc.b	138				
						
	.dc.b	48				
						
	.dc.b	170				
	.dc.b	44				
	.dc.b	238				
						
	.dc.b	208				
						
	.dc.b	170				
	.dc.b	77				
	.dc.b	85				
						
	.dc.b	16				
						
	.dc.b	170				
	.dc.b	109				
	.dc.b	188				
						
	.dc.b	208				
						
	.dc.b	170				
	.dc.b	142				
	.dc.b	38				
						
	.dc.b	48				
						
	.dc.b	170				
	.dc.b	174				
	.dc.b	144				
						
	.dc.b	240				
						
	.dc.b	170				
	.dc.b	206				
	.dc.b	253				
						
	.dc.b	80				
						
	.dc.b	170				
	.dc.b	239				
	.dc.b	107				
						
	.dc.b	80				
						
	.dc.b	171				
	.dc.b	15				
	.dc.b	218				
						
	.dc.b	176				
						
	.dc.b	171				
	.dc.b	48				
	.dc.b	75				
						
	.dc.b	208				
						
	.dc.b	171				
	.dc.b	80				
	.dc.b	190				
						
	.dc.b	80				
						
	.dc.b	171				
	.dc.b	113				
	.dc.b	50				
						
	.dc.b	80				
						
	.dc.b	171				
	.dc.b	145				
	.dc.b	167				
						
	.dc.b	240				
						
	.dc.b	171				
	.dc.b	178				
	.dc.b	31				
						
	.dc.b	48				
						
	.dc.b	171				
	.dc.b	210				
	.dc.b	151				
						
	.dc.b	208				
						
	.dc.b	171				
	.dc.b	243				
	.dc.b	18				
						
	.dc.b	16				
						
	.dc.b	172				
	.dc.b	19				
	.dc.b	141				
						
	.dc.b	208				
						
	.dc.b	172				
	.dc.b	52				
	.dc.b	11				
						
	.dc.b	16				
						
	.dc.b	172				
	.dc.b	84				
	.dc.b	137				
						
	.dc.b	240				
						
	.dc.b	172				
	.dc.b	117				
	.dc.b	10				
						
	.dc.b	48				
						
	.dc.b	172				
	.dc.b	149				
	.dc.b	140				
						
	.dc.b	16				
						
	.dc.b	172				
	.dc.b	182				
	.dc.b	15				
						
	.dc.b	144				
						
	.dc.b	172				
	.dc.b	214				
	.dc.b	148				
						
	.dc.b	112				
						
	.dc.b	172				
	.dc.b	247				
	.dc.b	26				
						
	.dc.b	240				
						
	.dc.b	173				
	.dc.b	23				
	.dc.b	162				
						
	.dc.b	240				
						
	.dc.b	173				
	.dc.b	56				
	.dc.b	44				
						
	.dc.b	112				
						
	.dc.b	173				
	.dc.b	88				
	.dc.b	183				
						
	.dc.b	144				
						
	.dc.b	173				
	.dc.b	121				
	.dc.b	68				
						
	.dc.b	16				
						
	.dc.b	173				
	.dc.b	153				
	.dc.b	210				
						
	.dc.b	48				
						
	.dc.b	173				
	.dc.b	186				
	.dc.b	97				
						
	.dc.b	208				
						
	.dc.b	173				
	.dc.b	218				
	.dc.b	243				
						
	.dc.b	16				
						
	.dc.b	173				
	.dc.b	251				
	.dc.b	133				
						
	.dc.b	176				
						
	.dc.b	174				
	.dc.b	28				
	.dc.b	25				
						
	.dc.b	240				
						
	.dc.b	174				
	.dc.b	60				
	.dc.b	175				
						
	.dc.b	176				
						
	.dc.b	174				
	.dc.b	93				
	.dc.b	70				
						
	.dc.b	240				
						
	.dc.b	174				
	.dc.b	125				
	.dc.b	223				
						
	.dc.b	176				
						
	.dc.b	174				
	.dc.b	158				
	.dc.b	122				
						
	.dc.b	16				
						
	.dc.b	174				
	.dc.b	191				
	.dc.b	21				
						
	.dc.b	208				
						
	.dc.b	174				
	.dc.b	223				
	.dc.b	179				
						
	.dc.b	48				
						
	.dc.b	175				
	.dc.b	0				
	.dc.b	82				
						
	.dc.b	16				
						
	.dc.b	175				
	.dc.b	32				
	.dc.b	242				
						
	.dc.b	112				
						
	.dc.b	175				
	.dc.b	65				
	.dc.b	148				
						
	.dc.b	112				
						
	.dc.b	175				
	.dc.b	98				
	.dc.b	55				
						
	.dc.b	208				
						
	.dc.b	175				
	.dc.b	130				
	.dc.b	220				
						
	.dc.b	208				
						
	.dc.b	175				
	.dc.b	163				
	.dc.b	131				
						
	.dc.b	80				
						
	.dc.b	175				
	.dc.b	196				
	.dc.b	43				
						
	.dc.b	48				
						
	.dc.b	175				
	.dc.b	228				
	.dc.b	212				
						
	.dc.b	208				
						
	.dc.b	176				
	.dc.b	5				
	.dc.b	127				
						
	.dc.b	208				
						
	.dc.b	176				
	.dc.b	38				
	.dc.b	44				
						
	.dc.b	80				
						
	.dc.b	176				
	.dc.b	70				
	.dc.b	218				
						
	.dc.b	80				
						
	.dc.b	176				
	.dc.b	103				
	.dc.b	137				
						
	.dc.b	240				
						
	.dc.b	176				
	.dc.b	136				
	.dc.b	59				
						
	.dc.b	16				
						
	.dc.b	176				
	.dc.b	168				
	.dc.b	237				
						
	.dc.b	144				
						
	.dc.b	176				
	.dc.b	201				
	.dc.b	161				
						
	.dc.b	176				
						
	.dc.b	176				
	.dc.b	234				
	.dc.b	87				
						
	.dc.b	80				
						
	.dc.b	177				
	.dc.b	11				
	.dc.b	14				
						
	.dc.b	112				
						
	.dc.b	177				
	.dc.b	43				
	.dc.b	199				
						
	.dc.b	48				
						
	.dc.b	177				
	.dc.b	76				
	.dc.b	129				
						
	.dc.b	80				
						
	.dc.b	177				
	.dc.b	109				
	.dc.b	60				
						
	.dc.b	240				
						
	.dc.b	177				
	.dc.b	141				
	.dc.b	250				
						
	.dc.b	48				
						
	.dc.b	177				
	.dc.b	174				
	.dc.b	184				
						
	.dc.b	208				
						
	.dc.b	177				
	.dc.b	207				
	.dc.b	121				
						
	.dc.b	16				
						
	.dc.b	177				
	.dc.b	240				
	.dc.b	58				
						
	.dc.b	176				
						
	.dc.b	178				
	.dc.b	16				
	.dc.b	253				
						
	.dc.b	240				
						
	.dc.b	178				
	.dc.b	49				
	.dc.b	194				
						
	.dc.b	176				
						
	.dc.b	178				
	.dc.b	82				
	.dc.b	136				
						
	.dc.b	240				
						
	.dc.b	178				
	.dc.b	115				
	.dc.b	80				
						
	.dc.b	144				
						
	.dc.b	178				
	.dc.b	148				
	.dc.b	25				
						
	.dc.b	208				
						
	.dc.b	178				
	.dc.b	180				
	.dc.b	228				
						
	.dc.b	144				
						
	.dc.b	178				
	.dc.b	213				
	.dc.b	176				
						
	.dc.b	208				
						
	.dc.b	178				
	.dc.b	246				
	.dc.b	126				
						
	.dc.b	144				
						
	.dc.b	179				
	.dc.b	23				
	.dc.b	77				
						
	.dc.b	208				
						
	.dc.b	179				
	.dc.b	56				
	.dc.b	30				
						
	.dc.b	144				
						
	.dc.b	179				
	.dc.b	88				
	.dc.b	240				
						
	.dc.b	208				
						
	.dc.b	179				
	.dc.b	121				
	.dc.b	196				
						
	.dc.b	176				
						
	.dc.b	179				
	.dc.b	154				
	.dc.b	153				
						
	.dc.b	240				
						
	.dc.b	179				
	.dc.b	187				
	.dc.b	112				
						
	.dc.b	176				
						
	.dc.b	179				
	.dc.b	220				
	.dc.b	72				
						
	.dc.b	240				
						
	.dc.b	179				
	.dc.b	253				
	.dc.b	34				
						
	.dc.b	176				
						
	.dc.b	180				
	.dc.b	29				
	.dc.b	253				
						
	.dc.b	240				
						
	.dc.b	180				
	.dc.b	62				
	.dc.b	218				
						
	.dc.b	176				
						
	.dc.b	180				
	.dc.b	95				
	.dc.b	184				
						
	.dc.b	240				
						
	.dc.b	180				
	.dc.b	128				
	.dc.b	152				
						
	.dc.b	176				
						
	.dc.b	180				
	.dc.b	161				
	.dc.b	121				
						
	.dc.b	240				
						
	.dc.b	180				
	.dc.b	194				
	.dc.b	92				
						
	.dc.b	176				
						
	.dc.b	180				
	.dc.b	227				
	.dc.b	64				
						
	.dc.b	240				
						
	.dc.b	181				
	.dc.b	4				
	.dc.b	38				
						
	.dc.b	176				
						
	.dc.b	181				
	.dc.b	37				
	.dc.b	13				
						
	.dc.b	240				
						
	.dc.b	181				
	.dc.b	69				
	.dc.b	246				
						
	.dc.b	176				
						
	.dc.b	181				
	.dc.b	102				
	.dc.b	224				
						
	.dc.b	240				
						
	.dc.b	181				
	.dc.b	135				
	.dc.b	204				
						
	.dc.b	176				
						
	.dc.b	181				
	.dc.b	168				
	.dc.b	185				
						
	.dc.b	208				
						
	.dc.b	181				
	.dc.b	201				
	.dc.b	168				
						
	.dc.b	144				
						
	.dc.b	181				
	.dc.b	234				
	.dc.b	152				
						
	.dc.b	208				
						
	.dc.b	182				
	.dc.b	11				
	.dc.b	138				
						
	.dc.b	112				
						
	.dc.b	182				
	.dc.b	44				
	.dc.b	125				
						
	.dc.b	176				
						
	.dc.b	182				
	.dc.b	77				
	.dc.b	114				
						
	.dc.b	80				
						
	.dc.b	182				
	.dc.b	110				
	.dc.b	104				
						
	.dc.b	112				
						
	.dc.b	182				
	.dc.b	143				
	.dc.b	96				
						
	.dc.b	16				
						
	.dc.b	182				
	.dc.b	176				
	.dc.b	89				
						
	.dc.b	48				
						
	.dc.b	182				
	.dc.b	209				
	.dc.b	83				
						
	.dc.b	208				
						
	.dc.b	182				
	.dc.b	242				
	.dc.b	79				
						
	.dc.b	240				
						
	.dc.b	183				
	.dc.b	19				
	.dc.b	77				
						
	.dc.b	144				
						
	.dc.b	183				
	.dc.b	52				
	.dc.b	76				
						
	.dc.b	176				
						
	.dc.b	183				
	.dc.b	85				
	.dc.b	77				
						
	.dc.b	48				
						
	.dc.b	183				
	.dc.b	118				
	.dc.b	79				
						
	.dc.b	80				
						
	.dc.b	183				
	.dc.b	151				
	.dc.b	82				
						
	.dc.b	208				
						
	.dc.b	183				
	.dc.b	184				
	.dc.b	87				
						
	.dc.b	208				
						
	.dc.b	183				
	.dc.b	217				
	.dc.b	94				
						
	.dc.b	80				
						
	.dc.b	183				
	.dc.b	250				
	.dc.b	102				
						
	.dc.b	80				
						
	.dc.b	184				
	.dc.b	27				
	.dc.b	111				
						
	.dc.b	208				
						
	.dc.b	184				
	.dc.b	60				
	.dc.b	122				
						
	.dc.b	208				
						
	.dc.b	184				
	.dc.b	93				
	.dc.b	135				
						
	.dc.b	48				
						
	.dc.b	184				
	.dc.b	126				
	.dc.b	149				
						
	.dc.b	48				
						
	.dc.b	184				
	.dc.b	159				
	.dc.b	164				
						
	.dc.b	144				
						
	.dc.b	184				
	.dc.b	192				
	.dc.b	181				
						
	.dc.b	112				
						
	.dc.b	184				
	.dc.b	225				
	.dc.b	199				
						
	.dc.b	208				
						
	.dc.b	185				
	.dc.b	2				
	.dc.b	219				
						
	.dc.b	176				
						
	.dc.b	185				
	.dc.b	35				
	.dc.b	240				
						
	.dc.b	240				
						
	.dc.b	185				
	.dc.b	69				
	.dc.b	7				
						
	.dc.b	208				
						
	.dc.b	185				
	.dc.b	102				
	.dc.b	32				
						
	.dc.b	16				
						
	.dc.b	185				
	.dc.b	135				
	.dc.b	57				
						
	.dc.b	208				
						
	.dc.b	185				
	.dc.b	168				
	.dc.b	85				
						
	.dc.b	16				
						
	.dc.b	185				
	.dc.b	201				
	.dc.b	113				
						
	.dc.b	176				
						
	.dc.b	185				
	.dc.b	234				
	.dc.b	143				
						
	.dc.b	240				
						
	.dc.b	186				
	.dc.b	11				
	.dc.b	175				
						
	.dc.b	144				
						
	.dc.b	186				
	.dc.b	44				
	.dc.b	208				
						
	.dc.b	176				
						
	.dc.b	186				
	.dc.b	77				
	.dc.b	243				
						
	.dc.b	80				
						
	.dc.b	186				
	.dc.b	111				
	.dc.b	23				
						
	.dc.b	112				
						
	.dc.b	186				
	.dc.b	144				
	.dc.b	60				
						
	.dc.b	240				
						
	.dc.b	186				
	.dc.b	177				
	.dc.b	99				
						
	.dc.b	240				
						
	.dc.b	186				
	.dc.b	210				
	.dc.b	140				
						
	.dc.b	112				
						
	.dc.b	186				
	.dc.b	243				
	.dc.b	182				
						
	.dc.b	112				
						
	.dc.b	187				
	.dc.b	20				
	.dc.b	225				
						
	.dc.b	240				
						
	.dc.b	187				
	.dc.b	54				
	.dc.b	14				
						
	.dc.b	208				
						
	.dc.b	187				
	.dc.b	87				
	.dc.b	61				
						
	.dc.b	48				
						
	.dc.b	187				
	.dc.b	120				
	.dc.b	109				
						
	.dc.b	16				
						
	.dc.b	187				
	.dc.b	153				
	.dc.b	158				
						
	.dc.b	80				
						
	.dc.b	187				
	.dc.b	186				
	.dc.b	209				
						
	.dc.b	48				
						
	.dc.b	187				
	.dc.b	220				
	.dc.b	5				
						
	.dc.b	112				
						
	.dc.b	187				
	.dc.b	253				
	.dc.b	59				
						
	.dc.b	16				
						
	.dc.b	188				
	.dc.b	30				
	.dc.b	114				
						
	.dc.b	80				
						
	.dc.b	188				
	.dc.b	63				
	.dc.b	170				
						
	.dc.b	240				
						
	.dc.b	188				
	.dc.b	96				
	.dc.b	229				
						
	.dc.b	16				
						
	.dc.b	188				
	.dc.b	130				
	.dc.b	32				
						
	.dc.b	176				
						
	.dc.b	188				
	.dc.b	163				
	.dc.b	93				
						
	.dc.b	176				
						
	.dc.b	188				
	.dc.b	196				
	.dc.b	156				
						
	.dc.b	48				
						
	.dc.b	188				
	.dc.b	229				
	.dc.b	220				
						
	.dc.b	48				
						
	.dc.b	189				
	.dc.b	7				
	.dc.b	29				
						
	.dc.b	176				
						
	.dc.b	189				
	.dc.b	40				
	.dc.b	96				
						
	.dc.b	144				
						
	.dc.b	189				
	.dc.b	73				
	.dc.b	164				
						
	.dc.b	240				
						
	.dc.b	189				
	.dc.b	106				
	.dc.b	234				
						
	.dc.b	208				
						
	.dc.b	189				
	.dc.b	140				
	.dc.b	50				
						
	.dc.b	16				
						
	.dc.b	189				
	.dc.b	173				
	.dc.b	122				
						
	.dc.b	208				
						
	.dc.b	189				
	.dc.b	206				
	.dc.b	197				
						
	.dc.b	16				
						
	.dc.b	189				
	.dc.b	240				
	.dc.b	16				
						
	.dc.b	176				
						
	.dc.b	190				
	.dc.b	17				
	.dc.b	93				
						
	.dc.b	208				
						
	.dc.b	190				
	.dc.b	50				
	.dc.b	172				
						
	.dc.b	112				
						
	.dc.b	190				
	.dc.b	83				
	.dc.b	252				
						
	.dc.b	112				
						
	.dc.b	190				
	.dc.b	117				
	.dc.b	77				
						
	.dc.b	240				
						
	.dc.b	190				
	.dc.b	150				
	.dc.b	160				
						
	.dc.b	240				
						
	.dc.b	190				
	.dc.b	183				
	.dc.b	245				
						
	.dc.b	112				
						
	.dc.b	190				
	.dc.b	217				
	.dc.b	75				
						
	.dc.b	80				
						
	.dc.b	190				
	.dc.b	250				
	.dc.b	162				
						
	.dc.b	144				
						
	.dc.b	191				
	.dc.b	27				
	.dc.b	251				
						
	.dc.b	112				
						
	.dc.b	191				
	.dc.b	61				
	.dc.b	85				
						
	.dc.b	176				
						
	.dc.b	191				
	.dc.b	94				
	.dc.b	177				
						
	.dc.b	80				
						
	.dc.b	191				
	.dc.b	128				
	.dc.b	14				
						
	.dc.b	112				
						
	.dc.b	191				
	.dc.b	161				
	.dc.b	109				
						
	.dc.b	16				
						
	.dc.b	191				
	.dc.b	194				
	.dc.b	205				
						
	.dc.b	48				
						
	.dc.b	191				
	.dc.b	228				
	.dc.b	46				
						
	.dc.b	176				
						
	.dc.b	192				
	.dc.b	5				
	.dc.b	145				
						
	.dc.b	176				
						
	.dc.b	192				
	.dc.b	38				
	.dc.b	246				
						
	.dc.b	16				
						
	.dc.b	192				
	.dc.b	72				
	.dc.b	91				
						
	.dc.b	240				
						
	.dc.b	192				
	.dc.b	105				
	.dc.b	195				
						
	.dc.b	48				
						
	.dc.b	192				
	.dc.b	139				
	.dc.b	43				
						
	.dc.b	240				
						
	.dc.b	192				
	.dc.b	172				
	.dc.b	150				
						
	.dc.b	48				
						
	.dc.b	192				
	.dc.b	206				
	.dc.b	1				
						
	.dc.b	240				
						
	.dc.b	192				
	.dc.b	239				
	.dc.b	110				
						
	.dc.b	240				
						
	.dc.b	193				
	.dc.b	16				
	.dc.b	221				
						
	.dc.b	144				
						
	.dc.b	193				
	.dc.b	50				
	.dc.b	77				
						
	.dc.b	144				
						
	.dc.b	193				
	.dc.b	83				
	.dc.b	191				
						
	.dc.b	16				
						
	.dc.b	193				
	.dc.b	117				
	.dc.b	49				
						
	.dc.b	240				
						
	.dc.b	193				
	.dc.b	150				
	.dc.b	166				
						
	.dc.b	80				
						
	.dc.b	193				
	.dc.b	184				
	.dc.b	28				
						
	.dc.b	16				
						
	.dc.b	193				
	.dc.b	217				
	.dc.b	147				
						
	.dc.b	80				
						
	.dc.b	193				
	.dc.b	251				
	.dc.b	12				
						
	.dc.b	16				
						
	.dc.b	194				
	.dc.b	28				
	.dc.b	134				
						
	.dc.b	48				
						
	.dc.b	194				
	.dc.b	62				
	.dc.b	1				
						
	.dc.b	176				
						
	.dc.b	194				
	.dc.b	95				
	.dc.b	126				
						
	.dc.b	176				
						
	.dc.b	194				
	.dc.b	128				
	.dc.b	253				
						
	.dc.b	48				
						
	.dc.b	194				
	.dc.b	162				
	.dc.b	125				
						
	.dc.b	16				
						
	.dc.b	194				
	.dc.b	195				
	.dc.b	254				
						
	.dc.b	112				
						
	.dc.b	194				
	.dc.b	229				
	.dc.b	129				
						
	.dc.b	48				
						
	.dc.b	195				
	.dc.b	7				
	.dc.b	5				
						
	.dc.b	112				
						
	.dc.b	195				
	.dc.b	40				
	.dc.b	139				
						
	.dc.b	16				
						
	.dc.b	195				
	.dc.b	74				
	.dc.b	18				
						
	.dc.b	48				
						
	.dc.b	195				
	.dc.b	107				
	.dc.b	154				
						
	.dc.b	176				
						
	.dc.b	195				
	.dc.b	141				
	.dc.b	36				
						
	.dc.b	176				
						
	.dc.b	195				
	.dc.b	174				
	.dc.b	176				
						
	.dc.b	48				
						
	.dc.b	195				
	.dc.b	208				
	.dc.b	61				
						
	.dc.b	16				
						
	.dc.b	195				
	.dc.b	241				
	.dc.b	203				
						
	.dc.b	80				
						
	.dc.b	196				
	.dc.b	19				
	.dc.b	91				
						
	.dc.b	16				
						
	.dc.b	196				
	.dc.b	52				
	.dc.b	236				
						
	.dc.b	48				
						
	.dc.b	196				
	.dc.b	86				
	.dc.b	126				
						
	.dc.b	208				
						
	.dc.b	196				
	.dc.b	120				
	.dc.b	18				
						
	.dc.b	208				
						
	.dc.b	196				
	.dc.b	153				
	.dc.b	168				
						
	.dc.b	80				
						
	.dc.b	196				
	.dc.b	187				
	.dc.b	63				
						
	.dc.b	48				
						
	.dc.b	196				
	.dc.b	220				
	.dc.b	215				
						
	.dc.b	144				
						
	.dc.b	196				
	.dc.b	254				
	.dc.b	113				
						
	.dc.b	80				
						
	.dc.b	197				
	.dc.b	32				
	.dc.b	12				
						
	.dc.b	144				
						
	.dc.b	197				
	.dc.b	65				
	.dc.b	169				
						
	.dc.b	48				
						
	.dc.b	197				
	.dc.b	99				
	.dc.b	71				
						
	.dc.b	80				
						
	.dc.b	197				
	.dc.b	132				
	.dc.b	230				
						
	.dc.b	208				
						
	.dc.b	197				
	.dc.b	166				
	.dc.b	135				
						
	.dc.b	176				
						
	.dc.b	197				
	.dc.b	200				
	.dc.b	42				
						
	.dc.b	16				
						
	.dc.b	197				
	.dc.b	233				
	.dc.b	205				
						
	.dc.b	240				
						
	.dc.b	198				
	.dc.b	11				
	.dc.b	115				
						
	.dc.b	48				
						
	.dc.b	198				
	.dc.b	45				
	.dc.b	25				
						
	.dc.b	208				
						
	.dc.b	198				
	.dc.b	78				
	.dc.b	193				
						
	.dc.b	240				
						
	.dc.b	198				
	.dc.b	112				
	.dc.b	107				
						
	.dc.b	112				
						
	.dc.b	198				
	.dc.b	146				
	.dc.b	22				
						
	.dc.b	80				
						
	.dc.b	198				
	.dc.b	179				
	.dc.b	194				
						
	.dc.b	176				
						
	.dc.b	198				
	.dc.b	213				
	.dc.b	112				
						
	.dc.b	112				
						
	.dc.b	198				
	.dc.b	247				
	.dc.b	31				
						
	.dc.b	176				
						
	.dc.b	199				
	.dc.b	24				
	.dc.b	208				
						
	.dc.b	80				
						
	.dc.b	199				
	.dc.b	58				
	.dc.b	130				
						
	.dc.b	112				
						
	.dc.b	199				
	.dc.b	92				
	.dc.b	53				
						
	.dc.b	240				
						
	.dc.b	199				
	.dc.b	125				
	.dc.b	234				
						
	.dc.b	208				
						
	.dc.b	199				
	.dc.b	159				
	.dc.b	161				
						
	.dc.b	48				
						
	.dc.b	199				
	.dc.b	193				
	.dc.b	88				
						
	.dc.b	240				
						
	.dc.b	199				
	.dc.b	227				
	.dc.b	18				
						
	.dc.b	48				
						
	.dc.b	200				
	.dc.b	4				
	.dc.b	204				
						
	.dc.b	208				
						
	.dc.b	200				
	.dc.b	38				
	.dc.b	136				
						
	.dc.b	208				
						
	.dc.b	200				
	.dc.b	72				
	.dc.b	70				
						
	.dc.b	80				
						
	.dc.b	200				
	.dc.b	106				
	.dc.b	5				
						
	.dc.b	48				
						
	.dc.b	200				
	.dc.b	139				
	.dc.b	197				
						
	.dc.b	112				
						
	.dc.b	200				
	.dc.b	173				
	.dc.b	135				
						
	.dc.b	48				
						
	.dc.b	200				
	.dc.b	207				
	.dc.b	74				
						
	.dc.b	80				
						
	.dc.b	200				
	.dc.b	241				
	.dc.b	14				
						
	.dc.b	240				
						
	.dc.b	201				
	.dc.b	18				
	.dc.b	212				
						
	.dc.b	240				
						
	.dc.b	201				
	.dc.b	52				
	.dc.b	156				
						
	.dc.b	80				
						
	.dc.b	201				
	.dc.b	86				
	.dc.b	101				
						
	.dc.b	16				
						
	.dc.b	201				
	.dc.b	120				
	.dc.b	47				
						
	.dc.b	80				
						
	.dc.b	201				
	.dc.b	153				
	.dc.b	251				
						
	.dc.b	16				
						
	.dc.b	201				
	.dc.b	187				
	.dc.b	200				
						
	.dc.b	16				
						
	.dc.b	201				
	.dc.b	221				
	.dc.b	150				
						
	.dc.b	144				
						
	.dc.b	201				
	.dc.b	255				
	.dc.b	102				
						
	.dc.b	112				
						
	.dc.b	202				
	.dc.b	33				
	.dc.b	55				
						
	.dc.b	208				
						
	.dc.b	202				
	.dc.b	67				
	.dc.b	10				
						
	.dc.b	144				
						
	.dc.b	202				
	.dc.b	100				
	.dc.b	222				
						
	.dc.b	176				
						
	.dc.b	202				
	.dc.b	134				
	.dc.b	180				
						
	.dc.b	48				
						
	.dc.b	202				
	.dc.b	168				
	.dc.b	139				
						
	.dc.b	48				
						
	.dc.b	202				
	.dc.b	202				
	.dc.b	99				
						
	.dc.b	144				
						
	.dc.b	202				
	.dc.b	236				
	.dc.b	61				
						
	.dc.b	80				
						
	.dc.b	203				
	.dc.b	14				
	.dc.b	24				
						
	.dc.b	144				
						
	.dc.b	203				
	.dc.b	47				
	.dc.b	245				
						
	.dc.b	48				
						
	.dc.b	203				
	.dc.b	81				
	.dc.b	211				
						
	.dc.b	48				
						
	.dc.b	203				
	.dc.b	115				
	.dc.b	178				
						
	.dc.b	176				
						
	.dc.b	203				
	.dc.b	149				
	.dc.b	147				
						
	.dc.b	144				
						
	.dc.b	203				
	.dc.b	183				
	.dc.b	117				
						
	.dc.b	208				
						
	.dc.b	203				
	.dc.b	217				
	.dc.b	89				
						
	.dc.b	112				
						
	.dc.b	203				
	.dc.b	251				
	.dc.b	62				
						
	.dc.b	144				
						
	.dc.b	204				
	.dc.b	29				
	.dc.b	37				
						
	.dc.b	16				
						
	.dc.b	204				
	.dc.b	63				
	.dc.b	12				
						
	.dc.b	240				
						
	.dc.b	204				
	.dc.b	96				
	.dc.b	246				
						
	.dc.b	48				
						
	.dc.b	204				
	.dc.b	130				
	.dc.b	224				
						
	.dc.b	240				
						
	.dc.b	204				
	.dc.b	164				
	.dc.b	205				
						
	.dc.b	16				
						
	.dc.b	204				
	.dc.b	198				
	.dc.b	186				
						
	.dc.b	144				
						
	.dc.b	204				
	.dc.b	232				
	.dc.b	169				
						
	.dc.b	144				
						
	.dc.b	205				
	.dc.b	10				
	.dc.b	153				
						
	.dc.b	208				
						
	.dc.b	205				
	.dc.b	44				
	.dc.b	139				
						
	.dc.b	144				
						
	.dc.b	205				
	.dc.b	78				
	.dc.b	126				
						
	.dc.b	176				
						
	.dc.b	205				
	.dc.b	112				
	.dc.b	115				
						
	.dc.b	80				
						
	.dc.b	205				
	.dc.b	146				
	.dc.b	105				
						
	.dc.b	48				
						
	.dc.b	205				
	.dc.b	180				
	.dc.b	96				
						
	.dc.b	144				
						
	.dc.b	205				
	.dc.b	214				
	.dc.b	89				
						
	.dc.b	80				
						
	.dc.b	205				
	.dc.b	248				
	.dc.b	83				
						
	.dc.b	112				
						
	.dc.b	206				
	.dc.b	26				
	.dc.b	79				
						
	.dc.b	16				
						
	.dc.b	206				
	.dc.b	60				
	.dc.b	75				
						
	.dc.b	240				
						
	.dc.b	206				
	.dc.b	94				
	.dc.b	74				
						
	.dc.b	80				
						
	.dc.b	206				
	.dc.b	128				
	.dc.b	74				
						
	.dc.b	16				
						
	.dc.b	206				
	.dc.b	162				
	.dc.b	75				
						
	.dc.b	80				
						
	.dc.b	206				
	.dc.b	196				
	.dc.b	77				
						
	.dc.b	208				
						
	.dc.b	206				
	.dc.b	230				
	.dc.b	81				
						
	.dc.b	208				
						
	.dc.b	207				
	.dc.b	8				
	.dc.b	87				
						
	.dc.b	48				
						
	.dc.b	207				
	.dc.b	42				
	.dc.b	93				
						
	.dc.b	240				
						
	.dc.b	207				
	.dc.b	76				
	.dc.b	102				
						
	.dc.b	16				
						
	.dc.b	207				
	.dc.b	110				
	.dc.b	111				
						
	.dc.b	144				
						
	.dc.b	207				
	.dc.b	144				
	.dc.b	122				
						
	.dc.b	144				
						
	.dc.b	207				
	.dc.b	178				
	.dc.b	134				
						
	.dc.b	208				
						
	.dc.b	207				
	.dc.b	212				
	.dc.b	148				
						
	.dc.b	144				
						
	.dc.b	207				
	.dc.b	246				
	.dc.b	163				
						
	.dc.b	176				
						
	.dc.b	208				
	.dc.b	24				
	.dc.b	180				
						
	.dc.b	80				
						
	.dc.b	208				
	.dc.b	58				
	.dc.b	198				
						
	.dc.b	48				
						
	.dc.b	208				
	.dc.b	92				
	.dc.b	217				
						
	.dc.b	112				
						
	.dc.b	208				
	.dc.b	126				
	.dc.b	238				
						
	.dc.b	48				
						
	.dc.b	208				
	.dc.b	161				
	.dc.b	4				
						
	.dc.b	80				
						
	.dc.b	208				
	.dc.b	195				
	.dc.b	27				
						
	.dc.b	208				
						
	.dc.b	208				
	.dc.b	229				
	.dc.b	52				
						
	.dc.b	176				
						
	.dc.b	209				
	.dc.b	7				
	.dc.b	78				
						
	.dc.b	240				
						
	.dc.b	209				
	.dc.b	41				
	.dc.b	106				
						
	.dc.b	176				
						
	.dc.b	209				
	.dc.b	75				
	.dc.b	135				
						
	.dc.b	176				
						
	.dc.b	209				
	.dc.b	109				
	.dc.b	166				
						
	.dc.b	48				
						
	.dc.b	209				
	.dc.b	143				
	.dc.b	197				
						
	.dc.b	240				
						
	.dc.b	209				
	.dc.b	177				
	.dc.b	231				
						
	.dc.b	48				
						
	.dc.b	209				
	.dc.b	212				
	.dc.b	9				
						
	.dc.b	208				
						
	.dc.b	209				
	.dc.b	246				
	.dc.b	45				
						
	.dc.b	208				
						
	.dc.b	210				
	.dc.b	24				
	.dc.b	83				
						
	.dc.b	48				
						
	.dc.b	210				
	.dc.b	58				
	.dc.b	121				
						
	.dc.b	240				
						
	.dc.b	210				
	.dc.b	92				
	.dc.b	162				
						
	.dc.b	48				
						
	.dc.b	210				
	.dc.b	126				
	.dc.b	203				
						
	.dc.b	176				
						
	.dc.b	210				
	.dc.b	160				
	.dc.b	246				
						
	.dc.b	176				
						
	.dc.b	210				
	.dc.b	195				
	.dc.b	34				
						
	.dc.b	240				
						
	.dc.b	210				
	.dc.b	229				
	.dc.b	80				
						
	.dc.b	176				
						
	.dc.b	211				
	.dc.b	7				
	.dc.b	127				
						
	.dc.b	208				
						
	.dc.b	211				
	.dc.b	41				
	.dc.b	176				
						
	.dc.b	80				
						
	.dc.b	211				
	.dc.b	75				
	.dc.b	226				
						
	.dc.b	48				
						
	.dc.b	211				
	.dc.b	110				
	.dc.b	21				
						
	.dc.b	112				
						
	.dc.b	211				
	.dc.b	144				
	.dc.b	74				
						
	.dc.b	16				
						
	.dc.b	211				
	.dc.b	178				
	.dc.b	128				
						
	.dc.b	16				
						
	.dc.b	211				
	.dc.b	212				
	.dc.b	183				
						
	.dc.b	112				
						
	.dc.b	211				
	.dc.b	246				
	.dc.b	240				
						
	.dc.b	48				
						
	.dc.b	212				
	.dc.b	25				
	.dc.b	42				
						
	.dc.b	112				
						
	.dc.b	212				
	.dc.b	59				
	.dc.b	101				
						
	.dc.b	240				
						
	.dc.b	212				
	.dc.b	93				
	.dc.b	162				
						
	.dc.b	208				
						
	.dc.b	212				
	.dc.b	127				
	.dc.b	225				
						
	.dc.b	48				
						
	.dc.b	212				
	.dc.b	162				
	.dc.b	32				
						
	.dc.b	208				
						
	.dc.b	212				
	.dc.b	196				
	.dc.b	97				
						
	.dc.b	240				
						
	.dc.b	212				
	.dc.b	230				
	.dc.b	164				
						
	.dc.b	80				
						
	.dc.b	213				
	.dc.b	8				
	.dc.b	232				
						
	.dc.b	48				
						
	.dc.b	213				
	.dc.b	43				
	.dc.b	45				
						
	.dc.b	80				
						
	.dc.b	213				
	.dc.b	77				
	.dc.b	115				
						
	.dc.b	240				
						
	.dc.b	213				
	.dc.b	111				
	.dc.b	187				
						
	.dc.b	240				
						
	.dc.b	213				
	.dc.b	146				
	.dc.b	5				
						
	.dc.b	48				
						
	.dc.b	213				
	.dc.b	180				
	.dc.b	79				
						
	.dc.b	240				
						
	.dc.b	213				
	.dc.b	214				
	.dc.b	156				
						
	.dc.b	16				
						
	.dc.b	213				
	.dc.b	248				
	.dc.b	233				
						
	.dc.b	112				
						
	.dc.b	214				
	.dc.b	27				
	.dc.b	56				
						
	.dc.b	80				
						
	.dc.b	214				
	.dc.b	61				
	.dc.b	136				
						
	.dc.b	112				
						
	.dc.b	214				
	.dc.b	95				
	.dc.b	218				
						
	.dc.b	16				
						
	.dc.b	214				
	.dc.b	130				
	.dc.b	45				
						
	.dc.b	16				
						
	.dc.b	214				
	.dc.b	164				
	.dc.b	129				
						
	.dc.b	80				
						
	.dc.b	214				
	.dc.b	198				
	.dc.b	215				
						
	.dc.b	16				
						
	.dc.b	214				
	.dc.b	233				
	.dc.b	46				
						
	.dc.b	48				
						
	.dc.b	215				
	.dc.b	11				
	.dc.b	134				
						
	.dc.b	144				
						
	.dc.b	215				
	.dc.b	45				
	.dc.b	224				
						
	.dc.b	112				
						
	.dc.b	215				
	.dc.b	80				
	.dc.b	59				
						
	.dc.b	144				
						
	.dc.b	215				
	.dc.b	114				
	.dc.b	152				
						
	.dc.b	48				
						
	.dc.b	215				
	.dc.b	148				
	.dc.b	246				
						
	.dc.b	16				
						
	.dc.b	215				
	.dc.b	183				
	.dc.b	85				
						
	.dc.b	80				
						
	.dc.b	215				
	.dc.b	217				
	.dc.b	182				
						
	.dc.b	16				
						
	.dc.b	215				
	.dc.b	252				
	.dc.b	24				
						
	.dc.b	16				
						
	.dc.b	216				
	.dc.b	30				
	.dc.b	123				
						
	.dc.b	112				
						
	.dc.b	216				
	.dc.b	64				
	.dc.b	224				
						
	.dc.b	80				
						
	.dc.b	216				
	.dc.b	99				
	.dc.b	70				
						
	.dc.b	112				
						
	.dc.b	216				
	.dc.b	133				
	.dc.b	173				
						
	.dc.b	240				
						
	.dc.b	216				
	.dc.b	168				
	.dc.b	22				
						
	.dc.b	208				
						
	.dc.b	216				
	.dc.b	202				
	.dc.b	129				
						
	.dc.b	16				
						
	.dc.b	216				
	.dc.b	236				
	.dc.b	236				
						
	.dc.b	176				
						
	.dc.b	217				
	.dc.b	15				
	.dc.b	89				
						
	.dc.b	144				
						
	.dc.b	217				
	.dc.b	49				
	.dc.b	199				
						
	.dc.b	240				
						
	.dc.b	217				
	.dc.b	84				
	.dc.b	55				
						
	.dc.b	176				
						
	.dc.b	217				
	.dc.b	118				
	.dc.b	168				
						
	.dc.b	176				
						
	.dc.b	217				
	.dc.b	153				
	.dc.b	27				
						
	.dc.b	48				
						
	.dc.b	217				
	.dc.b	187				
	.dc.b	142				
						
	.dc.b	240				
						
	.dc.b	217				
	.dc.b	222				
	.dc.b	4				
						
	.dc.b	16				
						
	.dc.b	218				
	.dc.b	0				
	.dc.b	122				
						
	.dc.b	144				
						
	.dc.b	218				
	.dc.b	34				
	.dc.b	242				
						
	.dc.b	144				
						
	.dc.b	218				
	.dc.b	69				
	.dc.b	107				
						
	.dc.b	208				
						
	.dc.b	218				
	.dc.b	103				
	.dc.b	230				
						
	.dc.b	80				
						
	.dc.b	218				
	.dc.b	138				
	.dc.b	98				
						
	.dc.b	80				
						
	.dc.b	218				
	.dc.b	172				
	.dc.b	223				
						
	.dc.b	176				
						
	.dc.b	218				
	.dc.b	207				
	.dc.b	94				
						
	.dc.b	80				
						
	.dc.b	218				
	.dc.b	241				
	.dc.b	222				
						
	.dc.b	112				
						
	.dc.b	219				
	.dc.b	20				
	.dc.b	95				
						
	.dc.b	208				
						
	.dc.b	219				
	.dc.b	54				
	.dc.b	226				
						
	.dc.b	144				
						
	.dc.b	219				
	.dc.b	89				
	.dc.b	102				
						
	.dc.b	176				
						
	.dc.b	219				
	.dc.b	123				
	.dc.b	236				
						
	.dc.b	48				
						
	.dc.b	219				
	.dc.b	158				
	.dc.b	115				
						
	.dc.b	16				
						
	.dc.b	219				
	.dc.b	192				
	.dc.b	251				
						
	.dc.b	48				
						
	.dc.b	219				
	.dc.b	227				
	.dc.b	132				
						
	.dc.b	208				
						
	.dc.b	220				
	.dc.b	6				
	.dc.b	15				
						
	.dc.b	176				
						
	.dc.b	220				
	.dc.b	40				
	.dc.b	155				
						
	.dc.b	240				
						
	.dc.b	220				
	.dc.b	75				
	.dc.b	41				
						
	.dc.b	144				
						
	.dc.b	220				
	.dc.b	109				
	.dc.b	184				
						
	.dc.b	144				
						
	.dc.b	220				
	.dc.b	144				
	.dc.b	72				
						
	.dc.b	208				
						
	.dc.b	220				
	.dc.b	178				
	.dc.b	218				
						
	.dc.b	144				
						
	.dc.b	220				
	.dc.b	213				
	.dc.b	109				
						
	.dc.b	144				
						
	.dc.b	220				
	.dc.b	248				
	.dc.b	1				
						
	.dc.b	240				
						
	.dc.b	221				
	.dc.b	26				
	.dc.b	151				
						
	.dc.b	176				
						
	.dc.b	221				
	.dc.b	61				
	.dc.b	46				
						
	.dc.b	208				
						
	.dc.b	221				
	.dc.b	95				
	.dc.b	199				
						
	.dc.b	80				
						
	.dc.b	221				
	.dc.b	130				
	.dc.b	97				
						
	.dc.b	16				
						
	.dc.b	221				
	.dc.b	164				
	.dc.b	252				
						
	.dc.b	80				
						
	.dc.b	221				
	.dc.b	199				
	.dc.b	152				
						
	.dc.b	208				
						
	.dc.b	221				
	.dc.b	234				
	.dc.b	54				
						
	.dc.b	144				
						
	.dc.b	222				
	.dc.b	12				
	.dc.b	213				
						
	.dc.b	208				
						
	.dc.b	222				
	.dc.b	47				
	.dc.b	118				
						
	.dc.b	112				
						
	.dc.b	222				
	.dc.b	82				
	.dc.b	24				
						
	.dc.b	80				
						
	.dc.b	222				
	.dc.b	116				
	.dc.b	187				
						
	.dc.b	144				
						
	.dc.b	222				
	.dc.b	151				
	.dc.b	96				
						
	.dc.b	48				
						
	.dc.b	222				
	.dc.b	186				
	.dc.b	6				
						
	.dc.b	16				
						
	.dc.b	222				
	.dc.b	220				
	.dc.b	173				
						
	.dc.b	112				
						
	.dc.b	222				
	.dc.b	255				
	.dc.b	86				
						
	.dc.b	16				
						
	.dc.b	223				
	.dc.b	34				
	.dc.b	0				
						
	.dc.b	16				
						
	.dc.b	223				
	.dc.b	68				
	.dc.b	171				
						
	.dc.b	80				
						
	.dc.b	223				
	.dc.b	103				
	.dc.b	88				
						
	.dc.b	16				
						
	.dc.b	223				
	.dc.b	138				
	.dc.b	6				
						
	.dc.b	16				
						
	.dc.b	223				
	.dc.b	172				
	.dc.b	181				
						
	.dc.b	112				
						
	.dc.b	223				
	.dc.b	207				
	.dc.b	102				
						
	.dc.b	48				
						
	.dc.b	223				
	.dc.b	242				
	.dc.b	24				
						
	.dc.b	80				
						
	.dc.b	224				
	.dc.b	20				
	.dc.b	203				
						
	.dc.b	176				
						
	.dc.b	224				
	.dc.b	55				
	.dc.b	128				
						
	.dc.b	112				
						
	.dc.b	224				
	.dc.b	90				
	.dc.b	54				
						
	.dc.b	144				
						
	.dc.b	224				
	.dc.b	124				
	.dc.b	237				
						
	.dc.b	240				
						
	.dc.b	224				
	.dc.b	159				
	.dc.b	166				
						
	.dc.b	176				
						
	.dc.b	224				
	.dc.b	194				
	.dc.b	96				
						
	.dc.b	208				
						
	.dc.b	224				
	.dc.b	229				
	.dc.b	28				
						
	.dc.b	80				
						
	.dc.b	225				
	.dc.b	7				
	.dc.b	217				
						
	.dc.b	48				
						
	.dc.b	225				
	.dc.b	42				
	.dc.b	151				
						
	.dc.b	80				
						
	.dc.b	225				
	.dc.b	77				
	.dc.b	86				
						
	.dc.b	208				
						
	.dc.b	225				
	.dc.b	112				
	.dc.b	23				
						
	.dc.b	144				
						
	.dc.b	225				
	.dc.b	146				
	.dc.b	217				
						
	.dc.b	208				
						
	.dc.b	225				
	.dc.b	181				
	.dc.b	157				
						
	.dc.b	80				
						
	.dc.b	225				
	.dc.b	216				
	.dc.b	98				
						
	.dc.b	16				
						
	.dc.b	225				
	.dc.b	251				
	.dc.b	40				
						
	.dc.b	80				
						
	.dc.b	226				
	.dc.b	29				
	.dc.b	239				
						
	.dc.b	208				
						
	.dc.b	226				
	.dc.b	64				
	.dc.b	184				
						
	.dc.b	176				
						
	.dc.b	226				
	.dc.b	99				
	.dc.b	130				
						
	.dc.b	240				
						
	.dc.b	226				
	.dc.b	134				
	.dc.b	78				
						
	.dc.b	112				
						
	.dc.b	226				
	.dc.b	169				
	.dc.b	27				
						
	.dc.b	80				
						
	.dc.b	226				
	.dc.b	203				
	.dc.b	233				
						
	.dc.b	112				
						
	.dc.b	226				
	.dc.b	238				
	.dc.b	185				
						
	.dc.b	16				
						
	.dc.b	227				
	.dc.b	17				
	.dc.b	137				
						
	.dc.b	240				
						
	.dc.b	227				
	.dc.b	52				
	.dc.b	92				
						
	.dc.b	16				
						
	.dc.b	227				
	.dc.b	87				
	.dc.b	47				
						
	.dc.b	176				
						
	.dc.b	227				
	.dc.b	122				
	.dc.b	4				
						
	.dc.b	144				
						
	.dc.b	227				
	.dc.b	156				
	.dc.b	218				
						
	.dc.b	208				
						
	.dc.b	227				
	.dc.b	191				
	.dc.b	178				
						
	.dc.b	80				
						
	.dc.b	227				
	.dc.b	226				
	.dc.b	139				
						
	.dc.b	48				
						
	.dc.b	228				
	.dc.b	5				
	.dc.b	101				
						
	.dc.b	112				
						
	.dc.b	228				
	.dc.b	40				
	.dc.b	64				
						
	.dc.b	240				
						
	.dc.b	228				
	.dc.b	75				
	.dc.b	29				
						
	.dc.b	208				
						
	.dc.b	228				
	.dc.b	109				
	.dc.b	252				
						
	.dc.b	16				
						
	.dc.b	228				
	.dc.b	144				
	.dc.b	219				
						
	.dc.b	144				
						
	.dc.b	228				
	.dc.b	179				
	.dc.b	188				
						
	.dc.b	112				
						
	.dc.b	228				
	.dc.b	214				
	.dc.b	158				
						
	.dc.b	144				
						
	.dc.b	228				
	.dc.b	249				
	.dc.b	130				
						
	.dc.b	48				
						
	.dc.b	229				
	.dc.b	28				
	.dc.b	103				
						
	.dc.b	16				
						
	.dc.b	229				
	.dc.b	63				
	.dc.b	77				
						
	.dc.b	48				
						
	.dc.b	229				
	.dc.b	98				
	.dc.b	52				
						
	.dc.b	176				
						
	.dc.b	229				
	.dc.b	133				
	.dc.b	29				
						
	.dc.b	144				
						
	.dc.b	229				
	.dc.b	168				
	.dc.b	7				
						
	.dc.b	176				
						
	.dc.b	229				
	.dc.b	202				
	.dc.b	243				
						
	.dc.b	48				
						
	.dc.b	229				
	.dc.b	237				
	.dc.b	224				
						
	.dc.b	16				
						
	.dc.b	230				
	.dc.b	16				
	.dc.b	206				
						
	.dc.b	48				
						
	.dc.b	230				
	.dc.b	51				
	.dc.b	189				
						
	.dc.b	176				
						
	.dc.b	230				
	.dc.b	86				
	.dc.b	174				
						
	.dc.b	112				
						
	.dc.b	230				
	.dc.b	121				
	.dc.b	160				
						
	.dc.b	144				
						
	.dc.b	230				
	.dc.b	156				
	.dc.b	148				
						
	.dc.b	16				
						
	.dc.b	230				
	.dc.b	191				
	.dc.b	136				
						
	.dc.b	208				
						
	.dc.b	230				
	.dc.b	226				
	.dc.b	126				
						
	.dc.b	240				
						
	.dc.b	231				
	.dc.b	5				
	.dc.b	118				
						
	.dc.b	80				
						
	.dc.b	231				
	.dc.b	40				
	.dc.b	111				
						
	.dc.b	16				
						
	.dc.b	231				
	.dc.b	75				
	.dc.b	105				
						
	.dc.b	48				
						
	.dc.b	231				
	.dc.b	110				
	.dc.b	100				
						
	.dc.b	144				
						
	.dc.b	231				
	.dc.b	145				
	.dc.b	97				
						
	.dc.b	80				
						
	.dc.b	231				
	.dc.b	180				
	.dc.b	95				
						
	.dc.b	80				
						
	.dc.b	231				
	.dc.b	215				
	.dc.b	94				
						
	.dc.b	176				
						
	.dc.b	231				
	.dc.b	250				
	.dc.b	95				
						
	.dc.b	80				
						
	.dc.b	232				
	.dc.b	29				
	.dc.b	97				
						
	.dc.b	80				
						
	.dc.b	232				
	.dc.b	64				
	.dc.b	100				
						
	.dc.b	176				
						
	.dc.b	232				
	.dc.b	99				
	.dc.b	105				
						
	.dc.b	80				
						
	.dc.b	232				
	.dc.b	134				
	.dc.b	111				
						
	.dc.b	80				
						
	.dc.b	232				
	.dc.b	169				
	.dc.b	118				
						
	.dc.b	144				
						
	.dc.b	232				
	.dc.b	204				
	.dc.b	127				
						
	.dc.b	16				
						
	.dc.b	232				
	.dc.b	239				
	.dc.b	137				
						
	.dc.b	16				
						
	.dc.b	233				
	.dc.b	18				
	.dc.b	148				
						
	.dc.b	80				
						
	.dc.b	233				
	.dc.b	53				
	.dc.b	160				
						
	.dc.b	208				
						
	.dc.b	233				
	.dc.b	88				
	.dc.b	174				
						
	.dc.b	176				
						
	.dc.b	233				
	.dc.b	123				
	.dc.b	189				
						
	.dc.b	208				
						
	.dc.b	233				
	.dc.b	158				
	.dc.b	206				
						
	.dc.b	80				
						
	.dc.b	233				
	.dc.b	193				
	.dc.b	224				
						
	.dc.b	48				
						
	.dc.b	233				
	.dc.b	228				
	.dc.b	243				
						
	.dc.b	80				
						
	.dc.b	234				
	.dc.b	8				
	.dc.b	7				
						
	.dc.b	208				
						
	.dc.b	234				
	.dc.b	43				
	.dc.b	29				
						
	.dc.b	144				
						
	.dc.b	234				
	.dc.b	78				
	.dc.b	52				
						
	.dc.b	144				
						
	.dc.b	234				
	.dc.b	113				
	.dc.b	76				
						
	.dc.b	240				
						
	.dc.b	234				
	.dc.b	148				
	.dc.b	102				
						
	.dc.b	176				
						
	.dc.b	234				
	.dc.b	183				
	.dc.b	129				
						
	.dc.b	176				
						
	.dc.b	234				
	.dc.b	218				
	.dc.b	158				
						
	.dc.b	16				
						
	.dc.b	234				
	.dc.b	253				
	.dc.b	187				
						
	.dc.b	176				
						
	.dc.b	235				
	.dc.b	32				
	.dc.b	218				
						
	.dc.b	176				
						
	.dc.b	235				
	.dc.b	67				
	.dc.b	250				
						
	.dc.b	240				
						
	.dc.b	235				
	.dc.b	103				
	.dc.b	28				
						
	.dc.b	112				
						
	.dc.b	235				
	.dc.b	138				
	.dc.b	63				
						
	.dc.b	80				
						
	.dc.b	235				
	.dc.b	173				
	.dc.b	99				
						
	.dc.b	144				
						
	.dc.b	235				
	.dc.b	208				
	.dc.b	137				
						
	.dc.b	16				
						
	.dc.b	235				
	.dc.b	243				
	.dc.b	175				
						
	.dc.b	240				
						
	.dc.b	236				
	.dc.b	22				
	.dc.b	216				
						
	.dc.b	16				
						
	.dc.b	236				
	.dc.b	58				
	.dc.b	1				
						
	.dc.b	112				
						
	.dc.b	236				
	.dc.b	93				
	.dc.b	44				
						
	.dc.b	48				
						
	.dc.b	236				
	.dc.b	128				
	.dc.b	88				
						
	.dc.b	48				
						
	.dc.b	236				
	.dc.b	163				
	.dc.b	133				
						
	.dc.b	144				
						
	.dc.b	236				
	.dc.b	198				
	.dc.b	180				
						
	.dc.b	80				
						
	.dc.b	236				
	.dc.b	233				
	.dc.b	228				
						
	.dc.b	80				
						
	.dc.b	237				
	.dc.b	13				
	.dc.b	21				
						
	.dc.b	144				
						
	.dc.b	237				
	.dc.b	48				
	.dc.b	72				
						
	.dc.b	16				
						
	.dc.b	237				
	.dc.b	83				
	.dc.b	124				
						
	.dc.b	16				
						
	.dc.b	237				
	.dc.b	118				
	.dc.b	177				
						
	.dc.b	48				
						
	.dc.b	237				
	.dc.b	153				
	.dc.b	231				
						
	.dc.b	176				
						
	.dc.b	237				
	.dc.b	189				
	.dc.b	31				
						
	.dc.b	144				
						
	.dc.b	237				
	.dc.b	224				
	.dc.b	88				
						
	.dc.b	176				
						
	.dc.b	238				
	.dc.b	3				
	.dc.b	147				
						
	.dc.b	16				
						
	.dc.b	238				
	.dc.b	38				
	.dc.b	206				
						
	.dc.b	208				
						
	.dc.b	238				
	.dc.b	74				
	.dc.b	11				
						
	.dc.b	208				
						
	.dc.b	238				
	.dc.b	109				
	.dc.b	74				
						
	.dc.b	48				
						
	.dc.b	238				
	.dc.b	144				
	.dc.b	137				
						
	.dc.b	208				
						
	.dc.b	238				
	.dc.b	179				
	.dc.b	202				
						
	.dc.b	176				
						
	.dc.b	238				
	.dc.b	215				
	.dc.b	12				
						
	.dc.b	240				
						
	.dc.b	238				
	.dc.b	250				
	.dc.b	80				
						
	.dc.b	112				
						
	.dc.b	239				
	.dc.b	29				
	.dc.b	149				
						
	.dc.b	80				
						
	.dc.b	239				
	.dc.b	64				
	.dc.b	219				
						
	.dc.b	112				
						
	.dc.b	239				
	.dc.b	100				
	.dc.b	34				
						
	.dc.b	240				
						
	.dc.b	239				
	.dc.b	135				
	.dc.b	107				
						
	.dc.b	176				
						
	.dc.b	239				
	.dc.b	170				
	.dc.b	181				
						
	.dc.b	176				
						
	.dc.b	239				
	.dc.b	206				
	.dc.b	1				
						
	.dc.b	16				
						
	.dc.b	239				
	.dc.b	241				
	.dc.b	77				
						
	.dc.b	176				
						
	.dc.b	240				
	.dc.b	20				
	.dc.b	155				
						
	.dc.b	144				
						
	.dc.b	240				
	.dc.b	55				
	.dc.b	234				
						
	.dc.b	208				
						
	.dc.b	240				
	.dc.b	91				
	.dc.b	59				
						
	.dc.b	80				
						
	.dc.b	240				
	.dc.b	126				
	.dc.b	141				
						
	.dc.b	48				
						
	.dc.b	240				
	.dc.b	161				
	.dc.b	224				
						
	.dc.b	80				
						
	.dc.b	240				
	.dc.b	197				
	.dc.b	52				
						
	.dc.b	176				
						
	.dc.b	240				
	.dc.b	232				
	.dc.b	138				
						
	.dc.b	112				
						
	.dc.b	241				
	.dc.b	11				
	.dc.b	225				
						
	.dc.b	112				
						
	.dc.b	241				
	.dc.b	47				
	.dc.b	57				
						
	.dc.b	208				
						
	.dc.b	241				
	.dc.b	82				
	.dc.b	147				
						
	.dc.b	80				
						
	.dc.b	241				
	.dc.b	117				
	.dc.b	238				
						
	.dc.b	80				
						
	.dc.b	241				
	.dc.b	153				
	.dc.b	74				
						
	.dc.b	112				
						
	.dc.b	241				
	.dc.b	188				
	.dc.b	167				
						
	.dc.b	240				
						
	.dc.b	241				
	.dc.b	224				
	.dc.b	6				
						
	.dc.b	176				
						
	.dc.b	242				
	.dc.b	3				
	.dc.b	102				
						
	.dc.b	208				
						
	.dc.b	242				
	.dc.b	38				
	.dc.b	200				
						
	.dc.b	48				
						
	.dc.b	242				
	.dc.b	74				
	.dc.b	42				
						
	.dc.b	208				
						
	.dc.b	242				
	.dc.b	109				
	.dc.b	142				
						
	.dc.b	208				
						
	.dc.b	242				
	.dc.b	144				
	.dc.b	244				
						
	.dc.b	16				
						
	.dc.b	242				
	.dc.b	180				
	.dc.b	90				
						
	.dc.b	144				
						
	.dc.b	242				
	.dc.b	215				
	.dc.b	194				
						
	.dc.b	112				
						
	.dc.b	242				
	.dc.b	251				
	.dc.b	43				
						
	.dc.b	144				
						
	.dc.b	243				
	.dc.b	30				
	.dc.b	149				
						
	.dc.b	240				
						
	.dc.b	243				
	.dc.b	66				
	.dc.b	1				
						
	.dc.b	144				
						
	.dc.b	243				
	.dc.b	101				
	.dc.b	110				
						
	.dc.b	144				
						
	.dc.b	243				
	.dc.b	136				
	.dc.b	220				
						
	.dc.b	240				
						
	.dc.b	243				
	.dc.b	172				
	.dc.b	76				
						
	.dc.b	112				
						
	.dc.b	243				
	.dc.b	207				
	.dc.b	189				
						
	.dc.b	80				
						
	.dc.b	243				
	.dc.b	243				
	.dc.b	47				
						
	.dc.b	112				
						
	.dc.b	244				
	.dc.b	22				
	.dc.b	162				
						
	.dc.b	208				
						
	.dc.b	244				
	.dc.b	58				
	.dc.b	23				
						
	.dc.b	144				
						
	.dc.b	244				
	.dc.b	93				
	.dc.b	141				
						
	.dc.b	144				
						
	.dc.b	244				
	.dc.b	129				
	.dc.b	4				
						
	.dc.b	240				
						
	.dc.b	244				
	.dc.b	164				
	.dc.b	125				
						
	.dc.b	112				
						
	.dc.b	244				
	.dc.b	199				
	.dc.b	247				
						
	.dc.b	80				
						
	.dc.b	244				
	.dc.b	235				
	.dc.b	114				
						
	.dc.b	112				
						
	.dc.b	245				
	.dc.b	14				
	.dc.b	238				
						
	.dc.b	240				
						
	.dc.b	245				
	.dc.b	50				
	.dc.b	108				
						
	.dc.b	144				
						
	.dc.b	245				
	.dc.b	85				
	.dc.b	235				
						
	.dc.b	144				
						
	.dc.b	245				
	.dc.b	121				
	.dc.b	107				
						
	.dc.b	240				
						
	.dc.b	245				
	.dc.b	156				
	.dc.b	237				
						
	.dc.b	112				
						
	.dc.b	245				
	.dc.b	192				
	.dc.b	112				
						
	.dc.b	80				
						
	.dc.b	245				
	.dc.b	227				
	.dc.b	244				
						
	.dc.b	112				
						
	.dc.b	246				
	.dc.b	7				
	.dc.b	121				
						
	.dc.b	240				
						
	.dc.b	246				
	.dc.b	43				
	.dc.b	0				
						
	.dc.b	144				
						
	.dc.b	246				
	.dc.b	78				
	.dc.b	136				
						
	.dc.b	144				
						
	.dc.b	246				
	.dc.b	114				
	.dc.b	17				
						
	.dc.b	208				
						
	.dc.b	246				
	.dc.b	149				
	.dc.b	156				
						
	.dc.b	112				
						
	.dc.b	246				
	.dc.b	185				
	.dc.b	40				
						
	.dc.b	48				
						
	.dc.b	246				
	.dc.b	220				
	.dc.b	181				
						
	.dc.b	80				
						
	.dc.b	247				
	.dc.b	0				
	.dc.b	67				
						
	.dc.b	176				
						
	.dc.b	247				
	.dc.b	35				
	.dc.b	211				
						
	.dc.b	112				
						
	.dc.b	247				
	.dc.b	71				
	.dc.b	100				
						
	.dc.b	80				
						
	.dc.b	247				
	.dc.b	106				
	.dc.b	246				
						
	.dc.b	144				
						
	.dc.b	247				
	.dc.b	142				
	.dc.b	138				
						
	.dc.b	16				
						
	.dc.b	247				
	.dc.b	178				
	.dc.b	30				
						
	.dc.b	208				
						
	.dc.b	247				
	.dc.b	213				
	.dc.b	180				
						
	.dc.b	240				
						
	.dc.b	247				
	.dc.b	249				
	.dc.b	76				
						
	.dc.b	48				
						
	.dc.b	248				
	.dc.b	28				
	.dc.b	228				
						
	.dc.b	208				
						
	.dc.b	248				
	.dc.b	64				
	.dc.b	126				
						
	.dc.b	176				
						
	.dc.b	248				
	.dc.b	100				
	.dc.b	25				
						
	.dc.b	240				
						
	.dc.b	248				
	.dc.b	135				
	.dc.b	182				
						
	.dc.b	80				
						
	.dc.b	248				
	.dc.b	171				
	.dc.b	84				
						
	.dc.b	16				
						
	.dc.b	248				
	.dc.b	206				
	.dc.b	243				
						
	.dc.b	16				
						
	.dc.b	248				
	.dc.b	242				
	.dc.b	147				
						
	.dc.b	80				
						
	.dc.b	249				
	.dc.b	22				
	.dc.b	52				
						
	.dc.b	240				
						
	.dc.b	249				
	.dc.b	57				
	.dc.b	215				
						
	.dc.b	176				
						
	.dc.b	249				
	.dc.b	93				
	.dc.b	123				
						
	.dc.b	208				
						
	.dc.b	249				
	.dc.b	129				
	.dc.b	33				
						
	.dc.b	48				
						
	.dc.b	249				
	.dc.b	164				
	.dc.b	199				
						
	.dc.b	208				
						
	.dc.b	249				
	.dc.b	200				
	.dc.b	111				
						
	.dc.b	176				
						
	.dc.b	249				
	.dc.b	236				
	.dc.b	24				
						
	.dc.b	240				
						
	.dc.b	250				
	.dc.b	15				
	.dc.b	195				
						
	.dc.b	112				
						
	.dc.b	250				
	.dc.b	51				
	.dc.b	111				
						
	.dc.b	48				
						
	.dc.b	250				
	.dc.b	87				
	.dc.b	28				
						
	.dc.b	48				
						
	.dc.b	250				
	.dc.b	122				
	.dc.b	202				
						
	.dc.b	112				
						
	.dc.b	250				
	.dc.b	158				
	.dc.b	121				
						
	.dc.b	240				
						
	.dc.b	250				
	.dc.b	194				
	.dc.b	42				
						
	.dc.b	208				
						
	.dc.b	250				
	.dc.b	229				
	.dc.b	220				
						
	.dc.b	208				
						
	.dc.b	251				
	.dc.b	9				
	.dc.b	144				
						
	.dc.b	48				
						
	.dc.b	251				
	.dc.b	45				
	.dc.b	68				
						
	.dc.b	208				
						
	.dc.b	251				
	.dc.b	80				
	.dc.b	250				
						
	.dc.b	176				
						
	.dc.b	251				
	.dc.b	116				
	.dc.b	177				
						
	.dc.b	240				
						
	.dc.b	251				
	.dc.b	152				
	.dc.b	106				
						
	.dc.b	80				
						
	.dc.b	251				
	.dc.b	188				
	.dc.b	36				
						
	.dc.b	16				
						
	.dc.b	251				
	.dc.b	223				
	.dc.b	222				
						
	.dc.b	240				
						
	.dc.b	252				
	.dc.b	3				
	.dc.b	155				
						
	.dc.b	48				
						
	.dc.b	252				
	.dc.b	39				
	.dc.b	88				
						
	.dc.b	176				
						
	.dc.b	252				
	.dc.b	75				
	.dc.b	23				
						
	.dc.b	144				
						
	.dc.b	252				
	.dc.b	110				
	.dc.b	215				
						
	.dc.b	144				
						
	.dc.b	252				
	.dc.b	146				
	.dc.b	152				
						
	.dc.b	208				
						
	.dc.b	252				
	.dc.b	182				
	.dc.b	91				
						
	.dc.b	112				
						
	.dc.b	252				
	.dc.b	218				
	.dc.b	31				
						
	.dc.b	48				
						
	.dc.b	252				
	.dc.b	253				
	.dc.b	228				
						
	.dc.b	80				
						
	.dc.b	253				
	.dc.b	33				
	.dc.b	170				
						
	.dc.b	176				
						
	.dc.b	253				
	.dc.b	69				
	.dc.b	114				
						
	.dc.b	80				
						
	.dc.b	253				
	.dc.b	105				
	.dc.b	59				
						
	.dc.b	48				
						
	.dc.b	253				
	.dc.b	141				
	.dc.b	5				
						
	.dc.b	80				
						
	.dc.b	253				
	.dc.b	176				
	.dc.b	208				
						
	.dc.b	208				
						
	.dc.b	253				
	.dc.b	212				
	.dc.b	157				
						
	.dc.b	112				
						
	.dc.b	253				
	.dc.b	248				
	.dc.b	107				
						
	.dc.b	112				
						
	.dc.b	254				
	.dc.b	28				
	.dc.b	58				
						
	.dc.b	144				
						
	.dc.b	254				
	.dc.b	64				
	.dc.b	11				
						
	.dc.b	16				
						
	.dc.b	254				
	.dc.b	99				
	.dc.b	220				
						
	.dc.b	208				
						
	.dc.b	254				
	.dc.b	135				
	.dc.b	175				
						
	.dc.b	208				
						
	.dc.b	254				
	.dc.b	171				
	.dc.b	132				
						
	.dc.b	16				
						
	.dc.b	254				
	.dc.b	207				
	.dc.b	89				
						
	.dc.b	144				
						
	.dc.b	254				
	.dc.b	243				
	.dc.b	48				
						
	.dc.b	80				
						
	.dc.b	255				
	.dc.b	23				
	.dc.b	8				
						
	.dc.b	80				
						
	.dc.b	255				
	.dc.b	58				
	.dc.b	225				
						
	.dc.b	144				
						
	.dc.b	255				
	.dc.b	94				
	.dc.b	188				
						
	.dc.b	48				
						
	.dc.b	255				
	.dc.b	130				
	.dc.b	151				
						
	.dc.b	240				
						
	.dc.b	255				
	.dc.b	166				
	.dc.b	117				
						
	.dc.b	16				
						
	.dc.b	255				
	.dc.b	202				
	.dc.b	83				
						
	.dc.b	80				
						
	.dc.b	255				
	.dc.b	238				
	.dc.b	50				
						
	.dc.b	240				
						
	.dc.b	128				
	.dc.b	9				
	.dc.b	9				
						
	.dc.b	241				
						
	.dc.b	128				
	.dc.b	26				
	.dc.b	250				
						
	.dc.b	241				
						
	.dc.b	128				
	.dc.b	44				
	.dc.b	236				
						
	.dc.b	145				
						
	.dc.b	128				
	.dc.b	62				
	.dc.b	222				
						
	.dc.b	241				
						
	.dc.b	128				
	.dc.b	80				
	.dc.b	209				
						
	.dc.b	209				
						
	.dc.b	128				
	.dc.b	98				
	.dc.b	197				
						
	.dc.b	113				
						
	.dc.b	128				
	.dc.b	116				
	.dc.b	185				
						
	.dc.b	145				
						
	.dc.b	128				
	.dc.b	134				
	.dc.b	174				
						
	.dc.b	113				
						
	.dc.b	128				
	.dc.b	152				
	.dc.b	163				
						
	.dc.b	209				
						
	.dc.b	128				
	.dc.b	170				
	.dc.b	153				
						
	.dc.b	241				
						
	.dc.b	128				
	.dc.b	188				
	.dc.b	144				
						
	.dc.b	145				
						
	.dc.b	128				
	.dc.b	206				
	.dc.b	135				
						
	.dc.b	241				
						
	.dc.b	128				
	.dc.b	224				
	.dc.b	127				
						
	.dc.b	241				
						
	.dc.b	128				
	.dc.b	242				
	.dc.b	120				
						
	.dc.b	113				
						
	.dc.b	129				
	.dc.b	4				
	.dc.b	113				
						
	.dc.b	177				
						
	.dc.b	129				
	.dc.b	22				
	.dc.b	107				
						
	.dc.b	113				
						
	.dc.b	129				
	.dc.b	40				
	.dc.b	101				
						
	.dc.b	241				
						
	.dc.b	129				
	.dc.b	58				
	.dc.b	97				
						
	.dc.b	17				
						
	.dc.b	129				
	.dc.b	76				
	.dc.b	92				
						
	.dc.b	177				
						
	.dc.b	129				
	.dc.b	94				
	.dc.b	89				
						
	.dc.b	17				
						
	.dc.b	129				
	.dc.b	112				
	.dc.b	86				
						
	.dc.b	17				
						
	.dc.b	129				
	.dc.b	130				
	.dc.b	83				
						
	.dc.b	145				
						
	.dc.b	129				
	.dc.b	148				
	.dc.b	81				
						
	.dc.b	209				
						
	.dc.b	129				
	.dc.b	166				
	.dc.b	80				
						
	.dc.b	145				
						
	.dc.b	129				
	.dc.b	184				
	.dc.b	80				
						
	.dc.b	17				
						
	.dc.b	129				
	.dc.b	202				
	.dc.b	80				
						
	.dc.b	49				
						
	.dc.b	129				
	.dc.b	220				
	.dc.b	80				
						
	.dc.b	209				
						
	.dc.b	129				
	.dc.b	238				
	.dc.b	82				
						
	.dc.b	49				
						
	.dc.b	130				
	.dc.b	0				
	.dc.b	84				
						
	.dc.b	49				
						
	.dc.b	130				
	.dc.b	18				
	.dc.b	86				
						
	.dc.b	177				
						
	.dc.b	130				
	.dc.b	36				
	.dc.b	89				
						
	.dc.b	241				
						
	.dc.b	130				
	.dc.b	54				
	.dc.b	93				
						
	.dc.b	177				
						
	.dc.b	130				
	.dc.b	72				
	.dc.b	98				
						
	.dc.b	49				
						
	.dc.b	130				
	.dc.b	90				
	.dc.b	103				
						
	.dc.b	49				
						
	.dc.b	130				
	.dc.b	108				
	.dc.b	108				
						
	.dc.b	241				
						
	.dc.b	130				
	.dc.b	126				
	.dc.b	115				
						
	.dc.b	49				
						
	.dc.b	130				
	.dc.b	144				
	.dc.b	122				
						
	.dc.b	49				
						
	.dc.b	130				
	.dc.b	162				
	.dc.b	129				
						
	.dc.b	177				
						
	.dc.b	130				
	.dc.b	180				
	.dc.b	137				
						
	.dc.b	241				
						
	.dc.b	130				
	.dc.b	198				
	.dc.b	146				
						
	.dc.b	177				
						
	.dc.b	130				
	.dc.b	216				
	.dc.b	156				
						
	.dc.b	49				
						
	.dc.b	130				
	.dc.b	234				
	.dc.b	166				
						
	.dc.b	49				
						
	.dc.b	130				
	.dc.b	252				
	.dc.b	176				
						
	.dc.b	209				
						
	.dc.b	131				
	.dc.b	14				
	.dc.b	188				
						
	.dc.b	49				
						
	.dc.b	131				
	.dc.b	32				
	.dc.b	200				
						
	.dc.b	17				
						
	.dc.b	131				
	.dc.b	50				
	.dc.b	212				
						
	.dc.b	145				
						
	.dc.b	131				
	.dc.b	68				
	.dc.b	225				
						
	.dc.b	177				
						
	.dc.b	131				
	.dc.b	86				
	.dc.b	239				
						
	.dc.b	113				
						
	.dc.b	131				
	.dc.b	104				
	.dc.b	253				
						
	.dc.b	241				
						
	.dc.b	131				
	.dc.b	123				
	.dc.b	12				
						
	.dc.b	241				
						
	.dc.b	131				
	.dc.b	141				
	.dc.b	28				
						
	.dc.b	145				
						
	.dc.b	131				
	.dc.b	159				
	.dc.b	44				
						
	.dc.b	209				
						
	.dc.b	131				
	.dc.b	177				
	.dc.b	61				
						
	.dc.b	177				
						
	.dc.b	131				
	.dc.b	195				
	.dc.b	79				
						
	.dc.b	49				
						
	.dc.b	131				
	.dc.b	213				
	.dc.b	97				
						
	.dc.b	81				
						
	.dc.b	131				
	.dc.b	231				
	.dc.b	115				
						
	.dc.b	241				
						
	.dc.b	131				
	.dc.b	249				
	.dc.b	135				
						
	.dc.b	81				
						
	.dc.b	132				
	.dc.b	11				
	.dc.b	155				
						
	.dc.b	81				
						
	.dc.b	132				
	.dc.b	29				
	.dc.b	175				
						
	.dc.b	241				
						
	.dc.b	132				
	.dc.b	47				
	.dc.b	197				
						
	.dc.b	17				
						
	.dc.b	132				
	.dc.b	65				
	.dc.b	218				
						
	.dc.b	241				
						
	.dc.b	132				
	.dc.b	83				
	.dc.b	241				
						
	.dc.b	81				
						
	.dc.b	132				
	.dc.b	102				
	.dc.b	8				
						
	.dc.b	113				
						
	.dc.b	132				
	.dc.b	120				
	.dc.b	32				
						
	.dc.b	17				
						
	.dc.b	132				
	.dc.b	138				
	.dc.b	56				
						
	.dc.b	113				
						
	.dc.b	132				
	.dc.b	156				
	.dc.b	81				
						
	.dc.b	81				
						
	.dc.b	132				
	.dc.b	174				
	.dc.b	106				
						
	.dc.b	209				
						
	.dc.b	132				
	.dc.b	192				
	.dc.b	133				
						
	.dc.b	17				
						
	.dc.b	132				
	.dc.b	210				
	.dc.b	159				
						
	.dc.b	209				
						
	.dc.b	132				
	.dc.b	228				
	.dc.b	187				
						
	.dc.b	49				
						
	.dc.b	132				
	.dc.b	246				
	.dc.b	215				
						
	.dc.b	49				
						
	.dc.b	133				
	.dc.b	8				
	.dc.b	243				
						
	.dc.b	209				
						
	.dc.b	133				
	.dc.b	27				
	.dc.b	17				
						
	.dc.b	17				
						
	.dc.b	133				
	.dc.b	45				
	.dc.b	46				
						
	.dc.b	209				
						
	.dc.b	133				
	.dc.b	63				
	.dc.b	77				
						
	.dc.b	81				
						
	.dc.b	133				
	.dc.b	81				
	.dc.b	108				
						
	.dc.b	113				
						
	.dc.b	133				
	.dc.b	99				
	.dc.b	140				
						
	.dc.b	17				
						
	.dc.b	133				
	.dc.b	117				
	.dc.b	172				
						
	.dc.b	113				
						
	.dc.b	133				
	.dc.b	135				
	.dc.b	205				
						
	.dc.b	81				
						
	.dc.b	133				
	.dc.b	153				
	.dc.b	238				
						
	.dc.b	241				
						
	.dc.b	133				
	.dc.b	172				
	.dc.b	17				
						
	.dc.b	17				
						
	.dc.b	133				
	.dc.b	190				
	.dc.b	51				
						
	.dc.b	209				
						
	.dc.b	133				
	.dc.b	208				
	.dc.b	87				
						
	.dc.b	49				
						
	.dc.b	133				
	.dc.b	226				
	.dc.b	123				
						
	.dc.b	49				
						
	.dc.b	133				
	.dc.b	244				
	.dc.b	159				
						
	.dc.b	209				
						
	.dc.b	134				
	.dc.b	6				
	.dc.b	197				
						
	.dc.b	17				
						
	.dc.b	134				
	.dc.b	24				
	.dc.b	234				
						
	.dc.b	241				
						
	.dc.b	134				
	.dc.b	43				
	.dc.b	17				
						
	.dc.b	113				
						
	.dc.b	134				
	.dc.b	61				
	.dc.b	56				
						
	.dc.b	113				
						
	.dc.b	134				
	.dc.b	79				
	.dc.b	96				
						
	.dc.b	49				
						
	.dc.b	134				
	.dc.b	97				
	.dc.b	136				
						
	.dc.b	113				
						
	.dc.b	134				
	.dc.b	115				
	.dc.b	177				
						
	.dc.b	81				
						
	.dc.b	134				
	.dc.b	133				
	.dc.b	218				
						
	.dc.b	241				
						
	.dc.b	134				
	.dc.b	152				
	.dc.b	5				
						
	.dc.b	17				
						
	.dc.b	134				
	.dc.b	170				
	.dc.b	47				
						
	.dc.b	209				
						
	.dc.b	134				
	.dc.b	188				
	.dc.b	91				
						
	.dc.b	49				
						
	.dc.b	134				
	.dc.b	206				
	.dc.b	135				
						
	.dc.b	49				
						
	.dc.b	134				
	.dc.b	224				
	.dc.b	179				
						
	.dc.b	209				
						
	.dc.b	134				
	.dc.b	242				
	.dc.b	224				
						
	.dc.b	241				
						
	.dc.b	135				
	.dc.b	5				
	.dc.b	14				
						
	.dc.b	209				
						
	.dc.b	135				
	.dc.b	23				
	.dc.b	61				
						
	.dc.b	49				
						
	.dc.b	135				
	.dc.b	41				
	.dc.b	108				
						
	.dc.b	49				
						
	.dc.b	135				
	.dc.b	59				
	.dc.b	155				
						
	.dc.b	241				
						
	.dc.b	135				
	.dc.b	77				
	.dc.b	204				
						
	.dc.b	49				
						
	.dc.b	135				
	.dc.b	95				
	.dc.b	253				
						
	.dc.b	17				
						
	.dc.b	135				
	.dc.b	114				
	.dc.b	46				
						
	.dc.b	145				
						
	.dc.b	135				
	.dc.b	132				
	.dc.b	96				
						
	.dc.b	177				
						
	.dc.b	135				
	.dc.b	150				
	.dc.b	147				
						
	.dc.b	81				
						
	.dc.b	135				
	.dc.b	168				
	.dc.b	198				
						
	.dc.b	177				
						
	.dc.b	135				
	.dc.b	186				
	.dc.b	250				
						
	.dc.b	145				
						
	.dc.b	135				
	.dc.b	205				
	.dc.b	47				
						
	.dc.b	49				
						
	.dc.b	135				
	.dc.b	223				
	.dc.b	100				
						
	.dc.b	81				
						
	.dc.b	135				
	.dc.b	241				
	.dc.b	154				
						
	.dc.b	17				
						
	.dc.b	136				
	.dc.b	3				
	.dc.b	208				
						
	.dc.b	113				
						
	.dc.b	136				
	.dc.b	22				
	.dc.b	7				
						
	.dc.b	113				
						
	.dc.b	136				
	.dc.b	40				
	.dc.b	62				
						
	.dc.b	241				
						
	.dc.b	136				
	.dc.b	58				
	.dc.b	119				
						
	.dc.b	49				
						
	.dc.b	136				
	.dc.b	76				
	.dc.b	176				
						
	.dc.b	17				
						
	.dc.b	136				
	.dc.b	94				
	.dc.b	233				
						
	.dc.b	113				
						
	.dc.b	136				
	.dc.b	113				
	.dc.b	35				
						
	.dc.b	113				
						
	.dc.b	136				
	.dc.b	131				
	.dc.b	94				
						
	.dc.b	17				
						
	.dc.b	136				
	.dc.b	149				
	.dc.b	153				
						
	.dc.b	81				
						
	.dc.b	136				
	.dc.b	167				
	.dc.b	213				
						
	.dc.b	49				
						
	.dc.b	136				
	.dc.b	186				
	.dc.b	17				
						
	.dc.b	177				
						
	.dc.b	136				
	.dc.b	204				
	.dc.b	78				
						
	.dc.b	177				
						
	.dc.b	136				
	.dc.b	222				
	.dc.b	140				
						
	.dc.b	113				
						
	.dc.b	136				
	.dc.b	240				
	.dc.b	202				
						
	.dc.b	177				
						
	.dc.b	137				
	.dc.b	3				
	.dc.b	9				
						
	.dc.b	145				
						
	.dc.b	137				
	.dc.b	21				
	.dc.b	73				
						
	.dc.b	17				
						
	.dc.b	137				
	.dc.b	39				
	.dc.b	137				
						
	.dc.b	49				
						
	.dc.b	137				
	.dc.b	57				
	.dc.b	201				
						
	.dc.b	241				
						
	.dc.b	137				
	.dc.b	76				
	.dc.b	11				
						
	.dc.b	49				
						
	.dc.b	137				
	.dc.b	94				
	.dc.b	77				
						
	.dc.b	49				
						
	.dc.b	137				
	.dc.b	112				
	.dc.b	143				
						
	.dc.b	177				
						
	.dc.b	137				
	.dc.b	130				
	.dc.b	210				
						
	.dc.b	209				
						
	.dc.b	137				
	.dc.b	149				
	.dc.b	22				
						
	.dc.b	145				
						
	.dc.b	137				
	.dc.b	167				
	.dc.b	90				
						
	.dc.b	241				
						
	.dc.b	137				
	.dc.b	185				
	.dc.b	159				
						
	.dc.b	241				
						
	.dc.b	137				
	.dc.b	203				
	.dc.b	229				
						
	.dc.b	113				
						
	.dc.b	137				
	.dc.b	222				
	.dc.b	43				
						
	.dc.b	177				
						
	.dc.b	137				
	.dc.b	240				
	.dc.b	114				
						
	.dc.b	113				
						
	.dc.b	138				
	.dc.b	2				
	.dc.b	185				
						
	.dc.b	209				
						
	.dc.b	138				
	.dc.b	21				
	.dc.b	1				
						
	.dc.b	209				
						
	.dc.b	138				
	.dc.b	39				
	.dc.b	74				
						
	.dc.b	113				
						
	.dc.b	138				
	.dc.b	57				
	.dc.b	147				
						
	.dc.b	145				
						
	.dc.b	138				
	.dc.b	75				
	.dc.b	221				
						
	.dc.b	113				
						
	.dc.b	138				
	.dc.b	94				
	.dc.b	39				
						
	.dc.b	209				
						
	.dc.b	138				
	.dc.b	112				
	.dc.b	114				
						
	.dc.b	209				
						
	.dc.b	138				
	.dc.b	130				
	.dc.b	190				
						
	.dc.b	113				
						
	.dc.b	138				
	.dc.b	149				
	.dc.b	10				
						
	.dc.b	177				
						
	.dc.b	138				
	.dc.b	167				
	.dc.b	87				
						
	.dc.b	113				
						
	.dc.b	138				
	.dc.b	185				
	.dc.b	164				
						
	.dc.b	241				
						
	.dc.b	138				
	.dc.b	203				
	.dc.b	242				
						
	.dc.b	241				
						
	.dc.b	138				
	.dc.b	222				
	.dc.b	65				
						
	.dc.b	145				
						
	.dc.b	138				
	.dc.b	240				
	.dc.b	144				
						
	.dc.b	209				
						
	.dc.b	139				
	.dc.b	2				
	.dc.b	224				
						
	.dc.b	177				
						
	.dc.b	139				
	.dc.b	21				
	.dc.b	49				
						
	.dc.b	49				
						
	.dc.b	139				
	.dc.b	39				
	.dc.b	130				
						
	.dc.b	49				
						
	.dc.b	139				
	.dc.b	57				
	.dc.b	211				
						
	.dc.b	209				
						
	.dc.b	139				
	.dc.b	76				
	.dc.b	38				
						
	.dc.b	17				
						
	.dc.b	139				
	.dc.b	94				
	.dc.b	120				
						
	.dc.b	241				
						
	.dc.b	139				
	.dc.b	112				
	.dc.b	204				
						
	.dc.b	113				
						
	.dc.b	139				
	.dc.b	131				
	.dc.b	32				
						
	.dc.b	113				
						
	.dc.b	139				
	.dc.b	149				
	.dc.b	117				
						
	.dc.b	49				
						
	.dc.b	139				
	.dc.b	167				
	.dc.b	202				
						
	.dc.b	113				
						
	.dc.b	139				
	.dc.b	186				
	.dc.b	32				
						
	.dc.b	81				
						
	.dc.b	139				
	.dc.b	204				
	.dc.b	118				
						
	.dc.b	209				
						
	.dc.b	139				
	.dc.b	222				
	.dc.b	205				
						
	.dc.b	209				
						
	.dc.b	139				
	.dc.b	241				
	.dc.b	37				
						
	.dc.b	113				
						
	.dc.b	140				
	.dc.b	3				
	.dc.b	125				
						
	.dc.b	209				
						
	.dc.b	140				
	.dc.b	21				
	.dc.b	214				
						
	.dc.b	177				
						
	.dc.b	140				
	.dc.b	40				
	.dc.b	48				
						
	.dc.b	17				
						
	.dc.b	140				
	.dc.b	58				
	.dc.b	138				
						
	.dc.b	49				
						
	.dc.b	140				
	.dc.b	76				
	.dc.b	228				
						
	.dc.b	241				
						
	.dc.b	140				
	.dc.b	95				
	.dc.b	64				
						
	.dc.b	49				
						
	.dc.b	140				
	.dc.b	113				
	.dc.b	156				
						
	.dc.b	17				
						
	.dc.b	140				
	.dc.b	131				
	.dc.b	248				
						
	.dc.b	145				
						
	.dc.b	140				
	.dc.b	150				
	.dc.b	85				
						
	.dc.b	145				
						
	.dc.b	140				
	.dc.b	168				
	.dc.b	179				
						
	.dc.b	81				
						
	.dc.b	140				
	.dc.b	187				
	.dc.b	17				
						
	.dc.b	145				
						
	.dc.b	140				
	.dc.b	205				
	.dc.b	112				
						
	.dc.b	113				
						
	.dc.b	140				
	.dc.b	223				
	.dc.b	207				
						
	.dc.b	241				
						
	.dc.b	140				
	.dc.b	242				
	.dc.b	47				
						
	.dc.b	241				
						
	.dc.b	141				
	.dc.b	4				
	.dc.b	144				
						
	.dc.b	177				
						
	.dc.b	141				
	.dc.b	22				
	.dc.b	241				
						
	.dc.b	241				
						
	.dc.b	141				
	.dc.b	41				
	.dc.b	83				
						
	.dc.b	209				
						
	.dc.b	141				
	.dc.b	59				
	.dc.b	182				
						
	.dc.b	81				
						
	.dc.b	141				
	.dc.b	78				
	.dc.b	25				
						
	.dc.b	81				
						
	.dc.b	141				
	.dc.b	96				
	.dc.b	124				
						
	.dc.b	241				
						
	.dc.b	141				
	.dc.b	114				
	.dc.b	225				
						
	.dc.b	81				
						
	.dc.b	141				
	.dc.b	133				
	.dc.b	70				
						
	.dc.b	49				
						
	.dc.b	141				
	.dc.b	151				
	.dc.b	171				
						
	.dc.b	145				
						
	.dc.b	141				
	.dc.b	170				
	.dc.b	17				
						
	.dc.b	177				
						
	.dc.b	141				
	.dc.b	188				
	.dc.b	120				
						
	.dc.b	81				
						
	.dc.b	141				
	.dc.b	206				
	.dc.b	223				
						
	.dc.b	145				
						
	.dc.b	141				
	.dc.b	225				
	.dc.b	71				
						
	.dc.b	113				
						
	.dc.b	141				
	.dc.b	243				
	.dc.b	175				
						
	.dc.b	209				
						
	.dc.b	142				
	.dc.b	6				
	.dc.b	24				
						
	.dc.b	241				
						
	.dc.b	142				
	.dc.b	24				
	.dc.b	130				
						
	.dc.b	145				
						
	.dc.b	142				
	.dc.b	42				
	.dc.b	236				
						
	.dc.b	209				
						
	.dc.b	142				
	.dc.b	61				
	.dc.b	87				
						
	.dc.b	145				
						
	.dc.b	142				
	.dc.b	79				
	.dc.b	195				
						
	.dc.b	17				
						
	.dc.b	142				
	.dc.b	98				
	.dc.b	47				
						
	.dc.b	17				
						
	.dc.b	142				
	.dc.b	116				
	.dc.b	155				
						
	.dc.b	177				
						
	.dc.b	142				
	.dc.b	135				
	.dc.b	8				
						
	.dc.b	241				
						
	.dc.b	142				
	.dc.b	153				
	.dc.b	118				
						
	.dc.b	177				
						
	.dc.b	142				
	.dc.b	171				
	.dc.b	229				
						
	.dc.b	49				
						
	.dc.b	142				
	.dc.b	190				
	.dc.b	84				
						
	.dc.b	49				
						
	.dc.b	142				
	.dc.b	208				
	.dc.b	195				
						
	.dc.b	177				
						
	.dc.b	142				
	.dc.b	227				
	.dc.b	51				
						
	.dc.b	241				
						
	.dc.b	142				
	.dc.b	245				
	.dc.b	164				
						
	.dc.b	177				
						
	.dc.b	143				
	.dc.b	8				
	.dc.b	22				
						
	.dc.b	17				
						
	.dc.b	143				
	.dc.b	26				
	.dc.b	136				
						
	.dc.b	17				
						
	.dc.b	143				
	.dc.b	44				
	.dc.b	250				
						
	.dc.b	177				
						
	.dc.b	143				
	.dc.b	63				
	.dc.b	109				
						
	.dc.b	209				
						
	.dc.b	143				
	.dc.b	81				
	.dc.b	225				
						
	.dc.b	145				
						
	.dc.b	143				
	.dc.b	100				
	.dc.b	85				
						
	.dc.b	241				
						
	.dc.b	143				
	.dc.b	118				
	.dc.b	202				
						
	.dc.b	241				
						
	.dc.b	143				
	.dc.b	137				
	.dc.b	64				
						
	.dc.b	113				
						
	.dc.b	143				
	.dc.b	155				
	.dc.b	182				
						
	.dc.b	145				
						
	.dc.b	143				
	.dc.b	174				
	.dc.b	45				
						
	.dc.b	81				
						
	.dc.b	143				
	.dc.b	192				
	.dc.b	164				
						
	.dc.b	145				
						
	.dc.b	143				
	.dc.b	211				
	.dc.b	28				
						
	.dc.b	145				
						
	.dc.b	143				
	.dc.b	229				
	.dc.b	149				
						
	.dc.b	17				
						
	.dc.b	143				
	.dc.b	248				
	.dc.b	14				
						
	.dc.b	49				
						
	.dc.b	144				
	.dc.b	10				
	.dc.b	135				
						
	.dc.b	209				
						
	.dc.b	144				
	.dc.b	29				
	.dc.b	2				
						
	.dc.b	49				
						
	.dc.b	144				
	.dc.b	47				
	.dc.b	125				
						
	.dc.b	17				
						
	.dc.b	144				
	.dc.b	65				
	.dc.b	248				
						
	.dc.b	113				
						
	.dc.b	144				
	.dc.b	84				
	.dc.b	116				
						
	.dc.b	145				
						
	.dc.b	144				
	.dc.b	102				
	.dc.b	241				
						
	.dc.b	49				
						
	.dc.b	144				
	.dc.b	121				
	.dc.b	110				
						
	.dc.b	113				
						
	.dc.b	144				
	.dc.b	139				
	.dc.b	236				
						
	.dc.b	81				
						
	.dc.b	144				
	.dc.b	158				
	.dc.b	106				
						
	.dc.b	177				
						
	.dc.b	144				
	.dc.b	176				
	.dc.b	233				
						
	.dc.b	177				
						
	.dc.b	144				
	.dc.b	195				
	.dc.b	105				
						
	.dc.b	81				
						
	.dc.b	144				
	.dc.b	213				
	.dc.b	233				
						
	.dc.b	145				
						
	.dc.b	144				
	.dc.b	232				
	.dc.b	106				
						
	.dc.b	81				
						
	.dc.b	144				
	.dc.b	250				
	.dc.b	235				
						
	.dc.b	177				
						
	.dc.b	145				
	.dc.b	13				
	.dc.b	109				
						
	.dc.b	177				
						
	.dc.b	145				
	.dc.b	31				
	.dc.b	240				
						
	.dc.b	81				
						
	.dc.b	145				
	.dc.b	50				
	.dc.b	115				
						
	.dc.b	113				
						
	.dc.b	145				
	.dc.b	68				
	.dc.b	247				
						
	.dc.b	49				
						
	.dc.b	145				
	.dc.b	87				
	.dc.b	123				
						
	.dc.b	145				
						
	.dc.b	145				
	.dc.b	106				
	.dc.b	0				
						
	.dc.b	113				
						
	.dc.b	145				
	.dc.b	124				
	.dc.b	133				
						
	.dc.b	241				
						
	.dc.b	145				
	.dc.b	143				
	.dc.b	12				
						
	.dc.b	17				
						
	.dc.b	145				
	.dc.b	161				
	.dc.b	146				
						
	.dc.b	209				
						
	.dc.b	145				
	.dc.b	180				
	.dc.b	26				
						
	.dc.b	17				
						
	.dc.b	145				
	.dc.b	198				
	.dc.b	161				
						
	.dc.b	241				
						
	.dc.b	145				
	.dc.b	217				
	.dc.b	42				
						
	.dc.b	113				
						
	.dc.b	145				
	.dc.b	235				
	.dc.b	179				
						
	.dc.b	113				
						
	.dc.b	145				
	.dc.b	254				
	.dc.b	61				
						
	.dc.b	17				
						
	.dc.b	146				
	.dc.b	16				
	.dc.b	199				
						
	.dc.b	81				
						
	.dc.b	146				
	.dc.b	35				
	.dc.b	82				
						
	.dc.b	49				
						
	.dc.b	146				
	.dc.b	53				
	.dc.b	221				
						
	.dc.b	145				
						
	.dc.b	146				
	.dc.b	72				
	.dc.b	105				
						
	.dc.b	145				
						
	.dc.b	146				
	.dc.b	90				
	.dc.b	246				
						
	.dc.b	17				
						
	.dc.b	146				
	.dc.b	109				
	.dc.b	131				
						
	.dc.b	81				
						
	.dc.b	146				
	.dc.b	128				
	.dc.b	17				
						
	.dc.b	17				
						
	.dc.b	146				
	.dc.b	146				
	.dc.b	159				
						
	.dc.b	113				
						
	.dc.b	146				
	.dc.b	165				
	.dc.b	46				
						
	.dc.b	81				
						
	.dc.b	146				
	.dc.b	183				
	.dc.b	189				
						
	.dc.b	209				
						
	.dc.b	146				
	.dc.b	202				
	.dc.b	77				
						
	.dc.b	241				
						
	.dc.b	146				
	.dc.b	220				
	.dc.b	222				
						
	.dc.b	177				
						
	.dc.b	146				
	.dc.b	239				
	.dc.b	111				
						
	.dc.b	241				
						
	.dc.b	147				
	.dc.b	2				
	.dc.b	1				
						
	.dc.b	209				
						
	.dc.b	147				
	.dc.b	20				
	.dc.b	148				
						
	.dc.b	49				
						
	.dc.b	147				
	.dc.b	39				
	.dc.b	39				
						
	.dc.b	81				
						
	.dc.b	147				
	.dc.b	57				
	.dc.b	186				
						
	.dc.b	241				
						
	.dc.b	147				
	.dc.b	76				
	.dc.b	79				
						
	.dc.b	17				
						
	.dc.b	147				
	.dc.b	94				
	.dc.b	227				
						
	.dc.b	241				
						
	.dc.b	147				
	.dc.b	113				
	.dc.b	121				
						
	.dc.b	81				
						
	.dc.b	147				
	.dc.b	132				
	.dc.b	15				
						
	.dc.b	81				
						
	.dc.b	147				
	.dc.b	150				
	.dc.b	165				
						
	.dc.b	209				
						
	.dc.b	147				
	.dc.b	169				
	.dc.b	60				
						
	.dc.b	241				
						
	.dc.b	147				
	.dc.b	187				
	.dc.b	212				
						
	.dc.b	177				
						
	.dc.b	147				
	.dc.b	206				
	.dc.b	108				
						
	.dc.b	241				
						
	.dc.b	147				
	.dc.b	225				
	.dc.b	5				
						
	.dc.b	241				
						
	.dc.b	147				
	.dc.b	243				
	.dc.b	159				
						
	.dc.b	81				
						
	.dc.b	148				
	.dc.b	6				
	.dc.b	57				
						
	.dc.b	113				
						
	.dc.b	148				
	.dc.b	24				
	.dc.b	212				
						
	.dc.b	17				
						
	.dc.b	148				
	.dc.b	43				
	.dc.b	111				
						
	.dc.b	81				
						
	.dc.b	148				
	.dc.b	62				
	.dc.b	11				
						
	.dc.b	49				
						
	.dc.b	148				
	.dc.b	80				
	.dc.b	167				
						
	.dc.b	145				
						
	.dc.b	148				
	.dc.b	99				
	.dc.b	68				
						
	.dc.b	145				
						
	.dc.b	148				
	.dc.b	117				
	.dc.b	226				
						
	.dc.b	17				
						
	.dc.b	148				
	.dc.b	136				
	.dc.b	128				
						
	.dc.b	49				
						
	.dc.b	148				
	.dc.b	155				
	.dc.b	30				
						
	.dc.b	241				
						
	.dc.b	148				
	.dc.b	173				
	.dc.b	190				
						
	.dc.b	81				
						
	.dc.b	148				
	.dc.b	192				
	.dc.b	94				
						
	.dc.b	49				
						
	.dc.b	148				
	.dc.b	210				
	.dc.b	254				
						
	.dc.b	177				
						
	.dc.b	148				
	.dc.b	229				
	.dc.b	159				
						
	.dc.b	209				
						
	.dc.b	148				
	.dc.b	248				
	.dc.b	65				
						
	.dc.b	113				
						
	.dc.b	149				
	.dc.b	10				
	.dc.b	227				
						
	.dc.b	177				
						
	.dc.b	149				
	.dc.b	29				
	.dc.b	134				
						
	.dc.b	113				
						
	.dc.b	149				
	.dc.b	48				
	.dc.b	41				
						
	.dc.b	209				
						
	.dc.b	149				
	.dc.b	66				
	.dc.b	205				
						
	.dc.b	209				
						
	.dc.b	149				
	.dc.b	85				
	.dc.b	114				
						
	.dc.b	113				
						
	.dc.b	149				
	.dc.b	104				
	.dc.b	23				
						
	.dc.b	145				
						
	.dc.b	149				
	.dc.b	122				
	.dc.b	189				
						
	.dc.b	81				
						
	.dc.b	149				
	.dc.b	141				
	.dc.b	99				
						
	.dc.b	145				
						
	.dc.b	149				
	.dc.b	160				
	.dc.b	10				
						
	.dc.b	113				
						
	.dc.b	149				
	.dc.b	178				
	.dc.b	177				
						
	.dc.b	241				
						
	.dc.b	149				
	.dc.b	197				
	.dc.b	90				
						
	.dc.b	17				
						
	.dc.b	149				
	.dc.b	216				
	.dc.b	2				
						
	.dc.b	177				
						
	.dc.b	149				
	.dc.b	234				
	.dc.b	171				
						
	.dc.b	209				
						
	.dc.b	149				
	.dc.b	253				
	.dc.b	85				
						
	.dc.b	177				
						
	.dc.b	150				
	.dc.b	16				
	.dc.b	0				
						
	.dc.b	17				
						
	.dc.b	150				
	.dc.b	34				
	.dc.b	170				
						
	.dc.b	241				
						
	.dc.b	150				
	.dc.b	53				
	.dc.b	86				
						
	.dc.b	145				
						
	.dc.b	150				
	.dc.b	72				
	.dc.b	2				
						
	.dc.b	177				
						
	.dc.b	150				
	.dc.b	90				
	.dc.b	175				
						
	.dc.b	81				
						
	.dc.b	150				
	.dc.b	109				
	.dc.b	92				
						
	.dc.b	145				
						
	.dc.b	150				
	.dc.b	128				
	.dc.b	10				
						
	.dc.b	113				
						
	.dc.b	150				
	.dc.b	146				
	.dc.b	184				
						
	.dc.b	241				
						
	.dc.b	150				
	.dc.b	165				
	.dc.b	103				
						
	.dc.b	241				
						
	.dc.b	150				
	.dc.b	184				
	.dc.b	23				
						
	.dc.b	145				
						
	.dc.b	150				
	.dc.b	202				
	.dc.b	199				
						
	.dc.b	177				
						
	.dc.b	150				
	.dc.b	221				
	.dc.b	120				
						
	.dc.b	113				
						
	.dc.b	150				
	.dc.b	240				
	.dc.b	41				
						
	.dc.b	209				
						
	.dc.b	151				
	.dc.b	2				
	.dc.b	219				
						
	.dc.b	177				
						
	.dc.b	151				
	.dc.b	21				
	.dc.b	142				
						
	.dc.b	49				
						
	.dc.b	151				
	.dc.b	40				
	.dc.b	65				
						
	.dc.b	81				
						
	.dc.b	151				
	.dc.b	58				
	.dc.b	244				
						
	.dc.b	241				
						
	.dc.b	151				
	.dc.b	77				
	.dc.b	169				
						
	.dc.b	49				
						
	.dc.b	151				
	.dc.b	96				
	.dc.b	93				
						
	.dc.b	241				
						
	.dc.b	151				
	.dc.b	115				
	.dc.b	19				
						
	.dc.b	81				
						
	.dc.b	151				
	.dc.b	133				
	.dc.b	201				
						
	.dc.b	81				
						
	.dc.b	151				
	.dc.b	152				
	.dc.b	127				
						
	.dc.b	209				
						
	.dc.b	151				
	.dc.b	171				
	.dc.b	54				
						
	.dc.b	241				
						
	.dc.b	151				
	.dc.b	189				
	.dc.b	238				
						
	.dc.b	145				
						
	.dc.b	151				
	.dc.b	208				
	.dc.b	166				
						
	.dc.b	241				
						
	.dc.b	151				
	.dc.b	227				
	.dc.b	95				
						
	.dc.b	177				
						
	.dc.b	151				
	.dc.b	246				
	.dc.b	25				
						
	.dc.b	49				
						
	.dc.b	152				
	.dc.b	8				
	.dc.b	211				
						
	.dc.b	49				
						
	.dc.b	152				
	.dc.b	27				
	.dc.b	141				
						
	.dc.b	177				
						
	.dc.b	152				
	.dc.b	46				
	.dc.b	72				
						
	.dc.b	241				
						
	.dc.b	152				
	.dc.b	65				
	.dc.b	4				
						
	.dc.b	145				
						
	.dc.b	152				
	.dc.b	83				
	.dc.b	192				
						
	.dc.b	241				
						
	.dc.b	152				
	.dc.b	102				
	.dc.b	125				
						
	.dc.b	209				
						
	.dc.b	152				
	.dc.b	121				
	.dc.b	59				
						
	.dc.b	81				
						
	.dc.b	152				
	.dc.b	139				
	.dc.b	249				
						
	.dc.b	81				
						
	.dc.b	152				
	.dc.b	158				
	.dc.b	183				
						
	.dc.b	241				
						
	.dc.b	152				
	.dc.b	177				
	.dc.b	119				
						
	.dc.b	17				
						
	.dc.b	152				
	.dc.b	196				
	.dc.b	54				
						
	.dc.b	209				
						
	.dc.b	152				
	.dc.b	214				
	.dc.b	247				
						
	.dc.b	49				
						
	.dc.b	152				
	.dc.b	233				
	.dc.b	184				
						
	.dc.b	17				
						
	.dc.b	152				
	.dc.b	252				
	.dc.b	121				
						
	.dc.b	145				
						
	.dc.b	153				
	.dc.b	15				
	.dc.b	59				
						
	.dc.b	177				
						
	.dc.b	153				
	.dc.b	33				
	.dc.b	254				
						
	.dc.b	81				
						
	.dc.b	153				
	.dc.b	52				
	.dc.b	193				
						
	.dc.b	145				
						
	.dc.b	153				
	.dc.b	71				
	.dc.b	133				
						
	.dc.b	81				
						
	.dc.b	153				
	.dc.b	90				
	.dc.b	73				
						
	.dc.b	177				
						
	.dc.b	153				
	.dc.b	109				
	.dc.b	14				
						
	.dc.b	145				
						
	.dc.b	153				
	.dc.b	127				
	.dc.b	212				
						
	.dc.b	17				
						
	.dc.b	153				
	.dc.b	146				
	.dc.b	154				
						
	.dc.b	49				
						
	.dc.b	153				
	.dc.b	165				
	.dc.b	96				
						
	.dc.b	209				
						
	.dc.b	153				
	.dc.b	184				
	.dc.b	40				
						
	.dc.b	17				
						
	.dc.b	153				
	.dc.b	202				
	.dc.b	239				
						
	.dc.b	241				
						
	.dc.b	153				
	.dc.b	221				
	.dc.b	184				
						
	.dc.b	81				
						
	.dc.b	153				
	.dc.b	240				
	.dc.b	129				
						
	.dc.b	49				
						
	.dc.b	154				
	.dc.b	3				
	.dc.b	74				
						
	.dc.b	177				
						
	.dc.b	154				
	.dc.b	22				
	.dc.b	20				
						
	.dc.b	209				
						
	.dc.b	154				
	.dc.b	40				
	.dc.b	223				
						
	.dc.b	113				
						
	.dc.b	154				
	.dc.b	59				
	.dc.b	170				
						
	.dc.b	177				
						
	.dc.b	154				
	.dc.b	78				
	.dc.b	118				
						
	.dc.b	145				
						
	.dc.b	154				
	.dc.b	97				
	.dc.b	66				
						
	.dc.b	241				
						
	.dc.b	154				
	.dc.b	116				
	.dc.b	15				
						
	.dc.b	241				
						
	.dc.b	154				
	.dc.b	134				
	.dc.b	221				
						
	.dc.b	113				
						
	.dc.b	154				
	.dc.b	153				
	.dc.b	171				
						
	.dc.b	145				
						
	.dc.b	154				
	.dc.b	172				
	.dc.b	122				
						
	.dc.b	49				
						
	.dc.b	154				
	.dc.b	191				
	.dc.b	73				
						
	.dc.b	113				
						
	.dc.b	154				
	.dc.b	210				
	.dc.b	25				
						
	.dc.b	81				
						
	.dc.b	154				
	.dc.b	228				
	.dc.b	233				
						
	.dc.b	177				
						
	.dc.b	154				
	.dc.b	247				
	.dc.b	186				
						
	.dc.b	177				
						
	.dc.b	155				
	.dc.b	10				
	.dc.b	140				
						
	.dc.b	49				
						
	.dc.b	155				
	.dc.b	29				
	.dc.b	94				
						
	.dc.b	81				
						
	.dc.b	155				
	.dc.b	48				
	.dc.b	48				
						
	.dc.b	241				
						
	.dc.b	155				
	.dc.b	67				
	.dc.b	4				
						
	.dc.b	49				
						
	.dc.b	155				
	.dc.b	85				
	.dc.b	216				
						
	.dc.b	17				
						
	.dc.b	155				
	.dc.b	104				
	.dc.b	172				
						
	.dc.b	113				
						
	.dc.b	155				
	.dc.b	123				
	.dc.b	129				
						
	.dc.b	81				
						
	.dc.b	155				
	.dc.b	142				
	.dc.b	86				
						
	.dc.b	241				
						
	.dc.b	155				
	.dc.b	161				
	.dc.b	44				
						
	.dc.b	241				
						
	.dc.b	155				
	.dc.b	180				
	.dc.b	3				
						
	.dc.b	177				
						
	.dc.b	155				
	.dc.b	198				
	.dc.b	218				
						
	.dc.b	241				
						
	.dc.b	155				
	.dc.b	217				
	.dc.b	178				
						
	.dc.b	177				
						
	.dc.b	155				
	.dc.b	236				
	.dc.b	139				
						
	.dc.b	17				
						
	.dc.b	155				
	.dc.b	255				
	.dc.b	100				
						
	.dc.b	17				
						
	.dc.b	156				
	.dc.b	18				
	.dc.b	61				
						
	.dc.b	145				
						
	.dc.b	156				
	.dc.b	37				
	.dc.b	23				
						
	.dc.b	145				
						
	.dc.b	156				
	.dc.b	55				
	.dc.b	242				
						
	.dc.b	81				
						
	.dc.b	156				
	.dc.b	74				
	.dc.b	205				
						
	.dc.b	113				
						
	.dc.b	156				
	.dc.b	93				
	.dc.b	169				
						
	.dc.b	81				
						
	.dc.b	156				
	.dc.b	112				
	.dc.b	133				
						
	.dc.b	177				
						
	.dc.b	156				
	.dc.b	131				
	.dc.b	98				
						
	.dc.b	145				
						
	.dc.b	156				
	.dc.b	150				
	.dc.b	64				
						
	.dc.b	17				
						
	.dc.b	156				
	.dc.b	169				
	.dc.b	30				
						
	.dc.b	49				
						
	.dc.b	156				
	.dc.b	187				
	.dc.b	252				
						
	.dc.b	209				
						
	.dc.b	156				
	.dc.b	206				
	.dc.b	219				
						
	.dc.b	241				
						
	.dc.b	156				
	.dc.b	225				
	.dc.b	187				
						
	.dc.b	209				
						
	.dc.b	156				
	.dc.b	244				
	.dc.b	156				
						
	.dc.b	17				
						
	.dc.b	157				
	.dc.b	7				
	.dc.b	124				
						
	.dc.b	241				
						
	.dc.b	157				
	.dc.b	26				
	.dc.b	94				
						
	.dc.b	113				
						
	.dc.b	157				
	.dc.b	45				
	.dc.b	64				
						
	.dc.b	145				
						
	.dc.b	157				
	.dc.b	64				
	.dc.b	35				
						
	.dc.b	17				
						
	.dc.b	157				
	.dc.b	83				
	.dc.b	6				
						
	.dc.b	81				
						
	.dc.b	157				
	.dc.b	101				
	.dc.b	234				
						
	.dc.b	17				
						
	.dc.b	157				
	.dc.b	120				
	.dc.b	206				
						
	.dc.b	81				
						
	.dc.b	157				
	.dc.b	139				
	.dc.b	179				
						
	.dc.b	49				
						
	.dc.b	157				
	.dc.b	158				
	.dc.b	152				
						
	.dc.b	177				
						
	.dc.b	157				
	.dc.b	177				
	.dc.b	126				
						
	.dc.b	177				
						
	.dc.b	157				
	.dc.b	196				
	.dc.b	101				
						
	.dc.b	49				
						
	.dc.b	157				
	.dc.b	215				
	.dc.b	76				
						
	.dc.b	113				
						
	.dc.b	157				
	.dc.b	234				
	.dc.b	52				
						
	.dc.b	17				
						
	.dc.b	157				
	.dc.b	253				
	.dc.b	28				
						
	.dc.b	81				
						
	.dc.b	158				
	.dc.b	16				
	.dc.b	5				
						
	.dc.b	49				
						
	.dc.b	158				
	.dc.b	34				
	.dc.b	238				
						
	.dc.b	145				
						
	.dc.b	158				
	.dc.b	53				
	.dc.b	216				
						
	.dc.b	145				
						
	.dc.b	158				
	.dc.b	72				
	.dc.b	195				
						
	.dc.b	17				
						
	.dc.b	158				
	.dc.b	91				
	.dc.b	174				
						
	.dc.b	49				
						
	.dc.b	158				
	.dc.b	110				
	.dc.b	153				
						
	.dc.b	241				
						
	.dc.b	158				
	.dc.b	129				
	.dc.b	134				
						
	.dc.b	17				
						
	.dc.b	158				
	.dc.b	148				
	.dc.b	114				
						
	.dc.b	241				
						
	.dc.b	158				
	.dc.b	167				
	.dc.b	96				
						
	.dc.b	81				
						
	.dc.b	158				
	.dc.b	186				
	.dc.b	78				
						
	.dc.b	49				
						
	.dc.b	158				
	.dc.b	205				
	.dc.b	60				
						
	.dc.b	177				
						
	.dc.b	158				
	.dc.b	224				
	.dc.b	43				
						
	.dc.b	177				
						
	.dc.b	158				
	.dc.b	243				
	.dc.b	27				
						
	.dc.b	81				
						
	.dc.b	159				
	.dc.b	6				
	.dc.b	11				
						
	.dc.b	145				
						
	.dc.b	159				
	.dc.b	24				
	.dc.b	252				
						
	.dc.b	81				
						
	.dc.b	159				
	.dc.b	43				
	.dc.b	237				
						
	.dc.b	145				
						
	.dc.b	159				
	.dc.b	62				
	.dc.b	223				
						
	.dc.b	113				
						
	.dc.b	159				
	.dc.b	81				
	.dc.b	209				
						
	.dc.b	241				
						
	.dc.b	159				
	.dc.b	100				
	.dc.b	196				
						
	.dc.b	241				
						
	.dc.b	159				
	.dc.b	119				
	.dc.b	184				
						
	.dc.b	113				
						
	.dc.b	159				
	.dc.b	138				
	.dc.b	172				
						
	.dc.b	145				
						
	.dc.b	159				
	.dc.b	157				
	.dc.b	161				
						
	.dc.b	81				
						
	.dc.b	159				
	.dc.b	176				
	.dc.b	150				
						
	.dc.b	145				
						
	.dc.b	159				
	.dc.b	195				
	.dc.b	140				
						
	.dc.b	81				
						
	.dc.b	159				
	.dc.b	214				
	.dc.b	130				
						
	.dc.b	177				
						
	.dc.b	159				
	.dc.b	233				
	.dc.b	121				
						
	.dc.b	177				
						
	.dc.b	159				
	.dc.b	252				
	.dc.b	113				
						
	.dc.b	49				
						
	.dc.b	160				
	.dc.b	15				
	.dc.b	105				
						
	.dc.b	49				
						
	.dc.b	160				
	.dc.b	34				
	.dc.b	97				
						
	.dc.b	209				
						
	.dc.b	160				
	.dc.b	53				
	.dc.b	91				
						
	.dc.b	17				
						
	.dc.b	160				
	.dc.b	72				
	.dc.b	84				
						
	.dc.b	209				
						
	.dc.b	160				
	.dc.b	91				
	.dc.b	79				
						
	.dc.b	17				
						
	.dc.b	160				
	.dc.b	110				
	.dc.b	73				
						
	.dc.b	241				
						
	.dc.b	160				
	.dc.b	129				
	.dc.b	69				
						
	.dc.b	113				
						
	.dc.b	160				
	.dc.b	148				
	.dc.b	65				
						
	.dc.b	113				
						
	.dc.b	160				
	.dc.b	167				
	.dc.b	61				
						
	.dc.b	241				
						
	.dc.b	160				
	.dc.b	186				
	.dc.b	59				
						
	.dc.b	17				
						
	.dc.b	160				
	.dc.b	205				
	.dc.b	56				
						
	.dc.b	177				
						
	.dc.b	160				
	.dc.b	224				
	.dc.b	54				
						
	.dc.b	241				
						
	.dc.b	160				
	.dc.b	243				
	.dc.b	53				
						
	.dc.b	209				
						
	.dc.b	161				
	.dc.b	6				
	.dc.b	53				
						
	.dc.b	49				
						
	.dc.b	161				
	.dc.b	25				
	.dc.b	53				
						
	.dc.b	17				
						
	.dc.b	161				
	.dc.b	44				
	.dc.b	53				
						
	.dc.b	145				
						
	.dc.b	161				
	.dc.b	63				
	.dc.b	54				
						
	.dc.b	145				
						
	.dc.b	161				
	.dc.b	82				
	.dc.b	56				
						
	.dc.b	49				
						
	.dc.b	161				
	.dc.b	101				
	.dc.b	58				
						
	.dc.b	81				
						
	.dc.b	161				
	.dc.b	120				
	.dc.b	61				
						
	.dc.b	17				
						
	.dc.b	161				
	.dc.b	139				
	.dc.b	64				
						
	.dc.b	81				
						
	.dc.b	161				
	.dc.b	158				
	.dc.b	68				
						
	.dc.b	49				
						
	.dc.b	161				
	.dc.b	177				
	.dc.b	72				
						
	.dc.b	145				
						
	.dc.b	161				
	.dc.b	196				
	.dc.b	77				
						
	.dc.b	145				
						
	.dc.b	161				
	.dc.b	215				
	.dc.b	83				
						
	.dc.b	17				
						
	.dc.b	161				
	.dc.b	234				
	.dc.b	89				
						
	.dc.b	49				
						
	.dc.b	161				
	.dc.b	253				
	.dc.b	95				
						
	.dc.b	209				
						
	.dc.b	162				
	.dc.b	16				
	.dc.b	102				
						
	.dc.b	241				
						
	.dc.b	162				
	.dc.b	35				
	.dc.b	110				
						
	.dc.b	177				
						
	.dc.b	162				
	.dc.b	54				
	.dc.b	119				
						
	.dc.b	17				
						
	.dc.b	162				
	.dc.b	73				
	.dc.b	127				
						
	.dc.b	241				
						
	.dc.b	162				
	.dc.b	92				
	.dc.b	137				
						
	.dc.b	81				
						
	.dc.b	162				
	.dc.b	111				
	.dc.b	147				
						
	.dc.b	81				
						
	.dc.b	162				
	.dc.b	130				
	.dc.b	157				
						
	.dc.b	209				
						
	.dc.b	162				
	.dc.b	149				
	.dc.b	168				
						
	.dc.b	241				
						
	.dc.b	162				
	.dc.b	168				
	.dc.b	180				
						
	.dc.b	177				
						
	.dc.b	162				
	.dc.b	187				
	.dc.b	192				
						
	.dc.b	209				
						
	.dc.b	162				
	.dc.b	206				
	.dc.b	205				
						
	.dc.b	177				
						
	.dc.b	162				
	.dc.b	225				
	.dc.b	218				
						
	.dc.b	241				
						
	.dc.b	162				
	.dc.b	244				
	.dc.b	232				
						
	.dc.b	209				
						
	.dc.b	163				
	.dc.b	7				
	.dc.b	247				
						
	.dc.b	81				
						
	.dc.b	163				
	.dc.b	27				
	.dc.b	6				
						
	.dc.b	81				
						
	.dc.b	163				
	.dc.b	46				
	.dc.b	21				
						
	.dc.b	209				
						
	.dc.b	163				
	.dc.b	65				
	.dc.b	37				
						
	.dc.b	241				
						
	.dc.b	163				
	.dc.b	84				
	.dc.b	54				
						
	.dc.b	177				
						
	.dc.b	163				
	.dc.b	103				
	.dc.b	71				
						
	.dc.b	241				
						
	.dc.b	163				
	.dc.b	122				
	.dc.b	89				
						
	.dc.b	177				
						
	.dc.b	163				
	.dc.b	141				
	.dc.b	108				
						
	.dc.b	17				
						
	.dc.b	163				
	.dc.b	160				
	.dc.b	126				
						
	.dc.b	241				
						
	.dc.b	163				
	.dc.b	179				
	.dc.b	146				
						
	.dc.b	81				
						
	.dc.b	163				
	.dc.b	198				
	.dc.b	166				
						
	.dc.b	81				
						
	.dc.b	163				
	.dc.b	217				
	.dc.b	186				
						
	.dc.b	241				
						
	.dc.b	163				
	.dc.b	236				
	.dc.b	208				
						
	.dc.b	17				
						
	.dc.b	163				
	.dc.b	255				
	.dc.b	229				
						
	.dc.b	177				
						
	.dc.b	164				
	.dc.b	18				
	.dc.b	251				
						
	.dc.b	241				
						
	.dc.b	164				
	.dc.b	38				
	.dc.b	18				
						
	.dc.b	177				
						
	.dc.b	164				
	.dc.b	57				
	.dc.b	42				
						
	.dc.b	17				
						
	.dc.b	164				
	.dc.b	76				
	.dc.b	65				
						
	.dc.b	241				
						
	.dc.b	164				
	.dc.b	95				
	.dc.b	90				
						
	.dc.b	113				
						
	.dc.b	164				
	.dc.b	114				
	.dc.b	115				
						
	.dc.b	113				
						
	.dc.b	164				
	.dc.b	133				
	.dc.b	141				
						
	.dc.b	17				
						
	.dc.b	164				
	.dc.b	152				
	.dc.b	167				
						
	.dc.b	17				
						
	.dc.b	164				
	.dc.b	171				
	.dc.b	193				
						
	.dc.b	209				
						
	.dc.b	164				
	.dc.b	190				
	.dc.b	221				
						
	.dc.b	17				
						
	.dc.b	164				
	.dc.b	209				
	.dc.b	248				
						
	.dc.b	209				
						
	.dc.b	164				
	.dc.b	229				
	.dc.b	21				
						
	.dc.b	49				
						
	.dc.b	164				
	.dc.b	248				
	.dc.b	50				
						
	.dc.b	17				
						
	.dc.b	165				
	.dc.b	11				
	.dc.b	79				
						
	.dc.b	113				
						
	.dc.b	165				
	.dc.b	30				
	.dc.b	109				
						
	.dc.b	113				
						
	.dc.b	165				
	.dc.b	49				
	.dc.b	139				
						
	.dc.b	241				
						
	.dc.b	165				
	.dc.b	68				
	.dc.b	171				
						
	.dc.b	17				
						
	.dc.b	165				
	.dc.b	87				
	.dc.b	202				
						
	.dc.b	177				
						
	.dc.b	165				
	.dc.b	106				
	.dc.b	234				
						
	.dc.b	241				
						
	.dc.b	165				
	.dc.b	126				
	.dc.b	11				
						
	.dc.b	177				
						
	.dc.b	165				
	.dc.b	145				
	.dc.b	45				
						
	.dc.b	17				
						
	.dc.b	165				
	.dc.b	164				
	.dc.b	78				
						
	.dc.b	241				
						
	.dc.b	165				
	.dc.b	183				
	.dc.b	113				
						
	.dc.b	81				
						
	.dc.b	165				
	.dc.b	202				
	.dc.b	148				
						
	.dc.b	81				
						
	.dc.b	165				
	.dc.b	221				
	.dc.b	183				
						
	.dc.b	209				
						
	.dc.b	165				
	.dc.b	240				
	.dc.b	219				
						
	.dc.b	209				
						
	.dc.b	166				
	.dc.b	4				
	.dc.b	0				
						
	.dc.b	113				
						
	.dc.b	166				
	.dc.b	23				
	.dc.b	37				
						
	.dc.b	177				
						
	.dc.b	166				
	.dc.b	42				
	.dc.b	75				
						
	.dc.b	113				
						
	.dc.b	166				
	.dc.b	61				
	.dc.b	113				
						
	.dc.b	177				
						
	.dc.b	166				
	.dc.b	80				
	.dc.b	152				
						
	.dc.b	145				
						
	.dc.b	166				
	.dc.b	99				
	.dc.b	191				
						
	.dc.b	241				
						
	.dc.b	166				
	.dc.b	118				
	.dc.b	231				
						
	.dc.b	209				
						
	.dc.b	166				
	.dc.b	138				
	.dc.b	16				
						
	.dc.b	81				
						
	.dc.b	166				
	.dc.b	157				
	.dc.b	57				
						
	.dc.b	81				
						
	.dc.b	166				
	.dc.b	176				
	.dc.b	98				
						
	.dc.b	241				
						
	.dc.b	166				
	.dc.b	195				
	.dc.b	141				
						
	.dc.b	17				
						
	.dc.b	166				
	.dc.b	214				
	.dc.b	183				
						
	.dc.b	209				
						
	.dc.b	166				
	.dc.b	233				
	.dc.b	226				
						
	.dc.b	241				
						
	.dc.b	166				
	.dc.b	253				
	.dc.b	14				
						
	.dc.b	209				
						
	.dc.b	167				
	.dc.b	16				
	.dc.b	59				
						
	.dc.b	49				
						
	.dc.b	167				
	.dc.b	35				
	.dc.b	104				
						
	.dc.b	17				
						
	.dc.b	167				
	.dc.b	54				
	.dc.b	149				
						
	.dc.b	113				
						
	.dc.b	167				
	.dc.b	73				
	.dc.b	195				
						
	.dc.b	113				
						
	.dc.b	167				
	.dc.b	92				
	.dc.b	241				
						
	.dc.b	241				
						
	.dc.b	167				
	.dc.b	112				
	.dc.b	33				
						
	.dc.b	17				
						
	.dc.b	167				
	.dc.b	131				
	.dc.b	80				
						
	.dc.b	177				
						
	.dc.b	167				
	.dc.b	150				
	.dc.b	128				
						
	.dc.b	241				
						
	.dc.b	167				
	.dc.b	169				
	.dc.b	177				
						
	.dc.b	177				
						
	.dc.b	167				
	.dc.b	188				
	.dc.b	226				
						
	.dc.b	241				
						
	.dc.b	167				
	.dc.b	208				
	.dc.b	20				
						
	.dc.b	209				
						
	.dc.b	167				
	.dc.b	227				
	.dc.b	71				
						
	.dc.b	49				
						
	.dc.b	167				
	.dc.b	246				
	.dc.b	122				
						
	.dc.b	17				
						
	.dc.b	168				
	.dc.b	9				
	.dc.b	173				
						
	.dc.b	145				
						
	.dc.b	168				
	.dc.b	28				
	.dc.b	225				
						
	.dc.b	145				
						
	.dc.b	168				
	.dc.b	48				
	.dc.b	22				
						
	.dc.b	49				
						
	.dc.b	168				
	.dc.b	67				
	.dc.b	75				
						
	.dc.b	81				
						
	.dc.b	168				
	.dc.b	86				
	.dc.b	128				
						
	.dc.b	241				
						
	.dc.b	168				
	.dc.b	105				
	.dc.b	183				
						
	.dc.b	49				
						
	.dc.b	168				
	.dc.b	124				
	.dc.b	237				
						
	.dc.b	241				
						
	.dc.b	168				
	.dc.b	144				
	.dc.b	37				
						
	.dc.b	81				
						
	.dc.b	168				
	.dc.b	163				
	.dc.b	93				
						
	.dc.b	49				
						
	.dc.b	168				
	.dc.b	182				
	.dc.b	149				
						
	.dc.b	145				
						
	.dc.b	168				
	.dc.b	201				
	.dc.b	206				
						
	.dc.b	145				
						
	.dc.b	168				
	.dc.b	221				
	.dc.b	8				
						
	.dc.b	17				
						
	.dc.b	168				
	.dc.b	240				
	.dc.b	66				
						
	.dc.b	49				
						
	.dc.b	169				
	.dc.b	3				
	.dc.b	124				
						
	.dc.b	177				
						
	.dc.b	169				
	.dc.b	22				
	.dc.b	183				
						
	.dc.b	241				
						
	.dc.b	169				
	.dc.b	41				
	.dc.b	243				
						
	.dc.b	145				
						
	.dc.b	169				
	.dc.b	61				
	.dc.b	47				
						
	.dc.b	209				
						
	.dc.b	169				
	.dc.b	80				
	.dc.b	108				
						
	.dc.b	145				
						
	.dc.b	169				
	.dc.b	99				
	.dc.b	169				
						
	.dc.b	241				
						
	.dc.b	169				
	.dc.b	118				
	.dc.b	231				
						
	.dc.b	209				
						
	.dc.b	169				
	.dc.b	138				
	.dc.b	38				
						
	.dc.b	81				
						
	.dc.b	169				
	.dc.b	157				
	.dc.b	101				
						
	.dc.b	81				
						
	.dc.b	169				
	.dc.b	176				
	.dc.b	164				
						
	.dc.b	209				
						
	.dc.b	169				
	.dc.b	195				
	.dc.b	228				
						
	.dc.b	209				
						
	.dc.b	169				
	.dc.b	215				
	.dc.b	37				
						
	.dc.b	113				
						
	.dc.b	169				
	.dc.b	234				
	.dc.b	102				
						
	.dc.b	145				
						
	.dc.b	169				
	.dc.b	253				
	.dc.b	168				
						
	.dc.b	81				
						
	.dc.b	170				
	.dc.b	16				
	.dc.b	234				
						
	.dc.b	145				
						
	.dc.b	170				
	.dc.b	36				
	.dc.b	45				
						
	.dc.b	113				
						
	.dc.b	170				
	.dc.b	55				
	.dc.b	112				
						
	.dc.b	177				
						
	.dc.b	170				
	.dc.b	74				
	.dc.b	180				
						
	.dc.b	145				
						
	.dc.b	170				
	.dc.b	93				
	.dc.b	249				
						
	.dc.b	17				
						
	.dc.b	170				
	.dc.b	113				
	.dc.b	62				
						
	.dc.b	17				
						
	.dc.b	170				
	.dc.b	132				
	.dc.b	131				
						
	.dc.b	145				
						
	.dc.b	170				
	.dc.b	151				
	.dc.b	201				
						
	.dc.b	145				
						
	.dc.b	170				
	.dc.b	171				
	.dc.b	16				
						
	.dc.b	49				
						
	.dc.b	170				
	.dc.b	190				
	.dc.b	87				
						
	.dc.b	81				
						
	.dc.b	170				
	.dc.b	209				
	.dc.b	159				
						
	.dc.b	17				
						
	.dc.b	170				
	.dc.b	228				
	.dc.b	231				
						
	.dc.b	81				
						
	.dc.b	170				
	.dc.b	248				
	.dc.b	48				
						
	.dc.b	17				
						
	.dc.b	171				
	.dc.b	11				
	.dc.b	121				
						
	.dc.b	113				
						
	.dc.b	171				
	.dc.b	30				
	.dc.b	195				
						
	.dc.b	81				
						
	.dc.b	171				
	.dc.b	50				
	.dc.b	13				
						
	.dc.b	177				
						
	.dc.b	171				
	.dc.b	69				
	.dc.b	88				
						
	.dc.b	177				
						
	.dc.b	171				
	.dc.b	88				
	.dc.b	164				
						
	.dc.b	49				
						
	.dc.b	171				
	.dc.b	107				
	.dc.b	240				
						
	.dc.b	49				
						
	.dc.b	171				
	.dc.b	127				
	.dc.b	60				
						
	.dc.b	209				
						
	.dc.b	171				
	.dc.b	146				
	.dc.b	137				
						
	.dc.b	241				
						
	.dc.b	171				
	.dc.b	165				
	.dc.b	215				
						
	.dc.b	177				
						
	.dc.b	171				
	.dc.b	185				
	.dc.b	37				
						
	.dc.b	209				
						
	.dc.b	171				
	.dc.b	204				
	.dc.b	116				
						
	.dc.b	177				
						
	.dc.b	171				
	.dc.b	223				
	.dc.b	195				
						
	.dc.b	241				
						
	.dc.b	171				
	.dc.b	243				
	.dc.b	19				
						
	.dc.b	209				
						
	.dc.b	172				
	.dc.b	6				
	.dc.b	100				
						
	.dc.b	49				
						
	.dc.b	172				
	.dc.b	25				
	.dc.b	181				
						
	.dc.b	17				
						
	.dc.b	172				
	.dc.b	45				
	.dc.b	6				
						
	.dc.b	145				
						
	.dc.b	172				
	.dc.b	64				
	.dc.b	88				
						
	.dc.b	145				
						
	.dc.b	172				
	.dc.b	83				
	.dc.b	171				
						
	.dc.b	49				
						
	.dc.b	172				
	.dc.b	102				
	.dc.b	254				
						
	.dc.b	81				
						
	.dc.b	172				
	.dc.b	122				
	.dc.b	81				
						
	.dc.b	241				
						
	.dc.b	172				
	.dc.b	141				
	.dc.b	166				
						
	.dc.b	17				
						
	.dc.b	172				
	.dc.b	160				
	.dc.b	250				
						
	.dc.b	209				
						
	.dc.b	172				
	.dc.b	180				
	.dc.b	80				
						
	.dc.b	17				
						
	.dc.b	172				
	.dc.b	199				
	.dc.b	165				
						
	.dc.b	241				
						
	.dc.b	172				
	.dc.b	218				
	.dc.b	252				
						
	.dc.b	49				
						
	.dc.b	172				
	.dc.b	238				
	.dc.b	83				
						
	.dc.b	17				
						
	.dc.b	173				
	.dc.b	1				
	.dc.b	170				
						
	.dc.b	145				
						
	.dc.b	173				
	.dc.b	21				
	.dc.b	2				
						
	.dc.b	145				
						
	.dc.b	173				
	.dc.b	40				
	.dc.b	91				
						
	.dc.b	17				
						
	.dc.b	173				
	.dc.b	59				
	.dc.b	180				
						
	.dc.b	17				
						
	.dc.b	173				
	.dc.b	79				
	.dc.b	13				
						
	.dc.b	177				
						
	.dc.b	173				
	.dc.b	98				
	.dc.b	103				
						
	.dc.b	209				
						
	.dc.b	173				
	.dc.b	117				
	.dc.b	194				
						
	.dc.b	113				
						
	.dc.b	173				
	.dc.b	137				
	.dc.b	29				
						
	.dc.b	177				
						
	.dc.b	173				
	.dc.b	156				
	.dc.b	121				
						
	.dc.b	113				
						
	.dc.b	173				
	.dc.b	175				
	.dc.b	213				
						
	.dc.b	177				
						
	.dc.b	173				
	.dc.b	195				
	.dc.b	50				
						
	.dc.b	145				
						
	.dc.b	173				
	.dc.b	214				
	.dc.b	143				
						
	.dc.b	241				
						
	.dc.b	173				
	.dc.b	233				
	.dc.b	237				
						
	.dc.b	209				
						
	.dc.b	173				
	.dc.b	253				
	.dc.b	76				
						
	.dc.b	81				
						
	.dc.b	174				
	.dc.b	16				
	.dc.b	171				
						
	.dc.b	81				
						
	.dc.b	174				
	.dc.b	36				
	.dc.b	10				
						
	.dc.b	209				
						
	.dc.b	174				
	.dc.b	55				
	.dc.b	106				
						
	.dc.b	209				
						
	.dc.b	174				
	.dc.b	74				
	.dc.b	203				
						
	.dc.b	113				
						
	.dc.b	174				
	.dc.b	94				
	.dc.b	44				
						
	.dc.b	145				
						
	.dc.b	174				
	.dc.b	113				
	.dc.b	142				
						
	.dc.b	81				
						
	.dc.b	174				
	.dc.b	132				
	.dc.b	240				
						
	.dc.b	145				
						
	.dc.b	174				
	.dc.b	152				
	.dc.b	83				
						
	.dc.b	81				
						
	.dc.b	174				
	.dc.b	171				
	.dc.b	182				
						
	.dc.b	145				
						
	.dc.b	174				
	.dc.b	191				
	.dc.b	26				
						
	.dc.b	113				
						
	.dc.b	174				
	.dc.b	210				
	.dc.b	126				
						
	.dc.b	209				
						
	.dc.b	174				
	.dc.b	229				
	.dc.b	227				
						
	.dc.b	177				
						
	.dc.b	174				
	.dc.b	249				
	.dc.b	73				
						
	.dc.b	49				
						
	.dc.b	175				
	.dc.b	12				
	.dc.b	175				
						
	.dc.b	17				
						
	.dc.b	175				
	.dc.b	32				
	.dc.b	21				
						
	.dc.b	177				
						
	.dc.b	175				
	.dc.b	51				
	.dc.b	124				
						
	.dc.b	177				
						
	.dc.b	175				
	.dc.b	70				
	.dc.b	228				
						
	.dc.b	81				
						
	.dc.b	175				
	.dc.b	90				
	.dc.b	76				
						
	.dc.b	113				
						
	.dc.b	175				
	.dc.b	109				
	.dc.b	181				
						
	.dc.b	17				
						
	.dc.b	175				
	.dc.b	129				
	.dc.b	30				
						
	.dc.b	81				
						
	.dc.b	175				
	.dc.b	148				
	.dc.b	136				
						
	.dc.b	17				
						
	.dc.b	175				
	.dc.b	167				
	.dc.b	242				
						
	.dc.b	81				
						
	.dc.b	175				
	.dc.b	187				
	.dc.b	93				
						
	.dc.b	49				
						
	.dc.b	175				
	.dc.b	206				
	.dc.b	200				
						
	.dc.b	145				
						
	.dc.b	175				
	.dc.b	226				
	.dc.b	52				
						
	.dc.b	113				
						
	.dc.b	175				
	.dc.b	245				
	.dc.b	160				
						
	.dc.b	209				
						
	.dc.b	176				
	.dc.b	9				
	.dc.b	13				
						
	.dc.b	209				
						
	.dc.b	176				
	.dc.b	28				
	.dc.b	123				
						
	.dc.b	81				
						
	.dc.b	176				
	.dc.b	47				
	.dc.b	233				
						
	.dc.b	81				
						
	.dc.b	176				
	.dc.b	67				
	.dc.b	87				
						
	.dc.b	241				
						
	.dc.b	176				
	.dc.b	86				
	.dc.b	199				
						
	.dc.b	17				
						
	.dc.b	176				
	.dc.b	106				
	.dc.b	54				
						
	.dc.b	177				
						
	.dc.b	176				
	.dc.b	125				
	.dc.b	166				
						
	.dc.b	209				
						
	.dc.b	176				
	.dc.b	145				
	.dc.b	23				
						
	.dc.b	145				
						
	.dc.b	176				
	.dc.b	164				
	.dc.b	136				
						
	.dc.b	209				
						
	.dc.b	176				
	.dc.b	183				
	.dc.b	250				
						
	.dc.b	145				
						
	.dc.b	176				
	.dc.b	203				
	.dc.b	108				
						
	.dc.b	241				
						
	.dc.b	176				
	.dc.b	222				
	.dc.b	223				
						
	.dc.b	177				
						
	.dc.b	176				
	.dc.b	242				
	.dc.b	83				
						
	.dc.b	17				
						
	.dc.b	177				
	.dc.b	5				
	.dc.b	199				
						
	.dc.b	17				
						
	.dc.b	177				
	.dc.b	25				
	.dc.b	59				
						
	.dc.b	145				
						
	.dc.b	177				
	.dc.b	44				
	.dc.b	176				
						
	.dc.b	113				
						
	.dc.b	177				
	.dc.b	64				
	.dc.b	38				
						
	.dc.b	17				
						
	.dc.b	177				
	.dc.b	83				
	.dc.b	156				
						
	.dc.b	17				
						
	.dc.b	177				
	.dc.b	103				
	.dc.b	18				
						
	.dc.b	177				
						
	.dc.b	177				
	.dc.b	122				
	.dc.b	137				
						
	.dc.b	209				
						
	.dc.b	177				
	.dc.b	142				
	.dc.b	1				
						
	.dc.b	113				
						
	.dc.b	177				
	.dc.b	161				
	.dc.b	121				
						
	.dc.b	177				
						
	.dc.b	177				
	.dc.b	180				
	.dc.b	242				
						
	.dc.b	113				
						
	.dc.b	177				
	.dc.b	200				
	.dc.b	107				
						
	.dc.b	177				
						
	.dc.b	177				
	.dc.b	219				
	.dc.b	229				
						
	.dc.b	113				
						
	.dc.b	177				
	.dc.b	239				
	.dc.b	95				
						
	.dc.b	209				
						
	.dc.b	178				
	.dc.b	2				
	.dc.b	218				
						
	.dc.b	177				
						
	.dc.b	178				
	.dc.b	22				
	.dc.b	86				
						
	.dc.b	17				
						
	.dc.b	178				
	.dc.b	41				
	.dc.b	209				
						
	.dc.b	241				
						
	.dc.b	178				
	.dc.b	61				
	.dc.b	78				
						
	.dc.b	113				
						
	.dc.b	178				
	.dc.b	80				
	.dc.b	203				
						
	.dc.b	113				
						
	.dc.b	178				
	.dc.b	100				
	.dc.b	72				
						
	.dc.b	241				
						
	.dc.b	178				
	.dc.b	119				
	.dc.b	198				
						
	.dc.b	241				
						
	.dc.b	178				
	.dc.b	139				
	.dc.b	69				
						
	.dc.b	145				
						
	.dc.b	178				
	.dc.b	158				
	.dc.b	196				
						
	.dc.b	177				
						
	.dc.b	178				
	.dc.b	178				
	.dc.b	68				
						
	.dc.b	81				
						
	.dc.b	178				
	.dc.b	197				
	.dc.b	196				
						
	.dc.b	145				
						
	.dc.b	178				
	.dc.b	217				
	.dc.b	69				
						
	.dc.b	81				
						
	.dc.b	178				
	.dc.b	236				
	.dc.b	198				
						
	.dc.b	145				
						
	.dc.b	179				
	.dc.b	0				
	.dc.b	72				
						
	.dc.b	81				
						
	.dc.b	179				
	.dc.b	19				
	.dc.b	202				
						
	.dc.b	145				
						
	.dc.b	179				
	.dc.b	39				
	.dc.b	77				
						
	.dc.b	113				
						
	.dc.b	179				
	.dc.b	58				
	.dc.b	208				
						
	.dc.b	209				
						
	.dc.b	179				
	.dc.b	78				
	.dc.b	84				
						
	.dc.b	177				
						
	.dc.b	179				
	.dc.b	97				
	.dc.b	217				
						
	.dc.b	49				
						
	.dc.b	179				
	.dc.b	117				
	.dc.b	94				
						
	.dc.b	49				
						
	.dc.b	179				
	.dc.b	136				
	.dc.b	227				
						
	.dc.b	177				
						
	.dc.b	179				
	.dc.b	156				
	.dc.b	105				
						
	.dc.b	177				
						
	.dc.b	179				
	.dc.b	175				
	.dc.b	240				
						
	.dc.b	49				
						
	.dc.b	179				
	.dc.b	195				
	.dc.b	119				
						
	.dc.b	81				
						
	.dc.b	179				
	.dc.b	214				
	.dc.b	254				
						
	.dc.b	241				
						
	.dc.b	179				
	.dc.b	234				
	.dc.b	135				
						
	.dc.b	17				
						
	.dc.b	179				
	.dc.b	254				
	.dc.b	15				
						
	.dc.b	209				
						
	.dc.b	180				
	.dc.b	17				
	.dc.b	152				
						
	.dc.b	241				
						
	.dc.b	180				
	.dc.b	37				
	.dc.b	34				
						
	.dc.b	177				
						
	.dc.b	180				
	.dc.b	56				
	.dc.b	172				
						
	.dc.b	241				
						
	.dc.b	180				
	.dc.b	76				
	.dc.b	55				
						
	.dc.b	209				
						
	.dc.b	180				
	.dc.b	95				
	.dc.b	195				
						
	.dc.b	17				
						
	.dc.b	180				
	.dc.b	115				
	.dc.b	78				
						
	.dc.b	241				
						
	.dc.b	180				
	.dc.b	134				
	.dc.b	219				
						
	.dc.b	81				
						
	.dc.b	180				
	.dc.b	154				
	.dc.b	104				
						
	.dc.b	81				
						
	.dc.b	180				
	.dc.b	173				
	.dc.b	245				
						
	.dc.b	177				
						
	.dc.b	180				
	.dc.b	193				
	.dc.b	131				
						
	.dc.b	177				
						
	.dc.b	180				
	.dc.b	213				
	.dc.b	18				
						
	.dc.b	49				
						
	.dc.b	180				
	.dc.b	232				
	.dc.b	161				
						
	.dc.b	81				
						
	.dc.b	180				
	.dc.b	252				
	.dc.b	48				
						
	.dc.b	209				
						
	.dc.b	181				
	.dc.b	15				
	.dc.b	192				
						
	.dc.b	241				
						
	.dc.b	181				
	.dc.b	35				
	.dc.b	81				
						
	.dc.b	145				
						
	.dc.b	181				
	.dc.b	54				
	.dc.b	226				
						
	.dc.b	177				
						
	.dc.b	181				
	.dc.b	74				
	.dc.b	116				
						
	.dc.b	81				
						
	.dc.b	181				
	.dc.b	94				
	.dc.b	6				
						
	.dc.b	145				
						
	.dc.b	181				
	.dc.b	113				
	.dc.b	153				
						
	.dc.b	81				
						
	.dc.b	181				
	.dc.b	133				
	.dc.b	44				
						
	.dc.b	145				
						
	.dc.b	181				
	.dc.b	152				
	.dc.b	192				
						
	.dc.b	81				
						
	.dc.b	181				
	.dc.b	172				
	.dc.b	84				
						
	.dc.b	177				
						
	.dc.b	181				
	.dc.b	191				
	.dc.b	233				
						
	.dc.b	145				
						
	.dc.b	181				
	.dc.b	211				
	.dc.b	126				
						
	.dc.b	241				
						
	.dc.b	181				
	.dc.b	231				
	.dc.b	20				
						
	.dc.b	209				
						
	.dc.b	181				
	.dc.b	250				
	.dc.b	171				
						
	.dc.b	49				
						
	.dc.b	182				
	.dc.b	14				
	.dc.b	66				
						
	.dc.b	49				
						
	.dc.b	182				
	.dc.b	33				
	.dc.b	217				
						
	.dc.b	177				
						
	.dc.b	182				
	.dc.b	53				
	.dc.b	113				
						
	.dc.b	177				
						
	.dc.b	182				
	.dc.b	73				
	.dc.b	10				
						
	.dc.b	49				
						
	.dc.b	182				
	.dc.b	92				
	.dc.b	163				
						
	.dc.b	81				
						
	.dc.b	182				
	.dc.b	112				
	.dc.b	60				
						
	.dc.b	209				
						
	.dc.b	182				
	.dc.b	131				
	.dc.b	214				
						
	.dc.b	241				
						
	.dc.b	182				
	.dc.b	151				
	.dc.b	113				
						
	.dc.b	145				
						
	.dc.b	182				
	.dc.b	171				
	.dc.b	12				
						
	.dc.b	209				
						
	.dc.b	182				
	.dc.b	190				
	.dc.b	168				
						
	.dc.b	113				
						
	.dc.b	182				
	.dc.b	210				
	.dc.b	68				
						
	.dc.b	177				
						
	.dc.b	182				
	.dc.b	229				
	.dc.b	225				
						
	.dc.b	113				
						
	.dc.b	182				
	.dc.b	249				
	.dc.b	126				
						
	.dc.b	177				
						
	.dc.b	183				
	.dc.b	13				
	.dc.b	28				
						
	.dc.b	113				
						
	.dc.b	183				
	.dc.b	32				
	.dc.b	186				
						
	.dc.b	209				
						
	.dc.b	183				
	.dc.b	52				
	.dc.b	89				
						
	.dc.b	177				
						
	.dc.b	183				
	.dc.b	71				
	.dc.b	249				
						
	.dc.b	17				
						
	.dc.b	183				
	.dc.b	91				
	.dc.b	152				
						
	.dc.b	241				
						
	.dc.b	183				
	.dc.b	111				
	.dc.b	57				
						
	.dc.b	81				
						
	.dc.b	183				
	.dc.b	130				
	.dc.b	218				
						
	.dc.b	81				
						
	.dc.b	183				
	.dc.b	150				
	.dc.b	123				
						
	.dc.b	209				
						
	.dc.b	183				
	.dc.b	170				
	.dc.b	29				
						
	.dc.b	209				
						
	.dc.b	183				
	.dc.b	189				
	.dc.b	192				
						
	.dc.b	81				
						
	.dc.b	183				
	.dc.b	209				
	.dc.b	99				
						
	.dc.b	81				
						
	.dc.b	183				
	.dc.b	229				
	.dc.b	6				
						
	.dc.b	241				
						
	.dc.b	183				
	.dc.b	248				
	.dc.b	171				
						
	.dc.b	17				
						
	.dc.b	184				
	.dc.b	12				
	.dc.b	79				
						
	.dc.b	177				
						
	.dc.b	184				
	.dc.b	31				
	.dc.b	244				
						
	.dc.b	209				
						
	.dc.b	184				
	.dc.b	51				
	.dc.b	154				
						
	.dc.b	113				
						
	.dc.b	184				
	.dc.b	71				
	.dc.b	64				
						
	.dc.b	177				
						
	.dc.b	184				
	.dc.b	90				
	.dc.b	231				
						
	.dc.b	81				
						
	.dc.b	184				
	.dc.b	110				
	.dc.b	142				
						
	.dc.b	145				
						
	.dc.b	184				
	.dc.b	130				
	.dc.b	54				
						
	.dc.b	81				
						
	.dc.b	184				
	.dc.b	149				
	.dc.b	222				
						
	.dc.b	177				
						
	.dc.b	184				
	.dc.b	169				
	.dc.b	135				
						
	.dc.b	113				
						
	.dc.b	184				
	.dc.b	189				
	.dc.b	48				
						
	.dc.b	209				
						
	.dc.b	184				
	.dc.b	208				
	.dc.b	218				
						
	.dc.b	177				
						
	.dc.b	184				
	.dc.b	228				
	.dc.b	133				
						
	.dc.b	17				
						
	.dc.b	184				
	.dc.b	248				
	.dc.b	47				
						
	.dc.b	241				
						
	.dc.b	185				
	.dc.b	11				
	.dc.b	219				
						
	.dc.b	81				
						
	.dc.b	185				
	.dc.b	31				
	.dc.b	135				
						
	.dc.b	81				
						
	.dc.b	185				
	.dc.b	51				
	.dc.b	51				
						
	.dc.b	209				
						
	.dc.b	185				
	.dc.b	70				
	.dc.b	224				
						
	.dc.b	209				
						
	.dc.b	185				
	.dc.b	90				
	.dc.b	142				
						
	.dc.b	81				
						
	.dc.b	185				
	.dc.b	110				
	.dc.b	60				
						
	.dc.b	81				
						
	.dc.b	185				
	.dc.b	129				
	.dc.b	234				
						
	.dc.b	241				
						
	.dc.b	185				
	.dc.b	149				
	.dc.b	153				
						
	.dc.b	241				
						
	.dc.b	185				
	.dc.b	169				
	.dc.b	73				
						
	.dc.b	145				
						
	.dc.b	185				
	.dc.b	188				
	.dc.b	249				
						
	.dc.b	177				
						
	.dc.b	185				
	.dc.b	208				
	.dc.b	170				
						
	.dc.b	81				
						
	.dc.b	185				
	.dc.b	228				
	.dc.b	91				
						
	.dc.b	145				
						
	.dc.b	185				
	.dc.b	248				
	.dc.b	13				
						
	.dc.b	49				
						
	.dc.b	186				
	.dc.b	11				
	.dc.b	191				
						
	.dc.b	113				
						
	.dc.b	186				
	.dc.b	31				
	.dc.b	114				
						
	.dc.b	49				
						
	.dc.b	186				
	.dc.b	51				
	.dc.b	37				
						
	.dc.b	113				
						
	.dc.b	186				
	.dc.b	70				
	.dc.b	217				
						
	.dc.b	49				
						
	.dc.b	186				
	.dc.b	90				
	.dc.b	141				
						
	.dc.b	145				
						
	.dc.b	186				
	.dc.b	110				
	.dc.b	66				
						
	.dc.b	81				
						
	.dc.b	186				
	.dc.b	129				
	.dc.b	247				
						
	.dc.b	177				
						
	.dc.b	186				
	.dc.b	149				
	.dc.b	173				
						
	.dc.b	145				
						
	.dc.b	186				
	.dc.b	169				
	.dc.b	99				
						
	.dc.b	241				
						
	.dc.b	186				
	.dc.b	189				
	.dc.b	26				
						
	.dc.b	209				
						
	.dc.b	186				
	.dc.b	208				
	.dc.b	210				
						
	.dc.b	49				
						
	.dc.b	186				
	.dc.b	228				
	.dc.b	138				
						
	.dc.b	49				
						
	.dc.b	186				
	.dc.b	248				
	.dc.b	66				
						
	.dc.b	177				
						
	.dc.b	187				
	.dc.b	11				
	.dc.b	251				
						
	.dc.b	145				
						
	.dc.b	187				
	.dc.b	31				
	.dc.b	181				
						
	.dc.b	17				
						
	.dc.b	187				
	.dc.b	51				
	.dc.b	111				
						
	.dc.b	49				
						
	.dc.b	187				
	.dc.b	71				
	.dc.b	41				
						
	.dc.b	177				
						
	.dc.b	187				
	.dc.b	90				
	.dc.b	228				
						
	.dc.b	209				
						
	.dc.b	187				
	.dc.b	110				
	.dc.b	160				
						
	.dc.b	81				
						
	.dc.b	187				
	.dc.b	130				
	.dc.b	92				
						
	.dc.b	113				
						
	.dc.b	187				
	.dc.b	150				
	.dc.b	25				
						
	.dc.b	17				
						
	.dc.b	187				
	.dc.b	169				
	.dc.b	214				
						
	.dc.b	49				
						
	.dc.b	187				
	.dc.b	189				
	.dc.b	147				
						
	.dc.b	209				
						
	.dc.b	187				
	.dc.b	209				
	.dc.b	82				
						
	.dc.b	17				
						
	.dc.b	187				
	.dc.b	229				
	.dc.b	16				
						
	.dc.b	177				
						
	.dc.b	187				
	.dc.b	248				
	.dc.b	207				
						
	.dc.b	241				
						
	.dc.b	188				
	.dc.b	12				
	.dc.b	143				
						
	.dc.b	177				
						
	.dc.b	188				
	.dc.b	32				
	.dc.b	79				
						
	.dc.b	241				
						
	.dc.b	188				
	.dc.b	52				
	.dc.b	16				
						
	.dc.b	177				
						
	.dc.b	188				
	.dc.b	71				
	.dc.b	209				
						
	.dc.b	241				
						
	.dc.b	188				
	.dc.b	91				
	.dc.b	147				
						
	.dc.b	209				
						
	.dc.b	188				
	.dc.b	111				
	.dc.b	86				
						
	.dc.b	17				
						
	.dc.b	188				
	.dc.b	131				
	.dc.b	24				
						
	.dc.b	241				
						
	.dc.b	188				
	.dc.b	150				
	.dc.b	220				
						
	.dc.b	81				
						
	.dc.b	188				
	.dc.b	170				
	.dc.b	160				
						
	.dc.b	49				
						
	.dc.b	188				
	.dc.b	190				
	.dc.b	100				
						
	.dc.b	145				
						
	.dc.b	188				
	.dc.b	210				
	.dc.b	41				
						
	.dc.b	145				
						
	.dc.b	188				
	.dc.b	229				
	.dc.b	238				
						
	.dc.b	241				
						
	.dc.b	188				
	.dc.b	249				
	.dc.b	180				
						
	.dc.b	241				
						
	.dc.b	189				
	.dc.b	13				
	.dc.b	123				
						
	.dc.b	81				
						
	.dc.b	189				
	.dc.b	33				
	.dc.b	66				
						
	.dc.b	81				
						
	.dc.b	189				
	.dc.b	53				
	.dc.b	9				
						
	.dc.b	209				
						
	.dc.b	189				
	.dc.b	72				
	.dc.b	209				
						
	.dc.b	209				
						
	.dc.b	189				
	.dc.b	92				
	.dc.b	154				
						
	.dc.b	113				
						
	.dc.b	189				
	.dc.b	112				
	.dc.b	99				
						
	.dc.b	113				
						
	.dc.b	189				
	.dc.b	132				
	.dc.b	45				
						
	.dc.b	17				
						
	.dc.b	189				
	.dc.b	151				
	.dc.b	247				
						
	.dc.b	17				
						
	.dc.b	189				
	.dc.b	171				
	.dc.b	193				
						
	.dc.b	177				
						
	.dc.b	189				
	.dc.b	191				
	.dc.b	140				
						
	.dc.b	209				
						
	.dc.b	189				
	.dc.b	211				
	.dc.b	88				
						
	.dc.b	113				
						
	.dc.b	189				
	.dc.b	231				
	.dc.b	36				
						
	.dc.b	145				
						
	.dc.b	189				
	.dc.b	250				
	.dc.b	241				
						
	.dc.b	81				
						
	.dc.b	190				
	.dc.b	14				
	.dc.b	190				
						
	.dc.b	113				
						
	.dc.b	190				
	.dc.b	34				
	.dc.b	140				
						
	.dc.b	49				
						
	.dc.b	190				
	.dc.b	54				
	.dc.b	90				
						
	.dc.b	113				
						
	.dc.b	190				
	.dc.b	74				
	.dc.b	41				
						
	.dc.b	17				
						
	.dc.b	190				
	.dc.b	93				
	.dc.b	248				
						
	.dc.b	81				
						
	.dc.b	190				
	.dc.b	113				
	.dc.b	200				
						
	.dc.b	17				
						
	.dc.b	190				
	.dc.b	133				
	.dc.b	152				
						
	.dc.b	113				
						
	.dc.b	190				
	.dc.b	153				
	.dc.b	105				
						
	.dc.b	49				
						
	.dc.b	190				
	.dc.b	173				
	.dc.b	58				
						
	.dc.b	113				
						
	.dc.b	190				
	.dc.b	193				
	.dc.b	12				
						
	.dc.b	81				
						
	.dc.b	190				
	.dc.b	212				
	.dc.b	222				
						
	.dc.b	177				
						
	.dc.b	190				
	.dc.b	232				
	.dc.b	177				
						
	.dc.b	113				
						
	.dc.b	190				
	.dc.b	252				
	.dc.b	132				
						
	.dc.b	209				
						
	.dc.b	191				
	.dc.b	16				
	.dc.b	88				
						
	.dc.b	177				
						
	.dc.b	191				
	.dc.b	36				
	.dc.b	45				
						
	.dc.b	49				
						
	.dc.b	191				
	.dc.b	56				
	.dc.b	2				
						
	.dc.b	17				
						
	.dc.b	191				
	.dc.b	75				
	.dc.b	215				
						
	.dc.b	113				
						
	.dc.b	191				
	.dc.b	95				
	.dc.b	173				
						
	.dc.b	113				
						
	.dc.b	191				
	.dc.b	115				
	.dc.b	131				
						
	.dc.b	209				
						
	.dc.b	191				
	.dc.b	135				
	.dc.b	90				
						
	.dc.b	209				
						
	.dc.b	191				
	.dc.b	155				
	.dc.b	50				
						
	.dc.b	81				
						
	.dc.b	191				
	.dc.b	175				
	.dc.b	10				
						
	.dc.b	81				
						
	.dc.b	191				
	.dc.b	194				
	.dc.b	226				
						
	.dc.b	209				
						
	.dc.b	191				
	.dc.b	214				
	.dc.b	187				
						
	.dc.b	209				
						
	.dc.b	191				
	.dc.b	234				
	.dc.b	149				
						
	.dc.b	81				
						
	.dc.b	191				
	.dc.b	254				
	.dc.b	111				
						
	.dc.b	113				
						
	.dc.b	192				
	.dc.b	18				
	.dc.b	73				
						
	.dc.b	241				
						
	.dc.b	192				
	.dc.b	38				
	.dc.b	37				
						
	.dc.b	17				
						
	.dc.b	192				
	.dc.b	58				
	.dc.b	0				
						
	.dc.b	145				
						
	.dc.b	192				
	.dc.b	77				
	.dc.b	220				
						
	.dc.b	177				
						
	.dc.b	192				
	.dc.b	97				
	.dc.b	185				
						
	.dc.b	81				
						
	.dc.b	192				
	.dc.b	117				
	.dc.b	150				
						
	.dc.b	113				
						
	.dc.b	192				
	.dc.b	137				
	.dc.b	116				
						
	.dc.b	17				
						
	.dc.b	192				
	.dc.b	157				
	.dc.b	82				
						
	.dc.b	49				
						
	.dc.b	192				
	.dc.b	177				
	.dc.b	48				
						
	.dc.b	241				
						
	.dc.b	192				
	.dc.b	197				
	.dc.b	16				
						
	.dc.b	17				
						
	.dc.b	192				
	.dc.b	216				
	.dc.b	239				
						
	.dc.b	177				
						
	.dc.b	192				
	.dc.b	236				
	.dc.b	207				
						
	.dc.b	241				
						
	.dc.b	193				
	.dc.b	0				
	.dc.b	176				
						
	.dc.b	177				
						
	.dc.b	193				
	.dc.b	20				
	.dc.b	145				
						
	.dc.b	241				
						
	.dc.b	193				
	.dc.b	40				
	.dc.b	115				
						
	.dc.b	145				
						
	.dc.b	193				
	.dc.b	60				
	.dc.b	85				
						
	.dc.b	209				
						
	.dc.b	193				
	.dc.b	80				
	.dc.b	56				
						
	.dc.b	145				
						
	.dc.b	193				
	.dc.b	100				
	.dc.b	27				
						
	.dc.b	241				
						
	.dc.b	193				
	.dc.b	119				
	.dc.b	255				
						
	.dc.b	177				
						
	.dc.b	193				
	.dc.b	139				
	.dc.b	227				
						
	.dc.b	241				
						
	.dc.b	193				
	.dc.b	159				
	.dc.b	200				
						
	.dc.b	209				
						
	.dc.b	193				
	.dc.b	179				
	.dc.b	174				
						
	.dc.b	17				
						
	.dc.b	193				
	.dc.b	199				
	.dc.b	147				
						
	.dc.b	241				
						
	.dc.b	193				
	.dc.b	219				
	.dc.b	122				
						
	.dc.b	49				
						
	.dc.b	193				
	.dc.b	239				
	.dc.b	97				
						
	.dc.b	17				
						
	.dc.b	194				
	.dc.b	3				
	.dc.b	72				
						
	.dc.b	113				
						
	.dc.b	194				
	.dc.b	23				
	.dc.b	48				
						
	.dc.b	81				
						
	.dc.b	194				
	.dc.b	43				
	.dc.b	24				
						
	.dc.b	177				
						
	.dc.b	194				
	.dc.b	63				
	.dc.b	1				
						
	.dc.b	145				
						
	.dc.b	194				
	.dc.b	82				
	.dc.b	234				
						
	.dc.b	241				
						
	.dc.b	194				
	.dc.b	102				
	.dc.b	212				
						
	.dc.b	209				
						
	.dc.b	194				
	.dc.b	122				
	.dc.b	191				
						
	.dc.b	81				
						
	.dc.b	194				
	.dc.b	142				
	.dc.b	170				
						
	.dc.b	49				
						
	.dc.b	194				
	.dc.b	162				
	.dc.b	149				
						
	.dc.b	177				
						
	.dc.b	194				
	.dc.b	182				
	.dc.b	129				
						
	.dc.b	145				
						
	.dc.b	194				
	.dc.b	202				
	.dc.b	110				
						
	.dc.b	17				
						
	.dc.b	194				
	.dc.b	222				
	.dc.b	91				
						
	.dc.b	17				
						
	.dc.b	194				
	.dc.b	242				
	.dc.b	72				
						
	.dc.b	113				
						
	.dc.b	195				
	.dc.b	6				
	.dc.b	54				
						
	.dc.b	113				
						
	.dc.b	195				
	.dc.b	26				
	.dc.b	36				
						
	.dc.b	241				
						
	.dc.b	195				
	.dc.b	46				
	.dc.b	19				
						
	.dc.b	241				
						
	.dc.b	195				
	.dc.b	66				
	.dc.b	3				
						
	.dc.b	113				
						
	.dc.b	195				
	.dc.b	85				
	.dc.b	243				
						
	.dc.b	145				
						
	.dc.b	195				
	.dc.b	105				
	.dc.b	228				
						
	.dc.b	17				
						
	.dc.b	195				
	.dc.b	125				
	.dc.b	213				
						
	.dc.b	17				
						
	.dc.b	195				
	.dc.b	145				
	.dc.b	198				
						
	.dc.b	145				
						
	.dc.b	195				
	.dc.b	165				
	.dc.b	184				
						
	.dc.b	177				
						
	.dc.b	195				
	.dc.b	185				
	.dc.b	171				
						
	.dc.b	49				
						
	.dc.b	195				
	.dc.b	205				
	.dc.b	158				
						
	.dc.b	81				
						
	.dc.b	195				
	.dc.b	225				
	.dc.b	145				
						
	.dc.b	241				
						
	.dc.b	195				
	.dc.b	245				
	.dc.b	133				
						
	.dc.b	241				
						
	.dc.b	196				
	.dc.b	9				
	.dc.b	122				
						
	.dc.b	145				
						
	.dc.b	196				
	.dc.b	29				
	.dc.b	111				
						
	.dc.b	177				
						
	.dc.b	196				
	.dc.b	49				
	.dc.b	101				
						
	.dc.b	81				
						
	.dc.b	196				
	.dc.b	69				
	.dc.b	91				
						
	.dc.b	113				
						
	.dc.b	196				
	.dc.b	89				
	.dc.b	82				
						
	.dc.b	17				
						
	.dc.b	196				
	.dc.b	109				
	.dc.b	73				
						
	.dc.b	49				
						
	.dc.b	196				
	.dc.b	129				
	.dc.b	64				
						
	.dc.b	209				
						
	.dc.b	196				
	.dc.b	149				
	.dc.b	56				
						
	.dc.b	241				
						
	.dc.b	196				
	.dc.b	169				
	.dc.b	49				
						
	.dc.b	177				
						
	.dc.b	196				
	.dc.b	189				
	.dc.b	42				
						
	.dc.b	209				
						
	.dc.b	196				
	.dc.b	209				
	.dc.b	36				
						
	.dc.b	113				
						
	.dc.b	196				
	.dc.b	229				
	.dc.b	30				
						
	.dc.b	177				
						
	.dc.b	196				
	.dc.b	249				
	.dc.b	25				
						
	.dc.b	81				
						
	.dc.b	197				
	.dc.b	13				
	.dc.b	20				
						
	.dc.b	145				
						
	.dc.b	197				
	.dc.b	33				
	.dc.b	16				
						
	.dc.b	49				
						
	.dc.b	197				
	.dc.b	53				
	.dc.b	12				
						
	.dc.b	113				
						
	.dc.b	197				
	.dc.b	73				
	.dc.b	9				
						
	.dc.b	49				
						
	.dc.b	197				
	.dc.b	93				
	.dc.b	6				
						
	.dc.b	81				
						
	.dc.b	197				
	.dc.b	113				
	.dc.b	4				
						
	.dc.b	17				
						
	.dc.b	197				
	.dc.b	133				
	.dc.b	2				
						
	.dc.b	81				
						
	.dc.b	197				
	.dc.b	153				
	.dc.b	1				
						
	.dc.b	17				
						
	.dc.b	197				
	.dc.b	173				
	.dc.b	0				
						
	.dc.b	81				
						
	.dc.b	197				
	.dc.b	193				
	.dc.b	0				
						
	.dc.b	17				
						
	.dc.b	197				
	.dc.b	213				
	.dc.b	0				
						
	.dc.b	81				
						
	.dc.b	197				
	.dc.b	233				
	.dc.b	1				
						
	.dc.b	17				
						
	.dc.b	197				
	.dc.b	253				
	.dc.b	2				
						
	.dc.b	81				
						
	.dc.b	198				
	.dc.b	17				
	.dc.b	4				
						
	.dc.b	17				
						
	.dc.b	198				
	.dc.b	37				
	.dc.b	6				
						
	.dc.b	81				
						
	.dc.b	198				
	.dc.b	57				
	.dc.b	9				
						
	.dc.b	49				
						
	.dc.b	198				
	.dc.b	77				
	.dc.b	12				
						
	.dc.b	113				
						
	.dc.b	198				
	.dc.b	97				
	.dc.b	16				
						
	.dc.b	49				
						
	.dc.b	198				
	.dc.b	117				
	.dc.b	20				
						
	.dc.b	113				
						
	.dc.b	198				
	.dc.b	137				
	.dc.b	25				
						
	.dc.b	81				
						
	.dc.b	198				
	.dc.b	157				
	.dc.b	30				
						
	.dc.b	145				
						
	.dc.b	198				
	.dc.b	177				
	.dc.b	36				
						
	.dc.b	113				
						
	.dc.b	198				
	.dc.b	197				
	.dc.b	42				
						
	.dc.b	177				
						
	.dc.b	198				
	.dc.b	217				
	.dc.b	49				
						
	.dc.b	145				
						
	.dc.b	198				
	.dc.b	237				
	.dc.b	56				
						
	.dc.b	209				
						
	.dc.b	199				
	.dc.b	1				
	.dc.b	64				
						
	.dc.b	177				
						
	.dc.b	199				
	.dc.b	21				
	.dc.b	73				
						
	.dc.b	17				
						
	.dc.b	199				
	.dc.b	41				
	.dc.b	81				
						
	.dc.b	209				
						
	.dc.b	199				
	.dc.b	61				
	.dc.b	91				
						
	.dc.b	49				
						
	.dc.b	199				
	.dc.b	81				
	.dc.b	101				
						
	.dc.b	17				
						
	.dc.b	199				
	.dc.b	101				
	.dc.b	111				
						
	.dc.b	113				
						
	.dc.b	199				
	.dc.b	121				
	.dc.b	122				
						
	.dc.b	49				
						
	.dc.b	199				
	.dc.b	141				
	.dc.b	133				
						
	.dc.b	145				
						
	.dc.b	199				
	.dc.b	161				
	.dc.b	145				
						
	.dc.b	113				
						
	.dc.b	199				
	.dc.b	181				
	.dc.b	157				
						
	.dc.b	209				
						
	.dc.b	199				
	.dc.b	201				
	.dc.b	170				
						
	.dc.b	177				
						
	.dc.b	199				
	.dc.b	221				
	.dc.b	184				
						
	.dc.b	17				
						
	.dc.b	199				
	.dc.b	241				
	.dc.b	197				
						
	.dc.b	241				
						
	.dc.b	200				
	.dc.b	5				
	.dc.b	212				
						
	.dc.b	81				
						
	.dc.b	200				
	.dc.b	25				
	.dc.b	227				
						
	.dc.b	49				
						
	.dc.b	200				
	.dc.b	45				
	.dc.b	242				
						
	.dc.b	145				
						
	.dc.b	200				
	.dc.b	66				
	.dc.b	2				
						
	.dc.b	113				
						
	.dc.b	200				
	.dc.b	86				
	.dc.b	18				
						
	.dc.b	209				
						
	.dc.b	200				
	.dc.b	106				
	.dc.b	35				
						
	.dc.b	177				
						
	.dc.b	200				
	.dc.b	126				
	.dc.b	53				
						
	.dc.b	17				
						
	.dc.b	200				
	.dc.b	146				
	.dc.b	70				
						
	.dc.b	241				
						
	.dc.b	200				
	.dc.b	166				
	.dc.b	89				
						
	.dc.b	81				
						
	.dc.b	200				
	.dc.b	186				
	.dc.b	108				
						
	.dc.b	49				
						
	.dc.b	200				
	.dc.b	206				
	.dc.b	127				
						
	.dc.b	145				
						
	.dc.b	200				
	.dc.b	226				
	.dc.b	147				
						
	.dc.b	145				
						
	.dc.b	200				
	.dc.b	246				
	.dc.b	167				
						
	.dc.b	241				
						
	.dc.b	201				
	.dc.b	10				
	.dc.b	188				
						
	.dc.b	209				
						
	.dc.b	201				
	.dc.b	30				
	.dc.b	210				
						
	.dc.b	49				
						
	.dc.b	201				
	.dc.b	50				
	.dc.b	232				
						
	.dc.b	17				
						
	.dc.b	201				
	.dc.b	70				
	.dc.b	254				
						
	.dc.b	145				
						
	.dc.b	201				
	.dc.b	91				
	.dc.b	21				
						
	.dc.b	113				
						
	.dc.b	201				
	.dc.b	111				
	.dc.b	44				
						
	.dc.b	209				
						
	.dc.b	201				
	.dc.b	131				
	.dc.b	68				
						
	.dc.b	177				
						
	.dc.b	201				
	.dc.b	151				
	.dc.b	93				
						
	.dc.b	49				
						
	.dc.b	201				
	.dc.b	171				
	.dc.b	118				
						
	.dc.b	17				
						
	.dc.b	201				
	.dc.b	191				
	.dc.b	143				
						
	.dc.b	113				
						
	.dc.b	201				
	.dc.b	211				
	.dc.b	169				
						
	.dc.b	113				
						
	.dc.b	201				
	.dc.b	231				
	.dc.b	195				
						
	.dc.b	209				
						
	.dc.b	201				
	.dc.b	251				
	.dc.b	222				
						
	.dc.b	177				
						
	.dc.b	202				
	.dc.b	15				
	.dc.b	250				
						
	.dc.b	17				
						
	.dc.b	202				
	.dc.b	36				
	.dc.b	22				
						
	.dc.b	17				
						
	.dc.b	202				
	.dc.b	56				
	.dc.b	50				
						
	.dc.b	113				
						
	.dc.b	202				
	.dc.b	76				
	.dc.b	79				
						
	.dc.b	81				
						
	.dc.b	202				
	.dc.b	96				
	.dc.b	108				
						
	.dc.b	209				
						
	.dc.b	202				
	.dc.b	116				
	.dc.b	138				
						
	.dc.b	177				
						
	.dc.b	202				
	.dc.b	136				
	.dc.b	169				
						
	.dc.b	17				
						
	.dc.b	202				
	.dc.b	156				
	.dc.b	200				
						
	.dc.b	17				
						
	.dc.b	202				
	.dc.b	176				
	.dc.b	231				
						
	.dc.b	113				
						
	.dc.b	202				
	.dc.b	197				
	.dc.b	7				
						
	.dc.b	81				
						
	.dc.b	202				
	.dc.b	217				
	.dc.b	39				
						
	.dc.b	177				
						
	.dc.b	202				
	.dc.b	237				
	.dc.b	72				
						
	.dc.b	177				
						
	.dc.b	203				
	.dc.b	1				
	.dc.b	106				
						
	.dc.b	17				
						
	.dc.b	203				
	.dc.b	21				
	.dc.b	139				
						
	.dc.b	241				
						
	.dc.b	203				
	.dc.b	41				
	.dc.b	174				
						
	.dc.b	113				
						
	.dc.b	203				
	.dc.b	61				
	.dc.b	209				
						
	.dc.b	81				
						
	.dc.b	203				
	.dc.b	81				
	.dc.b	244				
						
	.dc.b	177				
						
	.dc.b	203				
	.dc.b	102				
	.dc.b	24				
						
	.dc.b	145				
						
	.dc.b	203				
	.dc.b	122				
	.dc.b	60				
						
	.dc.b	241				
						
	.dc.b	203				
	.dc.b	142				
	.dc.b	97				
						
	.dc.b	241				
						
	.dc.b	203				
	.dc.b	162				
	.dc.b	135				
						
	.dc.b	81				
						
	.dc.b	203				
	.dc.b	182				
	.dc.b	173				
						
	.dc.b	49				
						
	.dc.b	203				
	.dc.b	202				
	.dc.b	211				
						
	.dc.b	145				
						
	.dc.b	203				
	.dc.b	222				
	.dc.b	250				
						
	.dc.b	113				
						
	.dc.b	203				
	.dc.b	243				
	.dc.b	33				
						
	.dc.b	209				
						
	.dc.b	204				
	.dc.b	7				
	.dc.b	73				
						
	.dc.b	209				
						
	.dc.b	204				
	.dc.b	27				
	.dc.b	114				
						
	.dc.b	49				
						
	.dc.b	204				
	.dc.b	47				
	.dc.b	155				
						
	.dc.b	17				
						
	.dc.b	204				
	.dc.b	67				
	.dc.b	196				
						
	.dc.b	113				
						
	.dc.b	204				
	.dc.b	87				
	.dc.b	238				
						
	.dc.b	81				
						
	.dc.b	204				
	.dc.b	108				
	.dc.b	24				
						
	.dc.b	177				
						
	.dc.b	204				
	.dc.b	128				
	.dc.b	67				
						
	.dc.b	145				
						
	.dc.b	204				
	.dc.b	148				
	.dc.b	110				
						
	.dc.b	241				
						
	.dc.b	204				
	.dc.b	168				
	.dc.b	154				
						
	.dc.b	209				
						
	.dc.b	204				
	.dc.b	188				
	.dc.b	199				
						
	.dc.b	49				
						
	.dc.b	204				
	.dc.b	208				
	.dc.b	244				
						
	.dc.b	17				
						
	.dc.b	204				
	.dc.b	229				
	.dc.b	33				
						
	.dc.b	113				
						
	.dc.b	204				
	.dc.b	249				
	.dc.b	79				
						
	.dc.b	49				
						
	.dc.b	205				
	.dc.b	13				
	.dc.b	125				
						
	.dc.b	145				
						
	.dc.b	205				
	.dc.b	33				
	.dc.b	172				
						
	.dc.b	113				
						
	.dc.b	205				
	.dc.b	53				
	.dc.b	219				
						
	.dc.b	209				
						
	.dc.b	205				
	.dc.b	74				
	.dc.b	11				
						
	.dc.b	177				
						
	.dc.b	205				
	.dc.b	94				
	.dc.b	59				
						
	.dc.b	241				
						
	.dc.b	205				
	.dc.b	114				
	.dc.b	108				
						
	.dc.b	209				
						
	.dc.b	205				
	.dc.b	134				
	.dc.b	158				
						
	.dc.b	49				
						
	.dc.b	205				
	.dc.b	154				
	.dc.b	207				
						
	.dc.b	241				
						
	.dc.b	205				
	.dc.b	175				
	.dc.b	2				
						
	.dc.b	81				
						
	.dc.b	205				
	.dc.b	195				
	.dc.b	53				
						
	.dc.b	49				
						
	.dc.b	205				
	.dc.b	215				
	.dc.b	104				
						
	.dc.b	113				
						
	.dc.b	205				
	.dc.b	235				
	.dc.b	156				
						
	.dc.b	81				
						
	.dc.b	205				
	.dc.b	255				
	.dc.b	208				
						
	.dc.b	145				
						
	.dc.b	206				
	.dc.b	20				
	.dc.b	5				
						
	.dc.b	81				
						
	.dc.b	206				
	.dc.b	40				
	.dc.b	58				
						
	.dc.b	177				
						
	.dc.b	206				
	.dc.b	60				
	.dc.b	112				
						
	.dc.b	113				
						
	.dc.b	206				
	.dc.b	80				
	.dc.b	166				
						
	.dc.b	177				
						
	.dc.b	206				
	.dc.b	100				
	.dc.b	221				
						
	.dc.b	145				
						
	.dc.b	206				
	.dc.b	121				
	.dc.b	20				
						
	.dc.b	209				
						
	.dc.b	206				
	.dc.b	141				
	.dc.b	76				
						
	.dc.b	145				
						
	.dc.b	206				
	.dc.b	161				
	.dc.b	132				
						
	.dc.b	209				
						
	.dc.b	206				
	.dc.b	181				
	.dc.b	189				
						
	.dc.b	145				
						
	.dc.b	206				
	.dc.b	201				
	.dc.b	246				
						
	.dc.b	209				
						
	.dc.b	206				
	.dc.b	222				
	.dc.b	48				
						
	.dc.b	145				
						
	.dc.b	206				
	.dc.b	242				
	.dc.b	106				
						
	.dc.b	209				
						
	.dc.b	207				
	.dc.b	6				
	.dc.b	165				
						
	.dc.b	145				
						
	.dc.b	207				
	.dc.b	26				
	.dc.b	224				
						
	.dc.b	209				
						
	.dc.b	207				
	.dc.b	47				
	.dc.b	28				
						
	.dc.b	145				
						
	.dc.b	207				
	.dc.b	67				
	.dc.b	88				
						
	.dc.b	209				
						
	.dc.b	207				
	.dc.b	87				
	.dc.b	149				
						
	.dc.b	145				
						
	.dc.b	207				
	.dc.b	107				
	.dc.b	210				
						
	.dc.b	177				
						
	.dc.b	207				
	.dc.b	128				
	.dc.b	16				
						
	.dc.b	113				
						
	.dc.b	207				
	.dc.b	148				
	.dc.b	78				
						
	.dc.b	177				
						
	.dc.b	207				
	.dc.b	168				
	.dc.b	141				
						
	.dc.b	81				
						
	.dc.b	207				
	.dc.b	188				
	.dc.b	204				
						
	.dc.b	145				
						
	.dc.b	207				
	.dc.b	209				
	.dc.b	12				
						
	.dc.b	49				
						
	.dc.b	207				
	.dc.b	229				
	.dc.b	76				
						
	.dc.b	81				
						
	.dc.b	207				
	.dc.b	249				
	.dc.b	141				
						
	.dc.b	17				
						
	.dc.b	208				
	.dc.b	13				
	.dc.b	206				
						
	.dc.b	49				
						
	.dc.b	208				
	.dc.b	34				
	.dc.b	15				
						
	.dc.b	209				
						
	.dc.b	208				
	.dc.b	54				
	.dc.b	81				
						
	.dc.b	241				
						
	.dc.b	208				
	.dc.b	74				
	.dc.b	148				
						
	.dc.b	145				
						
	.dc.b	208				
	.dc.b	94				
	.dc.b	215				
						
	.dc.b	177				
						
	.dc.b	208				
	.dc.b	115				
	.dc.b	27				
						
	.dc.b	81				
						
	.dc.b	208				
	.dc.b	135				
	.dc.b	95				
						
	.dc.b	113				
						
	.dc.b	208				
	.dc.b	155				
	.dc.b	164				
						
	.dc.b	17				
						
	.dc.b	208				
	.dc.b	175				
	.dc.b	233				
						
	.dc.b	49				
						
	.dc.b	208				
	.dc.b	196				
	.dc.b	46				
						
	.dc.b	209				
						
	.dc.b	208				
	.dc.b	216				
	.dc.b	116				
						
	.dc.b	209				
						
	.dc.b	208				
	.dc.b	236				
	.dc.b	187				
						
	.dc.b	113				
						
	.dc.b	209				
	.dc.b	1				
	.dc.b	2				
						
	.dc.b	145				
						
	.dc.b	209				
	.dc.b	21				
	.dc.b	74				
						
	.dc.b	17				
						
	.dc.b	209				
	.dc.b	41				
	.dc.b	146				
						
	.dc.b	17				
						
	.dc.b	209				
	.dc.b	61				
	.dc.b	218				
						
	.dc.b	177				
						
	.dc.b	209				
	.dc.b	82				
	.dc.b	35				
						
	.dc.b	177				
						
	.dc.b	209				
	.dc.b	102				
	.dc.b	109				
						
	.dc.b	49				
						
	.dc.b	209				
	.dc.b	122				
	.dc.b	183				
						
	.dc.b	49				
						
	.dc.b	209				
	.dc.b	143				
	.dc.b	1				
						
	.dc.b	209				
						
	.dc.b	209				
	.dc.b	163				
	.dc.b	76				
						
	.dc.b	209				
						
	.dc.b	209				
	.dc.b	183				
	.dc.b	152				
						
	.dc.b	49				
						
	.dc.b	209				
	.dc.b	203				
	.dc.b	228				
						
	.dc.b	49				
						
	.dc.b	209				
	.dc.b	224				
	.dc.b	48				
						
	.dc.b	177				
						
	.dc.b	209				
	.dc.b	244				
	.dc.b	125				
						
	.dc.b	177				
						
	.dc.b	210				
	.dc.b	8				
	.dc.b	203				
						
	.dc.b	17				
						
	.dc.b	210				
	.dc.b	29				
	.dc.b	25				
						
	.dc.b	17				
						
	.dc.b	210				
	.dc.b	49				
	.dc.b	103				
						
	.dc.b	145				
						
	.dc.b	210				
	.dc.b	69				
	.dc.b	182				
						
	.dc.b	113				
						
	.dc.b	210				
	.dc.b	90				
	.dc.b	5				
						
	.dc.b	209				
						
	.dc.b	210				
	.dc.b	110				
	.dc.b	85				
						
	.dc.b	209				
						
	.dc.b	210				
	.dc.b	130				
	.dc.b	166				
						
	.dc.b	49				
						
	.dc.b	210				
	.dc.b	150				
	.dc.b	247				
						
	.dc.b	17				
						
	.dc.b	210				
	.dc.b	171				
	.dc.b	72				
						
	.dc.b	113				
						
	.dc.b	210				
	.dc.b	191				
	.dc.b	154				
						
	.dc.b	81				
						
	.dc.b	210				
	.dc.b	211				
	.dc.b	236				
						
	.dc.b	177				
						
	.dc.b	210				
	.dc.b	232				
	.dc.b	63				
						
	.dc.b	113				
						
	.dc.b	210				
	.dc.b	252				
	.dc.b	146				
						
	.dc.b	209				
						
	.dc.b	211				
	.dc.b	16				
	.dc.b	230				
						
	.dc.b	177				
						
	.dc.b	211				
	.dc.b	37				
	.dc.b	58				
						
	.dc.b	241				
						
	.dc.b	211				
	.dc.b	57				
	.dc.b	143				
						
	.dc.b	209				
						
	.dc.b	211				
	.dc.b	77				
	.dc.b	229				
						
	.dc.b	17				
						
	.dc.b	211				
	.dc.b	98				
	.dc.b	58				
						
	.dc.b	209				
						
	.dc.b	211				
	.dc.b	118				
	.dc.b	145				
						
	.dc.b	49				
						
	.dc.b	211				
	.dc.b	138				
	.dc.b	231				
						
	.dc.b	241				
						
	.dc.b	211				
	.dc.b	159				
	.dc.b	63				
						
	.dc.b	49				
						
	.dc.b	211				
	.dc.b	179				
	.dc.b	150				
						
	.dc.b	241				
						
	.dc.b	211				
	.dc.b	199				
	.dc.b	239				
						
	.dc.b	17				
						
	.dc.b	211				
	.dc.b	220				
	.dc.b	71				
						
	.dc.b	209				
						
	.dc.b	211				
	.dc.b	240				
	.dc.b	161				
						
	.dc.b	17				
						
	.dc.b	212				
	.dc.b	4				
	.dc.b	250				
						
	.dc.b	177				
						
	.dc.b	212				
	.dc.b	25				
	.dc.b	84				
						
	.dc.b	241				
						
	.dc.b	212				
	.dc.b	45				
	.dc.b	175				
						
	.dc.b	145				
						
	.dc.b	212				
	.dc.b	66				
	.dc.b	10				
						
	.dc.b	177				
						
	.dc.b	212				
	.dc.b	86				
	.dc.b	102				
						
	.dc.b	113				
						
	.dc.b	212				
	.dc.b	106				
	.dc.b	194				
						
	.dc.b	145				
						
	.dc.b	212				
	.dc.b	127				
	.dc.b	31				
						
	.dc.b	49				
						
	.dc.b	212				
	.dc.b	147				
	.dc.b	124				
						
	.dc.b	81				
						
	.dc.b	212				
	.dc.b	167				
	.dc.b	217				
						
	.dc.b	209				
						
	.dc.b	212				
	.dc.b	188				
	.dc.b	55				
						
	.dc.b	241				
						
	.dc.b	212				
	.dc.b	208				
	.dc.b	150				
						
	.dc.b	145				
						
	.dc.b	212				
	.dc.b	228				
	.dc.b	245				
						
	.dc.b	145				
						
	.dc.b	212				
	.dc.b	249				
	.dc.b	85				
						
	.dc.b	49				
						
	.dc.b	213				
	.dc.b	13				
	.dc.b	181				
						
	.dc.b	49				
						
	.dc.b	213				
	.dc.b	34				
	.dc.b	21				
						
	.dc.b	177				
						
	.dc.b	213				
	.dc.b	54				
	.dc.b	118				
						
	.dc.b	177				
						
	.dc.b	213				
	.dc.b	74				
	.dc.b	216				
						
	.dc.b	49				
						
	.dc.b	213				
	.dc.b	95				
	.dc.b	58				
						
	.dc.b	49				
						
	.dc.b	213				
	.dc.b	115				
	.dc.b	156				
						
	.dc.b	177				
						
	.dc.b	213				
	.dc.b	135				
	.dc.b	255				
						
	.dc.b	145				
						
	.dc.b	213				
	.dc.b	156				
	.dc.b	99				
						
	.dc.b	17				
						
	.dc.b	213				
	.dc.b	176				
	.dc.b	198				
						
	.dc.b	241				
						
	.dc.b	213				
	.dc.b	197				
	.dc.b	43				
						
	.dc.b	113				
						
	.dc.b	213				
	.dc.b	217				
	.dc.b	144				
						
	.dc.b	81				
						
	.dc.b	213				
	.dc.b	237				
	.dc.b	245				
						
	.dc.b	177				
						
	.dc.b	214				
	.dc.b	2				
	.dc.b	91				
						
	.dc.b	145				
						
	.dc.b	214				
	.dc.b	22				
	.dc.b	193				
						
	.dc.b	241				
						
	.dc.b	214				
	.dc.b	43				
	.dc.b	40				
						
	.dc.b	209				
						
	.dc.b	214				
	.dc.b	63				
	.dc.b	144				
						
	.dc.b	49				
						
	.dc.b	214				
	.dc.b	83				
	.dc.b	247				
						
	.dc.b	241				
						
	.dc.b	214				
	.dc.b	104				
	.dc.b	96				
						
	.dc.b	81				
						
	.dc.b	214				
	.dc.b	124				
	.dc.b	201				
						
	.dc.b	17				
						
	.dc.b	214				
	.dc.b	145				
	.dc.b	50				
						
	.dc.b	81				
						
	.dc.b	214				
	.dc.b	165				
	.dc.b	156				
						
	.dc.b	17				
						
	.dc.b	214				
	.dc.b	186				
	.dc.b	6				
						
	.dc.b	81				
						
	.dc.b	214				
	.dc.b	206				
	.dc.b	113				
						
	.dc.b	17				
						
	.dc.b	214				
	.dc.b	226				
	.dc.b	220				
						
	.dc.b	81				
						
	.dc.b	214				
	.dc.b	247				
	.dc.b	71				
						
	.dc.b	241				
						
	.dc.b	215				
	.dc.b	11				
	.dc.b	180				
						
	.dc.b	49				
						
	.dc.b	215				
	.dc.b	32				
	.dc.b	32				
						
	.dc.b	209				
						
	.dc.b	215				
	.dc.b	52				
	.dc.b	142				
						
	.dc.b	17				
						
	.dc.b	215				
	.dc.b	72				
	.dc.b	251				
						
	.dc.b	177				
						
	.dc.b	215				
	.dc.b	93				
	.dc.b	105				
						
	.dc.b	209				
						
	.dc.b	215				
	.dc.b	113				
	.dc.b	216				
						
	.dc.b	113				
						
	.dc.b	215				
	.dc.b	134				
	.dc.b	71				
						
	.dc.b	113				
						
	.dc.b	215				
	.dc.b	154				
	.dc.b	183				
						
	.dc.b	17				
						
	.dc.b	215				
	.dc.b	175				
	.dc.b	39				
						
	.dc.b	49				
						
	.dc.b	215				
	.dc.b	195				
	.dc.b	151				
						
	.dc.b	177				
						
	.dc.b	215				
	.dc.b	216				
	.dc.b	8				
						
	.dc.b	177				
						
	.dc.b	215				
	.dc.b	236				
	.dc.b	122				
						
	.dc.b	49				
						
	.dc.b	216				
	.dc.b	0				
	.dc.b	236				
						
	.dc.b	49				
						
	.dc.b	216				
	.dc.b	21				
	.dc.b	94				
						
	.dc.b	177				
						
	.dc.b	216				
	.dc.b	41				
	.dc.b	209				
						
	.dc.b	177				
						
	.dc.b	216				
	.dc.b	62				
	.dc.b	69				
						
	.dc.b	49				
						
	.dc.b	216				
	.dc.b	82				
	.dc.b	185				
						
	.dc.b	17				
						
	.dc.b	216				
	.dc.b	103				
	.dc.b	45				
						
	.dc.b	145				
						
	.dc.b	216				
	.dc.b	123				
	.dc.b	162				
						
	.dc.b	113				
						
	.dc.b	216				
	.dc.b	144				
	.dc.b	23				
						
	.dc.b	209				
						
	.dc.b	216				
	.dc.b	164				
	.dc.b	141				
						
	.dc.b	177				
						
	.dc.b	216				
	.dc.b	185				
	.dc.b	4				
						
	.dc.b	17				
						
	.dc.b	216				
	.dc.b	205				
	.dc.b	122				
						
	.dc.b	209				
						
	.dc.b	216				
	.dc.b	225				
	.dc.b	242				
						
	.dc.b	49				
						
	.dc.b	216				
	.dc.b	246				
	.dc.b	105				
						
	.dc.b	241				
						
	.dc.b	217				
	.dc.b	10				
	.dc.b	226				
						
	.dc.b	81				
						
	.dc.b	217				
	.dc.b	31				
	.dc.b	91				
						
	.dc.b	17				
						
	.dc.b	217				
	.dc.b	51				
	.dc.b	212				
						
	.dc.b	81				
						
	.dc.b	217				
	.dc.b	72				
	.dc.b	78				
						
	.dc.b	17				
						
	.dc.b	217				
	.dc.b	92				
	.dc.b	200				
						
	.dc.b	49				
						
	.dc.b	217				
	.dc.b	113				
	.dc.b	66				
						
	.dc.b	241				
						
	.dc.b	217				
	.dc.b	133				
	.dc.b	190				
						
	.dc.b	17				
						
	.dc.b	217				
	.dc.b	154				
	.dc.b	57				
						
	.dc.b	209				
						
	.dc.b	217				
	.dc.b	174				
	.dc.b	181				
						
	.dc.b	241				
						
	.dc.b	217				
	.dc.b	195				
	.dc.b	50				
						
	.dc.b	145				
						
	.dc.b	217				
	.dc.b	215				
	.dc.b	175				
						
	.dc.b	177				
						
	.dc.b	217				
	.dc.b	236				
	.dc.b	45				
						
	.dc.b	49				
						
	.dc.b	218				
	.dc.b	0				
	.dc.b	171				
						
	.dc.b	81				
						
	.dc.b	218				
	.dc.b	21				
	.dc.b	41				
						
	.dc.b	209				
						
	.dc.b	218				
	.dc.b	41				
	.dc.b	168				
						
	.dc.b	241				
						
	.dc.b	218				
	.dc.b	62				
	.dc.b	40				
						
	.dc.b	113				
						
	.dc.b	218				
	.dc.b	82				
	.dc.b	168				
						
	.dc.b	113				
						
	.dc.b	218				
	.dc.b	103				
	.dc.b	40				
						
	.dc.b	241				
						
	.dc.b	218				
	.dc.b	123				
	.dc.b	169				
						
	.dc.b	209				
						
	.dc.b	218				
	.dc.b	144				
	.dc.b	43				
						
	.dc.b	81				
						
	.dc.b	218				
	.dc.b	164				
	.dc.b	173				
						
	.dc.b	49				
						
	.dc.b	218				
	.dc.b	185				
	.dc.b	47				
						
	.dc.b	145				
						
	.dc.b	218				
	.dc.b	205				
	.dc.b	178				
						
	.dc.b	113				
						
	.dc.b	218				
	.dc.b	226				
	.dc.b	53				
						
	.dc.b	209				
						
	.dc.b	218				
	.dc.b	246				
	.dc.b	185				
						
	.dc.b	177				
						
	.dc.b	219				
	.dc.b	11				
	.dc.b	62				
						
	.dc.b	17				
						
	.dc.b	219				
	.dc.b	31				
	.dc.b	194				
						
	.dc.b	209				
						
	.dc.b	219				
	.dc.b	52				
	.dc.b	72				
						
	.dc.b	17				
						
	.dc.b	219				
	.dc.b	72				
	.dc.b	205				
						
	.dc.b	241				
						
	.dc.b	219				
	.dc.b	93				
	.dc.b	84				
						
	.dc.b	49				
						
	.dc.b	219				
	.dc.b	113				
	.dc.b	218				
						
	.dc.b	209				
						
	.dc.b	219				
	.dc.b	134				
	.dc.b	98				
						
	.dc.b	17				
						
	.dc.b	219				
	.dc.b	154				
	.dc.b	233				
						
	.dc.b	177				
						
	.dc.b	219				
	.dc.b	175				
	.dc.b	113				
						
	.dc.b	241				
						
	.dc.b	219				
	.dc.b	195				
	.dc.b	250				
						
	.dc.b	145				
						
	.dc.b	219				
	.dc.b	216				
	.dc.b	131				
						
	.dc.b	177				
						
	.dc.b	219				
	.dc.b	237				
	.dc.b	13				
						
	.dc.b	81				
						
	.dc.b	220				
	.dc.b	1				
	.dc.b	151				
						
	.dc.b	113				
						
	.dc.b	220				
	.dc.b	22				
	.dc.b	33				
						
	.dc.b	241				
						
	.dc.b	220				
	.dc.b	42				
	.dc.b	172				
						
	.dc.b	241				
						
	.dc.b	220				
	.dc.b	63				
	.dc.b	56				
						
	.dc.b	145				
						
	.dc.b	220				
	.dc.b	83				
	.dc.b	196				
						
	.dc.b	145				
						
	.dc.b	220				
	.dc.b	104				
	.dc.b	80				
						
	.dc.b	241				
						
	.dc.b	220				
	.dc.b	124				
	.dc.b	221				
						
	.dc.b	241				
						
	.dc.b	220				
	.dc.b	145				
	.dc.b	107				
						
	.dc.b	113				
						
	.dc.b	220				
	.dc.b	165				
	.dc.b	249				
						
	.dc.b	81				
						
	.dc.b	220				
	.dc.b	186				
	.dc.b	135				
						
	.dc.b	177				
						
	.dc.b	220				
	.dc.b	207				
	.dc.b	22				
						
	.dc.b	145				
						
	.dc.b	220				
	.dc.b	227				
	.dc.b	165				
						
	.dc.b	241				
						
	.dc.b	220				
	.dc.b	248				
	.dc.b	53				
						
	.dc.b	209				
						
	.dc.b	221				
	.dc.b	12				
	.dc.b	198				
						
	.dc.b	17				
						
	.dc.b	221				
	.dc.b	33				
	.dc.b	86				
						
	.dc.b	241				
						
	.dc.b	221				
	.dc.b	53				
	.dc.b	232				
						
	.dc.b	49				
						
	.dc.b	221				
	.dc.b	74				
	.dc.b	121				
						
	.dc.b	241				
						
	.dc.b	221				
	.dc.b	95				
	.dc.b	12				
						
	.dc.b	17				
						
	.dc.b	221				
	.dc.b	115				
	.dc.b	158				
						
	.dc.b	209				
						
	.dc.b	221				
	.dc.b	136				
	.dc.b	49				
						
	.dc.b	241				
						
	.dc.b	221				
	.dc.b	156				
	.dc.b	197				
						
	.dc.b	177				
						
	.dc.b	221				
	.dc.b	177				
	.dc.b	89				
						
	.dc.b	209				
						
	.dc.b	221				
	.dc.b	197				
	.dc.b	238				
						
	.dc.b	113				
						
	.dc.b	221				
	.dc.b	218				
	.dc.b	131				
						
	.dc.b	113				
						
	.dc.b	221				
	.dc.b	239				
	.dc.b	25				
						
	.dc.b	17				
						
	.dc.b	222				
	.dc.b	3				
	.dc.b	175				
						
	.dc.b	17				
						
	.dc.b	222				
	.dc.b	24				
	.dc.b	69				
						
	.dc.b	145				
						
	.dc.b	222				
	.dc.b	44				
	.dc.b	220				
						
	.dc.b	145				
						
	.dc.b	222				
	.dc.b	65				
	.dc.b	116				
						
	.dc.b	17				
						
	.dc.b	222				
	.dc.b	86				
	.dc.b	12				
						
	.dc.b	17				
						
	.dc.b	222				
	.dc.b	106				
	.dc.b	164				
						
	.dc.b	113				
						
	.dc.b	222				
	.dc.b	127				
	.dc.b	61				
						
	.dc.b	113				
						
	.dc.b	222				
	.dc.b	147				
	.dc.b	214				
						
	.dc.b	209				
						
	.dc.b	222				
	.dc.b	168				
	.dc.b	112				
						
	.dc.b	177				
						
	.dc.b	222				
	.dc.b	189				
	.dc.b	10				
						
	.dc.b	241				
						
	.dc.b	222				
	.dc.b	209				
	.dc.b	165				
						
	.dc.b	209				
						
	.dc.b	222				
	.dc.b	230				
	.dc.b	65				
						
	.dc.b	17				
						
	.dc.b	222				
	.dc.b	250				
	.dc.b	220				
						
	.dc.b	209				
						
	.dc.b	223				
	.dc.b	15				
	.dc.b	121				
						
	.dc.b	17				
						
	.dc.b	223				
	.dc.b	36				
	.dc.b	21				
						
	.dc.b	209				
						
	.dc.b	223				
	.dc.b	56				
	.dc.b	178				
						
	.dc.b	241				
						
	.dc.b	223				
	.dc.b	77				
	.dc.b	80				
						
	.dc.b	177				
						
	.dc.b	223				
	.dc.b	97				
	.dc.b	238				
						
	.dc.b	209				
						
	.dc.b	223				
	.dc.b	118				
	.dc.b	141				
						
	.dc.b	113				
						
	.dc.b	223				
	.dc.b	139				
	.dc.b	44				
						
	.dc.b	145				
						
	.dc.b	223				
	.dc.b	159				
	.dc.b	204				
						
	.dc.b	17				
						
	.dc.b	223				
	.dc.b	180				
	.dc.b	108				
						
	.dc.b	49				
						
	.dc.b	223				
	.dc.b	201				
	.dc.b	12				
						
	.dc.b	177				
						
	.dc.b	223				
	.dc.b	221				
	.dc.b	173				
						
	.dc.b	177				
						
	.dc.b	223				
	.dc.b	242				
	.dc.b	79				
						
	.dc.b	49				
						
	.dc.b	224				
	.dc.b	6				
	.dc.b	241				
						
	.dc.b	17				
						
	.dc.b	224				
	.dc.b	27				
	.dc.b	147				
						
	.dc.b	145				
						
	.dc.b	224				
	.dc.b	48				
	.dc.b	54				
						
	.dc.b	113				
						
	.dc.b	224				
	.dc.b	68				
	.dc.b	217				
						
	.dc.b	209				
						
	.dc.b	224				
	.dc.b	89				
	.dc.b	125				
						
	.dc.b	177				
						
	.dc.b	224				
	.dc.b	110				
	.dc.b	33				
						
	.dc.b	241				
						
	.dc.b	224				
	.dc.b	130				
	.dc.b	198				
						
	.dc.b	209				
						
	.dc.b	224				
	.dc.b	151				
	.dc.b	108				
						
	.dc.b	17				
						
	.dc.b	224				
	.dc.b	172				
	.dc.b	17				
						
	.dc.b	209				
						
	.dc.b	224				
	.dc.b	192				
	.dc.b	184				
						
	.dc.b	17				
						
	.dc.b	224				
	.dc.b	213				
	.dc.b	94				
						
	.dc.b	177				
						
	.dc.b	224				
	.dc.b	234				
	.dc.b	5				
						
	.dc.b	241				
						
	.dc.b	224				
	.dc.b	254				
	.dc.b	173				
						
	.dc.b	145				
						
	.dc.b	225				
	.dc.b	19				
	.dc.b	85				
						
	.dc.b	177				
						
	.dc.b	225				
	.dc.b	39				
	.dc.b	254				
						
	.dc.b	81				
						
	.dc.b	225				
	.dc.b	60				
	.dc.b	167				
						
	.dc.b	81				
						
	.dc.b	225				
	.dc.b	81				
	.dc.b	80				
						
	.dc.b	209				
						
	.dc.b	225				
	.dc.b	101				
	.dc.b	250				
						
	.dc.b	241				
						
	.dc.b	225				
	.dc.b	122				
	.dc.b	165				
						
	.dc.b	81				
						
	.dc.b	225				
	.dc.b	143				
	.dc.b	80				
						
	.dc.b	81				
						
	.dc.b	225				
	.dc.b	163				
	.dc.b	251				
						
	.dc.b	209				
						
	.dc.b	225				
	.dc.b	184				
	.dc.b	167				
						
	.dc.b	177				
						
	.dc.b	225				
	.dc.b	205				
	.dc.b	84				
						
	.dc.b	17				
						
	.dc.b	225				
	.dc.b	226				
	.dc.b	0				
						
	.dc.b	241				
						
	.dc.b	225				
	.dc.b	246				
	.dc.b	174				
						
	.dc.b	49				
						
	.dc.b	226				
	.dc.b	11				
	.dc.b	92				
						
	.dc.b	17				
						
	.dc.b	226				
	.dc.b	32				
	.dc.b	10				
						
	.dc.b	81				
						
	.dc.b	226				
	.dc.b	52				
	.dc.b	185				
						
	.dc.b	17				
						
	.dc.b	226				
	.dc.b	73				
	.dc.b	104				
						
	.dc.b	81				
						
	.dc.b	226				
	.dc.b	94				
	.dc.b	23				
						
	.dc.b	241				
						
	.dc.b	226				
	.dc.b	114				
	.dc.b	200				
						
	.dc.b	49				
						
	.dc.b	226				
	.dc.b	135				
	.dc.b	120				
						
	.dc.b	209				
						
	.dc.b	226				
	.dc.b	156				
	.dc.b	41				
						
	.dc.b	241				
						
	.dc.b	226				
	.dc.b	176				
	.dc.b	219				
						
	.dc.b	113				
						
	.dc.b	226				
	.dc.b	197				
	.dc.b	141				
						
	.dc.b	145				
						
	.dc.b	226				
	.dc.b	218				
	.dc.b	64				
						
	.dc.b	17				
						
	.dc.b	226				
	.dc.b	238				
	.dc.b	243				
						
	.dc.b	17				
						
	.dc.b	227				
	.dc.b	3				
	.dc.b	166				
						
	.dc.b	145				
						
	.dc.b	227				
	.dc.b	24				
	.dc.b	90				
						
	.dc.b	113				
						
	.dc.b	227				
	.dc.b	45				
	.dc.b	14				
						
	.dc.b	241				
						
	.dc.b	227				
	.dc.b	65				
	.dc.b	195				
						
	.dc.b	209				
						
	.dc.b	227				
	.dc.b	86				
	.dc.b	121				
						
	.dc.b	49				
						
	.dc.b	227				
	.dc.b	107				
	.dc.b	46				
						
	.dc.b	241				
						
	.dc.b	227				
	.dc.b	127				
	.dc.b	229				
						
	.dc.b	81				
						
	.dc.b	227				
	.dc.b	148				
	.dc.b	156				
						
	.dc.b	17				
						
	.dc.b	227				
	.dc.b	169				
	.dc.b	83				
						
	.dc.b	81				
						
	.dc.b	227				
	.dc.b	190				
	.dc.b	11				
						
	.dc.b	17				
						
	.dc.b	227				
	.dc.b	210				
	.dc.b	195				
						
	.dc.b	49				
						
	.dc.b	227				
	.dc.b	231				
	.dc.b	123				
						
	.dc.b	209				
						
	.dc.b	227				
	.dc.b	252				
	.dc.b	53				
						
	.dc.b	17				
						
	.dc.b	228				
	.dc.b	16				
	.dc.b	238				
						
	.dc.b	145				
						
	.dc.b	228				
	.dc.b	37				
	.dc.b	168				
						
	.dc.b	177				
						
	.dc.b	228				
	.dc.b	58				
	.dc.b	99				
						
	.dc.b	49				
						
	.dc.b	228				
	.dc.b	79				
	.dc.b	30				
						
	.dc.b	49				
						
	.dc.b	228				
	.dc.b	99				
	.dc.b	217				
						
	.dc.b	177				
						
	.dc.b	228				
	.dc.b	120				
	.dc.b	149				
						
	.dc.b	177				
						
	.dc.b	228				
	.dc.b	141				
	.dc.b	82				
						
	.dc.b	17				
						
	.dc.b	228				
	.dc.b	162				
	.dc.b	14				
						
	.dc.b	241				
						
	.dc.b	228				
	.dc.b	182				
	.dc.b	204				
						
	.dc.b	81				
						
	.dc.b	228				
	.dc.b	203				
	.dc.b	138				
						
	.dc.b	49				
						
	.dc.b	228				
	.dc.b	224				
	.dc.b	72				
						
	.dc.b	145				
						
	.dc.b	228				
	.dc.b	245				
	.dc.b	7				
						
	.dc.b	81				
						
	.dc.b	229				
	.dc.b	9				
	.dc.b	198				
						
	.dc.b	145				
						
	.dc.b	229				
	.dc.b	30				
	.dc.b	134				
						
	.dc.b	49				
						
	.dc.b	229				
	.dc.b	51				
	.dc.b	70				
						
	.dc.b	113				
						
	.dc.b	229				
	.dc.b	72				
	.dc.b	7				
						
	.dc.b	17				
						
	.dc.b	229				
	.dc.b	92				
	.dc.b	200				
						
	.dc.b	49				
						
	.dc.b	229				
	.dc.b	113				
	.dc.b	137				
						
	.dc.b	209				
						
	.dc.b	229				
	.dc.b	134				
	.dc.b	75				
						
	.dc.b	209				
						
	.dc.b	229				
	.dc.b	155				
	.dc.b	14				
						
	.dc.b	113				
						
	.dc.b	229				
	.dc.b	175				
	.dc.b	209				
						
	.dc.b	113				
						
	.dc.b	229				
	.dc.b	196				
	.dc.b	148				
						
	.dc.b	241				
						
	.dc.b	229				
	.dc.b	217				
	.dc.b	88				
						
	.dc.b	209				
						
	.dc.b	229				
	.dc.b	238				
	.dc.b	29				
						
	.dc.b	49				
						
	.dc.b	230				
	.dc.b	2				
	.dc.b	226				
						
	.dc.b	17				
						
	.dc.b	230				
	.dc.b	23				
	.dc.b	167				
						
	.dc.b	113				
						
	.dc.b	230				
	.dc.b	44				
	.dc.b	109				
						
	.dc.b	81				
						
	.dc.b	230				
	.dc.b	65				
	.dc.b	51				
						
	.dc.b	145				
						
	.dc.b	230				
	.dc.b	85				
	.dc.b	250				
						
	.dc.b	81				
						
	.dc.b	230				
	.dc.b	106				
	.dc.b	193				
						
	.dc.b	145				
						
	.dc.b	230				
	.dc.b	127				
	.dc.b	137				
						
	.dc.b	49				
						
	.dc.b	230				
	.dc.b	148				
	.dc.b	81				
						
	.dc.b	113				
						
	.dc.b	230				
	.dc.b	169				
	.dc.b	26				
						
	.dc.b	17				
						
	.dc.b	230				
	.dc.b	189				
	.dc.b	227				
						
	.dc.b	17				
						
	.dc.b	230				
	.dc.b	210				
	.dc.b	172				
						
	.dc.b	177				
						
	.dc.b	230				
	.dc.b	231				
	.dc.b	118				
						
	.dc.b	177				
						
	.dc.b	230				
	.dc.b	252				
	.dc.b	65				
						
	.dc.b	49				
						
	.dc.b	231				
	.dc.b	17				
	.dc.b	12				
						
	.dc.b	49				
						
	.dc.b	231				
	.dc.b	37				
	.dc.b	215				
						
	.dc.b	145				
						
	.dc.b	231				
	.dc.b	58				
	.dc.b	163				
						
	.dc.b	145				
						
	.dc.b	231				
	.dc.b	79				
	.dc.b	111				
						
	.dc.b	241				
						
	.dc.b	231				
	.dc.b	100				
	.dc.b	60				
						
	.dc.b	177				
						
	.dc.b	231				
	.dc.b	121				
	.dc.b	10				
						
	.dc.b	17				
						
	.dc.b	231				
	.dc.b	141				
	.dc.b	215				
						
	.dc.b	209				
						
	.dc.b	231				
	.dc.b	162				
	.dc.b	166				
						
	.dc.b	17				
						
	.dc.b	231				
	.dc.b	183				
	.dc.b	116				
						
	.dc.b	209				
						
	.dc.b	231				
	.dc.b	204				
	.dc.b	67				
						
	.dc.b	241				
						
	.dc.b	231				
	.dc.b	225				
	.dc.b	19				
						
	.dc.b	145				
						
	.dc.b	231				
	.dc.b	245				
	.dc.b	227				
						
	.dc.b	177				
						
	.dc.b	232				
	.dc.b	10				
	.dc.b	180				
						
	.dc.b	81				
						
	.dc.b	232				
	.dc.b	31				
	.dc.b	133				
						
	.dc.b	81				
						
	.dc.b	232				
	.dc.b	52				
	.dc.b	86				
						
	.dc.b	209				
						
	.dc.b	232				
	.dc.b	73				
	.dc.b	40				
						
	.dc.b	209				
						
	.dc.b	232				
	.dc.b	93				
	.dc.b	251				
						
	.dc.b	49				
						
	.dc.b	232				
	.dc.b	114				
	.dc.b	206				
						
	.dc.b	49				
						
	.dc.b	232				
	.dc.b	135				
	.dc.b	161				
						
	.dc.b	145				
						
	.dc.b	232				
	.dc.b	156				
	.dc.b	117				
						
	.dc.b	81				
						
	.dc.b	232				
	.dc.b	177				
	.dc.b	73				
						
	.dc.b	177				
						
	.dc.b	232				
	.dc.b	198				
	.dc.b	30				
						
	.dc.b	113				
						
	.dc.b	232				
	.dc.b	218				
	.dc.b	243				
						
	.dc.b	177				
						
	.dc.b	232				
	.dc.b	239				
	.dc.b	201				
						
	.dc.b	113				
						
	.dc.b	233				
	.dc.b	4				
	.dc.b	159				
						
	.dc.b	145				
						
	.dc.b	233				
	.dc.b	25				
	.dc.b	118				
						
	.dc.b	49				
						
	.dc.b	233				
	.dc.b	46				
	.dc.b	77				
						
	.dc.b	81				
						
	.dc.b	233				
	.dc.b	67				
	.dc.b	36				
						
	.dc.b	241				
						
	.dc.b	233				
	.dc.b	87				
	.dc.b	252				
						
	.dc.b	241				
						
	.dc.b	233				
	.dc.b	108				
	.dc.b	213				
						
	.dc.b	113				
						
	.dc.b	233				
	.dc.b	129				
	.dc.b	174				
						
	.dc.b	113				
						
	.dc.b	233				
	.dc.b	150				
	.dc.b	135				
						
	.dc.b	209				
						
	.dc.b	233				
	.dc.b	171				
	.dc.b	97				
						
	.dc.b	177				
						
	.dc.b	233				
	.dc.b	192				
	.dc.b	60				
						
	.dc.b	17				
						
	.dc.b	233				
	.dc.b	213				
	.dc.b	22				
						
	.dc.b	241				
						
	.dc.b	233				
	.dc.b	233				
	.dc.b	242				
						
	.dc.b	49				
						
	.dc.b	233				
	.dc.b	254				
	.dc.b	205				
						
	.dc.b	241				
						
	.dc.b	234				
	.dc.b	19				
	.dc.b	170				
						
	.dc.b	49				
						
	.dc.b	234				
	.dc.b	40				
	.dc.b	134				
						
	.dc.b	241				
						
	.dc.b	234				
	.dc.b	61				
	.dc.b	100				
						
	.dc.b	17				
						
	.dc.b	234				
	.dc.b	82				
	.dc.b	65				
						
	.dc.b	177				
						
	.dc.b	234				
	.dc.b	103				
	.dc.b	31				
						
	.dc.b	177				
						
	.dc.b	234				
	.dc.b	123				
	.dc.b	254				
						
	.dc.b	81				
						
	.dc.b	234				
	.dc.b	144				
	.dc.b	221				
						
	.dc.b	81				
						
	.dc.b	234				
	.dc.b	165				
	.dc.b	188				
						
	.dc.b	209				
						
	.dc.b	234				
	.dc.b	186				
	.dc.b	156				
						
	.dc.b	177				
						
	.dc.b	234				
	.dc.b	207				
	.dc.b	125				
						
	.dc.b	17				
						
	.dc.b	234				
	.dc.b	228				
	.dc.b	93				
						
	.dc.b	241				
						
	.dc.b	234				
	.dc.b	249				
	.dc.b	63				
						
	.dc.b	81				
						
	.dc.b	235				
	.dc.b	14				
	.dc.b	33				
						
	.dc.b	17				
						
	.dc.b	235				
	.dc.b	35				
	.dc.b	3				
						
	.dc.b	81				
						
	.dc.b	235				
	.dc.b	55				
	.dc.b	230				
						
	.dc.b	17				
						
	.dc.b	235				
	.dc.b	76				
	.dc.b	201				
						
	.dc.b	81				
						
	.dc.b	235				
	.dc.b	97				
	.dc.b	172				
						
	.dc.b	241				
						
	.dc.b	235				
	.dc.b	118				
	.dc.b	145				
						
	.dc.b	17				
						
	.dc.b	235				
	.dc.b	139				
	.dc.b	117				
						
	.dc.b	145				
						
	.dc.b	235				
	.dc.b	160				
	.dc.b	90				
						
	.dc.b	177				
						
	.dc.b	235				
	.dc.b	181				
	.dc.b	64				
						
	.dc.b	49				
						
	.dc.b	235				
	.dc.b	202				
	.dc.b	38				
						
	.dc.b	17				
						
	.dc.b	235				
	.dc.b	223				
	.dc.b	12				
						
	.dc.b	145				
						
	.dc.b	235				
	.dc.b	243				
	.dc.b	243				
						
	.dc.b	113				
						
	.dc.b	236				
	.dc.b	8				
	.dc.b	218				
						
	.dc.b	209				
						
	.dc.b	236				
	.dc.b	29				
	.dc.b	194				
						
	.dc.b	145				
						
	.dc.b	236				
	.dc.b	50				
	.dc.b	170				
						
	.dc.b	241				
						
	.dc.b	236				
	.dc.b	71				
	.dc.b	147				
						
	.dc.b	177				
						
	.dc.b	236				
	.dc.b	92				
	.dc.b	124				
						
	.dc.b	209				
						
	.dc.b	236				
	.dc.b	113				
	.dc.b	102				
						
	.dc.b	145				
						
	.dc.b	236				
	.dc.b	134				
	.dc.b	80				
						
	.dc.b	177				
						
	.dc.b	236				
	.dc.b	155				
	.dc.b	59				
						
	.dc.b	49				
						
	.dc.b	236				
	.dc.b	176				
	.dc.b	38				
						
	.dc.b	81				
						
	.dc.b	236				
	.dc.b	197				
	.dc.b	17				
						
	.dc.b	209				
						
	.dc.b	236				
	.dc.b	217				
	.dc.b	253				
						
	.dc.b	209				
						
	.dc.b	236				
	.dc.b	238				
	.dc.b	234				
						
	.dc.b	49				
						
	.dc.b	237				
	.dc.b	3				
	.dc.b	215				
						
	.dc.b	49				
						
	.dc.b	237				
	.dc.b	24				
	.dc.b	196				
						
	.dc.b	145				
						
	.dc.b	237				
	.dc.b	45				
	.dc.b	178				
						
	.dc.b	81				
						
	.dc.b	237				
	.dc.b	66				
	.dc.b	160				
						
	.dc.b	177				
						
	.dc.b	237				
	.dc.b	87				
	.dc.b	143				
						
	.dc.b	113				
						
	.dc.b	237				
	.dc.b	108				
	.dc.b	126				
						
	.dc.b	145				
						
	.dc.b	237				
	.dc.b	129				
	.dc.b	110				
						
	.dc.b	81				
						
	.dc.b	237				
	.dc.b	150				
	.dc.b	94				
						
	.dc.b	113				
						
	.dc.b	237				
	.dc.b	171				
	.dc.b	79				
						
	.dc.b	17				
						
	.dc.b	237				
	.dc.b	192				
	.dc.b	64				
						
	.dc.b	17				
						
	.dc.b	237				
	.dc.b	213				
	.dc.b	49				
						
	.dc.b	145				
						
	.dc.b	237				
	.dc.b	234				
	.dc.b	35				
						
	.dc.b	145				
						
	.dc.b	237				
	.dc.b	255				
	.dc.b	22				
						
	.dc.b	17				
						
	.dc.b	238				
	.dc.b	20				
	.dc.b	8				
						
	.dc.b	241				
						
	.dc.b	238				
	.dc.b	40				
	.dc.b	252				
						
	.dc.b	81				
						
	.dc.b	238				
	.dc.b	61				
	.dc.b	240				
						
	.dc.b	17				
						
	.dc.b	238				
	.dc.b	82				
	.dc.b	228				
						
	.dc.b	113				
						
	.dc.b	238				
	.dc.b	103				
	.dc.b	217				
						
	.dc.b	49				
						
	.dc.b	238				
	.dc.b	124				
	.dc.b	206				
						
	.dc.b	81				
						
	.dc.b	238				
	.dc.b	145				
	.dc.b	196				
						
	.dc.b	17				
						
	.dc.b	238				
	.dc.b	166				
	.dc.b	186				
						
	.dc.b	49				
						
	.dc.b	238				
	.dc.b	187				
	.dc.b	176				
						
	.dc.b	177				
						
	.dc.b	238				
	.dc.b	208				
	.dc.b	167				
						
	.dc.b	209				
						
	.dc.b	238				
	.dc.b	229				
	.dc.b	159				
						
	.dc.b	81				
						
	.dc.b	238				
	.dc.b	250				
	.dc.b	151				
						
	.dc.b	81				
						
	.dc.b	239				
	.dc.b	15				
	.dc.b	143				
						
	.dc.b	177				
						
	.dc.b	239				
	.dc.b	36				
	.dc.b	136				
						
	.dc.b	145				
						
	.dc.b	239				
	.dc.b	57				
	.dc.b	129				
						
	.dc.b	241				
						
	.dc.b	239				
	.dc.b	78				
	.dc.b	123				
						
	.dc.b	177				
						
	.dc.b	239				
	.dc.b	99				
	.dc.b	117				
						
	.dc.b	241				
						
	.dc.b	239				
	.dc.b	120				
	.dc.b	112				
						
	.dc.b	177				
						
	.dc.b	239				
	.dc.b	141				
	.dc.b	107				
						
	.dc.b	241				
						
	.dc.b	239				
	.dc.b	162				
	.dc.b	103				
						
	.dc.b	145				
						
	.dc.b	239				
	.dc.b	183				
	.dc.b	99				
						
	.dc.b	177				
						
	.dc.b	239				
	.dc.b	204				
	.dc.b	96				
						
	.dc.b	49				
						
	.dc.b	239				
	.dc.b	225				
	.dc.b	93				
						
	.dc.b	49				
						
	.dc.b	239				
	.dc.b	246				
	.dc.b	90				
						
	.dc.b	177				
						
	.dc.b	240				
	.dc.b	11				
	.dc.b	88				
						
	.dc.b	177				
						
	.dc.b	240				
	.dc.b	32				
	.dc.b	87				
						
	.dc.b	17				
						
	.dc.b	240				
	.dc.b	53				
	.dc.b	85				
						
	.dc.b	241				
						
	.dc.b	240				
	.dc.b	74				
	.dc.b	85				
						
	.dc.b	81				
						
	.dc.b	240				
	.dc.b	95				
	.dc.b	85				
						
	.dc.b	17				
						
	.dc.b	240				
	.dc.b	116				
	.dc.b	85				
						
	.dc.b	81				
						
	.dc.b	240				
	.dc.b	137				
	.dc.b	85				
						
	.dc.b	241				
						
	.dc.b	240				
	.dc.b	158				
	.dc.b	87				
						
	.dc.b	17				
						
	.dc.b	240				
	.dc.b	179				
	.dc.b	88				
						
	.dc.b	177				
						
	.dc.b	240				
	.dc.b	200				
	.dc.b	90				
						
	.dc.b	209				
						
	.dc.b	240				
	.dc.b	221				
	.dc.b	93				
						
	.dc.b	81				
						
	.dc.b	240				
	.dc.b	242				
	.dc.b	96				
						
	.dc.b	81				
						
	.dc.b	241				
	.dc.b	7				
	.dc.b	99				
						
	.dc.b	209				
						
	.dc.b	241				
	.dc.b	28				
	.dc.b	103				
						
	.dc.b	177				
						
	.dc.b	241				
	.dc.b	49				
	.dc.b	108				
						
	.dc.b	17				
						
	.dc.b	241				
	.dc.b	70				
	.dc.b	112				
						
	.dc.b	209				
						
	.dc.b	241				
	.dc.b	91				
	.dc.b	118				
						
	.dc.b	17				
						
	.dc.b	241				
	.dc.b	112				
	.dc.b	123				
						
	.dc.b	209				
						
	.dc.b	241				
	.dc.b	133				
	.dc.b	130				
						
	.dc.b	17				
						
	.dc.b	241				
	.dc.b	154				
	.dc.b	136				
						
	.dc.b	177				
						
	.dc.b	241				
	.dc.b	175				
	.dc.b	143				
						
	.dc.b	209				
						
	.dc.b	241				
	.dc.b	196				
	.dc.b	151				
						
	.dc.b	81				
						
	.dc.b	241				
	.dc.b	217				
	.dc.b	159				
						
	.dc.b	113				
						
	.dc.b	241				
	.dc.b	238				
	.dc.b	167				
						
	.dc.b	209				
						
	.dc.b	242				
	.dc.b	3				
	.dc.b	176				
						
	.dc.b	209				
						
	.dc.b	242				
	.dc.b	24				
	.dc.b	186				
						
	.dc.b	49				
						
	.dc.b	242				
	.dc.b	45				
	.dc.b	196				
						
	.dc.b	17				
						
	.dc.b	242				
	.dc.b	66				
	.dc.b	206				
						
	.dc.b	81				
						
	.dc.b	242				
	.dc.b	87				
	.dc.b	217				
						
	.dc.b	17				
						
	.dc.b	242				
	.dc.b	108				
	.dc.b	228				
						
	.dc.b	81				
						
	.dc.b	242				
	.dc.b	129				
	.dc.b	240				
						
	.dc.b	17				
						
	.dc.b	242				
	.dc.b	150				
	.dc.b	252				
						
	.dc.b	49				
						
	.dc.b	242				
	.dc.b	172				
	.dc.b	8				
						
	.dc.b	177				
						
	.dc.b	242				
	.dc.b	193				
	.dc.b	21				
						
	.dc.b	209				
						
	.dc.b	242				
	.dc.b	214				
	.dc.b	35				
						
	.dc.b	81				
						
	.dc.b	242				
	.dc.b	235				
	.dc.b	49				
						
	.dc.b	81				
						
	.dc.b	243				
	.dc.b	0				
	.dc.b	63				
						
	.dc.b	177				
						
	.dc.b	243				
	.dc.b	21				
	.dc.b	78				
						
	.dc.b	145				
						
	.dc.b	243				
	.dc.b	42				
	.dc.b	93				
						
	.dc.b	209				
						
	.dc.b	243				
	.dc.b	63				
	.dc.b	109				
						
	.dc.b	177				
						
	.dc.b	243				
	.dc.b	84				
	.dc.b	125				
						
	.dc.b	241				
						
	.dc.b	243				
	.dc.b	105				
	.dc.b	142				
						
	.dc.b	145				
						
	.dc.b	243				
	.dc.b	126				
	.dc.b	159				
						
	.dc.b	177				
						
	.dc.b	243				
	.dc.b	147				
	.dc.b	177				
						
	.dc.b	81				
						
	.dc.b	243				
	.dc.b	168				
	.dc.b	195				
						
	.dc.b	113				
						
	.dc.b	243				
	.dc.b	189				
	.dc.b	213				
						
	.dc.b	241				
						
	.dc.b	243				
	.dc.b	210				
	.dc.b	232				
						
	.dc.b	241				
						
	.dc.b	243				
	.dc.b	231				
	.dc.b	252				
						
	.dc.b	81				
						
	.dc.b	243				
	.dc.b	253				
	.dc.b	16				
						
	.dc.b	49				
						
	.dc.b	244				
	.dc.b	18				
	.dc.b	36				
						
	.dc.b	145				
						
	.dc.b	244				
	.dc.b	39				
	.dc.b	57				
						
	.dc.b	81				
						
	.dc.b	244				
	.dc.b	60				
	.dc.b	78				
						
	.dc.b	145				
						
	.dc.b	244				
	.dc.b	81				
	.dc.b	100				
						
	.dc.b	81				
						
	.dc.b	244				
	.dc.b	102				
	.dc.b	122				
						
	.dc.b	113				
						
	.dc.b	244				
	.dc.b	123				
	.dc.b	145				
						
	.dc.b	17				
						
	.dc.b	244				
	.dc.b	144				
	.dc.b	168				
						
	.dc.b	49				
						
	.dc.b	244				
	.dc.b	165				
	.dc.b	191				
						
	.dc.b	177				
						
	.dc.b	244				
	.dc.b	186				
	.dc.b	215				
						
	.dc.b	177				
						
	.dc.b	244				
	.dc.b	207				
	.dc.b	240				
						
	.dc.b	17				
						
	.dc.b	244				
	.dc.b	229				
	.dc.b	8				
						
	.dc.b	241				
						
	.dc.b	244				
	.dc.b	250				
	.dc.b	34				
						
	.dc.b	81				
						
	.dc.b	245				
	.dc.b	15				
	.dc.b	60				
						
	.dc.b	49				
						
	.dc.b	245				
	.dc.b	36				
	.dc.b	86				
						
	.dc.b	113				
						
	.dc.b	245				
	.dc.b	57				
	.dc.b	113				
						
	.dc.b	17				
						
	.dc.b	245				
	.dc.b	78				
	.dc.b	140				
						
	.dc.b	81				
						
	.dc.b	245				
	.dc.b	99				
	.dc.b	167				
						
	.dc.b	209				
						
	.dc.b	245				
	.dc.b	120				
	.dc.b	195				
						
	.dc.b	241				
						
	.dc.b	245				
	.dc.b	141				
	.dc.b	224				
						
	.dc.b	113				
						
	.dc.b	245				
	.dc.b	162				
	.dc.b	253				
						
	.dc.b	113				
						
	.dc.b	245				
	.dc.b	184				
	.dc.b	26				
						
	.dc.b	209				
						
	.dc.b	245				
	.dc.b	205				
	.dc.b	56				
						
	.dc.b	209				
						
	.dc.b	245				
	.dc.b	226				
	.dc.b	87				
						
	.dc.b	17				
						
	.dc.b	245				
	.dc.b	247				
	.dc.b	117				
						
	.dc.b	241				
						
	.dc.b	246				
	.dc.b	12				
	.dc.b	149				
						
	.dc.b	17				
						
	.dc.b	246				
	.dc.b	33				
	.dc.b	180				
						
	.dc.b	209				
						
	.dc.b	246				
	.dc.b	54				
	.dc.b	212				
						
	.dc.b	241				
						
	.dc.b	246				
	.dc.b	75				
	.dc.b	245				
						
	.dc.b	145				
						
	.dc.b	246				
	.dc.b	97				
	.dc.b	22				
						
	.dc.b	177				
						
	.dc.b	246				
	.dc.b	118				
	.dc.b	56				
						
	.dc.b	49				
						
	.dc.b	246				
	.dc.b	139				
	.dc.b	90				
						
	.dc.b	17				
						
	.dc.b	246				
	.dc.b	160				
	.dc.b	124				
						
	.dc.b	145				
						
	.dc.b	246				
	.dc.b	181				
	.dc.b	159				
						
	.dc.b	113				
						
	.dc.b	246				
	.dc.b	202				
	.dc.b	194				
						
	.dc.b	177				
						
	.dc.b	246				
	.dc.b	223				
	.dc.b	230				
						
	.dc.b	113				
						
	.dc.b	246				
	.dc.b	245				
	.dc.b	10				
						
	.dc.b	177				
						
	.dc.b	247				
	.dc.b	10				
	.dc.b	47				
						
	.dc.b	113				
						
	.dc.b	247				
	.dc.b	31				
	.dc.b	84				
						
	.dc.b	145				
						
	.dc.b	247				
	.dc.b	52				
	.dc.b	122				
						
	.dc.b	17				
						
	.dc.b	247				
	.dc.b	73				
	.dc.b	160				
						
	.dc.b	49				
						
	.dc.b	247				
	.dc.b	94				
	.dc.b	198				
						
	.dc.b	177				
						
	.dc.b	247				
	.dc.b	115				
	.dc.b	237				
						
	.dc.b	145				
						
	.dc.b	247				
	.dc.b	137				
	.dc.b	20				
						
	.dc.b	241				
						
	.dc.b	247				
	.dc.b	158				
	.dc.b	60				
						
	.dc.b	209				
						
	.dc.b	247				
	.dc.b	179				
	.dc.b	101				
						
	.dc.b	17				
						
	.dc.b	247				
	.dc.b	200				
	.dc.b	141				
						
	.dc.b	209				
						
	.dc.b	247				
	.dc.b	221				
	.dc.b	183				
						
	.dc.b	17				
						
	.dc.b	247				
	.dc.b	242				
	.dc.b	224				
						
	.dc.b	177				
						
	.dc.b	248				
	.dc.b	8				
	.dc.b	10				
						
	.dc.b	209				
						
	.dc.b	248				
	.dc.b	29				
	.dc.b	53				
						
	.dc.b	81				
						
	.dc.b	248				
	.dc.b	50				
	.dc.b	96				
						
	.dc.b	81				
						
	.dc.b	248				
	.dc.b	71				
	.dc.b	139				
						
	.dc.b	209				
						
	.dc.b	248				
	.dc.b	92				
	.dc.b	183				
						
	.dc.b	177				
						
	.dc.b	248				
	.dc.b	113				
	.dc.b	228				
						
	.dc.b	17				
						
	.dc.b	248				
	.dc.b	135				
	.dc.b	16				
						
	.dc.b	241				
						
	.dc.b	248				
	.dc.b	156				
	.dc.b	62				
						
	.dc.b	49				
						
	.dc.b	248				
	.dc.b	177				
	.dc.b	107				
						
	.dc.b	241				
						
	.dc.b	248				
	.dc.b	198				
	.dc.b	154				
						
	.dc.b	17				
						
	.dc.b	248				
	.dc.b	219				
	.dc.b	200				
						
	.dc.b	177				
						
	.dc.b	248				
	.dc.b	240				
	.dc.b	247				
						
	.dc.b	177				
						
	.dc.b	249				
	.dc.b	6				
	.dc.b	39				
						
	.dc.b	49				
						
	.dc.b	249				
	.dc.b	27				
	.dc.b	87				
						
	.dc.b	49				
						
	.dc.b	249				
	.dc.b	48				
	.dc.b	135				
						
	.dc.b	145				
						
	.dc.b	249				
	.dc.b	69				
	.dc.b	184				
						
	.dc.b	113				
						
	.dc.b	249				
	.dc.b	90				
	.dc.b	233				
						
	.dc.b	209				
						
	.dc.b	249				
	.dc.b	112				
	.dc.b	27				
						
	.dc.b	145				
						
	.dc.b	249				
	.dc.b	133				
	.dc.b	77				
						
	.dc.b	209				
						
	.dc.b	249				
	.dc.b	154				
	.dc.b	128				
						
	.dc.b	113				
						
	.dc.b	249				
	.dc.b	175				
	.dc.b	179				
						
	.dc.b	145				
						
	.dc.b	249				
	.dc.b	196				
	.dc.b	231				
						
	.dc.b	49				
						
	.dc.b	249				
	.dc.b	218				
	.dc.b	27				
						
	.dc.b	49				
						
	.dc.b	249				
	.dc.b	239				
	.dc.b	79				
						
	.dc.b	177				
						
	.dc.b	250				
	.dc.b	4				
	.dc.b	132				
						
	.dc.b	145				
						
	.dc.b	250				
	.dc.b	25				
	.dc.b	185				
						
	.dc.b	241				
						
	.dc.b	250				
	.dc.b	46				
	.dc.b	239				
						
	.dc.b	209				
						
	.dc.b	250				
	.dc.b	68				
	.dc.b	38				
						
	.dc.b	17				
						
	.dc.b	250				
	.dc.b	89				
	.dc.b	92				
						
	.dc.b	177				
						
	.dc.b	250				
	.dc.b	110				
	.dc.b	147				
						
	.dc.b	241				
						
	.dc.b	250				
	.dc.b	131				
	.dc.b	203				
						
	.dc.b	145				
						
	.dc.b	250				
	.dc.b	153				
	.dc.b	3				
						
	.dc.b	145				
						
	.dc.b	250				
	.dc.b	174				
	.dc.b	60				
						
	.dc.b	17				
						
	.dc.b	250				
	.dc.b	195				
	.dc.b	117				
						
	.dc.b	17				
						
	.dc.b	250				
	.dc.b	216				
	.dc.b	174				
						
	.dc.b	113				
						
	.dc.b	250				
	.dc.b	237				
	.dc.b	232				
						
	.dc.b	81				
						
	.dc.b	251				
	.dc.b	3				
	.dc.b	34				
						
	.dc.b	177				
						
	.dc.b	251				
	.dc.b	24				
	.dc.b	93				
						
	.dc.b	113				
						
	.dc.b	251				
	.dc.b	45				
	.dc.b	152				
						
	.dc.b	145				
						
	.dc.b	251				
	.dc.b	66				
	.dc.b	212				
						
	.dc.b	81				
						
	.dc.b	251				
	.dc.b	88				
	.dc.b	16				
						
	.dc.b	113				
						
	.dc.b	251				
	.dc.b	109				
	.dc.b	76				
						
	.dc.b	241				
						
	.dc.b	251				
	.dc.b	130				
	.dc.b	137				
						
	.dc.b	241				
						
	.dc.b	251				
	.dc.b	151				
	.dc.b	199				
						
	.dc.b	113				
						
	.dc.b	251				
	.dc.b	173				
	.dc.b	5				
						
	.dc.b	81				
						
	.dc.b	251				
	.dc.b	194				
	.dc.b	67				
						
	.dc.b	177				
						
	.dc.b	251				
	.dc.b	215				
	.dc.b	130				
						
	.dc.b	113				
						
	.dc.b	251				
	.dc.b	236				
	.dc.b	193				
						
	.dc.b	177				
						
	.dc.b	252				
	.dc.b	2				
	.dc.b	1				
						
	.dc.b	81				
						
	.dc.b	252				
	.dc.b	23				
	.dc.b	65				
						
	.dc.b	145				
						
	.dc.b	252				
	.dc.b	44				
	.dc.b	130				
						
	.dc.b	17				
						
	.dc.b	252				
	.dc.b	65				
	.dc.b	195				
						
	.dc.b	49				
						
	.dc.b	252				
	.dc.b	87				
	.dc.b	4				
						
	.dc.b	145				
						
	.dc.b	252				
	.dc.b	108				
	.dc.b	70				
						
	.dc.b	145				
						
	.dc.b	252				
	.dc.b	129				
	.dc.b	136				
						
	.dc.b	241				
						
	.dc.b	252				
	.dc.b	150				
	.dc.b	203				
						
	.dc.b	209				
						
	.dc.b	252				
	.dc.b	172				
	.dc.b	15				
						
	.dc.b	17				
						
	.dc.b	252				
	.dc.b	193				
	.dc.b	82				
						
	.dc.b	177				
						
	.dc.b	252				
	.dc.b	214				
	.dc.b	150				
						
	.dc.b	241				
						
	.dc.b	252				
	.dc.b	235				
	.dc.b	219				
						
	.dc.b	145				
						
	.dc.b	253				
	.dc.b	1				
	.dc.b	32				
						
	.dc.b	145				
						
	.dc.b	253				
	.dc.b	22				
	.dc.b	102				
						
	.dc.b	17				
						
	.dc.b	253				
	.dc.b	43				
	.dc.b	172				
						
	.dc.b	17				
						
	.dc.b	253				
	.dc.b	64				
	.dc.b	242				
						
	.dc.b	113				
						
	.dc.b	253				
	.dc.b	86				
	.dc.b	57				
						
	.dc.b	81				
						
	.dc.b	253				
	.dc.b	107				
	.dc.b	128				
						
	.dc.b	145				
						
	.dc.b	253				
	.dc.b	128				
	.dc.b	200				
						
	.dc.b	81				
						
	.dc.b	253				
	.dc.b	150				
	.dc.b	16				
						
	.dc.b	145				
						
	.dc.b	253				
	.dc.b	171				
	.dc.b	89				
						
	.dc.b	49				
						
	.dc.b	253				
	.dc.b	192				
	.dc.b	162				
						
	.dc.b	81				
						
	.dc.b	253				
	.dc.b	213				
	.dc.b	235				
						
	.dc.b	209				
						
	.dc.b	253				
	.dc.b	235				
	.dc.b	53				
						
	.dc.b	209				
						
	.dc.b	254				
	.dc.b	0				
	.dc.b	128				
						
	.dc.b	49				
						
	.dc.b	254				
	.dc.b	21				
	.dc.b	203				
						
	.dc.b	17				
						
	.dc.b	254				
	.dc.b	43				
	.dc.b	22				
						
	.dc.b	113				
						
	.dc.b	254				
	.dc.b	64				
	.dc.b	98				
						
	.dc.b	49				
						
	.dc.b	254				
	.dc.b	85				
	.dc.b	174				
						
	.dc.b	81				
						
	.dc.b	254				
	.dc.b	106				
	.dc.b	251				
						
	.dc.b	17				
						
	.dc.b	254				
	.dc.b	128				
	.dc.b	72				
						
	.dc.b	17				
						
	.dc.b	254				
	.dc.b	149				
	.dc.b	149				
						
	.dc.b	177				
						
	.dc.b	254				
	.dc.b	170				
	.dc.b	227				
						
	.dc.b	177				
						
	.dc.b	254				
	.dc.b	192				
	.dc.b	50				
						
	.dc.b	17				
						
	.dc.b	254				
	.dc.b	213				
	.dc.b	128				
						
	.dc.b	241				
						
	.dc.b	254				
	.dc.b	234				
	.dc.b	208				
						
	.dc.b	81				
						
	.dc.b	255				
	.dc.b	0				
	.dc.b	32				
						
	.dc.b	17				
						
	.dc.b	255				
	.dc.b	21				
	.dc.b	112				
						
	.dc.b	81				
						
	.dc.b	255				
	.dc.b	42				
	.dc.b	192				
						
	.dc.b	241				
						
	.dc.b	255				
	.dc.b	64				
	.dc.b	18				
						
	.dc.b	17				
						
	.dc.b	255				
	.dc.b	85				
	.dc.b	99				
						
	.dc.b	145				
						
	.dc.b	255				
	.dc.b	106				
	.dc.b	181				
						
	.dc.b	145				
						
	.dc.b	255				
	.dc.b	128				
	.dc.b	8				
						
	.dc.b	17				
						
	.dc.b	255				
	.dc.b	149				
	.dc.b	90				
						
	.dc.b	241				
						
	.dc.b	255				
	.dc.b	170				
	.dc.b	174				
						
	.dc.b	81				
						
	.dc.b	255				
	.dc.b	192				
	.dc.b	2				
						
	.dc.b	17				
						
	.dc.b	255				
	.dc.b	213				
	.dc.b	86				
						
	.dc.b	81				
						
	.dc.b	255				
	.dc.b	234				
	.dc.b	170				
						
	.dc.b	241				
						
	.dc.b	128				
	.dc.b	0				
	.dc.b	0				
						
	.dc.b	18				
						
	.dc.b	128				
	.dc.b	10				
	.dc.b	170				
						
	.dc.b	210				
						
	.dc.b	128				
	.dc.b	21				
	.dc.b	85				
						
	.dc.b	210				
						
	.dc.b	128				
	.dc.b	32				
	.dc.b	1				
						
	.dc.b	18				
						
	.dc.b	128				
	.dc.b	42				
	.dc.b	172				
						
	.dc.b	114				
						
	.dc.b	128				
	.dc.b	53				
	.dc.b	88				
						
	.dc.b	50				
						
	.dc.b	128				
	.dc.b	64				
	.dc.b	4				
						
	.dc.b	18				
						
	.dc.b	128				
	.dc.b	74				
	.dc.b	176				
						
	.dc.b	50				
						
	.dc.b	128				
	.dc.b	85				
	.dc.b	92				
						
	.dc.b	114				
						
	.dc.b	128				
	.dc.b	96				
	.dc.b	9				
						
	.dc.b	18				
						
	.dc.b	128				
	.dc.b	106				
	.dc.b	181				
						
	.dc.b	210				
						
	.dc.b	128				
	.dc.b	117				
	.dc.b	98				
						
	.dc.b	210				
						
	.dc.b	128				
	.dc.b	128				
	.dc.b	16				
						
	.dc.b	18				
						
	.dc.b	128				
	.dc.b	138				
	.dc.b	189				
						
	.dc.b	114				
						
	.dc.b	128				
	.dc.b	149				
	.dc.b	107				
						
	.dc.b	50				
						
	.dc.b	128				
	.dc.b	160				
	.dc.b	25				
						
	.dc.b	18				
						
	.dc.b	128				
	.dc.b	170				
	.dc.b	199				
						
	.dc.b	18				
						
	.dc.b	128				
	.dc.b	181				
	.dc.b	117				
						
	.dc.b	114				
						
	.dc.b	128				
	.dc.b	192				
	.dc.b	35				
						
	.dc.b	242				
						
	.dc.b	128				
	.dc.b	202				
	.dc.b	210				
						
	.dc.b	210				
						
	.dc.b	128				
	.dc.b	213				
	.dc.b	129				
						
	.dc.b	210				
						
	.dc.b	128				
	.dc.b	224				
	.dc.b	48				
						
	.dc.b	242				
						
	.dc.b	128				
	.dc.b	234				
	.dc.b	224				
						
	.dc.b	114				
						
	.dc.b	128				
	.dc.b	245				
	.dc.b	144				
						
	.dc.b	18				
						
	.dc.b	129				
	.dc.b	0				
	.dc.b	63				
						
	.dc.b	242				
						
	.dc.b	129				
	.dc.b	10				
	.dc.b	240				
						
	.dc.b	18				
						
	.dc.b	129				
	.dc.b	21				
	.dc.b	160				
						
	.dc.b	82				
						
	.dc.b	129				
	.dc.b	32				
	.dc.b	80				
						
	.dc.b	242				
						
	.dc.b	129				
	.dc.b	43				
	.dc.b	1				
						
	.dc.b	178				
						
	.dc.b	129				
	.dc.b	53				
	.dc.b	178				
						
	.dc.b	178				
						
	.dc.b	129				
	.dc.b	64				
	.dc.b	99				
						
	.dc.b	210				
						
	.dc.b	129				
	.dc.b	75				
	.dc.b	21				
						
	.dc.b	82				
						
	.dc.b	129				
	.dc.b	85				
	.dc.b	198				
						
	.dc.b	242				
						
	.dc.b	129				
	.dc.b	96				
	.dc.b	120				
						
	.dc.b	210				
						
	.dc.b	129				
	.dc.b	107				
	.dc.b	42				
						
	.dc.b	242				
						
	.dc.b	129				
	.dc.b	117				
	.dc.b	221				
						
	.dc.b	50				
						
	.dc.b	129				
	.dc.b	128				
	.dc.b	143				
						
	.dc.b	210				
						
	.dc.b	129				
	.dc.b	139				
	.dc.b	66				
						
	.dc.b	146				
						
	.dc.b	129				
	.dc.b	149				
	.dc.b	245				
						
	.dc.b	114				
						
	.dc.b	129				
	.dc.b	160				
	.dc.b	168				
						
	.dc.b	178				
						
	.dc.b	129				
	.dc.b	171				
	.dc.b	92				
						
	.dc.b	18				
						
	.dc.b	129				
	.dc.b	182				
	.dc.b	15				
						
	.dc.b	178				
						
	.dc.b	129				
	.dc.b	192				
	.dc.b	195				
						
	.dc.b	146				
						
	.dc.b	129				
	.dc.b	203				
	.dc.b	119				
						
	.dc.b	178				
						
	.dc.b	129				
	.dc.b	214				
	.dc.b	43				
						
	.dc.b	242				
						
	.dc.b	129				
	.dc.b	224				
	.dc.b	224				
						
	.dc.b	114				
						
	.dc.b	129				
	.dc.b	235				
	.dc.b	149				
						
	.dc.b	50				
						
	.dc.b	129				
	.dc.b	246				
	.dc.b	74				
						
	.dc.b	50				
						
	.dc.b	130				
	.dc.b	0				
	.dc.b	255				
						
	.dc.b	82				
						
	.dc.b	130				
	.dc.b	11				
	.dc.b	180				
						
	.dc.b	210				
						
	.dc.b	130				
	.dc.b	22				
	.dc.b	106				
						
	.dc.b	114				
						
	.dc.b	130				
	.dc.b	33				
	.dc.b	32				
						
	.dc.b	50				
						
	.dc.b	130				
	.dc.b	43				
	.dc.b	214				
						
	.dc.b	82				
						
	.dc.b	130				
	.dc.b	54				
	.dc.b	140				
						
	.dc.b	146				
						
	.dc.b	130				
	.dc.b	65				
	.dc.b	67				
						
	.dc.b	18				
						
	.dc.b	130				
	.dc.b	75				
	.dc.b	249				
						
	.dc.b	210				
						
	.dc.b	130				
	.dc.b	86				
	.dc.b	176				
						
	.dc.b	210				
						
	.dc.b	130				
	.dc.b	97				
	.dc.b	103				
						
	.dc.b	242				
						
	.dc.b	130				
	.dc.b	108				
	.dc.b	31				
						
	.dc.b	82				
						
	.dc.b	130				
	.dc.b	118				
	.dc.b	214				
						
	.dc.b	242				
						
	.dc.b	130				
	.dc.b	129				
	.dc.b	142				
						
	.dc.b	178				
						
	.dc.b	130				
	.dc.b	140				
	.dc.b	70				
						
	.dc.b	210				
						
	.dc.b	130				
	.dc.b	150				
	.dc.b	255				
						
	.dc.b	18				
						
	.dc.b	130				
	.dc.b	161				
	.dc.b	183				
						
	.dc.b	146				
						
	.dc.b	130				
	.dc.b	172				
	.dc.b	112				
						
	.dc.b	50				
						
	.dc.b	130				
	.dc.b	183				
	.dc.b	41				
						
	.dc.b	50				
						
	.dc.b	130				
	.dc.b	193				
	.dc.b	226				
						
	.dc.b	82				
						
	.dc.b	130				
	.dc.b	204				
	.dc.b	155				
						
	.dc.b	178				
						
	.dc.b	130				
	.dc.b	215				
	.dc.b	85				
						
	.dc.b	82				
						
	.dc.b	130				
	.dc.b	226				
	.dc.b	15				
						
	.dc.b	18				
						
	.dc.b	130				
	.dc.b	236				
	.dc.b	201				
						
	.dc.b	18				
						
	.dc.b	130				
	.dc.b	247				
	.dc.b	131				
						
	.dc.b	82				
						
	.dc.b	131				
	.dc.b	2				
	.dc.b	61				
						
	.dc.b	210				
						
	.dc.b	131				
	.dc.b	12				
	.dc.b	248				
						
	.dc.b	114				
						
	.dc.b	131				
	.dc.b	23				
	.dc.b	179				
						
	.dc.b	114				
						
	.dc.b	131				
	.dc.b	34				
	.dc.b	110				
						
	.dc.b	146				
						
	.dc.b	131				
	.dc.b	45				
	.dc.b	41				
						
	.dc.b	210				
						
	.dc.b	131				
	.dc.b	55				
	.dc.b	229				
						
	.dc.b	114				
						
	.dc.b	131				
	.dc.b	66				
	.dc.b	161				
						
	.dc.b	50				
						
	.dc.b	131				
	.dc.b	77				
	.dc.b	93				
						
	.dc.b	50				
						
	.dc.b	131				
	.dc.b	88				
	.dc.b	25				
						
	.dc.b	114				
						
	.dc.b	131				
	.dc.b	98				
	.dc.b	213				
						
	.dc.b	210				
						
	.dc.b	131				
	.dc.b	109				
	.dc.b	146				
						
	.dc.b	146				
						
	.dc.b	131				
	.dc.b	120				
	.dc.b	79				
						
	.dc.b	114				
						
	.dc.b	131				
	.dc.b	131				
	.dc.b	12				
						
	.dc.b	114				
						
	.dc.b	131				
	.dc.b	141				
	.dc.b	201				
						
	.dc.b	210				
						
	.dc.b	131				
	.dc.b	152				
	.dc.b	135				
						
	.dc.b	82				
						
	.dc.b	131				
	.dc.b	163				
	.dc.b	69				
						
	.dc.b	18				
						
	.dc.b	131				
	.dc.b	174				
	.dc.b	3				
						
	.dc.b	18				
						
	.dc.b	131				
	.dc.b	184				
	.dc.b	193				
						
	.dc.b	82				
						
	.dc.b	131				
	.dc.b	195				
	.dc.b	127				
						
	.dc.b	178				
						
	.dc.b	131				
	.dc.b	206				
	.dc.b	62				
						
	.dc.b	82				
						
	.dc.b	131				
	.dc.b	216				
	.dc.b	253				
						
	.dc.b	50				
						
	.dc.b	131				
	.dc.b	227				
	.dc.b	188				
						
	.dc.b	50				
						
	.dc.b	131				
	.dc.b	238				
	.dc.b	123				
						
	.dc.b	146				
						
	.dc.b	131				
	.dc.b	249				
	.dc.b	59				
						
	.dc.b	18				
						
	.dc.b	132				
	.dc.b	3				
	.dc.b	250				
						
	.dc.b	178				
						
	.dc.b	132				
	.dc.b	14				
	.dc.b	186				
						
	.dc.b	178				
						
	.dc.b	132				
	.dc.b	25				
	.dc.b	122				
						
	.dc.b	210				
						
	.dc.b	132				
	.dc.b	36				
	.dc.b	59				
						
	.dc.b	50				
						
	.dc.b	132				
	.dc.b	46				
	.dc.b	251				
						
	.dc.b	210				
						
	.dc.b	132				
	.dc.b	57				
	.dc.b	188				
						
	.dc.b	178				
						
	.dc.b	132				
	.dc.b	68				
	.dc.b	125				
						
	.dc.b	178				
						
	.dc.b	132				
	.dc.b	79				
	.dc.b	62				
						
	.dc.b	242				
						
	.dc.b	132				
	.dc.b	90				
	.dc.b	0				
						
	.dc.b	114				
						
	.dc.b	132				
	.dc.b	100				
	.dc.b	194				
						
	.dc.b	50				
						
	.dc.b	132				
	.dc.b	111				
	.dc.b	132				
						
	.dc.b	18				
						
	.dc.b	132				
	.dc.b	122				
	.dc.b	70				
						
	.dc.b	50				
						
	.dc.b	132				
	.dc.b	133				
	.dc.b	8				
						
	.dc.b	146				
						
	.dc.b	132				
	.dc.b	143				
	.dc.b	203				
						
	.dc.b	18				
						
	.dc.b	132				
	.dc.b	154				
	.dc.b	141				
						
	.dc.b	210				
						
	.dc.b	132				
	.dc.b	165				
	.dc.b	80				
						
	.dc.b	242				
						
	.dc.b	132				
	.dc.b	176				
	.dc.b	20				
						
	.dc.b	18				
						
	.dc.b	132				
	.dc.b	186				
	.dc.b	215				
						
	.dc.b	146				
						
	.dc.b	132				
	.dc.b	197				
	.dc.b	155				
						
	.dc.b	50				
						
	.dc.b	132				
	.dc.b	208				
	.dc.b	95				
						
	.dc.b	18				
						
	.dc.b	132				
	.dc.b	219				
	.dc.b	35				
						
	.dc.b	50				
						
	.dc.b	132				
	.dc.b	229				
	.dc.b	231				
						
	.dc.b	114				
						
	.dc.b	132				
	.dc.b	240				
	.dc.b	172				
						
	.dc.b	18				
						
	.dc.b	132				
	.dc.b	251				
	.dc.b	112				
						
	.dc.b	210				
						
	.dc.b	133				
	.dc.b	6				
	.dc.b	53				
						
	.dc.b	178				
						
	.dc.b	133				
	.dc.b	16				
	.dc.b	250				
						
	.dc.b	242				
						
	.dc.b	133				
	.dc.b	27				
	.dc.b	192				
						
	.dc.b	82				
						
	.dc.b	133				
	.dc.b	38				
	.dc.b	133				
						
	.dc.b	242				
						
	.dc.b	133				
	.dc.b	49				
	.dc.b	75				
						
	.dc.b	210				
						
	.dc.b	133				
	.dc.b	60				
	.dc.b	17				
						
	.dc.b	210				
						
	.dc.b	133				
	.dc.b	70				
	.dc.b	216				
						
	.dc.b	18				
						
	.dc.b	133				
	.dc.b	81				
	.dc.b	158				
						
	.dc.b	146				
						
	.dc.b	133				
	.dc.b	92				
	.dc.b	101				
						
	.dc.b	82				
						
	.dc.b	133				
	.dc.b	103				
	.dc.b	44				
						
	.dc.b	82				
						
	.dc.b	133				
	.dc.b	113				
	.dc.b	243				
						
	.dc.b	114				
						
	.dc.b	133				
	.dc.b	124				
	.dc.b	186				
						
	.dc.b	210				
						
	.dc.b	133				
	.dc.b	135				
	.dc.b	130				
						
	.dc.b	82				
						
	.dc.b	133				
	.dc.b	146				
	.dc.b	74				
						
	.dc.b	50				
						
	.dc.b	133				
	.dc.b	157				
	.dc.b	18				
						
	.dc.b	50				
						
	.dc.b	133				
	.dc.b	167				
	.dc.b	218				
						
	.dc.b	114				
						
	.dc.b	133				
	.dc.b	178				
	.dc.b	162				
						
	.dc.b	210				
						
	.dc.b	133				
	.dc.b	189				
	.dc.b	107				
						
	.dc.b	146				
						
	.dc.b	133				
	.dc.b	200				
	.dc.b	52				
						
	.dc.b	114				
						
	.dc.b	133				
	.dc.b	210				
	.dc.b	253				
						
	.dc.b	146				
						
	.dc.b	133				
	.dc.b	221				
	.dc.b	198				
						
	.dc.b	210				
						
	.dc.b	133				
	.dc.b	232				
	.dc.b	144				
						
	.dc.b	82				
						
	.dc.b	133				
	.dc.b	243				
	.dc.b	90				
						
	.dc.b	50				
						
	.dc.b	133				
	.dc.b	254				
	.dc.b	36				
						
	.dc.b	18				
						
	.dc.b	134				
	.dc.b	8				
	.dc.b	238				
						
	.dc.b	82				
						
	.dc.b	134				
	.dc.b	19				
	.dc.b	184				
						
	.dc.b	178				
						
	.dc.b	134				
	.dc.b	30				
	.dc.b	131				
						
	.dc.b	82				
						
	.dc.b	134				
	.dc.b	41				
	.dc.b	78				
						
	.dc.b	50				
						
	.dc.b	134				
	.dc.b	52				
	.dc.b	25				
						
	.dc.b	50				
						
	.dc.b	134				
	.dc.b	62				
	.dc.b	228				
						
	.dc.b	114				
						
	.dc.b	134				
	.dc.b	73				
	.dc.b	175				
						
	.dc.b	242				
						
	.dc.b	134				
	.dc.b	84				
	.dc.b	123				
						
	.dc.b	178				
						
	.dc.b	134				
	.dc.b	95				
	.dc.b	71				
						
	.dc.b	178				
						
	.dc.b	134				
	.dc.b	106				
	.dc.b	19				
						
	.dc.b	210				
						
	.dc.b	134				
	.dc.b	116				
	.dc.b	224				
						
	.dc.b	50				
						
	.dc.b	134				
	.dc.b	127				
	.dc.b	172				
						
	.dc.b	178				
						
	.dc.b	134				
	.dc.b	138				
	.dc.b	121				
						
	.dc.b	146				
						
	.dc.b	134				
	.dc.b	149				
	.dc.b	70				
						
	.dc.b	146				
						
	.dc.b	134				
	.dc.b	160				
	.dc.b	19				
						
	.dc.b	178				
						
	.dc.b	134				
	.dc.b	170				
	.dc.b	225				
						
	.dc.b	50				
						
	.dc.b	134				
	.dc.b	181				
	.dc.b	174				
						
	.dc.b	210				
						
	.dc.b	134				
	.dc.b	192				
	.dc.b	124				
						
	.dc.b	178				
						
	.dc.b	134				
	.dc.b	203				
	.dc.b	74				
						
	.dc.b	210				
						
	.dc.b	134				
	.dc.b	214				
	.dc.b	25				
						
	.dc.b	50				
						
	.dc.b	134				
	.dc.b	224				
	.dc.b	231				
						
	.dc.b	178				
						
	.dc.b	134				
	.dc.b	235				
	.dc.b	182				
						
	.dc.b	114				
						
	.dc.b	134				
	.dc.b	246				
	.dc.b	133				
						
	.dc.b	82				
						
	.dc.b	135				
	.dc.b	1				
	.dc.b	84				
						
	.dc.b	146				
						
	.dc.b	135				
	.dc.b	12				
	.dc.b	35				
						
	.dc.b	242				
						
	.dc.b	135				
	.dc.b	22				
	.dc.b	243				
						
	.dc.b	146				
						
	.dc.b	135				
	.dc.b	33				
	.dc.b	195				
						
	.dc.b	82				
						
	.dc.b	135				
	.dc.b	44				
	.dc.b	147				
						
	.dc.b	114				
						
	.dc.b	135				
	.dc.b	55				
	.dc.b	99				
						
	.dc.b	178				
						
	.dc.b	135				
	.dc.b	66				
	.dc.b	52				
						
	.dc.b	50				
						
	.dc.b	135				
	.dc.b	77				
	.dc.b	4				
						
	.dc.b	210				
						
	.dc.b	135				
	.dc.b	87				
	.dc.b	213				
						
	.dc.b	178				
						
	.dc.b	135				
	.dc.b	98				
	.dc.b	166				
						
	.dc.b	210				
						
	.dc.b	135				
	.dc.b	109				
	.dc.b	120				
						
	.dc.b	50				
						
	.dc.b	135				
	.dc.b	120				
	.dc.b	73				
						
	.dc.b	178				
						
	.dc.b	135				
	.dc.b	131				
	.dc.b	27				
						
	.dc.b	146				
						
	.dc.b	135				
	.dc.b	141				
	.dc.b	237				
						
	.dc.b	146				
						
	.dc.b	135				
	.dc.b	152				
	.dc.b	191				
						
	.dc.b	178				
						
	.dc.b	135				
	.dc.b	163				
	.dc.b	146				
						
	.dc.b	50				
						
	.dc.b	135				
	.dc.b	174				
	.dc.b	100				
						
	.dc.b	210				
						
	.dc.b	135				
	.dc.b	185				
	.dc.b	55				
						
	.dc.b	146				
						
	.dc.b	135				
	.dc.b	196				
	.dc.b	10				
						
	.dc.b	178				
						
	.dc.b	135				
	.dc.b	206				
	.dc.b	221				
						
	.dc.b	242				
						
	.dc.b	135				
	.dc.b	217				
	.dc.b	177				
						
	.dc.b	114				
						
	.dc.b	135				
	.dc.b	228				
	.dc.b	133				
						
	.dc.b	50				
						
	.dc.b	135				
	.dc.b	239				
	.dc.b	89				
						
	.dc.b	18				
						
	.dc.b	135				
	.dc.b	250				
	.dc.b	45				
						
	.dc.b	50				
						
	.dc.b	136				
	.dc.b	5				
	.dc.b	1				
						
	.dc.b	146				
						
	.dc.b	136				
	.dc.b	15				
	.dc.b	214				
						
	.dc.b	50				
						
	.dc.b	136				
	.dc.b	26				
	.dc.b	170				
						
	.dc.b	242				
						
	.dc.b	136				
	.dc.b	37				
	.dc.b	127				
						
	.dc.b	242				
						
	.dc.b	136				
	.dc.b	48				
	.dc.b	85				
						
	.dc.b	50				
						
	.dc.b	136				
	.dc.b	59				
	.dc.b	42				
						
	.dc.b	178				
						
	.dc.b	136				
	.dc.b	70				
	.dc.b	0				
						
	.dc.b	82				
						
	.dc.b	136				
	.dc.b	80				
	.dc.b	214				
						
	.dc.b	50				
						
	.dc.b	136				
	.dc.b	91				
	.dc.b	172				
						
	.dc.b	50				
						
	.dc.b	136				
	.dc.b	102				
	.dc.b	130				
						
	.dc.b	146				
						
	.dc.b	136				
	.dc.b	113				
	.dc.b	89				
						
	.dc.b	18				
						
	.dc.b	136				
	.dc.b	124				
	.dc.b	47				
						
	.dc.b	210				
						
	.dc.b	136				
	.dc.b	135				
	.dc.b	6				
						
	.dc.b	178				
						
	.dc.b	136				
	.dc.b	145				
	.dc.b	221				
						
	.dc.b	242				
						
	.dc.b	136				
	.dc.b	156				
	.dc.b	181				
						
	.dc.b	82				
						
	.dc.b	136				
	.dc.b	167				
	.dc.b	140				
						
	.dc.b	210				
						
	.dc.b	136				
	.dc.b	178				
	.dc.b	100				
						
	.dc.b	178				
						
	.dc.b	136				
	.dc.b	189				
	.dc.b	60				
						
	.dc.b	178				
						
	.dc.b	136				
	.dc.b	200				
	.dc.b	20				
						
	.dc.b	242				
						
	.dc.b	136				
	.dc.b	210				
	.dc.b	237				
						
	.dc.b	82				
						
	.dc.b	136				
	.dc.b	221				
	.dc.b	198				
						
	.dc.b	18				
						
	.dc.b	136				
	.dc.b	232				
	.dc.b	158				
						
	.dc.b	242				
						
	.dc.b	136				
	.dc.b	243				
	.dc.b	120				
						
	.dc.b	18				
						
	.dc.b	136				
	.dc.b	254				
	.dc.b	81				
						
	.dc.b	82				
						
	.dc.b	137				
	.dc.b	9				
	.dc.b	42				
						
	.dc.b	210				
						
	.dc.b	137				
	.dc.b	20				
	.dc.b	4				
						
	.dc.b	146				
						
	.dc.b	137				
	.dc.b	30				
	.dc.b	222				
						
	.dc.b	146				
						
	.dc.b	137				
	.dc.b	41				
	.dc.b	184				
						
	.dc.b	178				
						
	.dc.b	137				
	.dc.b	52				
	.dc.b	147				
						
	.dc.b	18				
						
	.dc.b	137				
	.dc.b	63				
	.dc.b	109				
						
	.dc.b	178				
						
	.dc.b	137				
	.dc.b	74				
	.dc.b	72				
						
	.dc.b	114				
						
	.dc.b	137				
	.dc.b	85				
	.dc.b	35				
						
	.dc.b	146				
						
	.dc.b	137				
	.dc.b	95				
	.dc.b	254				
						
	.dc.b	210				
						
	.dc.b	137				
	.dc.b	106				
	.dc.b	218				
						
	.dc.b	50				
						
	.dc.b	137				
	.dc.b	117				
	.dc.b	181				
						
	.dc.b	242				
						
	.dc.b	137				
	.dc.b	128				
	.dc.b	145				
						
	.dc.b	210				
						
	.dc.b	137				
	.dc.b	139				
	.dc.b	109				
						
	.dc.b	242				
						
	.dc.b	137				
	.dc.b	150				
	.dc.b	74				
						
	.dc.b	50				
						
	.dc.b	137				
	.dc.b	161				
	.dc.b	38				
						
	.dc.b	178				
						
	.dc.b	137				
	.dc.b	172				
	.dc.b	3				
						
	.dc.b	114				
						
	.dc.b	137				
	.dc.b	182				
	.dc.b	224				
						
	.dc.b	114				
						
	.dc.b	137				
	.dc.b	193				
	.dc.b	189				
						
	.dc.b	146				
						
	.dc.b	137				
	.dc.b	204				
	.dc.b	154				
						
	.dc.b	242				
						
	.dc.b	137				
	.dc.b	215				
	.dc.b	120				
						
	.dc.b	146				
						
	.dc.b	137				
	.dc.b	226				
	.dc.b	86				
						
	.dc.b	114				
						
	.dc.b	137				
	.dc.b	237				
	.dc.b	52				
						
	.dc.b	114				
						
	.dc.b	137				
	.dc.b	248				
	.dc.b	18				
						
	.dc.b	178				
						
	.dc.b	138				
	.dc.b	2				
	.dc.b	241				
						
	.dc.b	18				
						
	.dc.b	138				
	.dc.b	13				
	.dc.b	207				
						
	.dc.b	210				
						
	.dc.b	138				
	.dc.b	24				
	.dc.b	174				
						
	.dc.b	178				
						
	.dc.b	138				
	.dc.b	35				
	.dc.b	141				
						
	.dc.b	210				
						
	.dc.b	138				
	.dc.b	46				
	.dc.b	109				
						
	.dc.b	18				
						
	.dc.b	138				
	.dc.b	57				
	.dc.b	76				
						
	.dc.b	146				
						
	.dc.b	138				
	.dc.b	68				
	.dc.b	44				
						
	.dc.b	82				
						
	.dc.b	138				
	.dc.b	79				
	.dc.b	12				
						
	.dc.b	82				
						
	.dc.b	138				
	.dc.b	89				
	.dc.b	236				
						
	.dc.b	114				
						
	.dc.b	138				
	.dc.b	100				
	.dc.b	204				
						
	.dc.b	210				
						
	.dc.b	138				
	.dc.b	111				
	.dc.b	173				
						
	.dc.b	114				
						
	.dc.b	138				
	.dc.b	122				
	.dc.b	142				
						
	.dc.b	82				
						
	.dc.b	138				
	.dc.b	133				
	.dc.b	111				
						
	.dc.b	82				
						
	.dc.b	138				
	.dc.b	144				
	.dc.b	80				
						
	.dc.b	146				
						
	.dc.b	138				
	.dc.b	155				
	.dc.b	49				
						
	.dc.b	242				
						
	.dc.b	138				
	.dc.b	166				
	.dc.b	19				
						
	.dc.b	146				
						
	.dc.b	138				
	.dc.b	176				
	.dc.b	245				
						
	.dc.b	114				
						
	.dc.b	138				
	.dc.b	187				
	.dc.b	215				
						
	.dc.b	146				
						
	.dc.b	138				
	.dc.b	198				
	.dc.b	185				
						
	.dc.b	242				
						
	.dc.b	138				
	.dc.b	209				
	.dc.b	156				
						
	.dc.b	114				
						
	.dc.b	138				
	.dc.b	220				
	.dc.b	127				
						
	.dc.b	50				
						
	.dc.b	138				
	.dc.b	231				
	.dc.b	98				
						
	.dc.b	18				
						
	.dc.b	138				
	.dc.b	242				
	.dc.b	69				
						
	.dc.b	50				
						
	.dc.b	138				
	.dc.b	253				
	.dc.b	40				
						
	.dc.b	146				
						
	.dc.b	139				
	.dc.b	8				
	.dc.b	12				
						
	.dc.b	50				
						
	.dc.b	139				
	.dc.b	18				
	.dc.b	239				
						
	.dc.b	242				
						
	.dc.b	139				
	.dc.b	29				
	.dc.b	211				
						
	.dc.b	242				
						
	.dc.b	139				
	.dc.b	40				
	.dc.b	184				
						
	.dc.b	50				
						
	.dc.b	139				
	.dc.b	51				
	.dc.b	156				
						
	.dc.b	178				
						
	.dc.b	139				
	.dc.b	62				
	.dc.b	129				
						
	.dc.b	82				
						
	.dc.b	139				
	.dc.b	73				
	.dc.b	102				
						
	.dc.b	50				
						
	.dc.b	139				
	.dc.b	84				
	.dc.b	75				
						
	.dc.b	50				
						
	.dc.b	139				
	.dc.b	95				
	.dc.b	48				
						
	.dc.b	146				
						
	.dc.b	139				
	.dc.b	106				
	.dc.b	22				
						
	.dc.b	18				
						
	.dc.b	139				
	.dc.b	116				
	.dc.b	251				
						
	.dc.b	178				
						
	.dc.b	139				
	.dc.b	127				
	.dc.b	225				
						
	.dc.b	178				
						
	.dc.b	139				
	.dc.b	138				
	.dc.b	199				
						
	.dc.b	210				
						
	.dc.b	139				
	.dc.b	149				
	.dc.b	174				
						
	.dc.b	50				
						
	.dc.b	139				
	.dc.b	160				
	.dc.b	148				
						
	.dc.b	178				
						
	.dc.b	139				
	.dc.b	171				
	.dc.b	123				
						
	.dc.b	146				
						
	.dc.b	139				
	.dc.b	182				
	.dc.b	98				
						
	.dc.b	114				
						
	.dc.b	139				
	.dc.b	193				
	.dc.b	73				
						
	.dc.b	178				
						
	.dc.b	139				
	.dc.b	204				
	.dc.b	49				
						
	.dc.b	18				
						
	.dc.b	139				
	.dc.b	215				
	.dc.b	24				
						
	.dc.b	178				
						
	.dc.b	139				
	.dc.b	226				
	.dc.b	0				
						
	.dc.b	146				
						
	.dc.b	139				
	.dc.b	236				
	.dc.b	232				
						
	.dc.b	178				
						
	.dc.b	139				
	.dc.b	247				
	.dc.b	208				
						
	.dc.b	242				
						
	.dc.b	140				
	.dc.b	2				
	.dc.b	185				
						
	.dc.b	114				
						
	.dc.b	140				
	.dc.b	13				
	.dc.b	162				
						
	.dc.b	18				
						
	.dc.b	140				
	.dc.b	24				
	.dc.b	138				
						
	.dc.b	242				
						
	.dc.b	140				
	.dc.b	35				
	.dc.b	116				
						
	.dc.b	18				
						
	.dc.b	140				
	.dc.b	46				
	.dc.b	93				
						
	.dc.b	114				
						
	.dc.b	140				
	.dc.b	57				
	.dc.b	70				
						
	.dc.b	242				
						
	.dc.b	140				
	.dc.b	68				
	.dc.b	48				
						
	.dc.b	178				
						
	.dc.b	140				
	.dc.b	79				
	.dc.b	26				
						
	.dc.b	178				
						
	.dc.b	140				
	.dc.b	90				
	.dc.b	4				
						
	.dc.b	210				
						
	.dc.b	140				
	.dc.b	100				
	.dc.b	239				
						
	.dc.b	82				
						
	.dc.b	140				
	.dc.b	111				
	.dc.b	217				
						
	.dc.b	210				
						
	.dc.b	140				
	.dc.b	122				
	.dc.b	196				
						
	.dc.b	178				
						
	.dc.b	140				
	.dc.b	133				
	.dc.b	175				
						
	.dc.b	178				
						
	.dc.b	140				
	.dc.b	144				
	.dc.b	154				
						
	.dc.b	242				
						
	.dc.b	140				
	.dc.b	155				
	.dc.b	134				
						
	.dc.b	114				
						
	.dc.b	140				
	.dc.b	166				
	.dc.b	114				
						
	.dc.b	18				
						
	.dc.b	140				
	.dc.b	177				
	.dc.b	93				
						
	.dc.b	242				
						
	.dc.b	140				
	.dc.b	188				
	.dc.b	74				
						
	.dc.b	18				
						
	.dc.b	140				
	.dc.b	199				
	.dc.b	54				
						
	.dc.b	82				
						
	.dc.b	140				
	.dc.b	210				
	.dc.b	34				
						
	.dc.b	210				
						
	.dc.b	140				
	.dc.b	221				
	.dc.b	15				
						
	.dc.b	146				
						
	.dc.b	140				
	.dc.b	231				
	.dc.b	252				
						
	.dc.b	114				
						
	.dc.b	140				
	.dc.b	242				
	.dc.b	233				
						
	.dc.b	178				
						
	.dc.b	140				
	.dc.b	253				
	.dc.b	214				
						
	.dc.b	242				
						
	.dc.b	141				
	.dc.b	8				
	.dc.b	196				
						
	.dc.b	146				
						
	.dc.b	141				
	.dc.b	19				
	.dc.b	178				
						
	.dc.b	82				
						
	.dc.b	141				
	.dc.b	30				
	.dc.b	160				
						
	.dc.b	82				
						
	.dc.b	141				
	.dc.b	41				
	.dc.b	142				
						
	.dc.b	146				
						
	.dc.b	141				
	.dc.b	52				
	.dc.b	124				
						
	.dc.b	242				
						
	.dc.b	141				
	.dc.b	63				
	.dc.b	107				
						
	.dc.b	146				
						
	.dc.b	141				
	.dc.b	74				
	.dc.b	90				
						
	.dc.b	114				
						
	.dc.b	141				
	.dc.b	85				
	.dc.b	73				
						
	.dc.b	114				
						
	.dc.b	141				
	.dc.b	96				
	.dc.b	56				
						
	.dc.b	178				
						
	.dc.b	141				
	.dc.b	107				
	.dc.b	40				
						
	.dc.b	50				
						
	.dc.b	141				
	.dc.b	118				
	.dc.b	23				
						
	.dc.b	242				
						
	.dc.b	141				
	.dc.b	129				
	.dc.b	7				
						
	.dc.b	210				
						
	.dc.b	141				
	.dc.b	139				
	.dc.b	247				
						
	.dc.b	242				
						
	.dc.b	141				
	.dc.b	150				
	.dc.b	232				
						
	.dc.b	50				
						
	.dc.b	141				
	.dc.b	161				
	.dc.b	216				
						
	.dc.b	178				
						
	.dc.b	141				
	.dc.b	172				
	.dc.b	201				
						
	.dc.b	114				
						
	.dc.b	141				
	.dc.b	183				
	.dc.b	186				
						
	.dc.b	114				
						
	.dc.b	141				
	.dc.b	194				
	.dc.b	171				
						
	.dc.b	146				
						
	.dc.b	141				
	.dc.b	205				
	.dc.b	156				
						
	.dc.b	242				
						
	.dc.b	141				
	.dc.b	216				
	.dc.b	142				
						
	.dc.b	146				
						
	.dc.b	141				
	.dc.b	227				
	.dc.b	128				
						
	.dc.b	82				
						
	.dc.b	141				
	.dc.b	238				
	.dc.b	114				
						
	.dc.b	82				
						
	.dc.b	141				
	.dc.b	249				
	.dc.b	100				
						
	.dc.b	146				
						
	.dc.b	142				
	.dc.b	4				
	.dc.b	87				
						
	.dc.b	18				
						
	.dc.b	142				
	.dc.b	15				
	.dc.b	73				
						
	.dc.b	178				
						
	.dc.b	142				
	.dc.b	26				
	.dc.b	60				
						
	.dc.b	146				
						
	.dc.b	142				
	.dc.b	37				
	.dc.b	47				
						
	.dc.b	146				
						
	.dc.b	142				
	.dc.b	48				
	.dc.b	34				
						
	.dc.b	210				
						
	.dc.b	142				
	.dc.b	59				
	.dc.b	22				
						
	.dc.b	82				
						
	.dc.b	142				
	.dc.b	70				
	.dc.b	10				
						
	.dc.b	18				
						
	.dc.b	142				
	.dc.b	80				
	.dc.b	253				
						
	.dc.b	242				
						
	.dc.b	142				
	.dc.b	91				
	.dc.b	242				
						
	.dc.b	18				
						
	.dc.b	142				
	.dc.b	102				
	.dc.b	230				
						
	.dc.b	114				
						
	.dc.b	142				
	.dc.b	113				
	.dc.b	218				
						
	.dc.b	242				
						
	.dc.b	142				
	.dc.b	124				
	.dc.b	207				
						
	.dc.b	178				
						
	.dc.b	142				
	.dc.b	135				
	.dc.b	196				
						
	.dc.b	178				
						
	.dc.b	142				
	.dc.b	146				
	.dc.b	185				
						
	.dc.b	210				
						
	.dc.b	142				
	.dc.b	157				
	.dc.b	175				
						
	.dc.b	50				
						
	.dc.b	142				
	.dc.b	168				
	.dc.b	164				
						
	.dc.b	210				
						
	.dc.b	142				
	.dc.b	179				
	.dc.b	154				
						
	.dc.b	146				
						
	.dc.b	142				
	.dc.b	190				
	.dc.b	144				
						
	.dc.b	146				
						
	.dc.b	142				
	.dc.b	201				
	.dc.b	134				
						
	.dc.b	210				
						
	.dc.b	142				
	.dc.b	212				
	.dc.b	125				
						
	.dc.b	82				
						
	.dc.b	142				
	.dc.b	223				
	.dc.b	115				
						
	.dc.b	242				
						
	.dc.b	142				
	.dc.b	234				
	.dc.b	106				
						
	.dc.b	210				
						
	.dc.b	142				
	.dc.b	245				
	.dc.b	97				
						
	.dc.b	210				
						
	.dc.b	143				
	.dc.b	0				
	.dc.b	89				
						
	.dc.b	18				
						
	.dc.b	143				
	.dc.b	11				
	.dc.b	80				
						
	.dc.b	146				
						
	.dc.b	143				
	.dc.b	22				
	.dc.b	72				
						
	.dc.b	82				
						
	.dc.b	143				
	.dc.b	33				
	.dc.b	64				
						
	.dc.b	50				
						
	.dc.b	143				
	.dc.b	44				
	.dc.b	56				
						
	.dc.b	82				
						
	.dc.b	143				
	.dc.b	55				
	.dc.b	48				
						
	.dc.b	146				
						
	.dc.b	143				
	.dc.b	66				
	.dc.b	41				
						
	.dc.b	50				
						
	.dc.b	143				
	.dc.b	77				
	.dc.b	33				
						
	.dc.b	242				
						
	.dc.b	143				
	.dc.b	88				
	.dc.b	26				
						
	.dc.b	210				
						
	.dc.b	143				
	.dc.b	99				
	.dc.b	20				
						
	.dc.b	18				
						
	.dc.b	143				
	.dc.b	110				
	.dc.b	13				
						
	.dc.b	114				
						
	.dc.b	143				
	.dc.b	121				
	.dc.b	6				
						
	.dc.b	242				
						
	.dc.b	143				
	.dc.b	132				
	.dc.b	0				
						
	.dc.b	210				
						
	.dc.b	143				
	.dc.b	142				
	.dc.b	250				
						
	.dc.b	210				
						
	.dc.b	143				
	.dc.b	153				
	.dc.b	245				
						
	.dc.b	18				
						
	.dc.b	143				
	.dc.b	164				
	.dc.b	239				
						
	.dc.b	114				
						
	.dc.b	143				
	.dc.b	175				
	.dc.b	234				
						
	.dc.b	18				
						
	.dc.b	143				
	.dc.b	186				
	.dc.b	228				
						
	.dc.b	242				
						
	.dc.b	143				
	.dc.b	197				
	.dc.b	223				
						
	.dc.b	242				
						
	.dc.b	143				
	.dc.b	208				
	.dc.b	219				
						
	.dc.b	50				
						
	.dc.b	143				
	.dc.b	219				
	.dc.b	214				
						
	.dc.b	178				
						
	.dc.b	143				
	.dc.b	230				
	.dc.b	210				
						
	.dc.b	114				
						
	.dc.b	143				
	.dc.b	241				
	.dc.b	206				
						
	.dc.b	82				
						
	.dc.b	143				
	.dc.b	252				
	.dc.b	202				
						
	.dc.b	114				
						
	.dc.b	144				
	.dc.b	7				
	.dc.b	198				
						
	.dc.b	178				
						
	.dc.b	144				
	.dc.b	18				
	.dc.b	195				
						
	.dc.b	50				
						
	.dc.b	144				
	.dc.b	29				
	.dc.b	191				
						
	.dc.b	242				
						
	.dc.b	144				
	.dc.b	40				
	.dc.b	188				
						
	.dc.b	242				
						
	.dc.b	144				
	.dc.b	51				
	.dc.b	186				
						
	.dc.b	18				
						
	.dc.b	144				
	.dc.b	62				
	.dc.b	183				
						
	.dc.b	114				
						
	.dc.b	144				
	.dc.b	73				
	.dc.b	180				
						
	.dc.b	242				
						
	.dc.b	144				
	.dc.b	84				
	.dc.b	178				
						
	.dc.b	178				
						
	.dc.b	144				
	.dc.b	95				
	.dc.b	176				
						
	.dc.b	178				
						
	.dc.b	144				
	.dc.b	106				
	.dc.b	174				
						
	.dc.b	242				
						
	.dc.b	144				
	.dc.b	117				
	.dc.b	173				
						
	.dc.b	82				
						
	.dc.b	144				
	.dc.b	128				
	.dc.b	171				
						
	.dc.b	242				
						
	.dc.b	144				
	.dc.b	139				
	.dc.b	170				
						
	.dc.b	210				
						
	.dc.b	144				
	.dc.b	150				
	.dc.b	169				
						
	.dc.b	210				
						
	.dc.b	144				
	.dc.b	161				
	.dc.b	169				
						
	.dc.b	18				
						
	.dc.b	144				
	.dc.b	172				
	.dc.b	168				
						
	.dc.b	146				
						
	.dc.b	144				
	.dc.b	183				
	.dc.b	168				
						
	.dc.b	50				
						
	.dc.b	144				
	.dc.b	194				
	.dc.b	168				
						
	.dc.b	18				
						
	.dc.b	144				
	.dc.b	205				
	.dc.b	168				
						
	.dc.b	18				
						
	.dc.b	144				
	.dc.b	216				
	.dc.b	168				
						
	.dc.b	114				
						
	.dc.b	144				
	.dc.b	227				
	.dc.b	168				
						
	.dc.b	242				
						
	.dc.b	144				
	.dc.b	238				
	.dc.b	169				
						
	.dc.b	146				
						
	.dc.b	144				
	.dc.b	249				
	.dc.b	170				
						
	.dc.b	146				
						
	.dc.b	145				
	.dc.b	4				
	.dc.b	171				
						
	.dc.b	178				
						
	.dc.b	145				
	.dc.b	15				
	.dc.b	172				
						
	.dc.b	242				
						
	.dc.b	145				
	.dc.b	26				
	.dc.b	174				
						
	.dc.b	146				
						
	.dc.b	145				
	.dc.b	37				
	.dc.b	176				
						
	.dc.b	82				
						
	.dc.b	145				
	.dc.b	48				
	.dc.b	178				
						
	.dc.b	50				
						
	.dc.b	145				
	.dc.b	59				
	.dc.b	180				
						
	.dc.b	114				
						
	.dc.b	145				
	.dc.b	70				
	.dc.b	182				
						
	.dc.b	210				
						
	.dc.b	145				
	.dc.b	81				
	.dc.b	185				
						
	.dc.b	82				
						
	.dc.b	145				
	.dc.b	92				
	.dc.b	188				
						
	.dc.b	50				
						
	.dc.b	145				
	.dc.b	103				
	.dc.b	191				
						
	.dc.b	50				
						
	.dc.b	145				
	.dc.b	114				
	.dc.b	194				
						
	.dc.b	82				
						
	.dc.b	145				
	.dc.b	125				
	.dc.b	197				
						
	.dc.b	210				
						
	.dc.b	145				
	.dc.b	136				
	.dc.b	201				
						
	.dc.b	114				
						
	.dc.b	145				
	.dc.b	147				
	.dc.b	205				
						
	.dc.b	50				
						
	.dc.b	145				
	.dc.b	158				
	.dc.b	209				
						
	.dc.b	82				
						
	.dc.b	145				
	.dc.b	169				
	.dc.b	213				
						
	.dc.b	146				
						
	.dc.b	145				
	.dc.b	180				
	.dc.b	217				
						
	.dc.b	242				
						
	.dc.b	145				
	.dc.b	191				
	.dc.b	222				
						
	.dc.b	178				
						
	.dc.b	145				
	.dc.b	202				
	.dc.b	227				
						
	.dc.b	146				
						
	.dc.b	145				
	.dc.b	213				
	.dc.b	232				
						
	.dc.b	146				
						
	.dc.b	145				
	.dc.b	224				
	.dc.b	237				
						
	.dc.b	242				
						
	.dc.b	145				
	.dc.b	235				
	.dc.b	243				
						
	.dc.b	114				
						
	.dc.b	145				
	.dc.b	246				
	.dc.b	249				
						
	.dc.b	18				
						
	.dc.b	146				
	.dc.b	1				
	.dc.b	255				
						
	.dc.b	18				
						
	.dc.b	146				
	.dc.b	13				
	.dc.b	5				
						
	.dc.b	50				
						
	.dc.b	146				
	.dc.b	24				
	.dc.b	11				
						
	.dc.b	114				
						
	.dc.b	146				
	.dc.b	35				
	.dc.b	18				
						
	.dc.b	18				
						
	.dc.b	146				
	.dc.b	46				
	.dc.b	24				
						
	.dc.b	210				
						
	.dc.b	146				
	.dc.b	57				
	.dc.b	31				
						
	.dc.b	178				
						
	.dc.b	146				
	.dc.b	68				
	.dc.b	38				
						
	.dc.b	242				
						
	.dc.b	146				
	.dc.b	79				
	.dc.b	46				
						
	.dc.b	82				
						
	.dc.b	146				
	.dc.b	90				
	.dc.b	53				
						
	.dc.b	210				
						
	.dc.b	146				
	.dc.b	101				
	.dc.b	61				
						
	.dc.b	178				
						
	.dc.b	146				
	.dc.b	112				
	.dc.b	69				
						
	.dc.b	146				
						
	.dc.b	146				
	.dc.b	123				
	.dc.b	77				
						
	.dc.b	210				
						
	.dc.b	146				
	.dc.b	134				
	.dc.b	86				
						
	.dc.b	50				
						
	.dc.b	146				
	.dc.b	145				
	.dc.b	94				
						
	.dc.b	210				
						
	.dc.b	146				
	.dc.b	156				
	.dc.b	103				
						
	.dc.b	178				
						
	.dc.b	146				
	.dc.b	167				
	.dc.b	112				
						
	.dc.b	178				
						
	.dc.b	146				
	.dc.b	178				
	.dc.b	121				
						
	.dc.b	242				
						
	.dc.b	146				
	.dc.b	189				
	.dc.b	131				
						
	.dc.b	114				
						
	.dc.b	146				
	.dc.b	200				
	.dc.b	141				
						
	.dc.b	18				
						
	.dc.b	146				
	.dc.b	211				
	.dc.b	150				
						
	.dc.b	242				
						
	.dc.b	146				
	.dc.b	222				
	.dc.b	161				
						
	.dc.b	18				
						
	.dc.b	146				
	.dc.b	233				
	.dc.b	171				
						
	.dc.b	82				
						
	.dc.b	146				
	.dc.b	244				
	.dc.b	181				
						
	.dc.b	210				
						
	.dc.b	146				
	.dc.b	255				
	.dc.b	192				
						
	.dc.b	114				
						
	.dc.b	147				
	.dc.b	10				
	.dc.b	203				
						
	.dc.b	82				
						
	.dc.b	147				
	.dc.b	21				
	.dc.b	214				
						
	.dc.b	114				
						
	.dc.b	147				
	.dc.b	32				
	.dc.b	225				
						
	.dc.b	210				
						
	.dc.b	147				
	.dc.b	43				
	.dc.b	237				
						
	.dc.b	82				
						
	.dc.b	147				
	.dc.b	54				
	.dc.b	249				
						
	.dc.b	18				
						
	.dc.b	147				
	.dc.b	66				
	.dc.b	4				
						
	.dc.b	242				
						
	.dc.b	147				
	.dc.b	77				
	.dc.b	17				
						
	.dc.b	50				
						
	.dc.b	147				
	.dc.b	88				
	.dc.b	29				
						
	.dc.b	114				
						
	.dc.b	147				
	.dc.b	99				
	.dc.b	42				
						
	.dc.b	18				
						
	.dc.b	147				
	.dc.b	110				
	.dc.b	54				
						
	.dc.b	210				
						
	.dc.b	147				
	.dc.b	121				
	.dc.b	67				
						
	.dc.b	210				
						
	.dc.b	147				
	.dc.b	132				
	.dc.b	80				
						
	.dc.b	242				
						
	.dc.b	147				
	.dc.b	143				
	.dc.b	94				
						
	.dc.b	82				
						
	.dc.b	147				
	.dc.b	154				
	.dc.b	107				
						
	.dc.b	242				
						
	.dc.b	147				
	.dc.b	165				
	.dc.b	121				
						
	.dc.b	210				
						
	.dc.b	147				
	.dc.b	176				
	.dc.b	135				
						
	.dc.b	210				
						
	.dc.b	147				
	.dc.b	187				
	.dc.b	149				
						
	.dc.b	242				
						
	.dc.b	147				
	.dc.b	198				
	.dc.b	164				
						
	.dc.b	114				
						
	.dc.b	147				
	.dc.b	209				
	.dc.b	179				
						
	.dc.b	18				
						
	.dc.b	147				
	.dc.b	220				
	.dc.b	193				
						
	.dc.b	210				
						
	.dc.b	147				
	.dc.b	231				
	.dc.b	208				
						
	.dc.b	242				
						
	.dc.b	147				
	.dc.b	242				
	.dc.b	224				
						
	.dc.b	50				
						
	.dc.b	147				
	.dc.b	253				
	.dc.b	239				
						
	.dc.b	146				
						
	.dc.b	148				
	.dc.b	8				
	.dc.b	255				
						
	.dc.b	82				
						
	.dc.b	148				
	.dc.b	20				
	.dc.b	15				
						
	.dc.b	50				
						
	.dc.b	148				
	.dc.b	31				
	.dc.b	31				
						
	.dc.b	50				
						
	.dc.b	148				
	.dc.b	42				
	.dc.b	47				
						
	.dc.b	146				
						
	.dc.b	148				
	.dc.b	53				
	.dc.b	63				
						
	.dc.b	242				
						
	.dc.b	148				
	.dc.b	64				
	.dc.b	80				
						
	.dc.b	178				
						
	.dc.b	148				
	.dc.b	75				
	.dc.b	97				
						
	.dc.b	146				
						
	.dc.b	148				
	.dc.b	86				
	.dc.b	114				
						
	.dc.b	178				
						
	.dc.b	148				
	.dc.b	97				
	.dc.b	132				
						
	.dc.b	18				
						
	.dc.b	148				
	.dc.b	108				
	.dc.b	149				
						
	.dc.b	146				
						
	.dc.b	148				
	.dc.b	119				
	.dc.b	167				
						
	.dc.b	82				
						
	.dc.b	148				
	.dc.b	130				
	.dc.b	185				
						
	.dc.b	50				
						
	.dc.b	148				
	.dc.b	141				
	.dc.b	203				
						
	.dc.b	82				
						
	.dc.b	148				
	.dc.b	152				
	.dc.b	221				
						
	.dc.b	178				
						
	.dc.b	148				
	.dc.b	163				
	.dc.b	240				
						
	.dc.b	50				
						
	.dc.b	148				
	.dc.b	175				
	.dc.b	3				
						
	.dc.b	18				
						
	.dc.b	148				
	.dc.b	186				
	.dc.b	21				
						
	.dc.b	242				
						
	.dc.b	148				
	.dc.b	197				
	.dc.b	41				
						
	.dc.b	50				
						
	.dc.b	148				
	.dc.b	208				
	.dc.b	60				
						
	.dc.b	146				
						
	.dc.b	148				
	.dc.b	219				
	.dc.b	80				
						
	.dc.b	18				
						
	.dc.b	148				
	.dc.b	230				
	.dc.b	99				
						
	.dc.b	242				
						
	.dc.b	148				
	.dc.b	241				
	.dc.b	119				
						
	.dc.b	242				
						
	.dc.b	148				
	.dc.b	252				
	.dc.b	140				
						
	.dc.b	18				
						
	.dc.b	149				
	.dc.b	7				
	.dc.b	160				
						
	.dc.b	114				
						
	.dc.b	149				
	.dc.b	18				
	.dc.b	181				
						
	.dc.b	18				
						
	.dc.b	149				
	.dc.b	29				
	.dc.b	201				
						
	.dc.b	242				
						
	.dc.b	149				
	.dc.b	40				
	.dc.b	222				
						
	.dc.b	242				
						
	.dc.b	149				
	.dc.b	51				
	.dc.b	244				
						
	.dc.b	50				
						
	.dc.b	149				
	.dc.b	63				
	.dc.b	9				
						
	.dc.b	146				
						
	.dc.b	149				
	.dc.b	74				
	.dc.b	31				
						
	.dc.b	82				
						
	.dc.b	149				
	.dc.b	85				
	.dc.b	53				
						
	.dc.b	18				
						
	.dc.b	149				
	.dc.b	96				
	.dc.b	75				
						
	.dc.b	50				
						
	.dc.b	149				
	.dc.b	107				
	.dc.b	97				
						
	.dc.b	114				
						
	.dc.b	149				
	.dc.b	118				
	.dc.b	119				
						
	.dc.b	242				
						
	.dc.b	149				
	.dc.b	129				
	.dc.b	142				
						
	.dc.b	146				
						
	.dc.b	149				
	.dc.b	140				
	.dc.b	165				
						
	.dc.b	114				
						
	.dc.b	149				
	.dc.b	151				
	.dc.b	188				
						
	.dc.b	146				
						
	.dc.b	149				
	.dc.b	162				
	.dc.b	211				
						
	.dc.b	210				
						
	.dc.b	149				
	.dc.b	173				
	.dc.b	235				
						
	.dc.b	82				
						
	.dc.b	149				
	.dc.b	185				
	.dc.b	3				
						
	.dc.b	18				
						
	.dc.b	149				
	.dc.b	196				
	.dc.b	26				
						
	.dc.b	242				
						
	.dc.b	149				
	.dc.b	207				
	.dc.b	51				
						
	.dc.b	18				
						
	.dc.b	149				
	.dc.b	218				
	.dc.b	75				
						
	.dc.b	82				
						
	.dc.b	149				
	.dc.b	229				
	.dc.b	99				
						
	.dc.b	210				
						
	.dc.b	149				
	.dc.b	240				
	.dc.b	124				
						
	.dc.b	146				
						
	.dc.b	149				
	.dc.b	251				
	.dc.b	149				
						
	.dc.b	146				
						
	.dc.b	150				
	.dc.b	6				
	.dc.b	174				
						
	.dc.b	178				
						
	.dc.b	150				
	.dc.b	17				
	.dc.b	200				
						
	.dc.b	18				
						
	.dc.b	150				
	.dc.b	28				
	.dc.b	225				
						
	.dc.b	146				
						
	.dc.b	150				
	.dc.b	39				
	.dc.b	251				
						
	.dc.b	82				
						
	.dc.b	150				
	.dc.b	51				
	.dc.b	21				
						
	.dc.b	82				
						
	.dc.b	150				
	.dc.b	62				
	.dc.b	47				
						
	.dc.b	114				
						
	.dc.b	150				
	.dc.b	73				
	.dc.b	73				
						
	.dc.b	210				
						
	.dc.b	150				
	.dc.b	84				
	.dc.b	100				
						
	.dc.b	82				
						
	.dc.b	150				
	.dc.b	95				
	.dc.b	127				
						
	.dc.b	50				
						
	.dc.b	150				
	.dc.b	106				
	.dc.b	154				
						
	.dc.b	50				
						
	.dc.b	150				
	.dc.b	117				
	.dc.b	181				
						
	.dc.b	82				
						
	.dc.b	150				
	.dc.b	128				
	.dc.b	208				
						
	.dc.b	178				
						
	.dc.b	150				
	.dc.b	139				
	.dc.b	236				
						
	.dc.b	82				
						
	.dc.b	150				
	.dc.b	151				
	.dc.b	8				
						
	.dc.b	18				
						
	.dc.b	150				
	.dc.b	162				
	.dc.b	36				
						
	.dc.b	18				
						
	.dc.b	150				
	.dc.b	173				
	.dc.b	64				
						
	.dc.b	82				
						
	.dc.b	150				
	.dc.b	184				
	.dc.b	92				
						
	.dc.b	210				
						
	.dc.b	150				
	.dc.b	195				
	.dc.b	121				
						
	.dc.b	114				
						
	.dc.b	150				
	.dc.b	206				
	.dc.b	150				
						
	.dc.b	50				
						
	.dc.b	150				
	.dc.b	217				
	.dc.b	179				
						
	.dc.b	50				
						
	.dc.b	150				
	.dc.b	228				
	.dc.b	208				
						
	.dc.b	114				
						
	.dc.b	150				
	.dc.b	239				
	.dc.b	237				
						
	.dc.b	242				
						
	.dc.b	150				
	.dc.b	251				
	.dc.b	11				
						
	.dc.b	146				
						
	.dc.b	151				
	.dc.b	6				
	.dc.b	41				
						
	.dc.b	114				
						
	.dc.b	151				
	.dc.b	17				
	.dc.b	71				
						
	.dc.b	114				
						
	.dc.b	151				
	.dc.b	28				
	.dc.b	101				
						
	.dc.b	178				
						
	.dc.b	151				
	.dc.b	39				
	.dc.b	132				
						
	.dc.b	50				
						
	.dc.b	151				
	.dc.b	50				
	.dc.b	162				
						
	.dc.b	210				
						
	.dc.b	151				
	.dc.b	61				
	.dc.b	193				
						
	.dc.b	178				
						
	.dc.b	151				
	.dc.b	72				
	.dc.b	224				
						
	.dc.b	210				
						
	.dc.b	151				
	.dc.b	84				
	.dc.b	0				
						
	.dc.b	18				
						
	.dc.b	151				
	.dc.b	95				
	.dc.b	31				
						
	.dc.b	146				
						
	.dc.b	151				
	.dc.b	106				
	.dc.b	63				
						
	.dc.b	82				
						
	.dc.b	151				
	.dc.b	117				
	.dc.b	95				
						
	.dc.b	50				
						
	.dc.b	151				
	.dc.b	128				
	.dc.b	127				
						
	.dc.b	82				
						
	.dc.b	151				
	.dc.b	139				
	.dc.b	159				
						
	.dc.b	146				
						
	.dc.b	151				
	.dc.b	150				
	.dc.b	192				
						
	.dc.b	18				
						
	.dc.b	151				
	.dc.b	161				
	.dc.b	224				
						
	.dc.b	210				
						
	.dc.b	151				
	.dc.b	173				
	.dc.b	1				
						
	.dc.b	178				
						
	.dc.b	151				
	.dc.b	184				
	.dc.b	34				
						
	.dc.b	210				
						
	.dc.b	151				
	.dc.b	195				
	.dc.b	68				
						
	.dc.b	50				
						
	.dc.b	151				
	.dc.b	206				
	.dc.b	101				
						
	.dc.b	178				
						
	.dc.b	151				
	.dc.b	217				
	.dc.b	135				
						
	.dc.b	114				
						
	.dc.b	151				
	.dc.b	228				
	.dc.b	169				
						
	.dc.b	82				
						
	.dc.b	151				
	.dc.b	239				
	.dc.b	203				
						
	.dc.b	114				
						
	.dc.b	151				
	.dc.b	250				
	.dc.b	237				
						
	.dc.b	210				
						
	.dc.b	152				
	.dc.b	6				
	.dc.b	16				
						
	.dc.b	114				
						
	.dc.b	152				
	.dc.b	17				
	.dc.b	51				
						
	.dc.b	50				
						
	.dc.b	152				
	.dc.b	28				
	.dc.b	86				
						
	.dc.b	18				
						
	.dc.b	152				
	.dc.b	39				
	.dc.b	121				
						
	.dc.b	82				
						
	.dc.b	152				
	.dc.b	50				
	.dc.b	156				
						
	.dc.b	146				
						
	.dc.b	152				
	.dc.b	61				
	.dc.b	192				
						
	.dc.b	50				
						
	.dc.b	152				
	.dc.b	72				
	.dc.b	227				
						
	.dc.b	242				
						
	.dc.b	152				
	.dc.b	84				
	.dc.b	7				
						
	.dc.b	242				
						
	.dc.b	152				
	.dc.b	95				
	.dc.b	44				
						
	.dc.b	18				
						
	.dc.b	152				
	.dc.b	106				
	.dc.b	80				
						
	.dc.b	114				
						
	.dc.b	152				
	.dc.b	117				
	.dc.b	117				
						
	.dc.b	18				
						
	.dc.b	152				
	.dc.b	128				
	.dc.b	153				
						
	.dc.b	210				
						
	.dc.b	152				
	.dc.b	139				
	.dc.b	190				
						
	.dc.b	210				
						
	.dc.b	152				
	.dc.b	150				
	.dc.b	228				
						
	.dc.b	18				
						
	.dc.b	152				
	.dc.b	162				
	.dc.b	9				
						
	.dc.b	114				
						
	.dc.b	152				
	.dc.b	173				
	.dc.b	47				
						
	.dc.b	18				
						
	.dc.b	152				
	.dc.b	184				
	.dc.b	84				
						
	.dc.b	242				
						
	.dc.b	152				
	.dc.b	195				
	.dc.b	122				
						
	.dc.b	242				
						
	.dc.b	152				
	.dc.b	206				
	.dc.b	161				
						
	.dc.b	18				
						
	.dc.b	152				
	.dc.b	217				
	.dc.b	199				
						
	.dc.b	146				
						
	.dc.b	152				
	.dc.b	228				
	.dc.b	238				
						
	.dc.b	50				
						
	.dc.b	152				
	.dc.b	240				
	.dc.b	20				
						
	.dc.b	242				
						
	.dc.b	152				
	.dc.b	251				
	.dc.b	59				
						
	.dc.b	242				
						
	.dc.b	153				
	.dc.b	6				
	.dc.b	99				
						
	.dc.b	50				
						
	.dc.b	153				
	.dc.b	17				
	.dc.b	138				
						
	.dc.b	178				
						
	.dc.b	153				
	.dc.b	28				
	.dc.b	178				
						
	.dc.b	82				
						
	.dc.b	153				
	.dc.b	39				
	.dc.b	218				
						
	.dc.b	50				
						
	.dc.b	153				
	.dc.b	51				
	.dc.b	2				
						
	.dc.b	50				
						
	.dc.b	153				
	.dc.b	62				
	.dc.b	42				
						
	.dc.b	114				
						
	.dc.b	153				
	.dc.b	73				
	.dc.b	82				
						
	.dc.b	242				
						
	.dc.b	153				
	.dc.b	84				
	.dc.b	123				
						
	.dc.b	146				
						
	.dc.b	153				
	.dc.b	95				
	.dc.b	164				
						
	.dc.b	114				
						
	.dc.b	153				
	.dc.b	106				
	.dc.b	205				
						
	.dc.b	114				
						
	.dc.b	153				
	.dc.b	117				
	.dc.b	246				
						
	.dc.b	178				
						
	.dc.b	153				
	.dc.b	129				
	.dc.b	32				
						
	.dc.b	50				
						
	.dc.b	153				
	.dc.b	140				
	.dc.b	73				
						
	.dc.b	210				
						
	.dc.b	153				
	.dc.b	151				
	.dc.b	115				
						
	.dc.b	178				
						
	.dc.b	153				
	.dc.b	162				
	.dc.b	157				
						
	.dc.b	210				
						
	.dc.b	153				
	.dc.b	173				
	.dc.b	200				
						
	.dc.b	18				
						
	.dc.b	153				
	.dc.b	184				
	.dc.b	242				
						
	.dc.b	146				
						
	.dc.b	153				
	.dc.b	196				
	.dc.b	29				
						
	.dc.b	50				
						
	.dc.b	153				
	.dc.b	207				
	.dc.b	72				
						
	.dc.b	18				
						
	.dc.b	153				
	.dc.b	218				
	.dc.b	115				
						
	.dc.b	50				
						
	.dc.b	153				
	.dc.b	229				
	.dc.b	158				
						
	.dc.b	114				
						
	.dc.b	153				
	.dc.b	240				
	.dc.b	201				
						
	.dc.b	242				
						
	.dc.b	153				
	.dc.b	251				
	.dc.b	245				
						
	.dc.b	178				
						
	.dc.b	154				
	.dc.b	7				
	.dc.b	33				
						
	.dc.b	146				
						
	.dc.b	154				
	.dc.b	18				
	.dc.b	77				
						
	.dc.b	178				
						
	.dc.b	154				
	.dc.b	29				
	.dc.b	121				
						
	.dc.b	242				
						
	.dc.b	154				
	.dc.b	40				
	.dc.b	166				
						
	.dc.b	114				
						
	.dc.b	154				
	.dc.b	51				
	.dc.b	211				
						
	.dc.b	50				
						
	.dc.b	154				
	.dc.b	63				
	.dc.b	0				
						
	.dc.b	18				
						
	.dc.b	154				
	.dc.b	74				
	.dc.b	45				
						
	.dc.b	50				
						
	.dc.b	154				
	.dc.b	85				
	.dc.b	90				
						
	.dc.b	146				
						
	.dc.b	154				
	.dc.b	96				
	.dc.b	136				
						
	.dc.b	18				
						
	.dc.b	154				
	.dc.b	107				
	.dc.b	181				
						
	.dc.b	210				
						
	.dc.b	154				
	.dc.b	118				
	.dc.b	227				
						
	.dc.b	178				
						
	.dc.b	154				
	.dc.b	130				
	.dc.b	17				
						
	.dc.b	210				
						
	.dc.b	154				
	.dc.b	141				
	.dc.b	64				
						
	.dc.b	50				
						
	.dc.b	154				
	.dc.b	152				
	.dc.b	110				
						
	.dc.b	178				
						
	.dc.b	154				
	.dc.b	163				
	.dc.b	157				
						
	.dc.b	114				
						
	.dc.b	154				
	.dc.b	174				
	.dc.b	204				
						
	.dc.b	82				
						
	.dc.b	154				
	.dc.b	185				
	.dc.b	251				
						
	.dc.b	114				
						
	.dc.b	154				
	.dc.b	197				
	.dc.b	42				
						
	.dc.b	210				
						
	.dc.b	154				
	.dc.b	208				
	.dc.b	90				
						
	.dc.b	82				
						
	.dc.b	154				
	.dc.b	219				
	.dc.b	138				
						
	.dc.b	18				
						
	.dc.b	154				
	.dc.b	230				
	.dc.b	186				
						
	.dc.b	18				
						
	.dc.b	154				
	.dc.b	241				
	.dc.b	234				
						
	.dc.b	50				
						
	.dc.b	154				
	.dc.b	253				
	.dc.b	26				
						
	.dc.b	146				
						
	.dc.b	155				
	.dc.b	8				
	.dc.b	75				
						
	.dc.b	18				
						
	.dc.b	155				
	.dc.b	19				
	.dc.b	123				
						
	.dc.b	210				
						
	.dc.b	155				
	.dc.b	30				
	.dc.b	172				
						
	.dc.b	210				
						
	.dc.b	155				
	.dc.b	41				
	.dc.b	221				
						
	.dc.b	242				
						
	.dc.b	155				
	.dc.b	53				
	.dc.b	15				
						
	.dc.b	82				
						
	.dc.b	155				
	.dc.b	64				
	.dc.b	64				
						
	.dc.b	242				
						
	.dc.b	155				
	.dc.b	75				
	.dc.b	114				
						
	.dc.b	178				
						
	.dc.b	155				
	.dc.b	86				
	.dc.b	164				
						
	.dc.b	146				
						
	.dc.b	155				
	.dc.b	97				
	.dc.b	214				
						
	.dc.b	210				
						
	.dc.b	155				
	.dc.b	109				
	.dc.b	9				
						
	.dc.b	50				
						
	.dc.b	155				
	.dc.b	120				
	.dc.b	59				
						
	.dc.b	178				
						
	.dc.b	155				
	.dc.b	131				
	.dc.b	110				
						
	.dc.b	114				
						
	.dc.b	155				
	.dc.b	142				
	.dc.b	161				
						
	.dc.b	114				
						
	.dc.b	155				
	.dc.b	153				
	.dc.b	212				
						
	.dc.b	178				
						
	.dc.b	155				
	.dc.b	165				
	.dc.b	8				
						
	.dc.b	18				
						
	.dc.b	155				
	.dc.b	176				
	.dc.b	59				
						
	.dc.b	146				
						
	.dc.b	155				
	.dc.b	187				
	.dc.b	111				
						
	.dc.b	82				
						
	.dc.b	155				
	.dc.b	198				
	.dc.b	163				
						
	.dc.b	82				
						
	.dc.b	155				
	.dc.b	209				
	.dc.b	215				
						
	.dc.b	146				
						
	.dc.b	155				
	.dc.b	221				
	.dc.b	11				
						
	.dc.b	242				
						
	.dc.b	155				
	.dc.b	232				
	.dc.b	64				
						
	.dc.b	114				
						
	.dc.b	155				
	.dc.b	243				
	.dc.b	117				
						
	.dc.b	82				
						
	.dc.b	155				
	.dc.b	254				
	.dc.b	170				
						
	.dc.b	82				
						
	.dc.b	156				
	.dc.b	9				
	.dc.b	223				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	21				
	.dc.b	20				
						
	.dc.b	210				
						
	.dc.b	156				
	.dc.b	32				
	.dc.b	74				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	43				
	.dc.b	128				
						
	.dc.b	50				
						
	.dc.b	156				
	.dc.b	54				
	.dc.b	182				
						
	.dc.b	50				
						
	.dc.b	156				
	.dc.b	65				
	.dc.b	236				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	77				
	.dc.b	34				
						
	.dc.b	210				
						
	.dc.b	156				
	.dc.b	88				
	.dc.b	89				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	99				
	.dc.b	144				
						
	.dc.b	50				
						
	.dc.b	156				
	.dc.b	110				
	.dc.b	199				
						
	.dc.b	50				
						
	.dc.b	156				
	.dc.b	121				
	.dc.b	254				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	133				
	.dc.b	53				
						
	.dc.b	210				
						
	.dc.b	156				
	.dc.b	144				
	.dc.b	109				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	155				
	.dc.b	165				
						
	.dc.b	50				
						
	.dc.b	156				
	.dc.b	166				
	.dc.b	221				
						
	.dc.b	50				
						
	.dc.b	156				
	.dc.b	178				
	.dc.b	21				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	189				
	.dc.b	77				
						
	.dc.b	210				
						
	.dc.b	156				
	.dc.b	200				
	.dc.b	134				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	211				
	.dc.b	191				
						
	.dc.b	50				
						
	.dc.b	156				
	.dc.b	222				
	.dc.b	248				
						
	.dc.b	50				
						
	.dc.b	156				
	.dc.b	234				
	.dc.b	49				
						
	.dc.b	114				
						
	.dc.b	156				
	.dc.b	245				
	.dc.b	106				
						
	.dc.b	210				
						
	.dc.b	157				
	.dc.b	0				
	.dc.b	164				
						
	.dc.b	114				
						
	.dc.b	157				
	.dc.b	11				
	.dc.b	222				
						
	.dc.b	82				
						
	.dc.b	157				
	.dc.b	23				
	.dc.b	24				
						
	.dc.b	82				
						
	.dc.b	157				
	.dc.b	34				
	.dc.b	82				
						
	.dc.b	114				
						
	.dc.b	157				
	.dc.b	45				
	.dc.b	140				
						
	.dc.b	242				
						
	.dc.b	157				
	.dc.b	56				
	.dc.b	199				
						
	.dc.b	114				
						
	.dc.b	157				
	.dc.b	68				
	.dc.b	2				
						
	.dc.b	82				
						
	.dc.b	157				
	.dc.b	79				
	.dc.b	61				
						
	.dc.b	82				
						
	.dc.b	157				
	.dc.b	90				
	.dc.b	120				
						
	.dc.b	146				
						
	.dc.b	157				
	.dc.b	101				
	.dc.b	179				
						
	.dc.b	242				
						
	.dc.b	157				
	.dc.b	112				
	.dc.b	239				
						
	.dc.b	146				
						
	.dc.b	157				
	.dc.b	124				
	.dc.b	43				
						
	.dc.b	114				
						
	.dc.b	157				
	.dc.b	135				
	.dc.b	103				
						
	.dc.b	114				
						
	.dc.b	157				
	.dc.b	146				
	.dc.b	163				
						
	.dc.b	146				
						
	.dc.b	157				
	.dc.b	157				
	.dc.b	224				
						
	.dc.b	18				
						
	.dc.b	157				
	.dc.b	169				
	.dc.b	28				
						
	.dc.b	178				
						
	.dc.b	157				
	.dc.b	180				
	.dc.b	89				
						
	.dc.b	114				
						
	.dc.b	157				
	.dc.b	191				
	.dc.b	150				
						
	.dc.b	114				
						
	.dc.b	157				
	.dc.b	202				
	.dc.b	211				
						
	.dc.b	178				
						
	.dc.b	157				
	.dc.b	214				
	.dc.b	17				
						
	.dc.b	18				
						
	.dc.b	157				
	.dc.b	225				
	.dc.b	78				
						
	.dc.b	178				
						
	.dc.b	157				
	.dc.b	236				
	.dc.b	140				
						
	.dc.b	146				
						
	.dc.b	157				
	.dc.b	247				
	.dc.b	202				
						
	.dc.b	146				
						
	.dc.b	158				
	.dc.b	3				
	.dc.b	8				
						
	.dc.b	210				
						
	.dc.b	158				
	.dc.b	14				
	.dc.b	71				
						
	.dc.b	50				
						
	.dc.b	158				
	.dc.b	25				
	.dc.b	133				
						
	.dc.b	210				
						
	.dc.b	158				
	.dc.b	36				
	.dc.b	196				
						
	.dc.b	146				
						
	.dc.b	158				
	.dc.b	48				
	.dc.b	3				
						
	.dc.b	178				
						
	.dc.b	158				
	.dc.b	59				
	.dc.b	66				
						
	.dc.b	210				
						
	.dc.b	158				
	.dc.b	70				
	.dc.b	130				
						
	.dc.b	82				
						
	.dc.b	158				
	.dc.b	81				
	.dc.b	193				
						
	.dc.b	242				
						
	.dc.b	158				
	.dc.b	93				
	.dc.b	1				
						
	.dc.b	178				
						
	.dc.b	158				
	.dc.b	104				
	.dc.b	65				
						
	.dc.b	178				
						
	.dc.b	158				
	.dc.b	115				
	.dc.b	129				
						
	.dc.b	242				
						
	.dc.b	158				
	.dc.b	126				
	.dc.b	194				
						
	.dc.b	82				
						
	.dc.b	158				
	.dc.b	138				
	.dc.b	2				
						
	.dc.b	242				
						
	.dc.b	158				
	.dc.b	149				
	.dc.b	67				
						
	.dc.b	210				
						
	.dc.b	158				
	.dc.b	160				
	.dc.b	132				
						
	.dc.b	210				
						
	.dc.b	158				
	.dc.b	171				
	.dc.b	198				
						
	.dc.b	18				
						
	.dc.b	158				
	.dc.b	183				
	.dc.b	7				
						
	.dc.b	114				
						
	.dc.b	158				
	.dc.b	194				
	.dc.b	73				
						
	.dc.b	18				
						
	.dc.b	158				
	.dc.b	205				
	.dc.b	138				
						
	.dc.b	210				
						
	.dc.b	158				
	.dc.b	216				
	.dc.b	204				
						
	.dc.b	210				
						
	.dc.b	158				
	.dc.b	228				
	.dc.b	15				
						
	.dc.b	18				
						
	.dc.b	158				
	.dc.b	239				
	.dc.b	81				
						
	.dc.b	114				
						
	.dc.b	158				
	.dc.b	250				
	.dc.b	148				
						
	.dc.b	18				
						
	.dc.b	159				
	.dc.b	5				
	.dc.b	214				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	17				
	.dc.b	25				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	28				
	.dc.b	93				
						
	.dc.b	50				
						
	.dc.b	159				
	.dc.b	39				
	.dc.b	160				
						
	.dc.b	146				
						
	.dc.b	159				
	.dc.b	50				
	.dc.b	228				
						
	.dc.b	50				
						
	.dc.b	159				
	.dc.b	62				
	.dc.b	39				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	73				
	.dc.b	107				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	84				
	.dc.b	176				
						
	.dc.b	50				
						
	.dc.b	159				
	.dc.b	95				
	.dc.b	244				
						
	.dc.b	146				
						
	.dc.b	159				
	.dc.b	107				
	.dc.b	57				
						
	.dc.b	50				
						
	.dc.b	159				
	.dc.b	118				
	.dc.b	125				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	129				
	.dc.b	194				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	141				
	.dc.b	8				
						
	.dc.b	50				
						
	.dc.b	159				
	.dc.b	152				
	.dc.b	77				
						
	.dc.b	146				
						
	.dc.b	159				
	.dc.b	163				
	.dc.b	147				
						
	.dc.b	50				
						
	.dc.b	159				
	.dc.b	174				
	.dc.b	216				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	186				
	.dc.b	30				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	197				
	.dc.b	101				
						
	.dc.b	50				
						
	.dc.b	159				
	.dc.b	208				
	.dc.b	171				
						
	.dc.b	146				
						
	.dc.b	159				
	.dc.b	219				
	.dc.b	242				
						
	.dc.b	50				
						
	.dc.b	159				
	.dc.b	231				
	.dc.b	56				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	242				
	.dc.b	127				
						
	.dc.b	242				
						
	.dc.b	159				
	.dc.b	253				
	.dc.b	199				
						
	.dc.b	18				
						
	.dc.b	160				
	.dc.b	9				
	.dc.b	14				
						
	.dc.b	146				
						
	.dc.b	160				
	.dc.b	20				
	.dc.b	86				
						
	.dc.b	18				
						
	.dc.b	160				
	.dc.b	31				
	.dc.b	157				
						
	.dc.b	242				
						
	.dc.b	160				
	.dc.b	42				
	.dc.b	229				
						
	.dc.b	210				
						
	.dc.b	160				
	.dc.b	54				
	.dc.b	46				
						
	.dc.b	18				
						
	.dc.b	160				
	.dc.b	65				
	.dc.b	118				
						
	.dc.b	114				
						
	.dc.b	160				
	.dc.b	76				
	.dc.b	191				
						
	.dc.b	18				
						
	.dc.b	160				
	.dc.b	88				
	.dc.b	7				
						
	.dc.b	210				
						
	.dc.b	160				
	.dc.b	99				
	.dc.b	80				
						
	.dc.b	210				
						
	.dc.b	160				
	.dc.b	110				
	.dc.b	153				
						
	.dc.b	242				
						
	.dc.b	160				
	.dc.b	121				
	.dc.b	227				
						
	.dc.b	82				
						
	.dc.b	160				
	.dc.b	133				
	.dc.b	44				
						
	.dc.b	242				
						
	.dc.b	160				
	.dc.b	144				
	.dc.b	118				
						
	.dc.b	178				
						
	.dc.b	160				
	.dc.b	155				
	.dc.b	192				
						
	.dc.b	178				
						
	.dc.b	160				
	.dc.b	167				
	.dc.b	10				
						
	.dc.b	210				
						
	.dc.b	160				
	.dc.b	178				
	.dc.b	85				
						
	.dc.b	50				
						
	.dc.b	160				
	.dc.b	189				
	.dc.b	159				
						
	.dc.b	178				
						
	.dc.b	160				
	.dc.b	200				
	.dc.b	234				
						
	.dc.b	146				
						
	.dc.b	160				
	.dc.b	212				
	.dc.b	53				
						
	.dc.b	114				
						
	.dc.b	160				
	.dc.b	223				
	.dc.b	128				
						
	.dc.b	146				
						
	.dc.b	160				
	.dc.b	234				
	.dc.b	203				
						
	.dc.b	242				
						
	.dc.b	160				
	.dc.b	246				
	.dc.b	23				
						
	.dc.b	146				
						
	.dc.b	161				
	.dc.b	1				
	.dc.b	99				
						
	.dc.b	82				
						
	.dc.b	161				
	.dc.b	12				
	.dc.b	175				
						
	.dc.b	50				
						
	.dc.b	161				
	.dc.b	23				
	.dc.b	251				
						
	.dc.b	114				
						
	.dc.b	161				
	.dc.b	35				
	.dc.b	71				
						
	.dc.b	178				
						
	.dc.b	161				
	.dc.b	46				
	.dc.b	148				
						
	.dc.b	82				
						
	.dc.b	161				
	.dc.b	57				
	.dc.b	225				
						
	.dc.b	18				
						
	.dc.b	161				
	.dc.b	69				
	.dc.b	45				
						
	.dc.b	242				
						
	.dc.b	161				
	.dc.b	80				
	.dc.b	123				
						
	.dc.b	18				
						
	.dc.b	161				
	.dc.b	91				
	.dc.b	200				
						
	.dc.b	114				
						
	.dc.b	161				
	.dc.b	103				
	.dc.b	21				
						
	.dc.b	242				
						
	.dc.b	161				
	.dc.b	114				
	.dc.b	99				
						
	.dc.b	178				
						
	.dc.b	161				
	.dc.b	125				
	.dc.b	177				
						
	.dc.b	178				
						
	.dc.b	161				
	.dc.b	136				
	.dc.b	255				
						
	.dc.b	210				
						
	.dc.b	161				
	.dc.b	148				
	.dc.b	78				
						
	.dc.b	50				
						
	.dc.b	161				
	.dc.b	159				
	.dc.b	156				
						
	.dc.b	178				
						
	.dc.b	161				
	.dc.b	170				
	.dc.b	235				
						
	.dc.b	114				
						
	.dc.b	161				
	.dc.b	182				
	.dc.b	58				
						
	.dc.b	82				
						
	.dc.b	161				
	.dc.b	193				
	.dc.b	137				
						
	.dc.b	114				
						
	.dc.b	161				
	.dc.b	204				
	.dc.b	216				
						
	.dc.b	178				
						
	.dc.b	161				
	.dc.b	216				
	.dc.b	40				
						
	.dc.b	50				
						
	.dc.b	161				
	.dc.b	227				
	.dc.b	119				
						
	.dc.b	242				
						
	.dc.b	161				
	.dc.b	238				
	.dc.b	199				
						
	.dc.b	210				
						
	.dc.b	161				
	.dc.b	250				
	.dc.b	23				
						
	.dc.b	242				
						
	.dc.b	162				
	.dc.b	5				
	.dc.b	104				
						
	.dc.b	82				
						
	.dc.b	162				
	.dc.b	16				
	.dc.b	184				
						
	.dc.b	210				
						
	.dc.b	162				
	.dc.b	28				
	.dc.b	9				
						
	.dc.b	114				
						
	.dc.b	162				
	.dc.b	39				
	.dc.b	90				
						
	.dc.b	114				
						
	.dc.b	162				
	.dc.b	50				
	.dc.b	171				
						
	.dc.b	114				
						
	.dc.b	162				
	.dc.b	61				
	.dc.b	252				
						
	.dc.b	210				
						
	.dc.b	162				
	.dc.b	73				
	.dc.b	78				
						
	.dc.b	82				
						
	.dc.b	162				
	.dc.b	84				
	.dc.b	159				
						
	.dc.b	242				
						
	.dc.b	162				
	.dc.b	95				
	.dc.b	241				
						
	.dc.b	210				
						
	.dc.b	162				
	.dc.b	107				
	.dc.b	67				
						
	.dc.b	242				
						
	.dc.b	162				
	.dc.b	118				
	.dc.b	150				
						
	.dc.b	50				
						
	.dc.b	162				
	.dc.b	129				
	.dc.b	232				
						
	.dc.b	178				
						
	.dc.b	162				
	.dc.b	141				
	.dc.b	59				
						
	.dc.b	82				
						
	.dc.b	162				
	.dc.b	152				
	.dc.b	142				
						
	.dc.b	50				
						
	.dc.b	162				
	.dc.b	163				
	.dc.b	225				
						
	.dc.b	82				
						
	.dc.b	162				
	.dc.b	175				
	.dc.b	52				
						
	.dc.b	146				
						
	.dc.b	162				
	.dc.b	186				
	.dc.b	136				
						
	.dc.b	18				
						
	.dc.b	162				
	.dc.b	197				
	.dc.b	219				
						
	.dc.b	178				
						
	.dc.b	162				
	.dc.b	209				
	.dc.b	47				
						
	.dc.b	146				
						
	.dc.b	162				
	.dc.b	220				
	.dc.b	131				
						
	.dc.b	146				
						
	.dc.b	162				
	.dc.b	231				
	.dc.b	215				
						
	.dc.b	210				
						
	.dc.b	162				
	.dc.b	243				
	.dc.b	44				
						
	.dc.b	82				
						
	.dc.b	162				
	.dc.b	254				
	.dc.b	128				
						
	.dc.b	242				
						
	.dc.b	163				
	.dc.b	9				
	.dc.b	213				
						
	.dc.b	210				
						
	.dc.b	163				
	.dc.b	21				
	.dc.b	42				
						
	.dc.b	210				
						
	.dc.b	163				
	.dc.b	32				
	.dc.b	128				
						
	.dc.b	18				
						
	.dc.b	163				
	.dc.b	43				
	.dc.b	213				
						
	.dc.b	114				
						
	.dc.b	163				
	.dc.b	55				
	.dc.b	43				
						
	.dc.b	18				
						
	.dc.b	163				
	.dc.b	66				
	.dc.b	128				
						
	.dc.b	242				
						
	.dc.b	163				
	.dc.b	77				
	.dc.b	214				
						
	.dc.b	242				
						
	.dc.b	163				
	.dc.b	89				
	.dc.b	45				
						
	.dc.b	50				
						
	.dc.b	163				
	.dc.b	100				
	.dc.b	131				
						
	.dc.b	146				
						
	.dc.b	163				
	.dc.b	111				
	.dc.b	218				
						
	.dc.b	50				
						
	.dc.b	163				
	.dc.b	123				
	.dc.b	48				
						
	.dc.b	242				
						
	.dc.b	163				
	.dc.b	134				
	.dc.b	136				
						
	.dc.b	18				
						
	.dc.b	163				
	.dc.b	145				
	.dc.b	223				
						
	.dc.b	50				
						
	.dc.b	163				
	.dc.b	157				
	.dc.b	54				
						
	.dc.b	146				
						
	.dc.b	163				
	.dc.b	168				
	.dc.b	142				
						
	.dc.b	50				
						
	.dc.b	163				
	.dc.b	179				
	.dc.b	229				
						
	.dc.b	242				
						
	.dc.b	163				
	.dc.b	191				
	.dc.b	61				
						
	.dc.b	242				
						
	.dc.b	163				
	.dc.b	202				
	.dc.b	150				
						
	.dc.b	50				
						
	.dc.b	163				
	.dc.b	213				
	.dc.b	238				
						
	.dc.b	146				
						
	.dc.b	163				
	.dc.b	225				
	.dc.b	71				
						
	.dc.b	18				
						
	.dc.b	163				
	.dc.b	236				
	.dc.b	159				
						
	.dc.b	242				
						
	.dc.b	163				
	.dc.b	247				
	.dc.b	248				
						
	.dc.b	210				
						
	.dc.b	164				
	.dc.b	3				
	.dc.b	82				
						
	.dc.b	18				
						
	.dc.b	164				
	.dc.b	14				
	.dc.b	171				
						
	.dc.b	114				
						
	.dc.b	164				
	.dc.b	26				
	.dc.b	4				
						
	.dc.b	242				
						
	.dc.b	164				
	.dc.b	37				
	.dc.b	94				
						
	.dc.b	178				
						
	.dc.b	164				
	.dc.b	48				
	.dc.b	184				
						
	.dc.b	178				
						
	.dc.b	164				
	.dc.b	60				
	.dc.b	18				
						
	.dc.b	210				
						
	.dc.b	164				
	.dc.b	71				
	.dc.b	109				
						
	.dc.b	50				
						
	.dc.b	164				
	.dc.b	82				
	.dc.b	199				
						
	.dc.b	178				
						
	.dc.b	164				
	.dc.b	94				
	.dc.b	34				
						
	.dc.b	114				
						
	.dc.b	164				
	.dc.b	105				
	.dc.b	125				
						
	.dc.b	82				
						
	.dc.b	164				
	.dc.b	116				
	.dc.b	216				
						
	.dc.b	114				
						
	.dc.b	164				
	.dc.b	128				
	.dc.b	51				
						
	.dc.b	210				
						
	.dc.b	164				
	.dc.b	139				
	.dc.b	143				
						
	.dc.b	82				
						
	.dc.b	164				
	.dc.b	150				
	.dc.b	235				
						
	.dc.b	18				
						
	.dc.b	164				
	.dc.b	162				
	.dc.b	70				
						
	.dc.b	242				
						
	.dc.b	164				
	.dc.b	173				
	.dc.b	163				
						
	.dc.b	18				
						
	.dc.b	164				
	.dc.b	184				
	.dc.b	255				
						
	.dc.b	114				
						
	.dc.b	164				
	.dc.b	196				
	.dc.b	91				
						
	.dc.b	242				
						
	.dc.b	164				
	.dc.b	207				
	.dc.b	184				
						
	.dc.b	146				
						
	.dc.b	164				
	.dc.b	219				
	.dc.b	21				
						
	.dc.b	114				
						
	.dc.b	164				
	.dc.b	230				
	.dc.b	114				
						
	.dc.b	146				
						
	.dc.b	164				
	.dc.b	241				
	.dc.b	207				
						
	.dc.b	210				
						
	.dc.b	164				
	.dc.b	253				
	.dc.b	45				
						
	.dc.b	82				
						
	.dc.b	165				
	.dc.b	8				
	.dc.b	138				
						
	.dc.b	242				
						
	.dc.b	165				
	.dc.b	19				
	.dc.b	232				
						
	.dc.b	210				
						
	.dc.b	165				
	.dc.b	31				
	.dc.b	70				
						
	.dc.b	242				
						
	.dc.b	165				
	.dc.b	42				
	.dc.b	165				
						
	.dc.b	50				
						
	.dc.b	165				
	.dc.b	54				
	.dc.b	3				
						
	.dc.b	178				
						
	.dc.b	165				
	.dc.b	65				
	.dc.b	98				
						
	.dc.b	82				
						
	.dc.b	165				
	.dc.b	76				
	.dc.b	193				
						
	.dc.b	50				
						
	.dc.b	165				
	.dc.b	88				
	.dc.b	32				
						
	.dc.b	50				
						
	.dc.b	165				
	.dc.b	99				
	.dc.b	127				
						
	.dc.b	114				
						
	.dc.b	165				
	.dc.b	110				
	.dc.b	222				
						
	.dc.b	242				
						
	.dc.b	165				
	.dc.b	122				
	.dc.b	62				
						
	.dc.b	146				
						
	.dc.b	165				
	.dc.b	133				
	.dc.b	158				
						
	.dc.b	82				
						
	.dc.b	165				
	.dc.b	144				
	.dc.b	254				
						
	.dc.b	82				
						
	.dc.b	165				
	.dc.b	156				
	.dc.b	94				
						
	.dc.b	146				
						
	.dc.b	165				
	.dc.b	167				
	.dc.b	190				
						
	.dc.b	242				
						
	.dc.b	165				
	.dc.b	179				
	.dc.b	31				
						
	.dc.b	146				
						
	.dc.b	165				
	.dc.b	190				
	.dc.b	128				
						
	.dc.b	114				
						
	.dc.b	165				
	.dc.b	201				
	.dc.b	225				
						
	.dc.b	114				
						
	.dc.b	165				
	.dc.b	213				
	.dc.b	66				
						
	.dc.b	146				
						
	.dc.b	165				
	.dc.b	224				
	.dc.b	163				
						
	.dc.b	242				
						
	.dc.b	165				
	.dc.b	236				
	.dc.b	5				
						
	.dc.b	146				
						
	.dc.b	165				
	.dc.b	247				
	.dc.b	103				
						
	.dc.b	82				
						
	.dc.b	166				
	.dc.b	2				
	.dc.b	201				
						
	.dc.b	82				
						
	.dc.b	166				
	.dc.b	14				
	.dc.b	43				
						
	.dc.b	114				
						
	.dc.b	166				
	.dc.b	25				
	.dc.b	141				
						
	.dc.b	210				
						
	.dc.b	166				
	.dc.b	36				
	.dc.b	240				
						
	.dc.b	114				
						
	.dc.b	166				
	.dc.b	48				
	.dc.b	83				
						
	.dc.b	50				
						
	.dc.b	166				
	.dc.b	59				
	.dc.b	182				
						
	.dc.b	18				
						
	.dc.b	166				
	.dc.b	71				
	.dc.b	25				
						
	.dc.b	82				
						
	.dc.b	166				
	.dc.b	82				
	.dc.b	124				
						
	.dc.b	146				
						
	.dc.b	166				
	.dc.b	93				
	.dc.b	224				
						
	.dc.b	50				
						
	.dc.b	166				
	.dc.b	105				
	.dc.b	67				
						
	.dc.b	210				
						
	.dc.b	166				
	.dc.b	116				
	.dc.b	167				
						
	.dc.b	210				
						
	.dc.b	166				
	.dc.b	128				
	.dc.b	11				
						
	.dc.b	242				
						
	.dc.b	166				
	.dc.b	139				
	.dc.b	112				
						
	.dc.b	50				
						
	.dc.b	166				
	.dc.b	150				
	.dc.b	212				
						
	.dc.b	178				
						
	.dc.b	166				
	.dc.b	162				
	.dc.b	57				
						
	.dc.b	114				
						
	.dc.b	166				
	.dc.b	173				
	.dc.b	158				
						
	.dc.b	82				
						
	.dc.b	166				
	.dc.b	185				
	.dc.b	3				
						
	.dc.b	114				
						
	.dc.b	166				
	.dc.b	196				
	.dc.b	104				
						
	.dc.b	178				
						
	.dc.b	166				
	.dc.b	207				
	.dc.b	206				
						
	.dc.b	50				
						
	.dc.b	166				
	.dc.b	219				
	.dc.b	51				
						
	.dc.b	242				
						
	.dc.b	166				
	.dc.b	230				
	.dc.b	153				
						
	.dc.b	210				
						
	.dc.b	166				
	.dc.b	241				
	.dc.b	255				
						
	.dc.b	210				
						
	.dc.b	166				
	.dc.b	253				
	.dc.b	102				
						
	.dc.b	18				
						
	.dc.b	167				
	.dc.b	8				
	.dc.b	204				
						
	.dc.b	146				
						
	.dc.b	167				
	.dc.b	20				
	.dc.b	51				
						
	.dc.b	50				
						
	.dc.b	167				
	.dc.b	31				
	.dc.b	154				
						
	.dc.b	18				
						
	.dc.b	167				
	.dc.b	43				
	.dc.b	1				
						
	.dc.b	18				
						
	.dc.b	167				
	.dc.b	54				
	.dc.b	104				
						
	.dc.b	82				
						
	.dc.b	167				
	.dc.b	65				
	.dc.b	207				
						
	.dc.b	178				
						
	.dc.b	167				
	.dc.b	77				
	.dc.b	55				
						
	.dc.b	82				
						
	.dc.b	167				
	.dc.b	88				
	.dc.b	159				
						
	.dc.b	50				
						
	.dc.b	167				
	.dc.b	100				
	.dc.b	7				
						
	.dc.b	50				
						
	.dc.b	167				
	.dc.b	111				
	.dc.b	111				
						
	.dc.b	114				
						
	.dc.b	167				
	.dc.b	122				
	.dc.b	215				
						
	.dc.b	210				
						
	.dc.b	167				
	.dc.b	134				
	.dc.b	64				
						
	.dc.b	114				
						
	.dc.b	167				
	.dc.b	145				
	.dc.b	169				
						
	.dc.b	50				
						
	.dc.b	167				
	.dc.b	157				
	.dc.b	18				
						
	.dc.b	50				
						
	.dc.b	167				
	.dc.b	168				
	.dc.b	123				
						
	.dc.b	82				
						
	.dc.b	167				
	.dc.b	179				
	.dc.b	228				
						
	.dc.b	178				
						
	.dc.b	167				
	.dc.b	191				
	.dc.b	78				
						
	.dc.b	82				
						
	.dc.b	167				
	.dc.b	202				
	.dc.b	184				
						
	.dc.b	18				
						
	.dc.b	167				
	.dc.b	214				
	.dc.b	33				
						
	.dc.b	242				
						
	.dc.b	167				
	.dc.b	225				
	.dc.b	140				
						
	.dc.b	50				
						
	.dc.b	167				
	.dc.b	236				
	.dc.b	246				
						
	.dc.b	114				
						
	.dc.b	167				
	.dc.b	248				
	.dc.b	97				
						
	.dc.b	18				
						
	.dc.b	168				
	.dc.b	3				
	.dc.b	203				
						
	.dc.b	210				
						
	.dc.b	168				
	.dc.b	15				
	.dc.b	54				
						
	.dc.b	178				
						
	.dc.b	168				
	.dc.b	26				
	.dc.b	161				
						
	.dc.b	210				
						
	.dc.b	168				
	.dc.b	38				
	.dc.b	13				
						
	.dc.b	18				
						
	.dc.b	168				
	.dc.b	49				
	.dc.b	120				
						
	.dc.b	146				
						
	.dc.b	168				
	.dc.b	60				
	.dc.b	228				
						
	.dc.b	82				
						
	.dc.b	168				
	.dc.b	72				
	.dc.b	80				
						
	.dc.b	50				
						
	.dc.b	168				
	.dc.b	83				
	.dc.b	188				
						
	.dc.b	82				
						
	.dc.b	168				
	.dc.b	95				
	.dc.b	40				
						
	.dc.b	146				
						
	.dc.b	168				
	.dc.b	106				
	.dc.b	149				
						
	.dc.b	18				
						
	.dc.b	168				
	.dc.b	118				
	.dc.b	1				
						
	.dc.b	178				
						
	.dc.b	168				
	.dc.b	129				
	.dc.b	110				
						
	.dc.b	146				
						
	.dc.b	168				
	.dc.b	140				
	.dc.b	219				
						
	.dc.b	178				
						
	.dc.b	168				
	.dc.b	152				
	.dc.b	72				
						
	.dc.b	242				
						
	.dc.b	168				
	.dc.b	163				
	.dc.b	182				
						
	.dc.b	82				
						
	.dc.b	168				
	.dc.b	175				
	.dc.b	35				
						
	.dc.b	242				
						
	.dc.b	168				
	.dc.b	186				
	.dc.b	145				
						
	.dc.b	210				
						
	.dc.b	168				
	.dc.b	197				
	.dc.b	255				
						
	.dc.b	210				
						
	.dc.b	168				
	.dc.b	209				
	.dc.b	110				
						
	.dc.b	18				
						
	.dc.b	168				
	.dc.b	220				
	.dc.b	220				
						
	.dc.b	114				
						
	.dc.b	168				
	.dc.b	232				
	.dc.b	75				
						
	.dc.b	18				
						
	.dc.b	168				
	.dc.b	243				
	.dc.b	185				
						
	.dc.b	210				
						
	.dc.b	168				
	.dc.b	255				
	.dc.b	40				
						
	.dc.b	210				
						
	.dc.b	169				
	.dc.b	10				
	.dc.b	152				
						
	.dc.b	18				
						
	.dc.b	169				
	.dc.b	22				
	.dc.b	7				
						
	.dc.b	114				
						
	.dc.b	169				
	.dc.b	33				
	.dc.b	118				
						
	.dc.b	242				
						
	.dc.b	169				
	.dc.b	44				
	.dc.b	230				
						
	.dc.b	178				
						
	.dc.b	169				
	.dc.b	56				
	.dc.b	86				
						
	.dc.b	178				
						
	.dc.b	169				
	.dc.b	67				
	.dc.b	198				
						
	.dc.b	210				
						
	.dc.b	169				
	.dc.b	79				
	.dc.b	55				
						
	.dc.b	50				
						
	.dc.b	169				
	.dc.b	90				
	.dc.b	167				
						
	.dc.b	178				
						
	.dc.b	169				
	.dc.b	102				
	.dc.b	24				
						
	.dc.b	114				
						
	.dc.b	169				
	.dc.b	113				
	.dc.b	137				
						
	.dc.b	114				
						
	.dc.b	169				
	.dc.b	124				
	.dc.b	250				
						
	.dc.b	146				
						
	.dc.b	169				
	.dc.b	136				
	.dc.b	107				
						
	.dc.b	210				
						
	.dc.b	169				
	.dc.b	147				
	.dc.b	221				
						
	.dc.b	82				
						
	.dc.b	169				
	.dc.b	159				
	.dc.b	79				
						
	.dc.b	18				
						
	.dc.b	169				
	.dc.b	170				
	.dc.b	192				
						
	.dc.b	242				
						
	.dc.b	169				
	.dc.b	182				
	.dc.b	50				
						
	.dc.b	242				
						
	.dc.b	169				
	.dc.b	193				
	.dc.b	165				
						
	.dc.b	82				
						
	.dc.b	169				
	.dc.b	205				
	.dc.b	23				
						
	.dc.b	178				
						
	.dc.b	169				
	.dc.b	216				
	.dc.b	138				
						
	.dc.b	114				
						
	.dc.b	169				
	.dc.b	227				
	.dc.b	253				
						
	.dc.b	50				
						
	.dc.b	169				
	.dc.b	239				
	.dc.b	112				
						
	.dc.b	82				
						
	.dc.b	169				
	.dc.b	250				
	.dc.b	227				
						
	.dc.b	146				
						
	.dc.b	170				
	.dc.b	6				
	.dc.b	86				
						
	.dc.b	242				
						
	.dc.b	170				
	.dc.b	17				
	.dc.b	202				
						
	.dc.b	146				
						
	.dc.b	170				
	.dc.b	29				
	.dc.b	62				
						
	.dc.b	114				
						
	.dc.b	170				
	.dc.b	40				
	.dc.b	178				
						
	.dc.b	114				
						
	.dc.b	170				
	.dc.b	52				
	.dc.b	38				
						
	.dc.b	146				
						
	.dc.b	170				
	.dc.b	63				
	.dc.b	155				
						
	.dc.b	18				
						
	.dc.b	170				
	.dc.b	75				
	.dc.b	15				
						
	.dc.b	146				
						
	.dc.b	170				
	.dc.b	86				
	.dc.b	132				
						
	.dc.b	114				
						
	.dc.b	170				
	.dc.b	97				
	.dc.b	249				
						
	.dc.b	82				
						
	.dc.b	170				
	.dc.b	109				
	.dc.b	110				
						
	.dc.b	146				
						
	.dc.b	170				
	.dc.b	120				
	.dc.b	227				
						
	.dc.b	242				
						
	.dc.b	170				
	.dc.b	132				
	.dc.b	89				
						
	.dc.b	114				
						
	.dc.b	170				
	.dc.b	143				
	.dc.b	207				
						
	.dc.b	50				
						
	.dc.b	170				
	.dc.b	155				
	.dc.b	69				
						
	.dc.b	50				
						
	.dc.b	170				
	.dc.b	166				
	.dc.b	187				
						
	.dc.b	82				
						
	.dc.b	170				
	.dc.b	178				
	.dc.b	49				
						
	.dc.b	146				
						
	.dc.b	170				
	.dc.b	189				
	.dc.b	168				
						
	.dc.b	18				
						
	.dc.b	170				
	.dc.b	201				
	.dc.b	30				
						
	.dc.b	210				
						
	.dc.b	170				
	.dc.b	212				
	.dc.b	149				
						
	.dc.b	178				
						
	.dc.b	170				
	.dc.b	224				
	.dc.b	12				
						
	.dc.b	210				
						
	.dc.b	170				
	.dc.b	235				
	.dc.b	132				
						
	.dc.b	18				
						
	.dc.b	170				
	.dc.b	246				
	.dc.b	251				
						
	.dc.b	146				
						
	.dc.b	171				
	.dc.b	2				
	.dc.b	115				
						
	.dc.b	50				
						
	.dc.b	171				
	.dc.b	13				
	.dc.b	235				
						
	.dc.b	18				
						
	.dc.b	171				
	.dc.b	25				
	.dc.b	99				
						
	.dc.b	50				
						
	.dc.b	171				
	.dc.b	36				
	.dc.b	219				
						
	.dc.b	114				
						
	.dc.b	171				
	.dc.b	48				
	.dc.b	83				
						
	.dc.b	210				
						
	.dc.b	171				
	.dc.b	59				
	.dc.b	204				
						
	.dc.b	114				
						
	.dc.b	171				
	.dc.b	71				
	.dc.b	69				
						
	.dc.b	82				
						
	.dc.b	171				
	.dc.b	82				
	.dc.b	190				
						
	.dc.b	82				
						
	.dc.b	171				
	.dc.b	94				
	.dc.b	55				
						
	.dc.b	114				
						
	.dc.b	171				
	.dc.b	105				
	.dc.b	176				
						
	.dc.b	242				
						
	.dc.b	171				
	.dc.b	117				
	.dc.b	42				
						
	.dc.b	114				
						
	.dc.b	171				
	.dc.b	128				
	.dc.b	164				
						
	.dc.b	82				
						
	.dc.b	171				
	.dc.b	140				
	.dc.b	30				
						
	.dc.b	50				
						
	.dc.b	171				
	.dc.b	151				
	.dc.b	152				
						
	.dc.b	114				
						
	.dc.b	171				
	.dc.b	163				
	.dc.b	18				
						
	.dc.b	210				
						
	.dc.b	171				
	.dc.b	174				
	.dc.b	141				
						
	.dc.b	82				
						
	.dc.b	171				
	.dc.b	186				
	.dc.b	8				
						
	.dc.b	18				
						
	.dc.b	171				
	.dc.b	197				
	.dc.b	130				
						
	.dc.b	242				
						
	.dc.b	171				
	.dc.b	208				
	.dc.b	254				
						
	.dc.b	18				
						
	.dc.b	171				
	.dc.b	220				
	.dc.b	121				
						
	.dc.b	114				
						
	.dc.b	171				
	.dc.b	231				
	.dc.b	244				
						
	.dc.b	242				
						
	.dc.b	171				
	.dc.b	243				
	.dc.b	112				
						
	.dc.b	178				
						
	.dc.b	171				
	.dc.b	254				
	.dc.b	236				
						
	.dc.b	146				
						
	.dc.b	172				
	.dc.b	10				
	.dc.b	104				
						
	.dc.b	146				
						
	.dc.b	172				
	.dc.b	21				
	.dc.b	228				
						
	.dc.b	242				
						
	.dc.b	172				
	.dc.b	33				
	.dc.b	97				
						
	.dc.b	82				
						
	.dc.b	172				
	.dc.b	44				
	.dc.b	222				
						
	.dc.b	18				
						
	.dc.b	172				
	.dc.b	56				
	.dc.b	90				
						
	.dc.b	242				
						
	.dc.b	172				
	.dc.b	67				
	.dc.b	215				
						
	.dc.b	242				
						
	.dc.b	172				
	.dc.b	79				
	.dc.b	85				
						
	.dc.b	50				
						
	.dc.b	172				
	.dc.b	90				
	.dc.b	210				
						
	.dc.b	146				
						
	.dc.b	172				
	.dc.b	102				
	.dc.b	80				
						
	.dc.b	50				
						
	.dc.b	172				
	.dc.b	113				
	.dc.b	206				
						
	.dc.b	18				
						
	.dc.b	172				
	.dc.b	125				
	.dc.b	76				
						
	.dc.b	18				
						
	.dc.b	172				
	.dc.b	136				
	.dc.b	202				
						
	.dc.b	50				
						
	.dc.b	172				
	.dc.b	148				
	.dc.b	72				
						
	.dc.b	146				
						
	.dc.b	172				
	.dc.b	159				
	.dc.b	199				
						
	.dc.b	50				
						
	.dc.b	172				
	.dc.b	171				
	.dc.b	69				
						
	.dc.b	242				
						
	.dc.b	172				
	.dc.b	182				
	.dc.b	196				
						
	.dc.b	242				
						
	.dc.b	172				
	.dc.b	194				
	.dc.b	68				
						
	.dc.b	18				
						
	.dc.b	172				
	.dc.b	205				
	.dc.b	195				
						
	.dc.b	82				
						
	.dc.b	172				
	.dc.b	217				
	.dc.b	66				
						
	.dc.b	242				
						
	.dc.b	172				
	.dc.b	228				
	.dc.b	194				
						
	.dc.b	146				
						
	.dc.b	172				
	.dc.b	240				
	.dc.b	66				
						
	.dc.b	146				
						
	.dc.b	172				
	.dc.b	251				
	.dc.b	194				
						
	.dc.b	178				
						
	.dc.b	173				
	.dc.b	7				
	.dc.b	66				
						
	.dc.b	242				
						
	.dc.b	173				
	.dc.b	18				
	.dc.b	195				
						
	.dc.b	114				
						
	.dc.b	173				
	.dc.b	30				
	.dc.b	68				
						
	.dc.b	18				
						
	.dc.b	173				
	.dc.b	41				
	.dc.b	196				
						
	.dc.b	242				
						
	.dc.b	173				
	.dc.b	53				
	.dc.b	70				
						
	.dc.b	18				
						
	.dc.b	173				
	.dc.b	64				
	.dc.b	199				
						
	.dc.b	82				
						
	.dc.b	173				
	.dc.b	76				
	.dc.b	72				
						
	.dc.b	178				
						
	.dc.b	173				
	.dc.b	87				
	.dc.b	202				
						
	.dc.b	82				
						
	.dc.b	173				
	.dc.b	99				
	.dc.b	76				
						
	.dc.b	50				
						
	.dc.b	173				
	.dc.b	110				
	.dc.b	206				
						
	.dc.b	50				
						
	.dc.b	173				
	.dc.b	122				
	.dc.b	80				
						
	.dc.b	114				
						
	.dc.b	173				
	.dc.b	133				
	.dc.b	210				
						
	.dc.b	210				
						
	.dc.b	173				
	.dc.b	145				
	.dc.b	85				
						
	.dc.b	114				
						
	.dc.b	173				
	.dc.b	156				
	.dc.b	216				
						
	.dc.b	50				
						
	.dc.b	173				
	.dc.b	168				
	.dc.b	91				
						
	.dc.b	50				
						
	.dc.b	173				
	.dc.b	179				
	.dc.b	222				
						
	.dc.b	82				
						
	.dc.b	173				
	.dc.b	191				
	.dc.b	97				
						
	.dc.b	178				
						
	.dc.b	173				
	.dc.b	202				
	.dc.b	229				
						
	.dc.b	50				
						
	.dc.b	173				
	.dc.b	214				
	.dc.b	104				
						
	.dc.b	242				
						
	.dc.b	173				
	.dc.b	225				
	.dc.b	236				
						
	.dc.b	210				
						
	.dc.b	173				
	.dc.b	237				
	.dc.b	112				
						
	.dc.b	242				
						
	.dc.b	173				
	.dc.b	248				
	.dc.b	245				
						
	.dc.b	82				
						
	.dc.b	174				
	.dc.b	4				
	.dc.b	121				
						
	.dc.b	178				
						
	.dc.b	174				
	.dc.b	15				
	.dc.b	254				
						
	.dc.b	114				
						
	.dc.b	174				
	.dc.b	27				
	.dc.b	131				
						
	.dc.b	82				
						
	.dc.b	174				
	.dc.b	39				
	.dc.b	8				
						
	.dc.b	114				
						
	.dc.b	174				
	.dc.b	50				
	.dc.b	141				
						
	.dc.b	178				
						
	.dc.b	174				
	.dc.b	62				
	.dc.b	19				
						
	.dc.b	18				
						
	.dc.b	174				
	.dc.b	73				
	.dc.b	152				
						
	.dc.b	178				
						
	.dc.b	174				
	.dc.b	85				
	.dc.b	30				
						
	.dc.b	146				
						
	.dc.b	174				
	.dc.b	96				
	.dc.b	164				
						
	.dc.b	146				
						
	.dc.b	174				
	.dc.b	108				
	.dc.b	42				
						
	.dc.b	210				
						
	.dc.b	174				
	.dc.b	119				
	.dc.b	177				
						
	.dc.b	50				
						
	.dc.b	174				
	.dc.b	131				
	.dc.b	55				
						
	.dc.b	210				
						
	.dc.b	174				
	.dc.b	142				
	.dc.b	190				
						
	.dc.b	146				
						
	.dc.b	174				
	.dc.b	154				
	.dc.b	69				
						
	.dc.b	146				
						
	.dc.b	174				
	.dc.b	165				
	.dc.b	204				
						
	.dc.b	178				
						
	.dc.b	174				
	.dc.b	177				
	.dc.b	84				
						
	.dc.b	18				
						
	.dc.b	174				
	.dc.b	188				
	.dc.b	219				
						
	.dc.b	146				
						
	.dc.b	174				
	.dc.b	200				
	.dc.b	99				
						
	.dc.b	82				
						
	.dc.b	174				
	.dc.b	211				
	.dc.b	235				
						
	.dc.b	50				
						
	.dc.b	174				
	.dc.b	223				
	.dc.b	115				
						
	.dc.b	82				
						
	.dc.b	174				
	.dc.b	234				
	.dc.b	251				
						
	.dc.b	178				
						
	.dc.b	174				
	.dc.b	246				
	.dc.b	132				
						
	.dc.b	50				
						
	.dc.b	175				
	.dc.b	2				
	.dc.b	12				
						
	.dc.b	210				
						
	.dc.b	175				
	.dc.b	13				
	.dc.b	149				
						
	.dc.b	178				
						
	.dc.b	175				
	.dc.b	25				
	.dc.b	30				
						
	.dc.b	178				
						
	.dc.b	175				
	.dc.b	36				
	.dc.b	167				
						
	.dc.b	242				
						
	.dc.b	175				
	.dc.b	48				
	.dc.b	49				
						
	.dc.b	114				
						
	.dc.b	175				
	.dc.b	59				
	.dc.b	187				
						
	.dc.b	18				
						
	.dc.b	175				
	.dc.b	71				
	.dc.b	68				
						
	.dc.b	242				
						
	.dc.b	175				
	.dc.b	82				
	.dc.b	206				
						
	.dc.b	242				
						
	.dc.b	175				
	.dc.b	94				
	.dc.b	89				
						
	.dc.b	18				
						
	.dc.b	175				
	.dc.b	105				
	.dc.b	227				
						
	.dc.b	146				
						
	.dc.b	175				
	.dc.b	117				
	.dc.b	110				
						
	.dc.b	18				
						
	.dc.b	175				
	.dc.b	128				
	.dc.b	248				
						
	.dc.b	210				
						
	.dc.b	175				
	.dc.b	140				
	.dc.b	131				
						
	.dc.b	210				
						
	.dc.b	175				
	.dc.b	152				
	.dc.b	14				
						
	.dc.b	242				
						
	.dc.b	175				
	.dc.b	163				
	.dc.b	154				
						
	.dc.b	82				
						
	.dc.b	175				
	.dc.b	175				
	.dc.b	37				
						
	.dc.b	210				
						
	.dc.b	175				
	.dc.b	186				
	.dc.b	177				
						
	.dc.b	146				
						
	.dc.b	175				
	.dc.b	198				
	.dc.b	61				
						
	.dc.b	114				
						
	.dc.b	175				
	.dc.b	209				
	.dc.b	201				
						
	.dc.b	146				
						
	.dc.b	175				
	.dc.b	221				
	.dc.b	85				
						
	.dc.b	210				
						
	.dc.b	175				
	.dc.b	232				
	.dc.b	226				
						
	.dc.b	82				
						
	.dc.b	175				
	.dc.b	244				
	.dc.b	111				
						
	.dc.b	18				
						
	.dc.b	175				
	.dc.b	255				
	.dc.b	251				
						
	.dc.b	210				
						
	.dc.b	176				
	.dc.b	11				
	.dc.b	136				
						
	.dc.b	242				
						
	.dc.b	176				
	.dc.b	23				
	.dc.b	22				
						
	.dc.b	50				
						
	.dc.b	176				
	.dc.b	34				
	.dc.b	163				
						
	.dc.b	146				
						
	.dc.b	176				
	.dc.b	46				
	.dc.b	49				
						
	.dc.b	50				
						
	.dc.b	176				
	.dc.b	57				
	.dc.b	190				
						
	.dc.b	242				
						
	.dc.b	176				
	.dc.b	69				
	.dc.b	76				
						
	.dc.b	242				
						
	.dc.b	176				
	.dc.b	80				
	.dc.b	219				
						
	.dc.b	50				
						
	.dc.b	176				
	.dc.b	92				
	.dc.b	105				
						
	.dc.b	146				
						
	.dc.b	176				
	.dc.b	103				
	.dc.b	248				
						
	.dc.b	18				
						
	.dc.b	176				
	.dc.b	115				
	.dc.b	134				
						
	.dc.b	210				
						
	.dc.b	176				
	.dc.b	127				
	.dc.b	21				
						
	.dc.b	210				
						
	.dc.b	176				
	.dc.b	138				
	.dc.b	164				
						
	.dc.b	242				
						
	.dc.b	176				
	.dc.b	150				
	.dc.b	52				
						
	.dc.b	50				
						
	.dc.b	176				
	.dc.b	161				
	.dc.b	195				
						
	.dc.b	210				
						
	.dc.b	176				
	.dc.b	173				
	.dc.b	83				
						
	.dc.b	114				
						
	.dc.b	176				
	.dc.b	184				
	.dc.b	227				
						
	.dc.b	82				
						
	.dc.b	176				
	.dc.b	196				
	.dc.b	115				
						
	.dc.b	114				
						
	.dc.b	176				
	.dc.b	208				
	.dc.b	3				
						
	.dc.b	178				
						
	.dc.b	176				
	.dc.b	219				
	.dc.b	148				
						
	.dc.b	50				
						
	.dc.b	176				
	.dc.b	231				
	.dc.b	36				
						
	.dc.b	210				
						
	.dc.b	176				
	.dc.b	242				
	.dc.b	181				
						
	.dc.b	146				
						
	.dc.b	176				
	.dc.b	254				
	.dc.b	70				
						
	.dc.b	178				
						
	.dc.b	177				
	.dc.b	9				
	.dc.b	215				
						
	.dc.b	210				
						
	.dc.b	177				
	.dc.b	21				
	.dc.b	105				
						
	.dc.b	50				
						
	.dc.b	177				
	.dc.b	32				
	.dc.b	250				
						
	.dc.b	210				
						
	.dc.b	177				
	.dc.b	44				
	.dc.b	140				
						
	.dc.b	146				
						
	.dc.b	177				
	.dc.b	56				
	.dc.b	30				
						
	.dc.b	146				
						
	.dc.b	177				
	.dc.b	67				
	.dc.b	176				
						
	.dc.b	178				
						
	.dc.b	177				
	.dc.b	79				
	.dc.b	67				
						
	.dc.b	18				
						
	.dc.b	177				
	.dc.b	90				
	.dc.b	213				
						
	.dc.b	146				
						
	.dc.b	177				
	.dc.b	102				
	.dc.b	104				
						
	.dc.b	82				
						
	.dc.b	177				
	.dc.b	113				
	.dc.b	251				
						
	.dc.b	50				
						
	.dc.b	177				
	.dc.b	125				
	.dc.b	142				
						
	.dc.b	82				
						
	.dc.b	177				
	.dc.b	137				
	.dc.b	33				
						
	.dc.b	146				
						
	.dc.b	177				
	.dc.b	148				
	.dc.b	181				
						
	.dc.b	18				
						
	.dc.b	177				
	.dc.b	160				
	.dc.b	72				
						
	.dc.b	210				
						
	.dc.b	177				
	.dc.b	171				
	.dc.b	220				
						
	.dc.b	146				
						
	.dc.b	177				
	.dc.b	183				
	.dc.b	112				
						
	.dc.b	178				
						
	.dc.b	177				
	.dc.b	195				
	.dc.b	4				
						
	.dc.b	242				
						
	.dc.b	177				
	.dc.b	206				
	.dc.b	153				
						
	.dc.b	82				
						
	.dc.b	177				
	.dc.b	218				
	.dc.b	45				
						
	.dc.b	242				
						
	.dc.b	177				
	.dc.b	229				
	.dc.b	194				
						
	.dc.b	178				
						
	.dc.b	177				
	.dc.b	241				
	.dc.b	87				
						
	.dc.b	178				
						
	.dc.b	177				
	.dc.b	252				
	.dc.b	236				
						
	.dc.b	210				
						
	.dc.b	178				
	.dc.b	8				
	.dc.b	130				
						
	.dc.b	50				
						
	.dc.b	178				
	.dc.b	20				
	.dc.b	23				
						
	.dc.b	210				
						
	.dc.b	178				
	.dc.b	31				
	.dc.b	173				
						
	.dc.b	146				
						
	.dc.b	178				
	.dc.b	43				
	.dc.b	67				
						
	.dc.b	114				
						
	.dc.b	178				
	.dc.b	54				
	.dc.b	217				
						
	.dc.b	146				
						
	.dc.b	178				
	.dc.b	66				
	.dc.b	111				
						
	.dc.b	210				
						
	.dc.b	178				
	.dc.b	78				
	.dc.b	6				
						
	.dc.b	82				
						
	.dc.b	178				
	.dc.b	89				
	.dc.b	157				
						
	.dc.b	18				
						
	.dc.b	178				
	.dc.b	101				
	.dc.b	51				
						
	.dc.b	242				
						
	.dc.b	178				
	.dc.b	112				
	.dc.b	202				
						
	.dc.b	242				
						
	.dc.b	178				
	.dc.b	124				
	.dc.b	98				
						
	.dc.b	50				
						
	.dc.b	178				
	.dc.b	135				
	.dc.b	249				
						
	.dc.b	178				
						
	.dc.b	178				
	.dc.b	147				
	.dc.b	145				
						
	.dc.b	82				
						
	.dc.b	178				
	.dc.b	159				
	.dc.b	41				
						
	.dc.b	18				
						
	.dc.b	178				
	.dc.b	170				
	.dc.b	193				
						
	.dc.b	18				
						
	.dc.b	178				
	.dc.b	182				
	.dc.b	89				
						
	.dc.b	82				
						
	.dc.b	178				
	.dc.b	193				
	.dc.b	241				
						
	.dc.b	146				
						
	.dc.b	178				
	.dc.b	205				
	.dc.b	138				
						
	.dc.b	50				
						
	.dc.b	178				
	.dc.b	217				
	.dc.b	34				
						
	.dc.b	242				
						
	.dc.b	178				
	.dc.b	228				
	.dc.b	187				
						
	.dc.b	210				
						
	.dc.b	178				
	.dc.b	240				
	.dc.b	84				
						
	.dc.b	242				
						
	.dc.b	178				
	.dc.b	251				
	.dc.b	238				
						
	.dc.b	82				
						
	.dc.b	179				
	.dc.b	7				
	.dc.b	135				
						
	.dc.b	210				
						
	.dc.b	179				
	.dc.b	19				
	.dc.b	33				
						
	.dc.b	146				
						
	.dc.b	179				
	.dc.b	30				
	.dc.b	187				
						
	.dc.b	114				
						
	.dc.b	179				
	.dc.b	42				
	.dc.b	85				
						
	.dc.b	114				
						
	.dc.b	179				
	.dc.b	53				
	.dc.b	239				
						
	.dc.b	178				
						
	.dc.b	179				
	.dc.b	65				
	.dc.b	138				
						
	.dc.b	50				
						
	.dc.b	179				
	.dc.b	77				
	.dc.b	36				
						
	.dc.b	210				
						
	.dc.b	179				
	.dc.b	88				
	.dc.b	191				
						
	.dc.b	146				
						
	.dc.b	179				
	.dc.b	100				
	.dc.b	90				
						
	.dc.b	146				
						
	.dc.b	179				
	.dc.b	111				
	.dc.b	245				
						
	.dc.b	210				
						
	.dc.b	179				
	.dc.b	123				
	.dc.b	145				
						
	.dc.b	50				
						
	.dc.b	179				
	.dc.b	135				
	.dc.b	44				
						
	.dc.b	178				
						
	.dc.b	179				
	.dc.b	146				
	.dc.b	200				
						
	.dc.b	114				
						
	.dc.b	179				
	.dc.b	158				
	.dc.b	100				
						
	.dc.b	114				
						
	.dc.b	179				
	.dc.b	170				
	.dc.b	0				
						
	.dc.b	146				
						
	.dc.b	179				
	.dc.b	181				
	.dc.b	156				
						
	.dc.b	210				
						
	.dc.b	179				
	.dc.b	193				
	.dc.b	57				
						
	.dc.b	114				
						
	.dc.b	179				
	.dc.b	204				
	.dc.b	214				
						
	.dc.b	18				
						
	.dc.b	179				
	.dc.b	216				
	.dc.b	114				
						
	.dc.b	242				
						
	.dc.b	179				
	.dc.b	228				
	.dc.b	16				
						
	.dc.b	18				
						
	.dc.b	179				
	.dc.b	239				
	.dc.b	173				
						
	.dc.b	82				
						
	.dc.b	179				
	.dc.b	251				
	.dc.b	74				
						
	.dc.b	178				
						
	.dc.b	180				
	.dc.b	6				
	.dc.b	232				
						
	.dc.b	82				
						
	.dc.b	180				
	.dc.b	18				
	.dc.b	134				
						
	.dc.b	50				
						
	.dc.b	180				
	.dc.b	30				
	.dc.b	36				
						
	.dc.b	50				
						
	.dc.b	180				
	.dc.b	41				
	.dc.b	194				
						
	.dc.b	82				
						
	.dc.b	180				
	.dc.b	53				
	.dc.b	96				
						
	.dc.b	178				
						
	.dc.b	180				
	.dc.b	64				
	.dc.b	255				
						
	.dc.b	82				
						
	.dc.b	180				
	.dc.b	76				
	.dc.b	158				
						
	.dc.b	18				
						
	.dc.b	180				
	.dc.b	88				
	.dc.b	60				
						
	.dc.b	242				
						
	.dc.b	180				
	.dc.b	99				
	.dc.b	220				
						
	.dc.b	50				
						
	.dc.b	180				
	.dc.b	111				
	.dc.b	123				
						
	.dc.b	114				
						
	.dc.b	180				
	.dc.b	123				
	.dc.b	26				
						
	.dc.b	242				
						
	.dc.b	180				
	.dc.b	134				
	.dc.b	186				
						
	.dc.b	178				
						
	.dc.b	180				
	.dc.b	146				
	.dc.b	90				
						
	.dc.b	146				
						
	.dc.b	180				
	.dc.b	157				
	.dc.b	250				
						
	.dc.b	146				
						
	.dc.b	180				
	.dc.b	169				
	.dc.b	154				
						
	.dc.b	210				
						
	.dc.b	180				
	.dc.b	181				
	.dc.b	59				
						
	.dc.b	82				
						
	.dc.b	180				
	.dc.b	192				
	.dc.b	219				
						
	.dc.b	242				
						
	.dc.b	180				
	.dc.b	204				
	.dc.b	124				
						
	.dc.b	178				
						
	.dc.b	180				
	.dc.b	216				
	.dc.b	29				
						
	.dc.b	178				
						
	.dc.b	180				
	.dc.b	227				
	.dc.b	190				
						
	.dc.b	242				
						
	.dc.b	180				
	.dc.b	239				
	.dc.b	96				
						
	.dc.b	82				
						
	.dc.b	180				
	.dc.b	251				
	.dc.b	1				
						
	.dc.b	210				
						
	.dc.b	181				
	.dc.b	6				
	.dc.b	163				
						
	.dc.b	146				
						
	.dc.b	181				
	.dc.b	18				
	.dc.b	69				
						
	.dc.b	146				
						
	.dc.b	181				
	.dc.b	29				
	.dc.b	231				
						
	.dc.b	146				
						
	.dc.b	181				
	.dc.b	41				
	.dc.b	137				
						
	.dc.b	242				
						
	.dc.b	181				
	.dc.b	53				
	.dc.b	44				
						
	.dc.b	114				
						
	.dc.b	181				
	.dc.b	64				
	.dc.b	207				
						
	.dc.b	18				
						
	.dc.b	181				
	.dc.b	76				
	.dc.b	113				
						
	.dc.b	242				
						
	.dc.b	181				
	.dc.b	88				
	.dc.b	21				
						
	.dc.b	18				
						
	.dc.b	181				
	.dc.b	99				
	.dc.b	184				
						
	.dc.b	82				
						
	.dc.b	181				
	.dc.b	111				
	.dc.b	91				
						
	.dc.b	178				
						
	.dc.b	181				
	.dc.b	122				
	.dc.b	255				
						
	.dc.b	82				
						
	.dc.b	181				
	.dc.b	134				
	.dc.b	163				
						
	.dc.b	18				
						
	.dc.b	181				
	.dc.b	146				
	.dc.b	71				
						
	.dc.b	18				
						
	.dc.b	181				
	.dc.b	157				
	.dc.b	235				
						
	.dc.b	82				
						
	.dc.b	181				
	.dc.b	169				
	.dc.b	143				
						
	.dc.b	178				
						
	.dc.b	181				
	.dc.b	181				
	.dc.b	52				
						
	.dc.b	50				
						
	.dc.b	181				
	.dc.b	192				
	.dc.b	216				
						
	.dc.b	242				
						
	.dc.b	181				
	.dc.b	204				
	.dc.b	125				
						
	.dc.b	210				
						
	.dc.b	181				
	.dc.b	216				
	.dc.b	34				
						
	.dc.b	242				
						
	.dc.b	181				
	.dc.b	227				
	.dc.b	200				
						
	.dc.b	50				
						
	.dc.b	181				
	.dc.b	239				
	.dc.b	109				
						
	.dc.b	178				
						
	.dc.b	181				
	.dc.b	251				
	.dc.b	19				
						
	.dc.b	114				
						
	.dc.b	182				
	.dc.b	6				
	.dc.b	185				
						
	.dc.b	50				
						
	.dc.b	182				
	.dc.b	18				
	.dc.b	95				
						
	.dc.b	82				
						
	.dc.b	182				
	.dc.b	30				
	.dc.b	5				
						
	.dc.b	114				
						
	.dc.b	182				
	.dc.b	41				
	.dc.b	171				
						
	.dc.b	242				
						
	.dc.b	182				
	.dc.b	53				
	.dc.b	82				
						
	.dc.b	146				
						
	.dc.b	182				
	.dc.b	64				
	.dc.b	249				
						
	.dc.b	82				
						
	.dc.b	182				
	.dc.b	76				
	.dc.b	160				
						
	.dc.b	82				
						
	.dc.b	182				
	.dc.b	88				
	.dc.b	71				
						
	.dc.b	114				
						
	.dc.b	182				
	.dc.b	99				
	.dc.b	238				
						
	.dc.b	210				
						
	.dc.b	182				
	.dc.b	111				
	.dc.b	150				
						
	.dc.b	82				
						
	.dc.b	182				
	.dc.b	123				
	.dc.b	62				
						
	.dc.b	18				
						
	.dc.b	182				
	.dc.b	134				
	.dc.b	229				
						
	.dc.b	242				
						
	.dc.b	182				
	.dc.b	146				
	.dc.b	141				
						
	.dc.b	242				
						
	.dc.b	182				
	.dc.b	158				
	.dc.b	54				
						
	.dc.b	82				
						
	.dc.b	182				
	.dc.b	169				
	.dc.b	222				
						
	.dc.b	178				
						
	.dc.b	182				
	.dc.b	181				
	.dc.b	135				
						
	.dc.b	82				
						
	.dc.b	182				
	.dc.b	193				
	.dc.b	48				
						
	.dc.b	50				
						
	.dc.b	182				
	.dc.b	204				
	.dc.b	217				
						
	.dc.b	50				
						
	.dc.b	182				
	.dc.b	216				
	.dc.b	130				
						
	.dc.b	114				
						
	.dc.b	182				
	.dc.b	228				
	.dc.b	43				
						
	.dc.b	210				
						
	.dc.b	182				
	.dc.b	239				
	.dc.b	213				
						
	.dc.b	114				
						
	.dc.b	182				
	.dc.b	251				
	.dc.b	127				
						
	.dc.b	50				
						
	.dc.b	183				
	.dc.b	7				
	.dc.b	41				
						
	.dc.b	18				
						
	.dc.b	183				
	.dc.b	18				
	.dc.b	211				
						
	.dc.b	50				
						
	.dc.b	183				
	.dc.b	30				
	.dc.b	125				
						
	.dc.b	146				
						
	.dc.b	183				
	.dc.b	42				
	.dc.b	40				
						
	.dc.b	18				
						
	.dc.b	183				
	.dc.b	53				
	.dc.b	210				
						
	.dc.b	178				
						
	.dc.b	183				
	.dc.b	65				
	.dc.b	125				
						
	.dc.b	146				
						
	.dc.b	183				
	.dc.b	77				
	.dc.b	40				
						
	.dc.b	178				
						
	.dc.b	183				
	.dc.b	88				
	.dc.b	211				
						
	.dc.b	242				
						
	.dc.b	183				
	.dc.b	100				
	.dc.b	127				
						
	.dc.b	82				
						
	.dc.b	183				
	.dc.b	112				
	.dc.b	42				
						
	.dc.b	242				
						
	.dc.b	183				
	.dc.b	123				
	.dc.b	214				
						
	.dc.b	210				
						
	.dc.b	183				
	.dc.b	135				
	.dc.b	130				
						
	.dc.b	210				
						
	.dc.b	183				
	.dc.b	147				
	.dc.b	46				
						
	.dc.b	242				
						
	.dc.b	183				
	.dc.b	158				
	.dc.b	219				
						
	.dc.b	82				
						
	.dc.b	183				
	.dc.b	170				
	.dc.b	135				
						
	.dc.b	210				
						
	.dc.b	183				
	.dc.b	182				
	.dc.b	52				
						
	.dc.b	146				
						
	.dc.b	183				
	.dc.b	193				
	.dc.b	225				
						
	.dc.b	114				
						
	.dc.b	183				
	.dc.b	205				
	.dc.b	142				
						
	.dc.b	146				
						
	.dc.b	183				
	.dc.b	217				
	.dc.b	59				
						
	.dc.b	242				
						
	.dc.b	183				
	.dc.b	228				
	.dc.b	233				
						
	.dc.b	82				
						
	.dc.b	183				
	.dc.b	240				
	.dc.b	151				
						
	.dc.b	18				
						
	.dc.b	183				
	.dc.b	252				
	.dc.b	68				
						
	.dc.b	210				
						
	.dc.b	184				
	.dc.b	7				
	.dc.b	242				
						
	.dc.b	242				
						
	.dc.b	184				
	.dc.b	19				
	.dc.b	161				
						
	.dc.b	18				
						
	.dc.b	184				
	.dc.b	31				
	.dc.b	79				
						
	.dc.b	146				
						
	.dc.b	184				
	.dc.b	42				
	.dc.b	254				
						
	.dc.b	18				
						
	.dc.b	184				
	.dc.b	54				
	.dc.b	172				
						
	.dc.b	210				
						
	.dc.b	184				
	.dc.b	66				
	.dc.b	91				
						
	.dc.b	210				
						
	.dc.b	184				
	.dc.b	78				
	.dc.b	10				
						
	.dc.b	242				
						
	.dc.b	184				
	.dc.b	89				
	.dc.b	186				
						
	.dc.b	82				
						
	.dc.b	184				
	.dc.b	101				
	.dc.b	105				
						
	.dc.b	210				
						
	.dc.b	184				
	.dc.b	113				
	.dc.b	25				
						
	.dc.b	114				
						
	.dc.b	184				
	.dc.b	124				
	.dc.b	201				
						
	.dc.b	114				
						
	.dc.b	184				
	.dc.b	136				
	.dc.b	121				
						
	.dc.b	114				
						
	.dc.b	184				
	.dc.b	148				
	.dc.b	41				
						
	.dc.b	178				
						
	.dc.b	184				
	.dc.b	159				
	.dc.b	218				
						
	.dc.b	50				
						
	.dc.b	184				
	.dc.b	171				
	.dc.b	138				
						
	.dc.b	210				
						
	.dc.b	184				
	.dc.b	183				
	.dc.b	59				
						
	.dc.b	146				
						
	.dc.b	184				
	.dc.b	194				
	.dc.b	236				
						
	.dc.b	146				
						
	.dc.b	184				
	.dc.b	206				
	.dc.b	157				
						
	.dc.b	178				
						
	.dc.b	184				
	.dc.b	218				
	.dc.b	79				
						
	.dc.b	18				
						
	.dc.b	184				
	.dc.b	230				
	.dc.b	0				
						
	.dc.b	178				
						
	.dc.b	184				
	.dc.b	241				
	.dc.b	178				
						
	.dc.b	114				
						
	.dc.b	184				
	.dc.b	253				
	.dc.b	100				
						
	.dc.b	82				
						
	.dc.b	185				
	.dc.b	9				
	.dc.b	22				
						
	.dc.b	114				
						
	.dc.b	185				
	.dc.b	20				
	.dc.b	200				
						
	.dc.b	178				
						
	.dc.b	185				
	.dc.b	32				
	.dc.b	123				
						
	.dc.b	50				
						
	.dc.b	185				
	.dc.b	44				
	.dc.b	45				
						
	.dc.b	210				
						
	.dc.b	185				
	.dc.b	55				
	.dc.b	224				
						
	.dc.b	178				
						
	.dc.b	185				
	.dc.b	67				
	.dc.b	147				
						
	.dc.b	178				
						
	.dc.b	185				
	.dc.b	79				
	.dc.b	70				
						
	.dc.b	242				
						
	.dc.b	185				
	.dc.b	90				
	.dc.b	250				
						
	.dc.b	82				
						
	.dc.b	185				
	.dc.b	102				
	.dc.b	173				
						
	.dc.b	210				
						
	.dc.b	185				
	.dc.b	114				
	.dc.b	97				
						
	.dc.b	178				
						
	.dc.b	185				
	.dc.b	126				
	.dc.b	21				
						
	.dc.b	146				
						
	.dc.b	185				
	.dc.b	137				
	.dc.b	201				
						
	.dc.b	178				
						
	.dc.b	185				
	.dc.b	149				
	.dc.b	126				
						
	.dc.b	18				
						
	.dc.b	185				
	.dc.b	161				
	.dc.b	50				
						
	.dc.b	146				
						
	.dc.b	185				
	.dc.b	172				
	.dc.b	231				
						
	.dc.b	50				
						
	.dc.b	185				
	.dc.b	184				
	.dc.b	156				
						
	.dc.b	18				
						
	.dc.b	185				
	.dc.b	196				
	.dc.b	81				
						
	.dc.b	50				
						
	.dc.b	185				
	.dc.b	208				
	.dc.b	6				
						
	.dc.b	114				
						
	.dc.b	185				
	.dc.b	219				
	.dc.b	187				
						
	.dc.b	210				
						
	.dc.b	185				
	.dc.b	231				
	.dc.b	113				
						
	.dc.b	114				
						
	.dc.b	185				
	.dc.b	243				
	.dc.b	39				
						
	.dc.b	50				
						
	.dc.b	185				
	.dc.b	254				
	.dc.b	221				
						
	.dc.b	50				
						
	.dc.b	186				
	.dc.b	10				
	.dc.b	147				
						
	.dc.b	82				
						
	.dc.b	186				
	.dc.b	22				
	.dc.b	73				
						
	.dc.b	178				
						
	.dc.b	186				
	.dc.b	34				
	.dc.b	0				
						
	.dc.b	50				
						
	.dc.b	186				
	.dc.b	45				
	.dc.b	182				
						
	.dc.b	242				
						
	.dc.b	186				
	.dc.b	57				
	.dc.b	109				
						
	.dc.b	210				
						
	.dc.b	186				
	.dc.b	69				
	.dc.b	36				
						
	.dc.b	242				
						
	.dc.b	186				
	.dc.b	80				
	.dc.b	220				
						
	.dc.b	50				
						
	.dc.b	186				
	.dc.b	92				
	.dc.b	147				
						
	.dc.b	178				
						
	.dc.b	186				
	.dc.b	104				
	.dc.b	75				
						
	.dc.b	82				
						
	.dc.b	186				
	.dc.b	116				
	.dc.b	3				
						
	.dc.b	18				
						
	.dc.b	186				
	.dc.b	127				
	.dc.b	187				
						
	.dc.b	18				
						
	.dc.b	186				
	.dc.b	139				
	.dc.b	115				
						
	.dc.b	82				
						
	.dc.b	186				
	.dc.b	151				
	.dc.b	43				
						
	.dc.b	178				
						
	.dc.b	186				
	.dc.b	162				
	.dc.b	228				
						
	.dc.b	50				
						
	.dc.b	186				
	.dc.b	174				
	.dc.b	156				
						
	.dc.b	242				
						
	.dc.b	186				
	.dc.b	186				
	.dc.b	85				
						
	.dc.b	242				
						
	.dc.b	186				
	.dc.b	198				
	.dc.b	15				
						
	.dc.b	18				
						
	.dc.b	186				
	.dc.b	209				
	.dc.b	200				
						
	.dc.b	82				
						
	.dc.b	186				
	.dc.b	221				
	.dc.b	129				
						
	.dc.b	210				
						
	.dc.b	186				
	.dc.b	233				
	.dc.b	59				
						
	.dc.b	114				
						
	.dc.b	186				
	.dc.b	244				
	.dc.b	245				
						
	.dc.b	82				
						
	.dc.b	187				
	.dc.b	0				
	.dc.b	175				
						
	.dc.b	82				
						
	.dc.b	187				
	.dc.b	12				
	.dc.b	105				
						
	.dc.b	146				
						
	.dc.b	187				
	.dc.b	24				
	.dc.b	35				
						
	.dc.b	242				
						
	.dc.b	187				
	.dc.b	35				
	.dc.b	222				
						
	.dc.b	146				
						
	.dc.b	187				
	.dc.b	47				
	.dc.b	153				
						
	.dc.b	82				
						
	.dc.b	187				
	.dc.b	59				
	.dc.b	84				
						
	.dc.b	50				
						
	.dc.b	187				
	.dc.b	71				
	.dc.b	15				
						
	.dc.b	82				
						
	.dc.b	187				
	.dc.b	82				
	.dc.b	202				
						
	.dc.b	178				
						
	.dc.b	187				
	.dc.b	94				
	.dc.b	134				
						
	.dc.b	50				
						
	.dc.b	187				
	.dc.b	106				
	.dc.b	65				
						
	.dc.b	210				
						
	.dc.b	187				
	.dc.b	117				
	.dc.b	253				
						
	.dc.b	178				
						
	.dc.b	187				
	.dc.b	129				
	.dc.b	185				
						
	.dc.b	210				
						
	.dc.b	187				
	.dc.b	141				
	.dc.b	117				
						
	.dc.b	242				
						
	.dc.b	187				
	.dc.b	153				
	.dc.b	50				
						
	.dc.b	114				
						
	.dc.b	187				
	.dc.b	164				
	.dc.b	239				
						
	.dc.b	18				
						
	.dc.b	187				
	.dc.b	176				
	.dc.b	171				
						
	.dc.b	210				
						
	.dc.b	187				
	.dc.b	188				
	.dc.b	104				
						
	.dc.b	210				
						
	.dc.b	187				
	.dc.b	200				
	.dc.b	37				
						
	.dc.b	242				
						
	.dc.b	187				
	.dc.b	211				
	.dc.b	227				
						
	.dc.b	82				
						
	.dc.b	187				
	.dc.b	223				
	.dc.b	160				
						
	.dc.b	210				
						
	.dc.b	187				
	.dc.b	235				
	.dc.b	94				
						
	.dc.b	114				
						
	.dc.b	187				
	.dc.b	247				
	.dc.b	28				
						
	.dc.b	82				
						
	.dc.b	188				
	.dc.b	2				
	.dc.b	218				
						
	.dc.b	114				
						
	.dc.b	188				
	.dc.b	14				
	.dc.b	152				
						
	.dc.b	178				
						
	.dc.b	188				
	.dc.b	26				
	.dc.b	87				
						
	.dc.b	18				
						
	.dc.b	188				
	.dc.b	38				
	.dc.b	21				
						
	.dc.b	178				
						
	.dc.b	188				
	.dc.b	49				
	.dc.b	212				
						
	.dc.b	146				
						
	.dc.b	188				
	.dc.b	61				
	.dc.b	147				
						
	.dc.b	146				
						
	.dc.b	188				
	.dc.b	73				
	.dc.b	82				
						
	.dc.b	178				
						
	.dc.b	188				
	.dc.b	85				
	.dc.b	18				
						
	.dc.b	18				
						
	.dc.b	188				
	.dc.b	96				
	.dc.b	209				
						
	.dc.b	146				
						
	.dc.b	188				
	.dc.b	108				
	.dc.b	145				
						
	.dc.b	82				
						
	.dc.b	188				
	.dc.b	120				
	.dc.b	81				
						
	.dc.b	50				
						
	.dc.b	188				
	.dc.b	132				
	.dc.b	17				
						
	.dc.b	82				
						
	.dc.b	188				
	.dc.b	143				
	.dc.b	209				
						
	.dc.b	146				
						
	.dc.b	188				
	.dc.b	155				
	.dc.b	145				
						
	.dc.b	242				
						
	.dc.b	188				
	.dc.b	167				
	.dc.b	82				
						
	.dc.b	146				
						
	.dc.b	188				
	.dc.b	179				
	.dc.b	19				
						
	.dc.b	114				
						
	.dc.b	188				
	.dc.b	190				
	.dc.b	212				
						
	.dc.b	114				
						
	.dc.b	188				
	.dc.b	202				
	.dc.b	149				
						
	.dc.b	146				
						
	.dc.b	188				
	.dc.b	214				
	.dc.b	86				
						
	.dc.b	242				
						
	.dc.b	188				
	.dc.b	226				
	.dc.b	24				
						
	.dc.b	146				
						
	.dc.b	188				
	.dc.b	237				
	.dc.b	218				
						
	.dc.b	82				
						
	.dc.b	188				
	.dc.b	249				
	.dc.b	156				
						
	.dc.b	50				
						
	.dc.b	189				
	.dc.b	5				
	.dc.b	94				
						
	.dc.b	82				
						
	.dc.b	189				
	.dc.b	17				
	.dc.b	32				
						
	.dc.b	146				
						
	.dc.b	189				
	.dc.b	28				
	.dc.b	227				
						
	.dc.b	18				
						
	.dc.b	189				
	.dc.b	40				
	.dc.b	165				
						
	.dc.b	178				
						
	.dc.b	189				
	.dc.b	52				
	.dc.b	104				
						
	.dc.b	114				
						
	.dc.b	189				
	.dc.b	64				
	.dc.b	43				
						
	.dc.b	146				
						
	.dc.b	189				
	.dc.b	75				
	.dc.b	238				
						
	.dc.b	178				
						
	.dc.b	189				
	.dc.b	87				
	.dc.b	178				
						
	.dc.b	18				
						
	.dc.b	189				
	.dc.b	99				
	.dc.b	117				
						
	.dc.b	178				
						
	.dc.b	189				
	.dc.b	111				
	.dc.b	57				
						
	.dc.b	114				
						
	.dc.b	189				
	.dc.b	122				
	.dc.b	253				
						
	.dc.b	82				
						
	.dc.b	189				
	.dc.b	134				
	.dc.b	193				
						
	.dc.b	114				
						
	.dc.b	189				
	.dc.b	146				
	.dc.b	133				
						
	.dc.b	178				
						
	.dc.b	189				
	.dc.b	158				
	.dc.b	74				
						
	.dc.b	50				
						
	.dc.b	189				
	.dc.b	170				
	.dc.b	14				
						
	.dc.b	210				
						
	.dc.b	189				
	.dc.b	181				
	.dc.b	211				
						
	.dc.b	178				
						
	.dc.b	189				
	.dc.b	193				
	.dc.b	152				
						
	.dc.b	178				
						
	.dc.b	189				
	.dc.b	205				
	.dc.b	93				
						
	.dc.b	242				
						
	.dc.b	189				
	.dc.b	217				
	.dc.b	35				
						
	.dc.b	82				
						
	.dc.b	189				
	.dc.b	228				
	.dc.b	232				
						
	.dc.b	210				
						
	.dc.b	189				
	.dc.b	240				
	.dc.b	174				
						
	.dc.b	146				
						
	.dc.b	189				
	.dc.b	252				
	.dc.b	116				
						
	.dc.b	146				
						
	.dc.b	190				
	.dc.b	8				
	.dc.b	58				
						
	.dc.b	178				
						
	.dc.b	190				
	.dc.b	20				
	.dc.b	0				
						
	.dc.b	242				
						
	.dc.b	190				
	.dc.b	31				
	.dc.b	199				
						
	.dc.b	114				
						
	.dc.b	190				
	.dc.b	43				
	.dc.b	142				
						
	.dc.b	18				
						
	.dc.b	190				
	.dc.b	55				
	.dc.b	84				
						
	.dc.b	242				
						
	.dc.b	190				
	.dc.b	67				
	.dc.b	27				
						
	.dc.b	242				
						
	.dc.b	190				
	.dc.b	78				
	.dc.b	227				
						
	.dc.b	50				
						
	.dc.b	190				
	.dc.b	90				
	.dc.b	170				
						
	.dc.b	146				
						
	.dc.b	190				
	.dc.b	102				
	.dc.b	114				
						
	.dc.b	18				
						
	.dc.b	190				
	.dc.b	114				
	.dc.b	57				
						
	.dc.b	242				
						
	.dc.b	190				
	.dc.b	126				
	.dc.b	1				
						
	.dc.b	210				
						
	.dc.b	190				
	.dc.b	137				
	.dc.b	201				
						
	.dc.b	242				
						
	.dc.b	190				
	.dc.b	149				
	.dc.b	146				
						
	.dc.b	50				
						
	.dc.b	190				
	.dc.b	161				
	.dc.b	90				
						
	.dc.b	178				
						
	.dc.b	190				
	.dc.b	173				
	.dc.b	35				
						
	.dc.b	114				
						
	.dc.b	190				
	.dc.b	184				
	.dc.b	236				
						
	.dc.b	50				
						
	.dc.b	190				
	.dc.b	196				
	.dc.b	181				
						
	.dc.b	82				
						
	.dc.b	190				
	.dc.b	208				
	.dc.b	126				
						
	.dc.b	114				
						
	.dc.b	190				
	.dc.b	220				
	.dc.b	71				
						
	.dc.b	242				
						
	.dc.b	190				
	.dc.b	232				
	.dc.b	17				
						
	.dc.b	114				
						
	.dc.b	190				
	.dc.b	243				
	.dc.b	219				
						
	.dc.b	50				
						
	.dc.b	190				
	.dc.b	255				
	.dc.b	165				
						
	.dc.b	50				
						
	.dc.b	191				
	.dc.b	11				
	.dc.b	111				
						
	.dc.b	82				
						
	.dc.b	191				
	.dc.b	23				
	.dc.b	57				
						
	.dc.b	146				
						
	.dc.b	191				
	.dc.b	35				
	.dc.b	4				
						
	.dc.b	18				
						
	.dc.b	191				
	.dc.b	46				
	.dc.b	206				
						
	.dc.b	178				
						
	.dc.b	191				
	.dc.b	58				
	.dc.b	153				
						
	.dc.b	146				
						
	.dc.b	191				
	.dc.b	70				
	.dc.b	100				
						
	.dc.b	146				
						
	.dc.b	191				
	.dc.b	82				
	.dc.b	47				
						
	.dc.b	210				
						
	.dc.b	191				
	.dc.b	93				
	.dc.b	251				
						
	.dc.b	50				
						
	.dc.b	191				
	.dc.b	105				
	.dc.b	198				
						
	.dc.b	210				
						
	.dc.b	191				
	.dc.b	117				
	.dc.b	146				
						
	.dc.b	146				
						
	.dc.b	191				
	.dc.b	129				
	.dc.b	94				
						
	.dc.b	114				
						
	.dc.b	191				
	.dc.b	141				
	.dc.b	42				
						
	.dc.b	146				
						
	.dc.b	191				
	.dc.b	152				
	.dc.b	246				
						
	.dc.b	242				
						
	.dc.b	191				
	.dc.b	164				
	.dc.b	195				
						
	.dc.b	114				
						
	.dc.b	191				
	.dc.b	176				
	.dc.b	144				
						
	.dc.b	18				
						
	.dc.b	191				
	.dc.b	188				
	.dc.b	92				
						
	.dc.b	242				
						
	.dc.b	191				
	.dc.b	200				
	.dc.b	41				
						
	.dc.b	242				
						
	.dc.b	191				
	.dc.b	211				
	.dc.b	247				
						
	.dc.b	50				
						
	.dc.b	191				
	.dc.b	223				
	.dc.b	196				
						
	.dc.b	146				
						
	.dc.b	191				
	.dc.b	235				
	.dc.b	146				
						
	.dc.b	50				
						
	.dc.b	191				
	.dc.b	247				
	.dc.b	95				
						
	.dc.b	242				
						
	.dc.b	192				
	.dc.b	3				
	.dc.b	45				
						
	.dc.b	210				
						
	.dc.b	192				
	.dc.b	14				
	.dc.b	251				
						
	.dc.b	242				
						
	.dc.b	192				
	.dc.b	26				
	.dc.b	202				
						
	.dc.b	50				
						
	.dc.b	192				
	.dc.b	38				
	.dc.b	152				
						
	.dc.b	178				
						
	.dc.b	192				
	.dc.b	50				
	.dc.b	103				
						
	.dc.b	114				
						
	.dc.b	192				
	.dc.b	62				
	.dc.b	54				
						
	.dc.b	50				
						
	.dc.b	192				
	.dc.b	74				
	.dc.b	5				
						
	.dc.b	82				
						
	.dc.b	192				
	.dc.b	85				
	.dc.b	212				
						
	.dc.b	114				
						
	.dc.b	192				
	.dc.b	97				
	.dc.b	163				
						
	.dc.b	210				
						
	.dc.b	192				
	.dc.b	109				
	.dc.b	115				
						
	.dc.b	114				
						
	.dc.b	192				
	.dc.b	121				
	.dc.b	67				
						
	.dc.b	50				
						
	.dc.b	192				
	.dc.b	133				
	.dc.b	19				
						
	.dc.b	18				
						
	.dc.b	192				
	.dc.b	144				
	.dc.b	227				
						
	.dc.b	50				
						
	.dc.b	192				
	.dc.b	156				
	.dc.b	179				
						
	.dc.b	146				
						
	.dc.b	192				
	.dc.b	168				
	.dc.b	131				
						
	.dc.b	242				
						
	.dc.b	192				
	.dc.b	180				
	.dc.b	84				
						
	.dc.b	178				
						
	.dc.b	192				
	.dc.b	192				
	.dc.b	37				
						
	.dc.b	114				
						
	.dc.b	192				
	.dc.b	203				
	.dc.b	246				
						
	.dc.b	146				
						
	.dc.b	192				
	.dc.b	215				
	.dc.b	199				
						
	.dc.b	178				
						
	.dc.b	192				
	.dc.b	227				
	.dc.b	153				
						
	.dc.b	18				
						
	.dc.b	192				
	.dc.b	239				
	.dc.b	106				
						
	.dc.b	178				
						
	.dc.b	192				
	.dc.b	251				
	.dc.b	60				
						
	.dc.b	114				
						
	.dc.b	193				
	.dc.b	7				
	.dc.b	14				
						
	.dc.b	82				
						
	.dc.b	193				
	.dc.b	18				
	.dc.b	224				
						
	.dc.b	114				
						
	.dc.b	193				
	.dc.b	30				
	.dc.b	178				
						
	.dc.b	178				
						
	.dc.b	193				
	.dc.b	42				
	.dc.b	133				
						
	.dc.b	50				
						
	.dc.b	193				
	.dc.b	54				
	.dc.b	87				
						
	.dc.b	210				
						
	.dc.b	193				
	.dc.b	66				
	.dc.b	42				
						
	.dc.b	178				
						
	.dc.b	193				
	.dc.b	77				
	.dc.b	253				
						
	.dc.b	178				
						
	.dc.b	193				
	.dc.b	89				
	.dc.b	208				
						
	.dc.b	210				
						
	.dc.b	193				
	.dc.b	101				
	.dc.b	164				
						
	.dc.b	50				
						
	.dc.b	193				
	.dc.b	113				
	.dc.b	119				
						
	.dc.b	210				
						
	.dc.b	193				
	.dc.b	125				
	.dc.b	75				
						
	.dc.b	146				
						
	.dc.b	193				
	.dc.b	137				
	.dc.b	31				
						
	.dc.b	114				
						
	.dc.b	193				
	.dc.b	148				
	.dc.b	243				
						
	.dc.b	146				
						
	.dc.b	193				
	.dc.b	160				
	.dc.b	199				
						
	.dc.b	210				
						
	.dc.b	193				
	.dc.b	172				
	.dc.b	156				
						
	.dc.b	50				
						
	.dc.b	193				
	.dc.b	184				
	.dc.b	112				
						
	.dc.b	242				
						
	.dc.b	193				
	.dc.b	196				
	.dc.b	69				
						
	.dc.b	178				
						
	.dc.b	193				
	.dc.b	208				
	.dc.b	26				
						
	.dc.b	178				
						
	.dc.b	193				
	.dc.b	219				
	.dc.b	239				
						
	.dc.b	242				
						
	.dc.b	193				
	.dc.b	231				
	.dc.b	197				
						
	.dc.b	50				
						
	.dc.b	193				
	.dc.b	243				
	.dc.b	154				
						
	.dc.b	210				
						
	.dc.b	193				
	.dc.b	255				
	.dc.b	112				
						
	.dc.b	114				
						
	.dc.b	194				
	.dc.b	11				
	.dc.b	70				
						
	.dc.b	114				
						
	.dc.b	194				
	.dc.b	23				
	.dc.b	28				
						
	.dc.b	114				
						
	.dc.b	194				
	.dc.b	34				
	.dc.b	242				
						
	.dc.b	178				
						
	.dc.b	194				
	.dc.b	46				
	.dc.b	201				
						
	.dc.b	50				
						
	.dc.b	194				
	.dc.b	58				
	.dc.b	159				
						
	.dc.b	210				
						
	.dc.b	194				
	.dc.b	70				
	.dc.b	118				
						
	.dc.b	146				
						
	.dc.b	194				
	.dc.b	82				
	.dc.b	77				
						
	.dc.b	146				
						
	.dc.b	194				
	.dc.b	94				
	.dc.b	36				
						
	.dc.b	178				
						
	.dc.b	194				
	.dc.b	105				
	.dc.b	252				
						
	.dc.b	18				
						
	.dc.b	194				
	.dc.b	117				
	.dc.b	211				
						
	.dc.b	146				
						
	.dc.b	194				
	.dc.b	129				
	.dc.b	171				
						
	.dc.b	82				
						
	.dc.b	194				
	.dc.b	141				
	.dc.b	131				
						
	.dc.b	50				
						
	.dc.b	194				
	.dc.b	153				
	.dc.b	91				
						
	.dc.b	82				
						
	.dc.b	194				
	.dc.b	165				
	.dc.b	51				
						
	.dc.b	146				
						
	.dc.b	194				
	.dc.b	177				
	.dc.b	11				
						
	.dc.b	242				
						
	.dc.b	194				
	.dc.b	188				
	.dc.b	228				
						
	.dc.b	146				
						
	.dc.b	194				
	.dc.b	200				
	.dc.b	189				
						
	.dc.b	82				
						
	.dc.b	194				
	.dc.b	212				
	.dc.b	150				
						
	.dc.b	82				
						
	.dc.b	194				
	.dc.b	224				
	.dc.b	111				
						
	.dc.b	114				
						
	.dc.b	194				
	.dc.b	236				
	.dc.b	72				
						
	.dc.b	210				
						
	.dc.b	194				
	.dc.b	248				
	.dc.b	34				
						
	.dc.b	82				
						
	.dc.b	195				
	.dc.b	3				
	.dc.b	251				
						
	.dc.b	242				
						
	.dc.b	195				
	.dc.b	15				
	.dc.b	213				
						
	.dc.b	210				
						
	.dc.b	195				
	.dc.b	27				
	.dc.b	175				
						
	.dc.b	210				
						
	.dc.b	195				
	.dc.b	39				
	.dc.b	138				
						
	.dc.b	18				
						
	.dc.b	195				
	.dc.b	51				
	.dc.b	100				
						
	.dc.b	146				
						
	.dc.b	195				
	.dc.b	63				
	.dc.b	63				
						
	.dc.b	18				
						
	.dc.b	195				
	.dc.b	75				
	.dc.b	25				
						
	.dc.b	210				
						
	.dc.b	195				
	.dc.b	86				
	.dc.b	244				
						
	.dc.b	210				
						
	.dc.b	195				
	.dc.b	98				
	.dc.b	207				
						
	.dc.b	242				
						
	.dc.b	195				
	.dc.b	110				
	.dc.b	171				
						
	.dc.b	50				
						
	.dc.b	195				
	.dc.b	122				
	.dc.b	134				
						
	.dc.b	178				
						
	.dc.b	195				
	.dc.b	134				
	.dc.b	98				
						
	.dc.b	114				
						
	.dc.b	195				
	.dc.b	146				
	.dc.b	62				
						
	.dc.b	50				
						
	.dc.b	195				
	.dc.b	158				
	.dc.b	26				
						
	.dc.b	82				
						
	.dc.b	195				
	.dc.b	169				
	.dc.b	246				
						
	.dc.b	114				
						
	.dc.b	195				
	.dc.b	181				
	.dc.b	210				
						
	.dc.b	210				
						
	.dc.b	195				
	.dc.b	193				
	.dc.b	175				
						
	.dc.b	114				
						
	.dc.b	195				
	.dc.b	205				
	.dc.b	140				
						
	.dc.b	50				
						
	.dc.b	195				
	.dc.b	217				
	.dc.b	105				
						
	.dc.b	18				
						
	.dc.b	195				
	.dc.b	229				
	.dc.b	70				
						
	.dc.b	50				
						
	.dc.b	195				
	.dc.b	241				
	.dc.b	35				
						
	.dc.b	114				
						
	.dc.b	195				
	.dc.b	253				
	.dc.b	0				
						
	.dc.b	242				
						
	.dc.b	196				
	.dc.b	8				
	.dc.b	222				
						
	.dc.b	146				
						
	.dc.b	196				
	.dc.b	20				
	.dc.b	188				
						
	.dc.b	114				
						
	.dc.b	196				
	.dc.b	32				
	.dc.b	154				
						
	.dc.b	114				
						
	.dc.b	196				
	.dc.b	44				
	.dc.b	120				
						
	.dc.b	146				
						
	.dc.b	196				
	.dc.b	56				
	.dc.b	86				
						
	.dc.b	242				
						
	.dc.b	196				
	.dc.b	68				
	.dc.b	53				
						
	.dc.b	114				
						
	.dc.b	196				
	.dc.b	80				
	.dc.b	20				
						
	.dc.b	50				
						
	.dc.b	196				
	.dc.b	91				
	.dc.b	243				
						
	.dc.b	18				
						
	.dc.b	196				
	.dc.b	103				
	.dc.b	210				
						
	.dc.b	50				
						
	.dc.b	196				
	.dc.b	115				
	.dc.b	177				
						
	.dc.b	114				
						
	.dc.b	196				
	.dc.b	127				
	.dc.b	144				
						
	.dc.b	210				
						
	.dc.b	196				
	.dc.b	139				
	.dc.b	112				
						
	.dc.b	114				
						
	.dc.b	196				
	.dc.b	151				
	.dc.b	80				
						
	.dc.b	82				
						
	.dc.b	196				
	.dc.b	163				
	.dc.b	48				
						
	.dc.b	50				
						
	.dc.b	196				
	.dc.b	175				
	.dc.b	16				
						
	.dc.b	114				
						
	.dc.b	196				
	.dc.b	186				
	.dc.b	240				
						
	.dc.b	178				
						
	.dc.b	196				
	.dc.b	198				
	.dc.b	209				
						
	.dc.b	50				
						
	.dc.b	196				
	.dc.b	210				
	.dc.b	177				
						
	.dc.b	242				
						
	.dc.b	196				
	.dc.b	222				
	.dc.b	146				
						
	.dc.b	210				
						
	.dc.b	196				
	.dc.b	234				
	.dc.b	115				
						
	.dc.b	210				
						
	.dc.b	196				
	.dc.b	246				
	.dc.b	85				
						
	.dc.b	18				
						
	.dc.b	197				
	.dc.b	2				
	.dc.b	54				
						
	.dc.b	114				
						
	.dc.b	197				
	.dc.b	14				
	.dc.b	24				
						
	.dc.b	18				
						
	.dc.b	197				
	.dc.b	25				
	.dc.b	249				
						
	.dc.b	210				
						
	.dc.b	197				
	.dc.b	37				
	.dc.b	219				
						
	.dc.b	210				
						
	.dc.b	197				
	.dc.b	49				
	.dc.b	189				
						
	.dc.b	242				
						
	.dc.b	197				
	.dc.b	61				
	.dc.b	160				
						
	.dc.b	50				
						
	.dc.b	197				
	.dc.b	73				
	.dc.b	130				
						
	.dc.b	178				
						
	.dc.b	197				
	.dc.b	85				
	.dc.b	101				
						
	.dc.b	82				
						
	.dc.b	197				
	.dc.b	97				
	.dc.b	72				
						
	.dc.b	50				
						
	.dc.b	197				
	.dc.b	109				
	.dc.b	43				
						
	.dc.b	50				
						
	.dc.b	197				
	.dc.b	121				
	.dc.b	14				
						
	.dc.b	114				
						
	.dc.b	197				
	.dc.b	132				
	.dc.b	241				
						
	.dc.b	210				
						
	.dc.b	197				
	.dc.b	144				
	.dc.b	213				
						
	.dc.b	82				
						
	.dc.b	197				
	.dc.b	156				
	.dc.b	185				
						
	.dc.b	18				
						
	.dc.b	197				
	.dc.b	168				
	.dc.b	157				
						
	.dc.b	18				
						
	.dc.b	197				
	.dc.b	180				
	.dc.b	129				
						
	.dc.b	18				
						
	.dc.b	197				
	.dc.b	192				
	.dc.b	101				
						
	.dc.b	82				
						
	.dc.b	197				
	.dc.b	204				
	.dc.b	73				
						
	.dc.b	210				
						
	.dc.b	197				
	.dc.b	216				
	.dc.b	46				
						
	.dc.b	114				
						
	.dc.b	197				
	.dc.b	228				
	.dc.b	19				
						
	.dc.b	82				
						
	.dc.b	197				
	.dc.b	239				
	.dc.b	248				
						
	.dc.b	50				
						
	.dc.b	197				
	.dc.b	251				
	.dc.b	221				
						
	.dc.b	114				
						
	.dc.b	198				
	.dc.b	7				
	.dc.b	194				
						
	.dc.b	210				
						
	.dc.b	198				
	.dc.b	19				
	.dc.b	168				
						
	.dc.b	82				
						
	.dc.b	198				
	.dc.b	31				
	.dc.b	141				
						
	.dc.b	242				
						
	.dc.b	198				
	.dc.b	43				
	.dc.b	115				
						
	.dc.b	210				
						
	.dc.b	198				
	.dc.b	55				
	.dc.b	89				
						
	.dc.b	242				
						
	.dc.b	198				
	.dc.b	67				
	.dc.b	64				
						
	.dc.b	50				
						
	.dc.b	198				
	.dc.b	79				
	.dc.b	38				
						
	.dc.b	146				
						
	.dc.b	198				
	.dc.b	91				
	.dc.b	13				
						
	.dc.b	50				
						
	.dc.b	198				
	.dc.b	102				
	.dc.b	243				
						
	.dc.b	242				
						
	.dc.b	198				
	.dc.b	114				
	.dc.b	218				
						
	.dc.b	242				
						
	.dc.b	198				
	.dc.b	126				
	.dc.b	194				
						
	.dc.b	18				
						
	.dc.b	198				
	.dc.b	138				
	.dc.b	169				
						
	.dc.b	82				
						
	.dc.b	198				
	.dc.b	150				
	.dc.b	144				
						
	.dc.b	210				
						
	.dc.b	198				
	.dc.b	162				
	.dc.b	120				
						
	.dc.b	114				
						
	.dc.b	198				
	.dc.b	174				
	.dc.b	96				
						
	.dc.b	82				
						
	.dc.b	198				
	.dc.b	186				
	.dc.b	72				
						
	.dc.b	82				
						
	.dc.b	198				
	.dc.b	198				
	.dc.b	48				
						
	.dc.b	146				
						
	.dc.b	198				
	.dc.b	210				
	.dc.b	24				
						
	.dc.b	242				
						
	.dc.b	198				
	.dc.b	222				
	.dc.b	1				
						
	.dc.b	114				
						
	.dc.b	198				
	.dc.b	233				
	.dc.b	234				
						
	.dc.b	50				
						
	.dc.b	198				
	.dc.b	245				
	.dc.b	211				
						
	.dc.b	50				
						
	.dc.b	199				
	.dc.b	1				
	.dc.b	188				
						
	.dc.b	50				
						
	.dc.b	199				
	.dc.b	13				
	.dc.b	165				
						
	.dc.b	114				
						
	.dc.b	199				
	.dc.b	25				
	.dc.b	142				
						
	.dc.b	242				
						
	.dc.b	199				
	.dc.b	37				
	.dc.b	120				
						
	.dc.b	146				
						
	.dc.b	199				
	.dc.b	49				
	.dc.b	98				
						
	.dc.b	82				
						
	.dc.b	199				
	.dc.b	61				
	.dc.b	76				
						
	.dc.b	82				
						
	.dc.b	199				
	.dc.b	73				
	.dc.b	54				
						
	.dc.b	146				
						
	.dc.b	199				
	.dc.b	85				
	.dc.b	32				
						
	.dc.b	210				
						
	.dc.b	199				
	.dc.b	97				
	.dc.b	11				
						
	.dc.b	82				
						
	.dc.b	199				
	.dc.b	108				
	.dc.b	246				
						
	.dc.b	18				
						
	.dc.b	199				
	.dc.b	120				
	.dc.b	224				
						
	.dc.b	242				
						
	.dc.b	199				
	.dc.b	132				
	.dc.b	203				
						
	.dc.b	242				
						
	.dc.b	199				
	.dc.b	144				
	.dc.b	183				
						
	.dc.b	50				
						
	.dc.b	199				
	.dc.b	156				
	.dc.b	162				
						
	.dc.b	146				
						
	.dc.b	199				
	.dc.b	168				
	.dc.b	142				
						
	.dc.b	50				
						
	.dc.b	199				
	.dc.b	180				
	.dc.b	121				
						
	.dc.b	242				
						
	.dc.b	199				
	.dc.b	192				
	.dc.b	101				
						
	.dc.b	242				
						
	.dc.b	199				
	.dc.b	204				
	.dc.b	82				
						
	.dc.b	18				
						
	.dc.b	199				
	.dc.b	216				
	.dc.b	62				
						
	.dc.b	82				
						
	.dc.b	199				
	.dc.b	228				
	.dc.b	42				
						
	.dc.b	210				
						
	.dc.b	199				
	.dc.b	240				
	.dc.b	23				
						
	.dc.b	114				
						
	.dc.b	199				
	.dc.b	252				
	.dc.b	4				
						
	.dc.b	82				
						
	.dc.b	200				
	.dc.b	7				
	.dc.b	241				
						
	.dc.b	82				
						
	.dc.b	200				
	.dc.b	19				
	.dc.b	222				
						
	.dc.b	114				
						
	.dc.b	200				
	.dc.b	31				
	.dc.b	203				
						
	.dc.b	210				
						
	.dc.b	200				
	.dc.b	43				
	.dc.b	185				
						
	.dc.b	114				
						
	.dc.b	200				
	.dc.b	55				
	.dc.b	167				
						
	.dc.b	18				
						
	.dc.b	200				
	.dc.b	67				
	.dc.b	148				
						
	.dc.b	242				
						
	.dc.b	200				
	.dc.b	79				
	.dc.b	131				
						
	.dc.b	18				
						
	.dc.b	200				
	.dc.b	91				
	.dc.b	113				
						
	.dc.b	82				
						
	.dc.b	200				
	.dc.b	103				
	.dc.b	95				
						
	.dc.b	178				
						
	.dc.b	200				
	.dc.b	115				
	.dc.b	78				
						
	.dc.b	82				
						
	.dc.b	200				
	.dc.b	127				
	.dc.b	61				
						
	.dc.b	50				
						
	.dc.b	200				
	.dc.b	139				
	.dc.b	44				
						
	.dc.b	18				
						
	.dc.b	200				
	.dc.b	151				
	.dc.b	27				
						
	.dc.b	50				
						
	.dc.b	200				
	.dc.b	163				
	.dc.b	10				
						
	.dc.b	146				
						
	.dc.b	200				
	.dc.b	174				
	.dc.b	250				
						
	.dc.b	18				
						
	.dc.b	200				
	.dc.b	186				
	.dc.b	233				
						
	.dc.b	178				
						
	.dc.b	200				
	.dc.b	198				
	.dc.b	217				
						
	.dc.b	146				
						
	.dc.b	200				
	.dc.b	210				
	.dc.b	201				
						
	.dc.b	146				
						
	.dc.b	200				
	.dc.b	222				
	.dc.b	185				
						
	.dc.b	210				
						
	.dc.b	200				
	.dc.b	234				
	.dc.b	170				
						
	.dc.b	50				
						
	.dc.b	200				
	.dc.b	246				
	.dc.b	154				
						
	.dc.b	178				
						
	.dc.b	201				
	.dc.b	2				
	.dc.b	139				
						
	.dc.b	114				
						
	.dc.b	201				
	.dc.b	14				
	.dc.b	124				
						
	.dc.b	114				
						
	.dc.b	201				
	.dc.b	26				
	.dc.b	109				
						
	.dc.b	114				
						
	.dc.b	201				
	.dc.b	38				
	.dc.b	94				
						
	.dc.b	210				
						
	.dc.b	201				
	.dc.b	50				
	.dc.b	80				
						
	.dc.b	50				
						
	.dc.b	201				
	.dc.b	62				
	.dc.b	65				
						
	.dc.b	210				
						
	.dc.b	201				
	.dc.b	74				
	.dc.b	51				
						
	.dc.b	146				
						
	.dc.b	201				
	.dc.b	86				
	.dc.b	37				
						
	.dc.b	146				
						
	.dc.b	201				
	.dc.b	98				
	.dc.b	23				
						
	.dc.b	210				
						
	.dc.b	201				
	.dc.b	110				
	.dc.b	10				
						
	.dc.b	18				
						
	.dc.b	201				
	.dc.b	121				
	.dc.b	252				
						
	.dc.b	146				
						
	.dc.b	201				
	.dc.b	133				
	.dc.b	239				
						
	.dc.b	82				
						
	.dc.b	201				
	.dc.b	145				
	.dc.b	226				
						
	.dc.b	50				
						
	.dc.b	201				
	.dc.b	157				
	.dc.b	213				
						
	.dc.b	50				
						
	.dc.b	201				
	.dc.b	169				
	.dc.b	200				
						
	.dc.b	114				
						
	.dc.b	201				
	.dc.b	181				
	.dc.b	187				
						
	.dc.b	210				
						
	.dc.b	201				
	.dc.b	193				
	.dc.b	175				
						
	.dc.b	82				
						
	.dc.b	201				
	.dc.b	205				
	.dc.b	163				
						
	.dc.b	18				
						
	.dc.b	201				
	.dc.b	217				
	.dc.b	151				
						
	.dc.b	18				
						
	.dc.b	201				
	.dc.b	229				
	.dc.b	139				
						
	.dc.b	50				
						
	.dc.b	201				
	.dc.b	241				
	.dc.b	127				
						
	.dc.b	114				
						
	.dc.b	201				
	.dc.b	253				
	.dc.b	115				
						
	.dc.b	210				
						
	.dc.b	202				
	.dc.b	9				
	.dc.b	104				
						
	.dc.b	146				
						
	.dc.b	202				
	.dc.b	21				
	.dc.b	93				
						
	.dc.b	82				
						
	.dc.b	202				
	.dc.b	33				
	.dc.b	82				
						
	.dc.b	82				
						
	.dc.b	202				
	.dc.b	45				
	.dc.b	71				
						
	.dc.b	114				
						
	.dc.b	202				
	.dc.b	57				
	.dc.b	60				
						
	.dc.b	210				
						
	.dc.b	202				
	.dc.b	69				
	.dc.b	50				
						
	.dc.b	82				
						
	.dc.b	202				
	.dc.b	81				
	.dc.b	40				
						
	.dc.b	18				
						
	.dc.b	202				
	.dc.b	93				
	.dc.b	29				
						
	.dc.b	242				
						
	.dc.b	202				
	.dc.b	105				
	.dc.b	19				
						
	.dc.b	242				
						
	.dc.b	202				
	.dc.b	117				
	.dc.b	10				
						
	.dc.b	50				
						
	.dc.b	202				
	.dc.b	129				
	.dc.b	0				
						
	.dc.b	146				
						
	.dc.b	202				
	.dc.b	140				
	.dc.b	247				
						
	.dc.b	50				
						
	.dc.b	202				
	.dc.b	152				
	.dc.b	237				
						
	.dc.b	242				
						
	.dc.b	202				
	.dc.b	164				
	.dc.b	228				
						
	.dc.b	210				
						
	.dc.b	202				
	.dc.b	176				
	.dc.b	219				
						
	.dc.b	242				
						
	.dc.b	202				
	.dc.b	188				
	.dc.b	211				
						
	.dc.b	50				
						
	.dc.b	202				
	.dc.b	200				
	.dc.b	202				
						
	.dc.b	178				
						
	.dc.b	202				
	.dc.b	212				
	.dc.b	194				
						
	.dc.b	82				
						
	.dc.b	202				
	.dc.b	224				
	.dc.b	186				
						
	.dc.b	18				
						
	.dc.b	202				
	.dc.b	236				
	.dc.b	178				
						
	.dc.b	18				
						
	.dc.b	202				
	.dc.b	248				
	.dc.b	170				
						
	.dc.b	82				
						
	.dc.b	203				
	.dc.b	4				
	.dc.b	162				
						
	.dc.b	146				
						
	.dc.b	203				
	.dc.b	16				
	.dc.b	155				
						
	.dc.b	50				
						
	.dc.b	203				
	.dc.b	28				
	.dc.b	147				
						
	.dc.b	210				
						
	.dc.b	203				
	.dc.b	40				
	.dc.b	140				
						
	.dc.b	178				
						
	.dc.b	203				
	.dc.b	52				
	.dc.b	133				
						
	.dc.b	210				
						
	.dc.b	203				
	.dc.b	64				
	.dc.b	126				
						
	.dc.b	242				
						
	.dc.b	203				
	.dc.b	76				
	.dc.b	120				
						
	.dc.b	114				
						
	.dc.b	203				
	.dc.b	88				
	.dc.b	113				
						
	.dc.b	242				
						
	.dc.b	203				
	.dc.b	100				
	.dc.b	107				
						
	.dc.b	178				
						
	.dc.b	203				
	.dc.b	112				
	.dc.b	101				
						
	.dc.b	178				
						
	.dc.b	203				
	.dc.b	124				
	.dc.b	95				
						
	.dc.b	210				
						
	.dc.b	203				
	.dc.b	136				
	.dc.b	90				
						
	.dc.b	18				
						
	.dc.b	203				
	.dc.b	148				
	.dc.b	84				
						
	.dc.b	114				
						
	.dc.b	203				
	.dc.b	160				
	.dc.b	79				
						
	.dc.b	50				
						
	.dc.b	203				
	.dc.b	172				
	.dc.b	73				
						
	.dc.b	242				
						
	.dc.b	203				
	.dc.b	184				
	.dc.b	68				
						
	.dc.b	242				
						
	.dc.b	203				
	.dc.b	196				
	.dc.b	64				
						
	.dc.b	18				
						
	.dc.b	203				
	.dc.b	208				
	.dc.b	59				
						
	.dc.b	114				
						
	.dc.b	203				
	.dc.b	220				
	.dc.b	54				
						
	.dc.b	242				
						
	.dc.b	203				
	.dc.b	232				
	.dc.b	50				
						
	.dc.b	178				
						
	.dc.b	203				
	.dc.b	244				
	.dc.b	46				
						
	.dc.b	146				
						
	.dc.b	204				
	.dc.b	0				
	.dc.b	42				
						
	.dc.b	146				
						
	.dc.b	204				
	.dc.b	12				
	.dc.b	38				
						
	.dc.b	210				
						
	.dc.b	204				
	.dc.b	24				
	.dc.b	35				
						
	.dc.b	50				
						
	.dc.b	204				
	.dc.b	36				
	.dc.b	31				
						
	.dc.b	178				
						
	.dc.b	204				
	.dc.b	48				
	.dc.b	28				
						
	.dc.b	114				
						
	.dc.b	204				
	.dc.b	60				
	.dc.b	25				
						
	.dc.b	114				
						
	.dc.b	204				
	.dc.b	72				
	.dc.b	22				
						
	.dc.b	146				
						
	.dc.b	204				
	.dc.b	84				
	.dc.b	19				
						
	.dc.b	210				
						
	.dc.b	204				
	.dc.b	96				
	.dc.b	17				
						
	.dc.b	50				
						
	.dc.b	204				
	.dc.b	108				
	.dc.b	14				
						
	.dc.b	242				
						
	.dc.b	204				
	.dc.b	120				
	.dc.b	12				
						
	.dc.b	178				
						
	.dc.b	204				
	.dc.b	132				
	.dc.b	10				
						
	.dc.b	178				
						
	.dc.b	204				
	.dc.b	144				
	.dc.b	8				
						
	.dc.b	210				
						
	.dc.b	204				
	.dc.b	156				
	.dc.b	7				
						
	.dc.b	50				
						
	.dc.b	204				
	.dc.b	168				
	.dc.b	5				
						
	.dc.b	178				
						
	.dc.b	204				
	.dc.b	180				
	.dc.b	4				
						
	.dc.b	82				
						
	.dc.b	204				
	.dc.b	192				
	.dc.b	3				
						
	.dc.b	50				
						
	.dc.b	204				
	.dc.b	204				
	.dc.b	2				
						
	.dc.b	50				
						
	.dc.b	204				
	.dc.b	216				
	.dc.b	1				
						
	.dc.b	114				
						
	.dc.b	204				
	.dc.b	228				
	.dc.b	0				
						
	.dc.b	210				
						
	.dc.b	204				
	.dc.b	240				
	.dc.b	0				
						
	.dc.b	114				
						
	.dc.b	204				
	.dc.b	252				
	.dc.b	0				
						
	.dc.b	18				
						
	.dc.b	205				
	.dc.b	8				
	.dc.b	0				
						
	.dc.b	18				
						
	.dc.b	205				
	.dc.b	20				
	.dc.b	0				
						
	.dc.b	18				
						
	.dc.b	205				
	.dc.b	32				
	.dc.b	0				
						
	.dc.b	114				
						
	.dc.b	205				
	.dc.b	44				
	.dc.b	0				
						
	.dc.b	210				
						
	.dc.b	205				
	.dc.b	56				
	.dc.b	1				
						
	.dc.b	114				
						
	.dc.b	205				
	.dc.b	68				
	.dc.b	2				
						
	.dc.b	50				
						
	.dc.b	205				
	.dc.b	80				
	.dc.b	3				
						
	.dc.b	50				
						
	.dc.b	205				
	.dc.b	92				
	.dc.b	4				
						
	.dc.b	82				
						
	.dc.b	205				
	.dc.b	104				
	.dc.b	5				
						
	.dc.b	178				
						
	.dc.b	205				
	.dc.b	116				
	.dc.b	7				
						
	.dc.b	50				
						
	.dc.b	205				
	.dc.b	128				
	.dc.b	8				
						
	.dc.b	210				
						
	.dc.b	205				
	.dc.b	140				
	.dc.b	10				
						
	.dc.b	178				
						
	.dc.b	205				
	.dc.b	152				
	.dc.b	12				
						
	.dc.b	178				
						
	.dc.b	205				
	.dc.b	164				
	.dc.b	14				
						
	.dc.b	210				
						
	.dc.b	205				
	.dc.b	176				
	.dc.b	17				
						
	.dc.b	50				
						
	.dc.b	205				
	.dc.b	188				
	.dc.b	19				
						
	.dc.b	210				
						
	.dc.b	205				
	.dc.b	200				
	.dc.b	22				
						
	.dc.b	114				
						
	.dc.b	205				
	.dc.b	212				
	.dc.b	25				
						
	.dc.b	114				
						
	.dc.b	205				
	.dc.b	224				
	.dc.b	28				
						
	.dc.b	114				
						
	.dc.b	205				
	.dc.b	236				
	.dc.b	31				
						
	.dc.b	178				
						
	.dc.b	205				
	.dc.b	248				
	.dc.b	35				
						
	.dc.b	18				
						
	.dc.b	206				
	.dc.b	4				
	.dc.b	38				
						
	.dc.b	178				
						
	.dc.b	206				
	.dc.b	16				
	.dc.b	42				
						
	.dc.b	114				
						
	.dc.b	206				
	.dc.b	28				
	.dc.b	46				
						
	.dc.b	114				
						
	.dc.b	206				
	.dc.b	40				
	.dc.b	50				
						
	.dc.b	146				
						
	.dc.b	206				
	.dc.b	52				
	.dc.b	54				
						
	.dc.b	210				
						
	.dc.b	206				
	.dc.b	64				
	.dc.b	59				
						
	.dc.b	82				
						
	.dc.b	206				
	.dc.b	76				
	.dc.b	63				
						
	.dc.b	242				
						
	.dc.b	206				
	.dc.b	88				
	.dc.b	68				
						
	.dc.b	210				
						
	.dc.b	206				
	.dc.b	100				
	.dc.b	73				
						
	.dc.b	210				
						
	.dc.b	206				
	.dc.b	112				
	.dc.b	78				
						
	.dc.b	242				
						
	.dc.b	206				
	.dc.b	124				
	.dc.b	84				
						
	.dc.b	82				
						
	.dc.b	206				
	.dc.b	136				
	.dc.b	89				
						
	.dc.b	210				
						
	.dc.b	206				
	.dc.b	148				
	.dc.b	95				
						
	.dc.b	146				
						
	.dc.b	206				
	.dc.b	160				
	.dc.b	101				
						
	.dc.b	114				
						
	.dc.b	206				
	.dc.b	172				
	.dc.b	107				
						
	.dc.b	114				
						
	.dc.b	206				
	.dc.b	184				
	.dc.b	113				
						
	.dc.b	178				
						
	.dc.b	206				
	.dc.b	196				
	.dc.b	120				
						
	.dc.b	18				
						
	.dc.b	206				
	.dc.b	208				
	.dc.b	126				
						
	.dc.b	146				
						
	.dc.b	206				
	.dc.b	220				
	.dc.b	133				
						
	.dc.b	82				
						
	.dc.b	206				
	.dc.b	232				
	.dc.b	140				
						
	.dc.b	82				
						
	.dc.b	206				
	.dc.b	244				
	.dc.b	147				
						
	.dc.b	114				
						
	.dc.b	207				
	.dc.b	0				
	.dc.b	154				
						
	.dc.b	178				
						
	.dc.b	207				
	.dc.b	12				
	.dc.b	162				
						
	.dc.b	18				
						
	.dc.b	207				
	.dc.b	24				
	.dc.b	169				
						
	.dc.b	178				
						
	.dc.b	207				
	.dc.b	36				
	.dc.b	177				
						
	.dc.b	146				
						
	.dc.b	207				
	.dc.b	48				
	.dc.b	185				
						
	.dc.b	114				
						
	.dc.b	207				
	.dc.b	60				
	.dc.b	193				
						
	.dc.b	146				
						
	.dc.b	207				
	.dc.b	72				
	.dc.b	201				
						
	.dc.b	242				
						
	.dc.b	207				
	.dc.b	84				
	.dc.b	210				
						
	.dc.b	114				
						
	.dc.b	207				
	.dc.b	96				
	.dc.b	219				
						
	.dc.b	18				
						
	.dc.b	207				
	.dc.b	108				
	.dc.b	227				
						
	.dc.b	242				
						
	.dc.b	207				
	.dc.b	120				
	.dc.b	236				
						
	.dc.b	242				
						
	.dc.b	207				
	.dc.b	132				
	.dc.b	246				
						
	.dc.b	50				
						
	.dc.b	207				
	.dc.b	144				
	.dc.b	255				
						
	.dc.b	146				
						
	.dc.b	207				
	.dc.b	157				
	.dc.b	9				
						
	.dc.b	18				
						
	.dc.b	207				
	.dc.b	169				
	.dc.b	18				
						
	.dc.b	210				
						
	.dc.b	207				
	.dc.b	181				
	.dc.b	28				
						
	.dc.b	178				
						
	.dc.b	207				
	.dc.b	193				
	.dc.b	38				
						
	.dc.b	178				
						
	.dc.b	207				
	.dc.b	205				
	.dc.b	48				
						
	.dc.b	242				
						
	.dc.b	207				
	.dc.b	217				
	.dc.b	59				
						
	.dc.b	82				
						
	.dc.b	207				
	.dc.b	229				
	.dc.b	69				
						
	.dc.b	242				
						
	.dc.b	207				
	.dc.b	241				
	.dc.b	80				
						
	.dc.b	178				
						
	.dc.b	207				
	.dc.b	253				
	.dc.b	91				
						
	.dc.b	178				
						
	.dc.b	208				
	.dc.b	9				
	.dc.b	102				
						
	.dc.b	210				
						
	.dc.b	208				
	.dc.b	21				
	.dc.b	114				
						
	.dc.b	18				
						
	.dc.b	208				
	.dc.b	33				
	.dc.b	125				
						
	.dc.b	114				
						
	.dc.b	208				
	.dc.b	45				
	.dc.b	137				
						
	.dc.b	50				
						
	.dc.b	208				
	.dc.b	57				
	.dc.b	148				
						
	.dc.b	242				
						
	.dc.b	208				
	.dc.b	69				
	.dc.b	160				
						
	.dc.b	242				
						
	.dc.b	208				
	.dc.b	81				
	.dc.b	173				
						
	.dc.b	18				
						
	.dc.b	208				
	.dc.b	93				
	.dc.b	185				
						
	.dc.b	114				
						
	.dc.b	208				
	.dc.b	105				
	.dc.b	197				
						
	.dc.b	242				
						
	.dc.b	208				
	.dc.b	117				
	.dc.b	210				
						
	.dc.b	146				
						
	.dc.b	208				
	.dc.b	129				
	.dc.b	223				
						
	.dc.b	114				
						
	.dc.b	208				
	.dc.b	141				
	.dc.b	236				
						
	.dc.b	114				
						
	.dc.b	208				
	.dc.b	153				
	.dc.b	249				
						
	.dc.b	178				
						
	.dc.b	208				
	.dc.b	166				
	.dc.b	7				
						
	.dc.b	18				
						
	.dc.b	208				
	.dc.b	178				
	.dc.b	20				
						
	.dc.b	146				
						
	.dc.b	208				
	.dc.b	190				
	.dc.b	34				
						
	.dc.b	82				
						
	.dc.b	208				
	.dc.b	202				
	.dc.b	48				
						
	.dc.b	50				
						
	.dc.b	208				
	.dc.b	214				
	.dc.b	62				
						
	.dc.b	82				
						
	.dc.b	208				
	.dc.b	226				
	.dc.b	76				
						
	.dc.b	146				
						
	.dc.b	208				
	.dc.b	238				
	.dc.b	90				
						
	.dc.b	242				
						
	.dc.b	208				
	.dc.b	250				
	.dc.b	105				
						
	.dc.b	146				
						
	.dc.b	209				
	.dc.b	6				
	.dc.b	120				
						
	.dc.b	82				
						
	.dc.b	209				
	.dc.b	18				
	.dc.b	135				
						
	.dc.b	50				
						
	.dc.b	209				
	.dc.b	30				
	.dc.b	150				
						
	.dc.b	82				
						
	.dc.b	209				
	.dc.b	42				
	.dc.b	165				
						
	.dc.b	146				
						
	.dc.b	209				
	.dc.b	54				
	.dc.b	181				
						
	.dc.b	18				
						
	.dc.b	209				
	.dc.b	66				
	.dc.b	196				
						
	.dc.b	178				
						
	.dc.b	209				
	.dc.b	78				
	.dc.b	212				
						
	.dc.b	146				
						
	.dc.b	209				
	.dc.b	90				
	.dc.b	228				
						
	.dc.b	146				
						
	.dc.b	209				
	.dc.b	102				
	.dc.b	244				
						
	.dc.b	178				
						
	.dc.b	209				
	.dc.b	115				
	.dc.b	4				
						
	.dc.b	242				
						
	.dc.b	209				
	.dc.b	127				
	.dc.b	21				
						
	.dc.b	146				
						
	.dc.b	209				
	.dc.b	139				
	.dc.b	38				
						
	.dc.b	50				
						
	.dc.b	209				
	.dc.b	151				
	.dc.b	55				
						
	.dc.b	18				
						
	.dc.b	209				
	.dc.b	163				
	.dc.b	72				
						
	.dc.b	18				
						
	.dc.b	209				
	.dc.b	175				
	.dc.b	89				
						
	.dc.b	82				
						
	.dc.b	209				
	.dc.b	187				
	.dc.b	106				
						
	.dc.b	146				
						
	.dc.b	209				
	.dc.b	199				
	.dc.b	124				
						
	.dc.b	50				
						
	.dc.b	209				
	.dc.b	211				
	.dc.b	141				
						
	.dc.b	242				
						
	.dc.b	209				
	.dc.b	223				
	.dc.b	159				
						
	.dc.b	210				
						
	.dc.b	209				
	.dc.b	235				
	.dc.b	177				
						
	.dc.b	210				
						
	.dc.b	209				
	.dc.b	247				
	.dc.b	196				
						
	.dc.b	18				
						
	.dc.b	210				
	.dc.b	3				
	.dc.b	214				
						
	.dc.b	146				
						
	.dc.b	210				
	.dc.b	15				
	.dc.b	233				
						
	.dc.b	18				
						
	.dc.b	210				
	.dc.b	27				
	.dc.b	251				
						
	.dc.b	210				
						
	.dc.b	210				
	.dc.b	40				
	.dc.b	14				
						
	.dc.b	210				
						
	.dc.b	210				
	.dc.b	52				
	.dc.b	33				
						
	.dc.b	242				
						
	.dc.b	210				
	.dc.b	64				
	.dc.b	53				
						
	.dc.b	50				
						
	.dc.b	210				
	.dc.b	76				
	.dc.b	72				
						
	.dc.b	178				
						
	.dc.b	210				
	.dc.b	88				
	.dc.b	92				
						
	.dc.b	82				
						
	.dc.b	210				
	.dc.b	100				
	.dc.b	112				
						
	.dc.b	18				
						
	.dc.b	210				
	.dc.b	112				
	.dc.b	132				
						
	.dc.b	18				
						
	.dc.b	210				
	.dc.b	124				
	.dc.b	152				
						
	.dc.b	50				
						
	.dc.b	210				
	.dc.b	136				
	.dc.b	172				
						
	.dc.b	114				
						
	.dc.b	210				
	.dc.b	148				
	.dc.b	192				
						
	.dc.b	242				
						
	.dc.b	210				
	.dc.b	160				
	.dc.b	213				
						
	.dc.b	178				
						
	.dc.b	210				
	.dc.b	172				
	.dc.b	234				
						
	.dc.b	114				
						
	.dc.b	210				
	.dc.b	184				
	.dc.b	255				
						
	.dc.b	146				
						
	.dc.b	210				
	.dc.b	197				
	.dc.b	20				
						
	.dc.b	178				
						
	.dc.b	210				
	.dc.b	209				
	.dc.b	42				
						
	.dc.b	18				
						
	.dc.b	210				
	.dc.b	221				
	.dc.b	63				
						
	.dc.b	146				
						
	.dc.b	210				
	.dc.b	233				
	.dc.b	85				
						
	.dc.b	82				
						
	.dc.b	210				
	.dc.b	245				
	.dc.b	107				
						
	.dc.b	50				
						
	.dc.b	211				
	.dc.b	1				
	.dc.b	129				
						
	.dc.b	50				
						
	.dc.b	211				
	.dc.b	13				
	.dc.b	151				
						
	.dc.b	114				
						
	.dc.b	211				
	.dc.b	25				
	.dc.b	173				
						
	.dc.b	210				
						
	.dc.b	211				
	.dc.b	37				
	.dc.b	196				
						
	.dc.b	114				
						
	.dc.b	211				
	.dc.b	49				
	.dc.b	219				
						
	.dc.b	50				
						
	.dc.b	211				
	.dc.b	61				
	.dc.b	242				
						
	.dc.b	18				
						
	.dc.b	211				
	.dc.b	74				
	.dc.b	9				
						
	.dc.b	50				
						
	.dc.b	211				
	.dc.b	86				
	.dc.b	32				
						
	.dc.b	114				
						
	.dc.b	211				
	.dc.b	98				
	.dc.b	55				
						
	.dc.b	242				
						
	.dc.b	211				
	.dc.b	110				
	.dc.b	79				
						
	.dc.b	114				
						
	.dc.b	211				
	.dc.b	122				
	.dc.b	103				
						
	.dc.b	82				
						
	.dc.b	211				
	.dc.b	134				
	.dc.b	127				
						
	.dc.b	50				
						
	.dc.b	211				
	.dc.b	146				
	.dc.b	151				
						
	.dc.b	82				
						
	.dc.b	211				
	.dc.b	158				
	.dc.b	175				
						
	.dc.b	178				
						
	.dc.b	211				
	.dc.b	170				
	.dc.b	200				
						
	.dc.b	50				
						
	.dc.b	211				
	.dc.b	182				
	.dc.b	224				
						
	.dc.b	210				
						
	.dc.b	211				
	.dc.b	194				
	.dc.b	249				
						
	.dc.b	146				
						
	.dc.b	211				
	.dc.b	207				
	.dc.b	18				
						
	.dc.b	146				
						
	.dc.b	211				
	.dc.b	219				
	.dc.b	43				
						
	.dc.b	210				
						
	.dc.b	211				
	.dc.b	231				
	.dc.b	69				
						
	.dc.b	18				
						
	.dc.b	211				
	.dc.b	243				
	.dc.b	94				
						
	.dc.b	146				
						
	.dc.b	211				
	.dc.b	255				
	.dc.b	120				
						
	.dc.b	82				
						
	.dc.b	212				
	.dc.b	11				
	.dc.b	146				
						
	.dc.b	50				
						
	.dc.b	212				
	.dc.b	23				
	.dc.b	172				
						
	.dc.b	50				
						
	.dc.b	212				
	.dc.b	35				
	.dc.b	198				
						
	.dc.b	82				
						
	.dc.b	212				
	.dc.b	47				
	.dc.b	224				
						
	.dc.b	178				
						
	.dc.b	212				
	.dc.b	59				
	.dc.b	251				
						
	.dc.b	82				
						
	.dc.b	212				
	.dc.b	72				
	.dc.b	22				
						
	.dc.b	18				
						
	.dc.b	212				
	.dc.b	84				
	.dc.b	48				
						
	.dc.b	242				
						
	.dc.b	212				
	.dc.b	96				
	.dc.b	75				
						
	.dc.b	242				
						
	.dc.b	212				
	.dc.b	108				
	.dc.b	103				
						
	.dc.b	50				
						
	.dc.b	212				
	.dc.b	120				
	.dc.b	130				
						
	.dc.b	146				
						
	.dc.b	212				
	.dc.b	132				
	.dc.b	158				
						
	.dc.b	50				
						
	.dc.b	212				
	.dc.b	144				
	.dc.b	185				
						
	.dc.b	242				
						
	.dc.b	212				
	.dc.b	156				
	.dc.b	213				
						
	.dc.b	210				
						
	.dc.b	212				
	.dc.b	168				
	.dc.b	241				
						
	.dc.b	242				
						
	.dc.b	212				
	.dc.b	181				
	.dc.b	14				
						
	.dc.b	50				
						
	.dc.b	212				
	.dc.b	193				
	.dc.b	42				
						
	.dc.b	178				
						
	.dc.b	212				
	.dc.b	205				
	.dc.b	71				
						
	.dc.b	82				
						
	.dc.b	212				
	.dc.b	217				
	.dc.b	100				
						
	.dc.b	18				
						
	.dc.b	212				
	.dc.b	229				
	.dc.b	129				
						
	.dc.b	18				
						
	.dc.b	212				
	.dc.b	241				
	.dc.b	158				
						
	.dc.b	50				
						
	.dc.b	212				
	.dc.b	253				
	.dc.b	187				
						
	.dc.b	114				
						
	.dc.b	213				
	.dc.b	9				
	.dc.b	216				
						
	.dc.b	242				
						
	.dc.b	213				
	.dc.b	21				
	.dc.b	246				
						
	.dc.b	146				
						
	.dc.b	213				
	.dc.b	34				
	.dc.b	20				
						
	.dc.b	114				
						
	.dc.b	213				
	.dc.b	46				
	.dc.b	50				
						
	.dc.b	114				
						
	.dc.b	213				
	.dc.b	58				
	.dc.b	80				
						
	.dc.b	146				
						
	.dc.b	213				
	.dc.b	70				
	.dc.b	110				
						
	.dc.b	242				
						
	.dc.b	213				
	.dc.b	82				
	.dc.b	141				
						
	.dc.b	114				
						
	.dc.b	213				
	.dc.b	94				
	.dc.b	172				
						
	.dc.b	50				
						
	.dc.b	213				
	.dc.b	106				
	.dc.b	202				
						
	.dc.b	242				
						
	.dc.b	213				
	.dc.b	118				
	.dc.b	234				
						
	.dc.b	18				
						
	.dc.b	213				
	.dc.b	131				
	.dc.b	9				
						
	.dc.b	50				
						
	.dc.b	213				
	.dc.b	143				
	.dc.b	40				
						
	.dc.b	146				
						
	.dc.b	213				
	.dc.b	155				
	.dc.b	72				
						
	.dc.b	50				
						
	.dc.b	213				
	.dc.b	167				
	.dc.b	103				
						
	.dc.b	210				
						
	.dc.b	213				
	.dc.b	179				
	.dc.b	135				
						
	.dc.b	178				
						
	.dc.b	213				
	.dc.b	191				
	.dc.b	167				
						
	.dc.b	210				
						
	.dc.b	213				
	.dc.b	203				
	.dc.b	200				
						
	.dc.b	18				
						
	.dc.b	213				
	.dc.b	215				
	.dc.b	232				
						
	.dc.b	114				
						
	.dc.b	213				
	.dc.b	228				
	.dc.b	8				
						
	.dc.b	242				
						
	.dc.b	213				
	.dc.b	240				
	.dc.b	41				
						
	.dc.b	178				
						
	.dc.b	213				
	.dc.b	252				
	.dc.b	74				
						
	.dc.b	178				
						
	.dc.b	214				
	.dc.b	8				
	.dc.b	107				
						
	.dc.b	210				
						
	.dc.b	214				
	.dc.b	20				
	.dc.b	141				
						
	.dc.b	18				
						
	.dc.b	214				
	.dc.b	32				
	.dc.b	174				
						
	.dc.b	114				
						
	.dc.b	214				
	.dc.b	44				
	.dc.b	208				
						
	.dc.b	18				
						
	.dc.b	214				
	.dc.b	56				
	.dc.b	241				
						
	.dc.b	210				
						
	.dc.b	214				
	.dc.b	69				
	.dc.b	19				
						
	.dc.b	210				
						
	.dc.b	214				
	.dc.b	81				
	.dc.b	53				
						
	.dc.b	242				
						
	.dc.b	214				
	.dc.b	93				
	.dc.b	88				
						
	.dc.b	50				
						
	.dc.b	214				
	.dc.b	105				
	.dc.b	122				
						
	.dc.b	178				
						
	.dc.b	214				
	.dc.b	117				
	.dc.b	157				
						
	.dc.b	82				
						
	.dc.b	214				
	.dc.b	129				
	.dc.b	192				
						
	.dc.b	18				
						
	.dc.b	214				
	.dc.b	141				
	.dc.b	227				
						
	.dc.b	18				
						
	.dc.b	214				
	.dc.b	154				
	.dc.b	6				
						
	.dc.b	50				
						
	.dc.b	214				
	.dc.b	166				
	.dc.b	41				
						
	.dc.b	146				
						
	.dc.b	214				
	.dc.b	178				
	.dc.b	77				
						
	.dc.b	18				
						
	.dc.b	214				
	.dc.b	190				
	.dc.b	112				
						
	.dc.b	178				
						
	.dc.b	214				
	.dc.b	202				
	.dc.b	148				
						
	.dc.b	146				
						
	.dc.b	214				
	.dc.b	214				
	.dc.b	184				
						
	.dc.b	146				
						
	.dc.b	214				
	.dc.b	226				
	.dc.b	220				
						
	.dc.b	210				
						
	.dc.b	214				
	.dc.b	239				
	.dc.b	1				
						
	.dc.b	18				
						
	.dc.b	214				
	.dc.b	251				
	.dc.b	37				
						
	.dc.b	178				
						
	.dc.b	215				
	.dc.b	7				
	.dc.b	74				
						
	.dc.b	82				
						
	.dc.b	215				
	.dc.b	19				
	.dc.b	111				
						
	.dc.b	50				
						
	.dc.b	215				
	.dc.b	31				
	.dc.b	148				
						
	.dc.b	50				
						
	.dc.b	215				
	.dc.b	43				
	.dc.b	185				
						
	.dc.b	114				
						
	.dc.b	215				
	.dc.b	55				
	.dc.b	222				
						
	.dc.b	210				
						
	.dc.b	215				
	.dc.b	68				
	.dc.b	4				
						
	.dc.b	114				
						
	.dc.b	215				
	.dc.b	80				
	.dc.b	42				
						
	.dc.b	18				
						
	.dc.b	215				
	.dc.b	92				
	.dc.b	80				
						
	.dc.b	18				
						
	.dc.b	215				
	.dc.b	104				
	.dc.b	118				
						
	.dc.b	18				
						
	.dc.b	215				
	.dc.b	116				
	.dc.b	156				
						
	.dc.b	82				
						
	.dc.b	215				
	.dc.b	128				
	.dc.b	194				
						
	.dc.b	178				
						
	.dc.b	215				
	.dc.b	140				
	.dc.b	233				
						
	.dc.b	82				
						
	.dc.b	215				
	.dc.b	153				
	.dc.b	16				
						
	.dc.b	18				
						
	.dc.b	215				
	.dc.b	165				
	.dc.b	54				
						
	.dc.b	242				
						
	.dc.b	215				
	.dc.b	177				
	.dc.b	94				
						
	.dc.b	18				
						
	.dc.b	215				
	.dc.b	189				
	.dc.b	133				
						
	.dc.b	82				
						
	.dc.b	215				
	.dc.b	201				
	.dc.b	172				
						
	.dc.b	210				
						
	.dc.b	215				
	.dc.b	213				
	.dc.b	212				
						
	.dc.b	114				
						
	.dc.b	215				
	.dc.b	225				
	.dc.b	252				
						
	.dc.b	50				
						
	.dc.b	215				
	.dc.b	238				
	.dc.b	36				
						
	.dc.b	18				
						
	.dc.b	215				
	.dc.b	250				
	.dc.b	76				
						
	.dc.b	50				
						
	.dc.b	216				
	.dc.b	6				
	.dc.b	116				
						
	.dc.b	146				
						
	.dc.b	216				
	.dc.b	18				
	.dc.b	156				
						
	.dc.b	242				
						
	.dc.b	216				
	.dc.b	30				
	.dc.b	197				
						
	.dc.b	146				
						
	.dc.b	216				
	.dc.b	42				
	.dc.b	238				
						
	.dc.b	114				
						
	.dc.b	216				
	.dc.b	55				
	.dc.b	23				
						
	.dc.b	114				
						
	.dc.b	216				
	.dc.b	67				
	.dc.b	64				
						
	.dc.b	146				
						
	.dc.b	216				
	.dc.b	79				
	.dc.b	105				
						
	.dc.b	210				
						
	.dc.b	216				
	.dc.b	91				
	.dc.b	147				
						
	.dc.b	82				
						
	.dc.b	216				
	.dc.b	103				
	.dc.b	189				
						
	.dc.b	18				
						
	.dc.b	216				
	.dc.b	115				
	.dc.b	230				
						
	.dc.b	210				
						
	.dc.b	216				
	.dc.b	128				
	.dc.b	16				
						
	.dc.b	210				
						
	.dc.b	216				
	.dc.b	140				
	.dc.b	59				
						
	.dc.b	18				
						
	.dc.b	216				
	.dc.b	152				
	.dc.b	101				
						
	.dc.b	82				
						
	.dc.b	216				
	.dc.b	164				
	.dc.b	143				
						
	.dc.b	242				
						
	.dc.b	216				
	.dc.b	176				
	.dc.b	186				
						
	.dc.b	146				
						
	.dc.b	216				
	.dc.b	188				
	.dc.b	229				
						
	.dc.b	114				
						
	.dc.b	216				
	.dc.b	201				
	.dc.b	16				
						
	.dc.b	114				
						
	.dc.b	216				
	.dc.b	213				
	.dc.b	59				
						
	.dc.b	178				
						
	.dc.b	216				
	.dc.b	225				
	.dc.b	103				
						
	.dc.b	18				
						
	.dc.b	216				
	.dc.b	237				
	.dc.b	146				
						
	.dc.b	146				
						
	.dc.b	216				
	.dc.b	249				
	.dc.b	190				
						
	.dc.b	82				
						
	.dc.b	217				
	.dc.b	5				
	.dc.b	234				
						
	.dc.b	50				
						
	.dc.b	217				
	.dc.b	18				
	.dc.b	22				
						
	.dc.b	50				
						
	.dc.b	217				
	.dc.b	30				
	.dc.b	66				
						
	.dc.b	114				
						
	.dc.b	217				
	.dc.b	42				
	.dc.b	110				
						
	.dc.b	210				
						
	.dc.b	217				
	.dc.b	54				
	.dc.b	155				
						
	.dc.b	82				
						
	.dc.b	217				
	.dc.b	66				
	.dc.b	200				
						
	.dc.b	18				
						
	.dc.b	217				
	.dc.b	78				
	.dc.b	245				
						
	.dc.b	18				
						
	.dc.b	217				
	.dc.b	91				
	.dc.b	34				
						
	.dc.b	18				
						
	.dc.b	217				
	.dc.b	103				
	.dc.b	79				
						
	.dc.b	82				
						
	.dc.b	217				
	.dc.b	115				
	.dc.b	124				
						
	.dc.b	178				
						
	.dc.b	217				
	.dc.b	127				
	.dc.b	170				
						
	.dc.b	82				
						
	.dc.b	217				
	.dc.b	139				
	.dc.b	216				
						
	.dc.b	18				
						
	.dc.b	217				
	.dc.b	152				
	.dc.b	6				
						
	.dc.b	18				
						
	.dc.b	217				
	.dc.b	164				
	.dc.b	52				
						
	.dc.b	18				
						
	.dc.b	217				
	.dc.b	176				
	.dc.b	98				
						
	.dc.b	114				
						
	.dc.b	217				
	.dc.b	188				
	.dc.b	144				
						
	.dc.b	210				
						
	.dc.b	217				
	.dc.b	200				
	.dc.b	191				
						
	.dc.b	114				
						
	.dc.b	217				
	.dc.b	212				
	.dc.b	238				
						
	.dc.b	50				
						
	.dc.b	217				
	.dc.b	225				
	.dc.b	29				
						
	.dc.b	50				
						
	.dc.b	217				
	.dc.b	237				
	.dc.b	76				
						
	.dc.b	82				
						
	.dc.b	217				
	.dc.b	249				
	.dc.b	123				
						
	.dc.b	146				
						
	.dc.b	218				
	.dc.b	5				
	.dc.b	171				
						
	.dc.b	18				
						
	.dc.b	218				
	.dc.b	17				
	.dc.b	218				
						
	.dc.b	178				
						
	.dc.b	218				
	.dc.b	30				
	.dc.b	10				
						
	.dc.b	114				
						
	.dc.b	218				
	.dc.b	42				
	.dc.b	58				
						
	.dc.b	114				
						
	.dc.b	218				
	.dc.b	54				
	.dc.b	106				
						
	.dc.b	146				
						
	.dc.b	218				
	.dc.b	66				
	.dc.b	154				
						
	.dc.b	242				
						
	.dc.b	218				
	.dc.b	78				
	.dc.b	203				
						
	.dc.b	82				
						
	.dc.b	218				
	.dc.b	90				
	.dc.b	252				
						
	.dc.b	18				
						
	.dc.b	218				
	.dc.b	103				
	.dc.b	44				
						
	.dc.b	210				
						
	.dc.b	218				
	.dc.b	115				
	.dc.b	93				
						
	.dc.b	210				
						
	.dc.b	218				
	.dc.b	127				
	.dc.b	142				
						
	.dc.b	242				
						
	.dc.b	218				
	.dc.b	139				
	.dc.b	192				
						
	.dc.b	82				
						
	.dc.b	218				
	.dc.b	151				
	.dc.b	241				
						
	.dc.b	210				
						
	.dc.b	218				
	.dc.b	164				
	.dc.b	35				
						
	.dc.b	146				
						
	.dc.b	218				
	.dc.b	176				
	.dc.b	85				
						
	.dc.b	82				
						
	.dc.b	218				
	.dc.b	188				
	.dc.b	135				
						
	.dc.b	82				
						
	.dc.b	218				
	.dc.b	200				
	.dc.b	185				
						
	.dc.b	146				
						
	.dc.b	218				
	.dc.b	212				
	.dc.b	235				
						
	.dc.b	242				
						
	.dc.b	218				
	.dc.b	225				
	.dc.b	30				
						
	.dc.b	114				
						
	.dc.b	218				
	.dc.b	237				
	.dc.b	81				
						
	.dc.b	18				
						
	.dc.b	218				
	.dc.b	249				
	.dc.b	131				
						
	.dc.b	242				
						
	.dc.b	219				
	.dc.b	5				
	.dc.b	183				
						
	.dc.b	18				
						
	.dc.b	219				
	.dc.b	17				
	.dc.b	234				
						
	.dc.b	50				
						
	.dc.b	219				
	.dc.b	30				
	.dc.b	29				
						
	.dc.b	146				
						
	.dc.b	219				
	.dc.b	42				
	.dc.b	81				
						
	.dc.b	18				
						
	.dc.b	219				
	.dc.b	54				
	.dc.b	132				
						
	.dc.b	210				
						
	.dc.b	219				
	.dc.b	66				
	.dc.b	184				
						
	.dc.b	178				
						
	.dc.b	219				
	.dc.b	78				
	.dc.b	236				
						
	.dc.b	210				
						
	.dc.b	219				
	.dc.b	91				
	.dc.b	32				
						
	.dc.b	242				
						
	.dc.b	219				
	.dc.b	103				
	.dc.b	85				
						
	.dc.b	82				
						
	.dc.b	219				
	.dc.b	115				
	.dc.b	137				
						
	.dc.b	242				
						
	.dc.b	219				
	.dc.b	127				
	.dc.b	190				
						
	.dc.b	178				
						
	.dc.b	219				
	.dc.b	139				
	.dc.b	243				
						
	.dc.b	146				
						
	.dc.b	219				
	.dc.b	152				
	.dc.b	40				
						
	.dc.b	178				
						
	.dc.b	219				
	.dc.b	164				
	.dc.b	93				
						
	.dc.b	210				
						
	.dc.b	219				
	.dc.b	176				
	.dc.b	147				
						
	.dc.b	82				
						
	.dc.b	219				
	.dc.b	188				
	.dc.b	200				
						
	.dc.b	210				
						
	.dc.b	219				
	.dc.b	200				
	.dc.b	254				
						
	.dc.b	146				
						
	.dc.b	219				
	.dc.b	213				
	.dc.b	52				
						
	.dc.b	146				
						
	.dc.b	219				
	.dc.b	225				
	.dc.b	106				
						
	.dc.b	146				
						
	.dc.b	219				
	.dc.b	237				
	.dc.b	160				
						
	.dc.b	210				
						
	.dc.b	219				
	.dc.b	249				
	.dc.b	215				
						
	.dc.b	82				
						
	.dc.b	220				
	.dc.b	6				
	.dc.b	13				
						
	.dc.b	242				
						
	.dc.b	220				
	.dc.b	18				
	.dc.b	68				
						
	.dc.b	178				
						
	.dc.b	220				
	.dc.b	30				
	.dc.b	123				
						
	.dc.b	146				
						
	.dc.b	220				
	.dc.b	42				
	.dc.b	178				
						
	.dc.b	178				
						
	.dc.b	220				
	.dc.b	54				
	.dc.b	233				
						
	.dc.b	242				
						
	.dc.b	220				
	.dc.b	67				
	.dc.b	33				
						
	.dc.b	114				
						
	.dc.b	220				
	.dc.b	79				
	.dc.b	89				
						
	.dc.b	18				
						
	.dc.b	220				
	.dc.b	91				
	.dc.b	144				
						
	.dc.b	210				
						
	.dc.b	220				
	.dc.b	103				
	.dc.b	200				
						
	.dc.b	210				
						
	.dc.b	220				
	.dc.b	116				
	.dc.b	0				
						
	.dc.b	242				
						
	.dc.b	220				
	.dc.b	128				
	.dc.b	57				
						
	.dc.b	50				
						
	.dc.b	220				
	.dc.b	140				
	.dc.b	113				
						
	.dc.b	178				
						
	.dc.b	220				
	.dc.b	152				
	.dc.b	170				
						
	.dc.b	82				
						
	.dc.b	220				
	.dc.b	164				
	.dc.b	227				
						
	.dc.b	18				
						
	.dc.b	220				
	.dc.b	177				
	.dc.b	28				
						
	.dc.b	18				
						
	.dc.b	220				
	.dc.b	189				
	.dc.b	85				
						
	.dc.b	50				
						
	.dc.b	220				
	.dc.b	201				
	.dc.b	142				
						
	.dc.b	114				
						
	.dc.b	220				
	.dc.b	213				
	.dc.b	199				
						
	.dc.b	242				
						
	.dc.b	220				
	.dc.b	226				
	.dc.b	1				
						
	.dc.b	146				
						
	.dc.b	220				
	.dc.b	238				
	.dc.b	59				
						
	.dc.b	114				
						
	.dc.b	220				
	.dc.b	250				
	.dc.b	117				
						
	.dc.b	114				
						
	.dc.b	221				
	.dc.b	6				
	.dc.b	175				
						
	.dc.b	146				
						
	.dc.b	221				
	.dc.b	18				
	.dc.b	233				
						
	.dc.b	210				
						
	.dc.b	221				
	.dc.b	31				
	.dc.b	36				
						
	.dc.b	82				
						
	.dc.b	221				
	.dc.b	43				
	.dc.b	95				
						
	.dc.b	18				
						
	.dc.b	221				
	.dc.b	55				
	.dc.b	153				
						
	.dc.b	210				
						
	.dc.b	221				
	.dc.b	67				
	.dc.b	212				
						
	.dc.b	210				
						
	.dc.b	221				
	.dc.b	80				
	.dc.b	15				
						
	.dc.b	242				
						
	.dc.b	221				
	.dc.b	92				
	.dc.b	75				
						
	.dc.b	82				
						
	.dc.b	221				
	.dc.b	104				
	.dc.b	134				
						
	.dc.b	210				
						
	.dc.b	221				
	.dc.b	116				
	.dc.b	194				
						
	.dc.b	146				
						
	.dc.b	221				
	.dc.b	128				
	.dc.b	254				
						
	.dc.b	82				
						
	.dc.b	221				
	.dc.b	141				
	.dc.b	58				
						
	.dc.b	82				
						
	.dc.b	221				
	.dc.b	153				
	.dc.b	118				
						
	.dc.b	146				
						
	.dc.b	221				
	.dc.b	165				
	.dc.b	178				
						
	.dc.b	242				
						
	.dc.b	221				
	.dc.b	177				
	.dc.b	239				
						
	.dc.b	114				
						
	.dc.b	221				
	.dc.b	190				
	.dc.b	44				
						
	.dc.b	18				
						
	.dc.b	221				
	.dc.b	202				
	.dc.b	104				
						
	.dc.b	242				
						
	.dc.b	221				
	.dc.b	214				
	.dc.b	165				
						
	.dc.b	242				
						
	.dc.b	221				
	.dc.b	226				
	.dc.b	227				
						
	.dc.b	50				
						
	.dc.b	221				
	.dc.b	239				
	.dc.b	32				
						
	.dc.b	146				
						
	.dc.b	221				
	.dc.b	251				
	.dc.b	94				
						
	.dc.b	18				
						
	.dc.b	222				
	.dc.b	7				
	.dc.b	155				
						
	.dc.b	210				
						
	.dc.b	222				
	.dc.b	19				
	.dc.b	217				
						
	.dc.b	146				
						
	.dc.b	222				
	.dc.b	32				
	.dc.b	23				
						
	.dc.b	178				
						
	.dc.b	222				
	.dc.b	44				
	.dc.b	85				
						
	.dc.b	210				
						
	.dc.b	222				
	.dc.b	56				
	.dc.b	148				
						
	.dc.b	50				
						
	.dc.b	222				
	.dc.b	68				
	.dc.b	210				
						
	.dc.b	210				
						
	.dc.b	222				
	.dc.b	81				
	.dc.b	17				
						
	.dc.b	114				
						
	.dc.b	222				
	.dc.b	93				
	.dc.b	80				
						
	.dc.b	82				
						
	.dc.b	222				
	.dc.b	105				
	.dc.b	143				
						
	.dc.b	114				
						
	.dc.b	222				
	.dc.b	117				
	.dc.b	206				
						
	.dc.b	178				
						
	.dc.b	222				
	.dc.b	130				
	.dc.b	14				
						
	.dc.b	18				
						
	.dc.b	222				
	.dc.b	142				
	.dc.b	77				
						
	.dc.b	146				
						
	.dc.b	222				
	.dc.b	154				
	.dc.b	141				
						
	.dc.b	82				
						
	.dc.b	222				
	.dc.b	166				
	.dc.b	205				
						
	.dc.b	50				
						
	.dc.b	222				
	.dc.b	179				
	.dc.b	13				
						
	.dc.b	50				
						
	.dc.b	222				
	.dc.b	191				
	.dc.b	77				
						
	.dc.b	114				
						
	.dc.b	222				
	.dc.b	203				
	.dc.b	141				
						
	.dc.b	210				
						
	.dc.b	222				
	.dc.b	215				
	.dc.b	206				
						
	.dc.b	114				
						
	.dc.b	222				
	.dc.b	228				
	.dc.b	15				
						
	.dc.b	50				
						
	.dc.b	222				
	.dc.b	240				
	.dc.b	80				
						
	.dc.b	18				
						
	.dc.b	222				
	.dc.b	252				
	.dc.b	145				
						
	.dc.b	50				
						
	.dc.b	223				
	.dc.b	8				
	.dc.b	210				
						
	.dc.b	114				
						
	.dc.b	223				
	.dc.b	21				
	.dc.b	19				
						
	.dc.b	210				
						
	.dc.b	223				
	.dc.b	33				
	.dc.b	85				
						
	.dc.b	82				
						
	.dc.b	223				
	.dc.b	45				
	.dc.b	151				
						
	.dc.b	18				
						
	.dc.b	223				
	.dc.b	57				
	.dc.b	217				
						
	.dc.b	18				
						
	.dc.b	223				
	.dc.b	70				
	.dc.b	27				
						
	.dc.b	18				
						
	.dc.b	223				
	.dc.b	82				
	.dc.b	93				
						
	.dc.b	82				
						
	.dc.b	223				
	.dc.b	94				
	.dc.b	159				
						
	.dc.b	210				
						
	.dc.b	223				
	.dc.b	106				
	.dc.b	226				
						
	.dc.b	82				
						
	.dc.b	223				
	.dc.b	119				
	.dc.b	37				
						
	.dc.b	18				
						
	.dc.b	223				
	.dc.b	131				
	.dc.b	104				
						
	.dc.b	18				
						
	.dc.b	223				
	.dc.b	143				
	.dc.b	171				
						
	.dc.b	18				
						
	.dc.b	223				
	.dc.b	155				
	.dc.b	238				
						
	.dc.b	82				
						
	.dc.b	223				
	.dc.b	168				
	.dc.b	49				
						
	.dc.b	210				
						
	.dc.b	223				
	.dc.b	180				
	.dc.b	117				
						
	.dc.b	114				
						
	.dc.b	223				
	.dc.b	192				
	.dc.b	185				
						
	.dc.b	50				
						
	.dc.b	223				
	.dc.b	204				
	.dc.b	253				
						
	.dc.b	18				
						
	.dc.b	223				
	.dc.b	217				
	.dc.b	65				
						
	.dc.b	50				
						
	.dc.b	223				
	.dc.b	229				
	.dc.b	133				
						
	.dc.b	114				
						
	.dc.b	223				
	.dc.b	241				
	.dc.b	201				
						
	.dc.b	242				
						
	.dc.b	223				
	.dc.b	254				
	.dc.b	14				
						
	.dc.b	114				
						
	.dc.b	224				
	.dc.b	10				
	.dc.b	83				
						
	.dc.b	82				
						
	.dc.b	224				
	.dc.b	22				
	.dc.b	152				
						
	.dc.b	50				
						
	.dc.b	224				
	.dc.b	34				
	.dc.b	221				
						
	.dc.b	82				
						
	.dc.b	224				
	.dc.b	47				
	.dc.b	34				
						
	.dc.b	146				
						
	.dc.b	224				
	.dc.b	59				
	.dc.b	104				
						
	.dc.b	18				
						
	.dc.b	224				
	.dc.b	71				
	.dc.b	173				
						
	.dc.b	146				
						
	.dc.b	224				
	.dc.b	83				
	.dc.b	243				
						
	.dc.b	114				
						
	.dc.b	224				
	.dc.b	96				
	.dc.b	57				
						
	.dc.b	82				
						
	.dc.b	224				
	.dc.b	108				
	.dc.b	127				
						
	.dc.b	114				
						
	.dc.b	224				
	.dc.b	120				
	.dc.b	197				
						
	.dc.b	178				
						
	.dc.b	224				
	.dc.b	133				
	.dc.b	12				
						
	.dc.b	50				
						
	.dc.b	224				
	.dc.b	145				
	.dc.b	82				
						
	.dc.b	210				
						
	.dc.b	224				
	.dc.b	157				
	.dc.b	153				
						
	.dc.b	146				
						
	.dc.b	224				
	.dc.b	169				
	.dc.b	224				
						
	.dc.b	146				
						
	.dc.b	224				
	.dc.b	182				
	.dc.b	39				
						
	.dc.b	178				
						
	.dc.b	224				
	.dc.b	194				
	.dc.b	110				
						
	.dc.b	242				
						
	.dc.b	224				
	.dc.b	206				
	.dc.b	182				
						
	.dc.b	114				
						
	.dc.b	224				
	.dc.b	218				
	.dc.b	254				
						
	.dc.b	18				
						
	.dc.b	224				
	.dc.b	231				
	.dc.b	69				
						
	.dc.b	210				
						
	.dc.b	224				
	.dc.b	243				
	.dc.b	141				
						
	.dc.b	210				
						
	.dc.b	224				
	.dc.b	255				
	.dc.b	213				
						
	.dc.b	242				
						
	.dc.b	225				
	.dc.b	12				
	.dc.b	30				
						
	.dc.b	50				
						
	.dc.b	225				
	.dc.b	24				
	.dc.b	102				
						
	.dc.b	178				
						
	.dc.b	225				
	.dc.b	36				
	.dc.b	175				
						
	.dc.b	82				
						
	.dc.b	225				
	.dc.b	48				
	.dc.b	248				
						
	.dc.b	18				
						
	.dc.b	225				
	.dc.b	61				
	.dc.b	65				
						
	.dc.b	18				
						
	.dc.b	225				
	.dc.b	73				
	.dc.b	138				
						
	.dc.b	50				
						
	.dc.b	225				
	.dc.b	85				
	.dc.b	211				
						
	.dc.b	114				
						
	.dc.b	225				
	.dc.b	98				
	.dc.b	28				
						
	.dc.b	242				
						
	.dc.b	225				
	.dc.b	110				
	.dc.b	102				
						
	.dc.b	146				
						
	.dc.b	225				
	.dc.b	122				
	.dc.b	176				
						
	.dc.b	114				
						
	.dc.b	225				
	.dc.b	134				
	.dc.b	250				
						
	.dc.b	82				
						
	.dc.b	225				
	.dc.b	147				
	.dc.b	68				
						
	.dc.b	114				
						
	.dc.b	225				
	.dc.b	159				
	.dc.b	142				
						
	.dc.b	210				
						
	.dc.b	225				
	.dc.b	171				
	.dc.b	217				
						
	.dc.b	82				
						
	.dc.b	225				
	.dc.b	184				
	.dc.b	35				
						
	.dc.b	242				
						
	.dc.b	225				
	.dc.b	196				
	.dc.b	110				
						
	.dc.b	178				
						
	.dc.b	225				
	.dc.b	208				
	.dc.b	185				
						
	.dc.b	178				
						
	.dc.b	225				
	.dc.b	221				
	.dc.b	4				
						
	.dc.b	210				
						
	.dc.b	225				
	.dc.b	233				
	.dc.b	80				
						
	.dc.b	18				
						
	.dc.b	225				
	.dc.b	245				
	.dc.b	155				
						
	.dc.b	146				
						
	.dc.b	226				
	.dc.b	1				
	.dc.b	231				
						
	.dc.b	50				
						
	.dc.b	226				
	.dc.b	14				
	.dc.b	51				
						
	.dc.b	18				
						
	.dc.b	226				
	.dc.b	26				
	.dc.b	127				
						
	.dc.b	18				
						
	.dc.b	226				
	.dc.b	38				
	.dc.b	203				
						
	.dc.b	50				
						
	.dc.b	226				
	.dc.b	51				
	.dc.b	23				
						
	.dc.b	114				
						
	.dc.b	226				
	.dc.b	63				
	.dc.b	99				
						
	.dc.b	242				
						
	.dc.b	226				
	.dc.b	75				
	.dc.b	176				
						
	.dc.b	146				
						
	.dc.b	226				
	.dc.b	87				
	.dc.b	253				
						
	.dc.b	114				
						
	.dc.b	226				
	.dc.b	100				
	.dc.b	74				
						
	.dc.b	114				
						
	.dc.b	226				
	.dc.b	112				
	.dc.b	151				
						
	.dc.b	146				
						
	.dc.b	226				
	.dc.b	124				
	.dc.b	228				
						
	.dc.b	210				
						
	.dc.b	226				
	.dc.b	137				
	.dc.b	50				
						
	.dc.b	82				
						
	.dc.b	226				
	.dc.b	149				
	.dc.b	127				
						
	.dc.b	242				
						
	.dc.b	226				
	.dc.b	161				
	.dc.b	205				
						
	.dc.b	210				
						
	.dc.b	226				
	.dc.b	174				
	.dc.b	27				
						
	.dc.b	210				
						
	.dc.b	226				
	.dc.b	186				
	.dc.b	105				
						
	.dc.b	242				
						
	.dc.b	226				
	.dc.b	198				
	.dc.b	184				
						
	.dc.b	50				
						
	.dc.b	226				
	.dc.b	211				
	.dc.b	6				
						
	.dc.b	178				
						
	.dc.b	226				
	.dc.b	223				
	.dc.b	85				
						
	.dc.b	82				
						
	.dc.b	226				
	.dc.b	235				
	.dc.b	164				
						
	.dc.b	50				
						
	.dc.b	226				
	.dc.b	247				
	.dc.b	243				
						
	.dc.b	50				
						
	.dc.b	227				
	.dc.b	4				
	.dc.b	66				
						
	.dc.b	82				
						
	.dc.b	227				
	.dc.b	16				
	.dc.b	145				
						
	.dc.b	178				
						
	.dc.b	227				
	.dc.b	28				
	.dc.b	225				
						
	.dc.b	50				
						
	.dc.b	227				
	.dc.b	41				
	.dc.b	48				
						
	.dc.b	210				
						
	.dc.b	227				
	.dc.b	53				
	.dc.b	128				
						
	.dc.b	146				
						
	.dc.b	227				
	.dc.b	65				
	.dc.b	208				
						
	.dc.b	146				
						
	.dc.b	227				
	.dc.b	78				
	.dc.b	32				
						
	.dc.b	178				
						
	.dc.b	227				
	.dc.b	90				
	.dc.b	113				
						
	.dc.b	18				
						
	.dc.b	227				
	.dc.b	102				
	.dc.b	193				
						
	.dc.b	146				
						
	.dc.b	227				
	.dc.b	115				
	.dc.b	18				
						
	.dc.b	50				
						
	.dc.b	227				
	.dc.b	127				
	.dc.b	99				
						
	.dc.b	18				
						
	.dc.b	227				
	.dc.b	139				
	.dc.b	179				
						
	.dc.b	242				
						
	.dc.b	227				
	.dc.b	152				
	.dc.b	5				
						
	.dc.b	50				
						
	.dc.b	227				
	.dc.b	164				
	.dc.b	86				
						
	.dc.b	114				
						
	.dc.b	227				
	.dc.b	176				
	.dc.b	167				
						
	.dc.b	242				
						
	.dc.b	227				
	.dc.b	188				
	.dc.b	249				
						
	.dc.b	146				
						
	.dc.b	227				
	.dc.b	201				
	.dc.b	75				
						
	.dc.b	114				
						
	.dc.b	227				
	.dc.b	213				
	.dc.b	157				
						
	.dc.b	114				
						
	.dc.b	227				
	.dc.b	225				
	.dc.b	239				
						
	.dc.b	146				
						
	.dc.b	227				
	.dc.b	238				
	.dc.b	65				
						
	.dc.b	210				
						
	.dc.b	227				
	.dc.b	250				
	.dc.b	148				
						
	.dc.b	82				
						
	.dc.b	228				
	.dc.b	6				
	.dc.b	230				
						
	.dc.b	242				
						
	.dc.b	228				
	.dc.b	19				
	.dc.b	57				
						
	.dc.b	210				
						
	.dc.b	228				
	.dc.b	31				
	.dc.b	140				
						
	.dc.b	210				
						
	.dc.b	228				
	.dc.b	43				
	.dc.b	223				
						
	.dc.b	242				
						
	.dc.b	228				
	.dc.b	56				
	.dc.b	51				
						
	.dc.b	82				
						
	.dc.b	228				
	.dc.b	68				
	.dc.b	134				
						
	.dc.b	210				
						
	.dc.b	228				
	.dc.b	80				
	.dc.b	218				
						
	.dc.b	114				
						
	.dc.b	228				
	.dc.b	93				
	.dc.b	46				
						
	.dc.b	50				
						
	.dc.b	228				
	.dc.b	105				
	.dc.b	130				
						
	.dc.b	50				
						
	.dc.b	228				
	.dc.b	117				
	.dc.b	214				
						
	.dc.b	82				
						
	.dc.b	228				
	.dc.b	130				
	.dc.b	42				
						
	.dc.b	178				
						
	.dc.b	228				
	.dc.b	142				
	.dc.b	127				
						
	.dc.b	50				
						
	.dc.b	228				
	.dc.b	154				
	.dc.b	211				
						
	.dc.b	210				
						
	.dc.b	228				
	.dc.b	167				
	.dc.b	40				
						
	.dc.b	146				
						
	.dc.b	228				
	.dc.b	179				
	.dc.b	125				
						
	.dc.b	146				
						
	.dc.b	228				
	.dc.b	191				
	.dc.b	210				
						
	.dc.b	178				
						
	.dc.b	228				
	.dc.b	204				
	.dc.b	40				
						
	.dc.b	18				
						
	.dc.b	228				
	.dc.b	216				
	.dc.b	125				
						
	.dc.b	146				
						
	.dc.b	228				
	.dc.b	228				
	.dc.b	211				
						
	.dc.b	50				
						
	.dc.b	228				
	.dc.b	241				
	.dc.b	40				
						
	.dc.b	242				
						
	.dc.b	228				
	.dc.b	253				
	.dc.b	126				
						
	.dc.b	242				
						
	.dc.b	229				
	.dc.b	9				
	.dc.b	213				
						
	.dc.b	18				
						
	.dc.b	229				
	.dc.b	22				
	.dc.b	43				
						
	.dc.b	114				
						
	.dc.b	229				
	.dc.b	34				
	.dc.b	129				
						
	.dc.b	242				
						
	.dc.b	229				
	.dc.b	46				
	.dc.b	216				
						
	.dc.b	146				
						
	.dc.b	229				
	.dc.b	59				
	.dc.b	47				
						
	.dc.b	82				
						
	.dc.b	229				
	.dc.b	71				
	.dc.b	134				
						
	.dc.b	82				
						
	.dc.b	229				
	.dc.b	83				
	.dc.b	221				
						
	.dc.b	114				
						
	.dc.b	229				
	.dc.b	96				
	.dc.b	52				
						
	.dc.b	210				
						
	.dc.b	229				
	.dc.b	108				
	.dc.b	140				
						
	.dc.b	50				
						
	.dc.b	229				
	.dc.b	120				
	.dc.b	227				
						
	.dc.b	210				
						
	.dc.b	229				
	.dc.b	133				
	.dc.b	59				
						
	.dc.b	178				
						
	.dc.b	229				
	.dc.b	145				
	.dc.b	147				
						
	.dc.b	178				
						
	.dc.b	229				
	.dc.b	157				
	.dc.b	235				
						
	.dc.b	210				
						
	.dc.b	229				
	.dc.b	170				
	.dc.b	68				
						
	.dc.b	18				
						
	.dc.b	229				
	.dc.b	182				
	.dc.b	156				
						
	.dc.b	146				
						
	.dc.b	229				
	.dc.b	194				
	.dc.b	245				
						
	.dc.b	50				
						
	.dc.b	229				
	.dc.b	207				
	.dc.b	77				
						
	.dc.b	242				
						
	.dc.b	229				
	.dc.b	219				
	.dc.b	166				
						
	.dc.b	242				
						
	.dc.b	229				
	.dc.b	232				
	.dc.b	0				
						
	.dc.b	18				
						
	.dc.b	229				
	.dc.b	244				
	.dc.b	89				
						
	.dc.b	82				
						
	.dc.b	230				
	.dc.b	0				
	.dc.b	178				
						
	.dc.b	210				
						
	.dc.b	230				
	.dc.b	13				
	.dc.b	12				
						
	.dc.b	114				
						
	.dc.b	230				
	.dc.b	25				
	.dc.b	102				
						
	.dc.b	82				
						
	.dc.b	230				
	.dc.b	37				
	.dc.b	192				
						
	.dc.b	50				
						
	.dc.b	230				
	.dc.b	50				
	.dc.b	26				
						
	.dc.b	82				
						
	.dc.b	230				
	.dc.b	62				
	.dc.b	116				
						
	.dc.b	178				
						
	.dc.b	230				
	.dc.b	74				
	.dc.b	207				
						
	.dc.b	18				
						
	.dc.b	230				
	.dc.b	87				
	.dc.b	41				
						
	.dc.b	178				
						
	.dc.b	230				
	.dc.b	99				
	.dc.b	132				
						
	.dc.b	114				
						
	.dc.b	230				
	.dc.b	111				
	.dc.b	223				
						
	.dc.b	114				
						
	.dc.b	230				
	.dc.b	124				
	.dc.b	58				
						
	.dc.b	146				
						
	.dc.b	230				
	.dc.b	136				
	.dc.b	149				
						
	.dc.b	210				
						
	.dc.b	230				
	.dc.b	148				
	.dc.b	241				
						
	.dc.b	82				
						
	.dc.b	230				
	.dc.b	161				
	.dc.b	76				
						
	.dc.b	242				
						
	.dc.b	230				
	.dc.b	173				
	.dc.b	168				
						
	.dc.b	178				
						
	.dc.b	230				
	.dc.b	186				
	.dc.b	4				
						
	.dc.b	178				
						
	.dc.b	230				
	.dc.b	198				
	.dc.b	96				
						
	.dc.b	210				
						
	.dc.b	230				
	.dc.b	210				
	.dc.b	189				
						
	.dc.b	18				
						
	.dc.b	230				
	.dc.b	223				
	.dc.b	25				
						
	.dc.b	114				
						
	.dc.b	230				
	.dc.b	235				
	.dc.b	118				
						
	.dc.b	18				
						
	.dc.b	230				
	.dc.b	247				
	.dc.b	210				
						
	.dc.b	210				
						
	.dc.b	231				
	.dc.b	4				
	.dc.b	47				
						
	.dc.b	210				
						
	.dc.b	231				
	.dc.b	16				
	.dc.b	140				
						
	.dc.b	242				
						
	.dc.b	231				
	.dc.b	28				
	.dc.b	234				
						
	.dc.b	50				
						
	.dc.b	231				
	.dc.b	41				
	.dc.b	71				
						
	.dc.b	178				
						
	.dc.b	231				
	.dc.b	53				
	.dc.b	165				
						
	.dc.b	50				
						
	.dc.b	231				
	.dc.b	66				
	.dc.b	2				
						
	.dc.b	242				
						
	.dc.b	231				
	.dc.b	78				
	.dc.b	96				
						
	.dc.b	242				
						
	.dc.b	231				
	.dc.b	90				
	.dc.b	191				
						
	.dc.b	18				
						
	.dc.b	231				
	.dc.b	103				
	.dc.b	29				
						
	.dc.b	82				
						
	.dc.b	231				
	.dc.b	115				
	.dc.b	123				
						
	.dc.b	178				
						
	.dc.b	231				
	.dc.b	127				
	.dc.b	218				
						
	.dc.b	82				
						
	.dc.b	231				
	.dc.b	140				
	.dc.b	57				
						
	.dc.b	18				
						
	.dc.b	231				
	.dc.b	152				
	.dc.b	151				
						
	.dc.b	242				
						
	.dc.b	231				
	.dc.b	164				
	.dc.b	247				
						
	.dc.b	18				
						
	.dc.b	231				
	.dc.b	177				
	.dc.b	86				
						
	.dc.b	82				
						
	.dc.b	231				
	.dc.b	189				
	.dc.b	181				
						
	.dc.b	210				
						
	.dc.b	231				
	.dc.b	202				
	.dc.b	21				
						
	.dc.b	82				
						
	.dc.b	231				
	.dc.b	214				
	.dc.b	117				
						
	.dc.b	18				
						
	.dc.b	231				
	.dc.b	226				
	.dc.b	213				
						
	.dc.b	18				
						
	.dc.b	231				
	.dc.b	239				
	.dc.b	53				
						
	.dc.b	18				
						
	.dc.b	231				
	.dc.b	251				
	.dc.b	149				
						
	.dc.b	82				
						
	.dc.b	232				
	.dc.b	7				
	.dc.b	245				
						
	.dc.b	178				
						
	.dc.b	232				
	.dc.b	20				
	.dc.b	86				
						
	.dc.b	82				
						
	.dc.b	232				
	.dc.b	32				
	.dc.b	183				
						
	.dc.b	18				
						
	.dc.b	232				
	.dc.b	45				
	.dc.b	23				
						
	.dc.b	242				
						
	.dc.b	232				
	.dc.b	57				
	.dc.b	121				
						
	.dc.b	18				
						
	.dc.b	232				
	.dc.b	69				
	.dc.b	218				
						
	.dc.b	82				
						
	.dc.b	232				
	.dc.b	82				
	.dc.b	59				
						
	.dc.b	178				
						
	.dc.b	232				
	.dc.b	94				
	.dc.b	157				
						
	.dc.b	50				
						
	.dc.b	232				
	.dc.b	106				
	.dc.b	254				
						
	.dc.b	242				
						
	.dc.b	232				
	.dc.b	119				
	.dc.b	96				
						
	.dc.b	210				
						
	.dc.b	232				
	.dc.b	131				
	.dc.b	194				
						
	.dc.b	242				
						
	.dc.b	232				
	.dc.b	144				
	.dc.b	37				
						
	.dc.b	50				
						
	.dc.b	232				
	.dc.b	156				
	.dc.b	135				
						
	.dc.b	146				
						
	.dc.b	232				
	.dc.b	168				
	.dc.b	234				
						
	.dc.b	18				
						
	.dc.b	232				
	.dc.b	181				
	.dc.b	76				
						
	.dc.b	210				
						
	.dc.b	232				
	.dc.b	193				
	.dc.b	175				
						
	.dc.b	178				
						
	.dc.b	232				
	.dc.b	206				
	.dc.b	18				
						
	.dc.b	178				
						
	.dc.b	232				
	.dc.b	218				
	.dc.b	117				
						
	.dc.b	242				
						
	.dc.b	232				
	.dc.b	230				
	.dc.b	217				
						
	.dc.b	82				
						
	.dc.b	232				
	.dc.b	243				
	.dc.b	60				
						
	.dc.b	242				
						
	.dc.b	232				
	.dc.b	255				
	.dc.b	160				
						
	.dc.b	146				
						
	.dc.b	233				
	.dc.b	12				
	.dc.b	4				
						
	.dc.b	114				
						
	.dc.b	233				
	.dc.b	24				
	.dc.b	104				
						
	.dc.b	146				
						
	.dc.b	233				
	.dc.b	36				
	.dc.b	204				
						
	.dc.b	178				
						
	.dc.b	233				
	.dc.b	49				
	.dc.b	49				
						
	.dc.b	18				
						
	.dc.b	233				
	.dc.b	61				
	.dc.b	149				
						
	.dc.b	146				
						
	.dc.b	233				
	.dc.b	73				
	.dc.b	250				
						
	.dc.b	82				
						
	.dc.b	233				
	.dc.b	86				
	.dc.b	95				
						
	.dc.b	50				
						
	.dc.b	233				
	.dc.b	98				
	.dc.b	196				
						
	.dc.b	50				
						
	.dc.b	233				
	.dc.b	111				
	.dc.b	41				
						
	.dc.b	114				
						
	.dc.b	233				
	.dc.b	123				
	.dc.b	142				
						
	.dc.b	178				
						
	.dc.b	233				
	.dc.b	135				
	.dc.b	244				
						
	.dc.b	50				
						
	.dc.b	233				
	.dc.b	148				
	.dc.b	89				
						
	.dc.b	242				
						
	.dc.b	233				
	.dc.b	160				
	.dc.b	191				
						
	.dc.b	210				
						
	.dc.b	233				
	.dc.b	173				
	.dc.b	37				
						
	.dc.b	210				
						
	.dc.b	233				
	.dc.b	185				
	.dc.b	139				
						
	.dc.b	242				
						
	.dc.b	233				
	.dc.b	197				
	.dc.b	242				
						
	.dc.b	82				
						
	.dc.b	233				
	.dc.b	210				
	.dc.b	88				
						
	.dc.b	210				
						
	.dc.b	233				
	.dc.b	222				
	.dc.b	191				
						
	.dc.b	114				
						
	.dc.b	233				
	.dc.b	235				
	.dc.b	38				
						
	.dc.b	82				
						
	.dc.b	233				
	.dc.b	247				
	.dc.b	141				
						
	.dc.b	82				
						
	.dc.b	234				
	.dc.b	3				
	.dc.b	244				
						
	.dc.b	114				
						
	.dc.b	234				
	.dc.b	16				
	.dc.b	91				
						
	.dc.b	210				
						
	.dc.b	234				
	.dc.b	28				
	.dc.b	195				
						
	.dc.b	82				
						
	.dc.b	234				
	.dc.b	41				
	.dc.b	42				
						
	.dc.b	242				
						
	.dc.b	234				
	.dc.b	53				
	.dc.b	146				
						
	.dc.b	210				
						
	.dc.b	234				
	.dc.b	65				
	.dc.b	250				
						
	.dc.b	210				
						
	.dc.b	234				
	.dc.b	78				
	.dc.b	98				
						
	.dc.b	242				
						
	.dc.b	234				
	.dc.b	90				
	.dc.b	203				
						
	.dc.b	50				
						
	.dc.b	234				
	.dc.b	103				
	.dc.b	51				
						
	.dc.b	178				
						
	.dc.b	234				
	.dc.b	115				
	.dc.b	156				
						
	.dc.b	82				
						
	.dc.b	234				
	.dc.b	128				
	.dc.b	5				
						
	.dc.b	50				
						
	.dc.b	234				
	.dc.b	140				
	.dc.b	110				
						
	.dc.b	50				
						
	.dc.b	234				
	.dc.b	152				
	.dc.b	215				
						
	.dc.b	82				
						
	.dc.b	234				
	.dc.b	165				
	.dc.b	64				
						
	.dc.b	146				
						
	.dc.b	234				
	.dc.b	177				
	.dc.b	170				
						
	.dc.b	18				
						
	.dc.b	234				
	.dc.b	190				
	.dc.b	19				
						
	.dc.b	178				
						
	.dc.b	234				
	.dc.b	202				
	.dc.b	125				
						
	.dc.b	114				
						
	.dc.b	234				
	.dc.b	214				
	.dc.b	231				
						
	.dc.b	114				
						
	.dc.b	234				
	.dc.b	227				
	.dc.b	81				
						
	.dc.b	146				
						
	.dc.b	234				
	.dc.b	239				
	.dc.b	187				
						
	.dc.b	210				
						
	.dc.b	234				
	.dc.b	252				
	.dc.b	38				
						
	.dc.b	50				
						
	.dc.b	235				
	.dc.b	8				
	.dc.b	144				
						
	.dc.b	210				
						
	.dc.b	235				
	.dc.b	20				
	.dc.b	251				
						
	.dc.b	178				
						
	.dc.b	235				
	.dc.b	33				
	.dc.b	102				
						
	.dc.b	146				
						
	.dc.b	235				
	.dc.b	45				
	.dc.b	209				
						
	.dc.b	178				
						
	.dc.b	235				
	.dc.b	58				
	.dc.b	60				
						
	.dc.b	242				
						
	.dc.b	235				
	.dc.b	70				
	.dc.b	168				
						
	.dc.b	82				
						
	.dc.b	235				
	.dc.b	83				
	.dc.b	19				
						
	.dc.b	242				
						
	.dc.b	235				
	.dc.b	95				
	.dc.b	127				
						
	.dc.b	178				
						
	.dc.b	235				
	.dc.b	107				
	.dc.b	235				
						
	.dc.b	178				
						
	.dc.b	235				
	.dc.b	120				
	.dc.b	87				
						
	.dc.b	178				
						
	.dc.b	235				
	.dc.b	132				
	.dc.b	195				
						
	.dc.b	242				
						
	.dc.b	235				
	.dc.b	145				
	.dc.b	48				
						
	.dc.b	114				
						
	.dc.b	235				
	.dc.b	157				
	.dc.b	156				
						
	.dc.b	242				
						
	.dc.b	235				
	.dc.b	170				
	.dc.b	9				
						
	.dc.b	178				
						
	.dc.b	235				
	.dc.b	182				
	.dc.b	118				
						
	.dc.b	178				
						
	.dc.b	235				
	.dc.b	194				
	.dc.b	227				
						
	.dc.b	178				
						
	.dc.b	235				
	.dc.b	207				
	.dc.b	80				
						
	.dc.b	242				
						
	.dc.b	235				
	.dc.b	219				
	.dc.b	190				
						
	.dc.b	82				
						
	.dc.b	235				
	.dc.b	232				
	.dc.b	43				
						
	.dc.b	242				
						
	.dc.b	235				
	.dc.b	244				
	.dc.b	153				
						
	.dc.b	146				
						
	.dc.b	236				
	.dc.b	1				
	.dc.b	7				
						
	.dc.b	114				
						
	.dc.b	236				
	.dc.b	13				
	.dc.b	117				
						
	.dc.b	146				
						
	.dc.b	236				
	.dc.b	25				
	.dc.b	227				
						
	.dc.b	210				
						
	.dc.b	236				
	.dc.b	38				
	.dc.b	82				
						
	.dc.b	50				
						
	.dc.b	236				
	.dc.b	50				
	.dc.b	192				
						
	.dc.b	178				
						
	.dc.b	236				
	.dc.b	63				
	.dc.b	47				
						
	.dc.b	114				
						
	.dc.b	236				
	.dc.b	75				
	.dc.b	158				
						
	.dc.b	82				
						
	.dc.b	236				
	.dc.b	88				
	.dc.b	13				
						
	.dc.b	82				
						
	.dc.b	236				
	.dc.b	100				
	.dc.b	124				
						
	.dc.b	114				
						
	.dc.b	236				
	.dc.b	112				
	.dc.b	235				
						
	.dc.b	210				
						
	.dc.b	236				
	.dc.b	125				
	.dc.b	91				
						
	.dc.b	114				
						
	.dc.b	236				
	.dc.b	137				
	.dc.b	203				
						
	.dc.b	18				
						
	.dc.b	236				
	.dc.b	150				
	.dc.b	58				
						
	.dc.b	242				
						
	.dc.b	236				
	.dc.b	162				
	.dc.b	170				
						
	.dc.b	242				
						
	.dc.b	236				
	.dc.b	175				
	.dc.b	27				
						
	.dc.b	18				
						
	.dc.b	236				
	.dc.b	187				
	.dc.b	139				
						
	.dc.b	114				
						
	.dc.b	236				
	.dc.b	199				
	.dc.b	251				
						
	.dc.b	242				
						
	.dc.b	236				
	.dc.b	212				
	.dc.b	108				
						
	.dc.b	146				
						
	.dc.b	236				
	.dc.b	224				
	.dc.b	221				
						
	.dc.b	114				
						
	.dc.b	236				
	.dc.b	237				
	.dc.b	78				
						
	.dc.b	114				
						
	.dc.b	236				
	.dc.b	249				
	.dc.b	191				
						
	.dc.b	146				
						
	.dc.b	237				
	.dc.b	6				
	.dc.b	48				
						
	.dc.b	242				
						
	.dc.b	237				
	.dc.b	18				
	.dc.b	162				
						
	.dc.b	114				
						
	.dc.b	237				
	.dc.b	31				
	.dc.b	20				
						
	.dc.b	18				
						
	.dc.b	237				
	.dc.b	43				
	.dc.b	133				
						
	.dc.b	210				
						
	.dc.b	237				
	.dc.b	55				
	.dc.b	247				
						
	.dc.b	210				
						
	.dc.b	237				
	.dc.b	68				
	.dc.b	105				
						
	.dc.b	242				
						
	.dc.b	237				
	.dc.b	80				
	.dc.b	220				
						
	.dc.b	82				
						
	.dc.b	237				
	.dc.b	93				
	.dc.b	78				
						
	.dc.b	178				
						
	.dc.b	237				
	.dc.b	105				
	.dc.b	193				
						
	.dc.b	82				
						
	.dc.b	237				
	.dc.b	118				
	.dc.b	52				
						
	.dc.b	50				
						
	.dc.b	237				
	.dc.b	130				
	.dc.b	167				
						
	.dc.b	18				
						
	.dc.b	237				
	.dc.b	143				
	.dc.b	26				
						
	.dc.b	50				
						
	.dc.b	237				
	.dc.b	155				
	.dc.b	141				
						
	.dc.b	146				
						
	.dc.b	237				
	.dc.b	168				
	.dc.b	0				
						
	.dc.b	242				
						
	.dc.b	237				
	.dc.b	180				
	.dc.b	116				
						
	.dc.b	146				
						
	.dc.b	237				
	.dc.b	192				
	.dc.b	232				
						
	.dc.b	82				
						
	.dc.b	237				
	.dc.b	205				
	.dc.b	92				
						
	.dc.b	82				
						
	.dc.b	237				
	.dc.b	217				
	.dc.b	208				
						
	.dc.b	82				
						
	.dc.b	237				
	.dc.b	230				
	.dc.b	68				
						
	.dc.b	146				
						
	.dc.b	237				
	.dc.b	242				
	.dc.b	185				
						
	.dc.b	18				
						
	.dc.b	237				
	.dc.b	255				
	.dc.b	45				
						
	.dc.b	146				
						
	.dc.b	238				
	.dc.b	11				
	.dc.b	162				
						
	.dc.b	82				
						
	.dc.b	238				
	.dc.b	24				
	.dc.b	23				
						
	.dc.b	82				
						
	.dc.b	238				
	.dc.b	36				
	.dc.b	140				
						
	.dc.b	82				
						
	.dc.b	238				
	.dc.b	49				
	.dc.b	1				
						
	.dc.b	146				
						
	.dc.b	238				
	.dc.b	61				
	.dc.b	118				
						
	.dc.b	242				
						
	.dc.b	238				
	.dc.b	73				
	.dc.b	236				
						
	.dc.b	146				
						
	.dc.b	238				
	.dc.b	86				
	.dc.b	98				
						
	.dc.b	82				
						
	.dc.b	238				
	.dc.b	98				
	.dc.b	216				
						
	.dc.b	50				
						
	.dc.b	238				
	.dc.b	111				
	.dc.b	78				
						
	.dc.b	50				
						
	.dc.b	238				
	.dc.b	123				
	.dc.b	196				
						
	.dc.b	114				
						
	.dc.b	238				
	.dc.b	136				
	.dc.b	58				
						
	.dc.b	210				
						
	.dc.b	238				
	.dc.b	148				
	.dc.b	177				
						
	.dc.b	82				
						
	.dc.b	238				
	.dc.b	161				
	.dc.b	40				
						
	.dc.b	18				
						
	.dc.b	238				
	.dc.b	173				
	.dc.b	158				
						
	.dc.b	242				
						
	.dc.b	238				
	.dc.b	186				
	.dc.b	21				
						
	.dc.b	242				
						
	.dc.b	238				
	.dc.b	198				
	.dc.b	141				
						
	.dc.b	18				
						
	.dc.b	238				
	.dc.b	211				
	.dc.b	4				
						
	.dc.b	114				
						
	.dc.b	238				
	.dc.b	223				
	.dc.b	123				
						
	.dc.b	242				
						
	.dc.b	238				
	.dc.b	235				
	.dc.b	243				
						
	.dc.b	178				
						
	.dc.b	238				
	.dc.b	248				
	.dc.b	107				
						
	.dc.b	146				
						
	.dc.b	239				
	.dc.b	4				
	.dc.b	227				
						
	.dc.b	146				
						
	.dc.b	239				
	.dc.b	17				
	.dc.b	91				
						
	.dc.b	178				
						
	.dc.b	239				
	.dc.b	29				
	.dc.b	211				
						
	.dc.b	242				
						
	.dc.b	239				
	.dc.b	42				
	.dc.b	76				
						
	.dc.b	114				
						
	.dc.b	239				
	.dc.b	54				
	.dc.b	197				
						
	.dc.b	50				
						
	.dc.b	239				
	.dc.b	67				
	.dc.b	61				
						
	.dc.b	242				
						
	.dc.b	239				
	.dc.b	79				
	.dc.b	182				
						
	.dc.b	242				
						
	.dc.b	239				
	.dc.b	92				
	.dc.b	48				
						
	.dc.b	18				
						
	.dc.b	239				
	.dc.b	104				
	.dc.b	169				
						
	.dc.b	114				
						
	.dc.b	239				
	.dc.b	117				
	.dc.b	34				
						
	.dc.b	210				
						
	.dc.b	239				
	.dc.b	129				
	.dc.b	156				
						
	.dc.b	114				
						
	.dc.b	239				
	.dc.b	142				
	.dc.b	22				
						
	.dc.b	82				
						
	.dc.b	239				
	.dc.b	154				
	.dc.b	144				
						
	.dc.b	50				
						
	.dc.b	239				
	.dc.b	167				
	.dc.b	10				
						
	.dc.b	82				
						
	.dc.b	239				
	.dc.b	179				
	.dc.b	132				
						
	.dc.b	146				
						
	.dc.b	239				
	.dc.b	191				
	.dc.b	255				
						
	.dc.b	18				
						
	.dc.b	239				
	.dc.b	204				
	.dc.b	121				
						
	.dc.b	178				
						
	.dc.b	239				
	.dc.b	216				
	.dc.b	244				
						
	.dc.b	114				
						
	.dc.b	239				
	.dc.b	229				
	.dc.b	111				
						
	.dc.b	82				
						
	.dc.b	239				
	.dc.b	241				
	.dc.b	234				
						
	.dc.b	114				
						
	.dc.b	239				
	.dc.b	254				
	.dc.b	101				
						
	.dc.b	178				
						
	.dc.b	240				
	.dc.b	10				
	.dc.b	225				
						
	.dc.b	18				
						
	.dc.b	240				
	.dc.b	23				
	.dc.b	92				
						
	.dc.b	178				
						
	.dc.b	240				
	.dc.b	35				
	.dc.b	216				
						
	.dc.b	114				
						
	.dc.b	240				
	.dc.b	48				
	.dc.b	84				
						
	.dc.b	82				
						
	.dc.b	240				
	.dc.b	60				
	.dc.b	208				
						
	.dc.b	114				
						
	.dc.b	240				
	.dc.b	73				
	.dc.b	76				
						
	.dc.b	146				
						
	.dc.b	240				
	.dc.b	85				
	.dc.b	200				
						
	.dc.b	242				
						
	.dc.b	240				
	.dc.b	98				
	.dc.b	69				
						
	.dc.b	146				
						
	.dc.b	240				
	.dc.b	110				
	.dc.b	194				
						
	.dc.b	82				
						
	.dc.b	240				
	.dc.b	123				
	.dc.b	63				
						
	.dc.b	50				
						
	.dc.b	240				
	.dc.b	135				
	.dc.b	188				
						
	.dc.b	50				
						
	.dc.b	240				
	.dc.b	148				
	.dc.b	57				
						
	.dc.b	82				
						
	.dc.b	240				
	.dc.b	160				
	.dc.b	182				
						
	.dc.b	178				
						
	.dc.b	240				
	.dc.b	173				
	.dc.b	52				
						
	.dc.b	82				
						
	.dc.b	240				
	.dc.b	185				
	.dc.b	177				
						
	.dc.b	242				
						
	.dc.b	240				
	.dc.b	198				
	.dc.b	47				
						
	.dc.b	210				
						
	.dc.b	240				
	.dc.b	210				
	.dc.b	173				
						
	.dc.b	210				
						
	.dc.b	240				
	.dc.b	223				
	.dc.b	43				
						
	.dc.b	242				
						
	.dc.b	240				
	.dc.b	235				
	.dc.b	170				
						
	.dc.b	82				
						
	.dc.b	240				
	.dc.b	248				
	.dc.b	40				
						
	.dc.b	210				
						
	.dc.b	241				
	.dc.b	4				
	.dc.b	167				
						
	.dc.b	114				
						
	.dc.b	241				
	.dc.b	17				
	.dc.b	38				
						
	.dc.b	82				
						
	.dc.b	241				
	.dc.b	29				
	.dc.b	165				
						
	.dc.b	82				
						
	.dc.b	241				
	.dc.b	42				
	.dc.b	36				
						
	.dc.b	114				
						
	.dc.b	241				
	.dc.b	54				
	.dc.b	163				
						
	.dc.b	178				
						
	.dc.b	241				
	.dc.b	67				
	.dc.b	35				
						
	.dc.b	50				
						
	.dc.b	241				
	.dc.b	79				
	.dc.b	162				
						
	.dc.b	210				
						
	.dc.b	241				
	.dc.b	92				
	.dc.b	34				
						
	.dc.b	146				
						
	.dc.b	241				
	.dc.b	104				
	.dc.b	162				
						
	.dc.b	146				
						
	.dc.b	241				
	.dc.b	117				
	.dc.b	34				
						
	.dc.b	178				
						
	.dc.b	241				
	.dc.b	129				
	.dc.b	162				
						
	.dc.b	242				
						
	.dc.b	241				
	.dc.b	142				
	.dc.b	35				
						
	.dc.b	82				
						
	.dc.b	241				
	.dc.b	154				
	.dc.b	163				
						
	.dc.b	242				
						
	.dc.b	241				
	.dc.b	167				
	.dc.b	36				
						
	.dc.b	178				
						
	.dc.b	241				
	.dc.b	179				
	.dc.b	165				
						
	.dc.b	178				
						
	.dc.b	241				
	.dc.b	192				
	.dc.b	38				
						
	.dc.b	178				
						
	.dc.b	241				
	.dc.b	204				
	.dc.b	167				
						
	.dc.b	242				
						
	.dc.b	241				
	.dc.b	217				
	.dc.b	41				
						
	.dc.b	114				
						
	.dc.b	241				
	.dc.b	229				
	.dc.b	170				
						
	.dc.b	242				
						
	.dc.b	241				
	.dc.b	242				
	.dc.b	44				
						
	.dc.b	178				
						
	.dc.b	241				
	.dc.b	254				
	.dc.b	174				
						
	.dc.b	146				
						
	.dc.b	242				
	.dc.b	11				
	.dc.b	48				
						
	.dc.b	178				
						
	.dc.b	242				
	.dc.b	23				
	.dc.b	178				
						
	.dc.b	210				
						
	.dc.b	242				
	.dc.b	36				
	.dc.b	53				
						
	.dc.b	50				
						
	.dc.b	242				
	.dc.b	48				
	.dc.b	183				
						
	.dc.b	210				
						
	.dc.b	242				
	.dc.b	61				
	.dc.b	58				
						
	.dc.b	114				
						
	.dc.b	242				
	.dc.b	73				
	.dc.b	189				
						
	.dc.b	82				
						
	.dc.b	242				
	.dc.b	86				
	.dc.b	64				
						
	.dc.b	82				
						
	.dc.b	242				
	.dc.b	98				
	.dc.b	195				
						
	.dc.b	146				
						
	.dc.b	242				
	.dc.b	111				
	.dc.b	70				
						
	.dc.b	242				
						
	.dc.b	242				
	.dc.b	123				
	.dc.b	202				
						
	.dc.b	114				
						
	.dc.b	242				
	.dc.b	136				
	.dc.b	78				
						
	.dc.b	18				
						
	.dc.b	242				
	.dc.b	148				
	.dc.b	209				
						
	.dc.b	242				
						
	.dc.b	242				
	.dc.b	161				
	.dc.b	85				
						
	.dc.b	242				
						
	.dc.b	242				
	.dc.b	173				
	.dc.b	218				
						
	.dc.b	18				
						
	.dc.b	242				
	.dc.b	186				
	.dc.b	94				
						
	.dc.b	82				
						
	.dc.b	242				
	.dc.b	198				
	.dc.b	226				
						
	.dc.b	210				
						
	.dc.b	242				
	.dc.b	211				
	.dc.b	103				
						
	.dc.b	114				
						
	.dc.b	242				
	.dc.b	223				
	.dc.b	236				
						
	.dc.b	82				
						
	.dc.b	242				
	.dc.b	236				
	.dc.b	113				
						
	.dc.b	50				
						
	.dc.b	242				
	.dc.b	248				
	.dc.b	246				
						
	.dc.b	82				
						
	.dc.b	243				
	.dc.b	5				
	.dc.b	123				
						
	.dc.b	178				
						
	.dc.b	243				
	.dc.b	18				
	.dc.b	1				
						
	.dc.b	18				
						
	.dc.b	243				
	.dc.b	30				
	.dc.b	134				
						
	.dc.b	178				
						
	.dc.b	243				
	.dc.b	43				
	.dc.b	12				
						
	.dc.b	114				
						
	.dc.b	243				
	.dc.b	55				
	.dc.b	146				
						
	.dc.b	82				
						
	.dc.b	243				
	.dc.b	68				
	.dc.b	24				
						
	.dc.b	114				
						
	.dc.b	243				
	.dc.b	80				
	.dc.b	158				
						
	.dc.b	178				
						
	.dc.b	243				
	.dc.b	93				
	.dc.b	37				
						
	.dc.b	50				
						
	.dc.b	243				
	.dc.b	105				
	.dc.b	171				
						
	.dc.b	178				
						
	.dc.b	243				
	.dc.b	118				
	.dc.b	50				
						
	.dc.b	114				
						
	.dc.b	243				
	.dc.b	130				
	.dc.b	185				
						
	.dc.b	82				
						
	.dc.b	243				
	.dc.b	143				
	.dc.b	64				
						
	.dc.b	114				
						
	.dc.b	243				
	.dc.b	155				
	.dc.b	199				
						
	.dc.b	146				
						
	.dc.b	243				
	.dc.b	168				
	.dc.b	78				
						
	.dc.b	242				
						
	.dc.b	243				
	.dc.b	180				
	.dc.b	214				
						
	.dc.b	146				
						
	.dc.b	243				
	.dc.b	193				
	.dc.b	94				
						
	.dc.b	50				
						
	.dc.b	243				
	.dc.b	205				
	.dc.b	230				
						
	.dc.b	18				
						
	.dc.b	243				
	.dc.b	218				
	.dc.b	110				
						
	.dc.b	18				
						
	.dc.b	243				
	.dc.b	230				
	.dc.b	246				
						
	.dc.b	82				
						
	.dc.b	243				
	.dc.b	243				
	.dc.b	126				
						
	.dc.b	178				
						
	.dc.b	244				
	.dc.b	0				
	.dc.b	7				
						
	.dc.b	50				
						
	.dc.b	244				
	.dc.b	12				
	.dc.b	143				
						
	.dc.b	210				
						
	.dc.b	244				
	.dc.b	25				
	.dc.b	24				
						
	.dc.b	178				
						
	.dc.b	244				
	.dc.b	37				
	.dc.b	161				
						
	.dc.b	146				
						
	.dc.b	244				
	.dc.b	50				
	.dc.b	42				
						
	.dc.b	210				
						
	.dc.b	244				
	.dc.b	62				
	.dc.b	180				
						
	.dc.b	18				
						
	.dc.b	244				
	.dc.b	75				
	.dc.b	61				
						
	.dc.b	146				
						
	.dc.b	244				
	.dc.b	87				
	.dc.b	199				
						
	.dc.b	50				
						
	.dc.b	244				
	.dc.b	100				
	.dc.b	80				
						
	.dc.b	242				
						
	.dc.b	244				
	.dc.b	112				
	.dc.b	218				
						
	.dc.b	242				
						
	.dc.b	244				
	.dc.b	125				
	.dc.b	101				
						
	.dc.b	18				
						
	.dc.b	244				
	.dc.b	137				
	.dc.b	239				
						
	.dc.b	82				
						
	.dc.b	244				
	.dc.b	150				
	.dc.b	121				
						
	.dc.b	210				
						
	.dc.b	244				
	.dc.b	163				
	.dc.b	4				
						
	.dc.b	82				
						
	.dc.b	244				
	.dc.b	175				
	.dc.b	143				
						
	.dc.b	18				
						
	.dc.b	244				
	.dc.b	188				
	.dc.b	26				
						
	.dc.b	18				
						
	.dc.b	244				
	.dc.b	200				
	.dc.b	165				
						
	.dc.b	18				
						
	.dc.b	244				
	.dc.b	213				
	.dc.b	48				
						
	.dc.b	82				
						
	.dc.b	244				
	.dc.b	225				
	.dc.b	187				
						
	.dc.b	178				
						
	.dc.b	244				
	.dc.b	238				
	.dc.b	71				
						
	.dc.b	82				
						
	.dc.b	244				
	.dc.b	250				
	.dc.b	211				
						
	.dc.b	18				
						
	.dc.b	245				
	.dc.b	7				
	.dc.b	94				
						
	.dc.b	242				
						
	.dc.b	245				
	.dc.b	19				
	.dc.b	234				
						
	.dc.b	242				
						
	.dc.b	245				
	.dc.b	32				
	.dc.b	119				
						
	.dc.b	50				
						
	.dc.b	245				
	.dc.b	45				
	.dc.b	3				
						
	.dc.b	146				
						
	.dc.b	245				
	.dc.b	57				
	.dc.b	144				
						
	.dc.b	18				
						
	.dc.b	245				
	.dc.b	70				
	.dc.b	28				
						
	.dc.b	178				
						
	.dc.b	245				
	.dc.b	82				
	.dc.b	169				
						
	.dc.b	146				
						
	.dc.b	245				
	.dc.b	95				
	.dc.b	54				
						
	.dc.b	146				
						
	.dc.b	245				
	.dc.b	107				
	.dc.b	195				
						
	.dc.b	210				
						
	.dc.b	245				
	.dc.b	120				
	.dc.b	81				
						
	.dc.b	18				
						
	.dc.b	245				
	.dc.b	132				
	.dc.b	222				
						
	.dc.b	146				
						
	.dc.b	245				
	.dc.b	145				
	.dc.b	108				
						
	.dc.b	50				
						
	.dc.b	245				
	.dc.b	157				
	.dc.b	250				
						
	.dc.b	18				
						
	.dc.b	245				
	.dc.b	170				
	.dc.b	135				
						
	.dc.b	242				
						
	.dc.b	245				
	.dc.b	183				
	.dc.b	22				
						
	.dc.b	18				
						
	.dc.b	245				
	.dc.b	195				
	.dc.b	164				
						
	.dc.b	114				
						
	.dc.b	245				
	.dc.b	208				
	.dc.b	50				
						
	.dc.b	210				
						
	.dc.b	245				
	.dc.b	220				
	.dc.b	193				
						
	.dc.b	114				
						
	.dc.b	245				
	.dc.b	233				
	.dc.b	80				
						
	.dc.b	50				
						
	.dc.b	245				
	.dc.b	245				
	.dc.b	223				
						
	.dc.b	50				
						
	.dc.b	246				
	.dc.b	2				
	.dc.b	110				
						
	.dc.b	82				
						
	.dc.b	246				
	.dc.b	14				
	.dc.b	253				
						
	.dc.b	146				
						
	.dc.b	246				
	.dc.b	27				
	.dc.b	140				
						
	.dc.b	242				
						
	.dc.b	246				
	.dc.b	40				
	.dc.b	28				
						
	.dc.b	146				
						
	.dc.b	246				
	.dc.b	52				
	.dc.b	172				
						
	.dc.b	50				
						
	.dc.b	246				
	.dc.b	65				
	.dc.b	60				
						
	.dc.b	50				
						
	.dc.b	246				
	.dc.b	77				
	.dc.b	204				
						
	.dc.b	50				
						
	.dc.b	246				
	.dc.b	90				
	.dc.b	92				
						
	.dc.b	114				
						
	.dc.b	246				
	.dc.b	102				
	.dc.b	236				
						
	.dc.b	210				
						
	.dc.b	246				
	.dc.b	115				
	.dc.b	125				
						
	.dc.b	82				
						
	.dc.b	246				
	.dc.b	128				
	.dc.b	13				
						
	.dc.b	242				
						
	.dc.b	246				
	.dc.b	140				
	.dc.b	158				
						
	.dc.b	210				
						
	.dc.b	246				
	.dc.b	153				
	.dc.b	47				
						
	.dc.b	210				
						
	.dc.b	246				
	.dc.b	165				
	.dc.b	193				
						
	.dc.b	18				
						
	.dc.b	246				
	.dc.b	178				
	.dc.b	82				
						
	.dc.b	82				
						
	.dc.b	246				
	.dc.b	190				
	.dc.b	227				
						
	.dc.b	210				
						
	.dc.b	246				
	.dc.b	203				
	.dc.b	117				
						
	.dc.b	146				
						
	.dc.b	246				
	.dc.b	216				
	.dc.b	7				
						
	.dc.b	82				
						
	.dc.b	246				
	.dc.b	228				
	.dc.b	153				
						
	.dc.b	82				
						
	.dc.b	246				
	.dc.b	241				
	.dc.b	43				
						
	.dc.b	114				
						
	.dc.b	246				
	.dc.b	253				
	.dc.b	189				
						
	.dc.b	178				
						
	.dc.b	247				
	.dc.b	10				
	.dc.b	80				
						
	.dc.b	50				
						
	.dc.b	247				
	.dc.b	22				
	.dc.b	226				
						
	.dc.b	210				
						
	.dc.b	247				
	.dc.b	35				
	.dc.b	117				
						
	.dc.b	146				
						
	.dc.b	247				
	.dc.b	48				
	.dc.b	8				
						
	.dc.b	146				
						
	.dc.b	247				
	.dc.b	60				
	.dc.b	155				
						
	.dc.b	146				
						
	.dc.b	247				
	.dc.b	73				
	.dc.b	46				
						
	.dc.b	210				
						
	.dc.b	247				
	.dc.b	85				
	.dc.b	194				
						
	.dc.b	82				
						
	.dc.b	247				
	.dc.b	98				
	.dc.b	85				
						
	.dc.b	210				
						
	.dc.b	247				
	.dc.b	110				
	.dc.b	233				
						
	.dc.b	146				
						
	.dc.b	247				
	.dc.b	123				
	.dc.b	125				
						
	.dc.b	114				
						
	.dc.b	247				
	.dc.b	136				
	.dc.b	17				
						
	.dc.b	146				
						
	.dc.b	247				
	.dc.b	148				
	.dc.b	165				
						
	.dc.b	178				
						
	.dc.b	247				
	.dc.b	161				
	.dc.b	58				
						
	.dc.b	18				
						
	.dc.b	247				
	.dc.b	173				
	.dc.b	206				
						
	.dc.b	178				
						
	.dc.b	247				
	.dc.b	186				
	.dc.b	99				
						
	.dc.b	82				
						
	.dc.b	247				
	.dc.b	198				
	.dc.b	248				
						
	.dc.b	50				
						
	.dc.b	247				
	.dc.b	211				
	.dc.b	141				
						
	.dc.b	50				
						
	.dc.b	247				
	.dc.b	224				
	.dc.b	34				
						
	.dc.b	114				
						
	.dc.b	247				
	.dc.b	236				
	.dc.b	183				
						
	.dc.b	178				
						
	.dc.b	247				
	.dc.b	249				
	.dc.b	77				
						
	.dc.b	50				
						
	.dc.b	248				
	.dc.b	5				
	.dc.b	226				
						
	.dc.b	210				
						
	.dc.b	248				
	.dc.b	18				
	.dc.b	120				
						
	.dc.b	178				
						
	.dc.b	248				
	.dc.b	31				
	.dc.b	14				
						
	.dc.b	178				
						
	.dc.b	248				
	.dc.b	43				
	.dc.b	164				
						
	.dc.b	210				
						
	.dc.b	248				
	.dc.b	56				
	.dc.b	59				
						
	.dc.b	18				
						
	.dc.b	248				
	.dc.b	68				
	.dc.b	209				
						
	.dc.b	114				
						
	.dc.b	248				
	.dc.b	81				
	.dc.b	104				
						
	.dc.b	18				
						
	.dc.b	248				
	.dc.b	93				
	.dc.b	254				
						
	.dc.b	210				
						
	.dc.b	248				
	.dc.b	106				
	.dc.b	149				
						
	.dc.b	210				
						
	.dc.b	248				
	.dc.b	119				
	.dc.b	44				
						
	.dc.b	242				
						
	.dc.b	248				
	.dc.b	131				
	.dc.b	196				
						
	.dc.b	50				
						
	.dc.b	248				
	.dc.b	144				
	.dc.b	91				
						
	.dc.b	146				
						
	.dc.b	248				
	.dc.b	156				
	.dc.b	243				
						
	.dc.b	18				
						
	.dc.b	248				
	.dc.b	169				
	.dc.b	138				
						
	.dc.b	210				
						
	.dc.b	248				
	.dc.b	182				
	.dc.b	34				
						
	.dc.b	178				
						
	.dc.b	248				
	.dc.b	194				
	.dc.b	186				
						
	.dc.b	210				
						
	.dc.b	248				
	.dc.b	207				
	.dc.b	82				
						
	.dc.b	242				
						
	.dc.b	248				
	.dc.b	219				
	.dc.b	235				
						
	.dc.b	82				
						
	.dc.b	248				
	.dc.b	232				
	.dc.b	131				
						
	.dc.b	210				
						
	.dc.b	248				
	.dc.b	245				
	.dc.b	28				
						
	.dc.b	146				
						
	.dc.b	249				
	.dc.b	1				
	.dc.b	181				
						
	.dc.b	82				
						
	.dc.b	249				
	.dc.b	14				
	.dc.b	78				
						
	.dc.b	82				
						
	.dc.b	249				
	.dc.b	26				
	.dc.b	231				
						
	.dc.b	146				
						
	.dc.b	249				
	.dc.b	39				
	.dc.b	128				
						
	.dc.b	210				
						
	.dc.b	249				
	.dc.b	52				
	.dc.b	26				
						
	.dc.b	82				
						
	.dc.b	249				
	.dc.b	64				
	.dc.b	179				
						
	.dc.b	242				
						
	.dc.b	249				
	.dc.b	77				
	.dc.b	77				
						
	.dc.b	178				
						
	.dc.b	249				
	.dc.b	89				
	.dc.b	231				
						
	.dc.b	178				
						
	.dc.b	249				
	.dc.b	102				
	.dc.b	129				
						
	.dc.b	210				
						
	.dc.b	249				
	.dc.b	115				
	.dc.b	28				
						
	.dc.b	18				
						
	.dc.b	249				
	.dc.b	127				
	.dc.b	182				
						
	.dc.b	146				
						
	.dc.b	249				
	.dc.b	140				
	.dc.b	81				
						
	.dc.b	18				
						
	.dc.b	249				
	.dc.b	152				
	.dc.b	235				
						
	.dc.b	210				
						
	.dc.b	249				
	.dc.b	165				
	.dc.b	134				
						
	.dc.b	210				
						
	.dc.b	249				
	.dc.b	178				
	.dc.b	33				
						
	.dc.b	210				
						
	.dc.b	249				
	.dc.b	190				
	.dc.b	189				
						
	.dc.b	18				
						
	.dc.b	249				
	.dc.b	203				
	.dc.b	88				
						
	.dc.b	114				
						
	.dc.b	249				
	.dc.b	215				
	.dc.b	244				
						
	.dc.b	18				
						
	.dc.b	249				
	.dc.b	228				
	.dc.b	143				
						
	.dc.b	178				
						
	.dc.b	249				
	.dc.b	241				
	.dc.b	43				
						
	.dc.b	146				
						
	.dc.b	249				
	.dc.b	253				
	.dc.b	199				
						
	.dc.b	146				
						
	.dc.b	250				
	.dc.b	10				
	.dc.b	99				
						
	.dc.b	210				
						
	.dc.b	250				
	.dc.b	23				
	.dc.b	0				
						
	.dc.b	50				
						
	.dc.b	250				
	.dc.b	35				
	.dc.b	156				
						
	.dc.b	178				
						
	.dc.b	250				
	.dc.b	48				
	.dc.b	57				
						
	.dc.b	82				
						
	.dc.b	250				
	.dc.b	60				
	.dc.b	214				
						
	.dc.b	18				
						
	.dc.b	250				
	.dc.b	73				
	.dc.b	115				
						
	.dc.b	18				
						
	.dc.b	250				
	.dc.b	86				
	.dc.b	16				
						
	.dc.b	50				
						
	.dc.b	250				
	.dc.b	98				
	.dc.b	173				
						
	.dc.b	146				
						
	.dc.b	250				
	.dc.b	111				
	.dc.b	74				
						
	.dc.b	242				
						
	.dc.b	250				
	.dc.b	123				
	.dc.b	232				
						
	.dc.b	146				
						
	.dc.b	250				
	.dc.b	136				
	.dc.b	134				
						
	.dc.b	82				
						
	.dc.b	250				
	.dc.b	149				
	.dc.b	36				
						
	.dc.b	82				
						
	.dc.b	250				
	.dc.b	161				
	.dc.b	194				
						
	.dc.b	114				
						
	.dc.b	250				
	.dc.b	174				
	.dc.b	96				
						
	.dc.b	178				
						
	.dc.b	250				
	.dc.b	186				
	.dc.b	255				
						
	.dc.b	18				
						
	.dc.b	250				
	.dc.b	199				
	.dc.b	157				
						
	.dc.b	146				
						
	.dc.b	250				
	.dc.b	212				
	.dc.b	60				
						
	.dc.b	82				
						
	.dc.b	250				
	.dc.b	224				
	.dc.b	219				
						
	.dc.b	50				
						
	.dc.b	250				
	.dc.b	237				
	.dc.b	122				
						
	.dc.b	82				
						
	.dc.b	250				
	.dc.b	250				
	.dc.b	25				
						
	.dc.b	114				
						
	.dc.b	251				
	.dc.b	6				
	.dc.b	184				
						
	.dc.b	210				
						
	.dc.b	251				
	.dc.b	19				
	.dc.b	88				
						
	.dc.b	82				
						
	.dc.b	251				
	.dc.b	31				
	.dc.b	248				
						
	.dc.b	18				
						
	.dc.b	251				
	.dc.b	44				
	.dc.b	151				
						
	.dc.b	210				
						
	.dc.b	251				
	.dc.b	57				
	.dc.b	55				
						
	.dc.b	210				
						
	.dc.b	251				
	.dc.b	69				
	.dc.b	215				
						
	.dc.b	242				
						
	.dc.b	251				
	.dc.b	82				
	.dc.b	120				
						
	.dc.b	82				
						
	.dc.b	251				
	.dc.b	95				
	.dc.b	24				
						
	.dc.b	210				
						
	.dc.b	251				
	.dc.b	107				
	.dc.b	185				
						
	.dc.b	114				
						
	.dc.b	251				
	.dc.b	120				
	.dc.b	90				
						
	.dc.b	50				
						
	.dc.b	251				
	.dc.b	132				
	.dc.b	251				
						
	.dc.b	50				
						
	.dc.b	251				
	.dc.b	145				
	.dc.b	156				
						
	.dc.b	50				
						
	.dc.b	251				
	.dc.b	158				
	.dc.b	61				
						
	.dc.b	146				
						
	.dc.b	251				
	.dc.b	170				
	.dc.b	222				
						
	.dc.b	242				
						
	.dc.b	251				
	.dc.b	183				
	.dc.b	128				
						
	.dc.b	146				
						
	.dc.b	251				
	.dc.b	196				
	.dc.b	34				
						
	.dc.b	50				
						
	.dc.b	251				
	.dc.b	208				
	.dc.b	196				
						
	.dc.b	50				
						
	.dc.b	251				
	.dc.b	221				
	.dc.b	102				
						
	.dc.b	50				
						
	.dc.b	251				
	.dc.b	234				
	.dc.b	8				
						
	.dc.b	114				
						
	.dc.b	251				
	.dc.b	246				
	.dc.b	170				
						
	.dc.b	210				
						
	.dc.b	252				
	.dc.b	3				
	.dc.b	77				
						
	.dc.b	82				
						
	.dc.b	252				
	.dc.b	15				
	.dc.b	240				
						
	.dc.b	18				
						
	.dc.b	252				
	.dc.b	28				
	.dc.b	146				
						
	.dc.b	210				
						
	.dc.b	252				
	.dc.b	41				
	.dc.b	53				
						
	.dc.b	210				
						
	.dc.b	252				
	.dc.b	53				
	.dc.b	217				
						
	.dc.b	18				
						
	.dc.b	252				
	.dc.b	66				
	.dc.b	124				
						
	.dc.b	82				
						
	.dc.b	252				
	.dc.b	79				
	.dc.b	31				
						
	.dc.b	210				
						
	.dc.b	252				
	.dc.b	91				
	.dc.b	195				
						
	.dc.b	114				
						
	.dc.b	252				
	.dc.b	104				
	.dc.b	103				
						
	.dc.b	82				
						
	.dc.b	252				
	.dc.b	117				
	.dc.b	11				
						
	.dc.b	50				
						
	.dc.b	252				
	.dc.b	129				
	.dc.b	175				
						
	.dc.b	82				
						
	.dc.b	252				
	.dc.b	142				
	.dc.b	83				
						
	.dc.b	146				
						
	.dc.b	252				
	.dc.b	154				
	.dc.b	248				
						
	.dc.b	18				
						
	.dc.b	252				
	.dc.b	167				
	.dc.b	156				
						
	.dc.b	146				
						
	.dc.b	252				
	.dc.b	180				
	.dc.b	65				
						
	.dc.b	82				
						
	.dc.b	252				
	.dc.b	192				
	.dc.b	230				
						
	.dc.b	82				
						
	.dc.b	252				
	.dc.b	205				
	.dc.b	139				
						
	.dc.b	82				
						
	.dc.b	252				
	.dc.b	218				
	.dc.b	48				
						
	.dc.b	146				
						
	.dc.b	252				
	.dc.b	230				
	.dc.b	213				
						
	.dc.b	242				
						
	.dc.b	252				
	.dc.b	243				
	.dc.b	123				
						
	.dc.b	114				
						
	.dc.b	253				
	.dc.b	0				
	.dc.b	33				
						
	.dc.b	50				
						
	.dc.b	253				
	.dc.b	12				
	.dc.b	199				
						
	.dc.b	18				
						
	.dc.b	253				
	.dc.b	25				
	.dc.b	109				
						
	.dc.b	18				
						
	.dc.b	253				
	.dc.b	38				
	.dc.b	19				
						
	.dc.b	50				
						
	.dc.b	253				
	.dc.b	50				
	.dc.b	185				
						
	.dc.b	146				
						
	.dc.b	253				
	.dc.b	63				
	.dc.b	96				
						
	.dc.b	18				
						
	.dc.b	253				
	.dc.b	76				
	.dc.b	6				
						
	.dc.b	178				
						
	.dc.b	253				
	.dc.b	88				
	.dc.b	173				
						
	.dc.b	114				
						
	.dc.b	253				
	.dc.b	101				
	.dc.b	84				
						
	.dc.b	114				
						
	.dc.b	253				
	.dc.b	113				
	.dc.b	251				
						
	.dc.b	146				
						
	.dc.b	253				
	.dc.b	126				
	.dc.b	162				
						
	.dc.b	210				
						
	.dc.b	253				
	.dc.b	139				
	.dc.b	74				
						
	.dc.b	50				
						
	.dc.b	253				
	.dc.b	151				
	.dc.b	241				
						
	.dc.b	210				
						
	.dc.b	253				
	.dc.b	164				
	.dc.b	153				
						
	.dc.b	146				
						
	.dc.b	253				
	.dc.b	177				
	.dc.b	65				
						
	.dc.b	114				
						
	.dc.b	253				
	.dc.b	189				
	.dc.b	233				
						
	.dc.b	146				
						
	.dc.b	253				
	.dc.b	202				
	.dc.b	145				
						
	.dc.b	210				
						
	.dc.b	253				
	.dc.b	215				
	.dc.b	58				
						
	.dc.b	50				
						
	.dc.b	253				
	.dc.b	227				
	.dc.b	226				
						
	.dc.b	178				
						
	.dc.b	253				
	.dc.b	240				
	.dc.b	139				
						
	.dc.b	114				
						
	.dc.b	253				
	.dc.b	253				
	.dc.b	52				
						
	.dc.b	50				
						
	.dc.b	254				
	.dc.b	9				
	.dc.b	221				
						
	.dc.b	50				
						
	.dc.b	254				
	.dc.b	22				
	.dc.b	134				
						
	.dc.b	114				
						
	.dc.b	254				
	.dc.b	35				
	.dc.b	47				
						
	.dc.b	178				
						
	.dc.b	254				
	.dc.b	47				
	.dc.b	217				
						
	.dc.b	50				
						
	.dc.b	254				
	.dc.b	60				
	.dc.b	130				
						
	.dc.b	210				
						
	.dc.b	254				
	.dc.b	73				
	.dc.b	44				
						
	.dc.b	178				
						
	.dc.b	254				
	.dc.b	85				
	.dc.b	214				
						
	.dc.b	178				
						
	.dc.b	254				
	.dc.b	98				
	.dc.b	128				
						
	.dc.b	178				
						
	.dc.b	254				
	.dc.b	111				
	.dc.b	43				
						
	.dc.b	18				
						
	.dc.b	254				
	.dc.b	123				
	.dc.b	213				
						
	.dc.b	114				
						
	.dc.b	254				
	.dc.b	136				
	.dc.b	128				
						
	.dc.b	18				
						
	.dc.b	254				
	.dc.b	149				
	.dc.b	42				
						
	.dc.b	210				
						
	.dc.b	254				
	.dc.b	161				
	.dc.b	213				
						
	.dc.b	178				
						
	.dc.b	254				
	.dc.b	174				
	.dc.b	128				
						
	.dc.b	178				
						
	.dc.b	254				
	.dc.b	187				
	.dc.b	43				
						
	.dc.b	242				
						
	.dc.b	254				
	.dc.b	199				
	.dc.b	215				
						
	.dc.b	82				
						
	.dc.b	254				
	.dc.b	212				
	.dc.b	130				
						
	.dc.b	210				
						
	.dc.b	254				
	.dc.b	225				
	.dc.b	46				
						
	.dc.b	146				
						
	.dc.b	254				
	.dc.b	237				
	.dc.b	218				
						
	.dc.b	114				
						
	.dc.b	254				
	.dc.b	250				
	.dc.b	134				
						
	.dc.b	114				
						
	.dc.b	255				
	.dc.b	7				
	.dc.b	50				
						
	.dc.b	146				
						
	.dc.b	255				
	.dc.b	19				
	.dc.b	222				
						
	.dc.b	242				
						
	.dc.b	255				
	.dc.b	32				
	.dc.b	139				
						
	.dc.b	82				
						
	.dc.b	255				
	.dc.b	45				
	.dc.b	56				
						
	.dc.b	18				
						
	.dc.b	255				
	.dc.b	57				
	.dc.b	228				
						
	.dc.b	210				
						
	.dc.b	255				
	.dc.b	70				
	.dc.b	145				
						
	.dc.b	210				
						
	.dc.b	255				
	.dc.b	83				
	.dc.b	62				
						
	.dc.b	210				
						
	.dc.b	255				
	.dc.b	95				
	.dc.b	236				
						
	.dc.b	18				
						
	.dc.b	255				
	.dc.b	108				
	.dc.b	153				
						
	.dc.b	146				
						
	.dc.b	255				
	.dc.b	121				
	.dc.b	71				
						
	.dc.b	18				
						
	.dc.b	255				
	.dc.b	133				
	.dc.b	244				
						
	.dc.b	210				
						
	.dc.b	255				
	.dc.b	146				
	.dc.b	162				
						
	.dc.b	210				
						
	.dc.b	255				
	.dc.b	159				
	.dc.b	80				
						
	.dc.b	210				
						
	.dc.b	255				
	.dc.b	171				
	.dc.b	255				
						
	.dc.b	18				
						
	.dc.b	255				
	.dc.b	184				
	.dc.b	173				
						
	.dc.b	114				
						
	.dc.b	255				
	.dc.b	197				
	.dc.b	91				
						
	.dc.b	242				
						
	.dc.b	255				
	.dc.b	210				
	.dc.b	10				
						
	.dc.b	146				
						
	.dc.b	255				
	.dc.b	222				
	.dc.b	185				
						
	.dc.b	114				
						
	.dc.b	255				
	.dc.b	235				
	.dc.b	104				
						
	.dc.b	114				
						
	.dc.b	255				
	.dc.b	248				
	.dc.b	23				
						
	.dc.b	146				
						
	.dc.b	128				
	.dc.b	2				
	.dc.b	99				
						
	.dc.b	115				
						
	.dc.b	128				
	.dc.b	8				
	.dc.b	187				
						
	.dc.b	51				
						
	.dc.b	128				
	.dc.b	15				
	.dc.b	18				
						
	.dc.b	243				
						
	.dc.b	128				
	.dc.b	21				
	.dc.b	106				
						
	.dc.b	243				
						
	.dc.b	128				
	.dc.b	27				
	.dc.b	194				
						
	.dc.b	211				
						
	.dc.b	128				
	.dc.b	34				
	.dc.b	26				
						
	.dc.b	243				
						
	.dc.b	128				
	.dc.b	40				
	.dc.b	115				
						
	.dc.b	19				
						
	.dc.b	128				
	.dc.b	46				
	.dc.b	203				
						
	.dc.b	51				
						
	.dc.b	128				
	.dc.b	53				
	.dc.b	35				
						
	.dc.b	147				
						
	.dc.b	128				
	.dc.b	59				
	.dc.b	123				
						
	.dc.b	243				
						
	.dc.b	128				
	.dc.b	65				
	.dc.b	212				
						
	.dc.b	83				
						
	.dc.b	128				
	.dc.b	72				
	.dc.b	44				
						
	.dc.b	211				
						
	.dc.b	128				
	.dc.b	78				
	.dc.b	133				
						
	.dc.b	115				
						
	.dc.b	128				
	.dc.b	84				
	.dc.b	222				
						
	.dc.b	19				
						
	.dc.b	128				
	.dc.b	91				
	.dc.b	54				
						
	.dc.b	211				
						
	.dc.b	128				
	.dc.b	97				
	.dc.b	143				
						
	.dc.b	179				
						
	.dc.b	128				
	.dc.b	103				
	.dc.b	232				
						
	.dc.b	147				
						
	.dc.b	128				
	.dc.b	110				
	.dc.b	65				
						
	.dc.b	147				
						
	.dc.b	128				
	.dc.b	116				
	.dc.b	154				
						
	.dc.b	179				
						
	.dc.b	128				
	.dc.b	122				
	.dc.b	243				
						
	.dc.b	211				
						
	.dc.b	128				
	.dc.b	129				
	.dc.b	77				
						
	.dc.b	19				
						
	.dc.b	128				
	.dc.b	135				
	.dc.b	166				
						
	.dc.b	83				
						
	.dc.b	128				
	.dc.b	141				
	.dc.b	255				
						
	.dc.b	179				
						
	.dc.b	128				
	.dc.b	148				
	.dc.b	89				
						
	.dc.b	51				
						
	.dc.b	128				
	.dc.b	154				
	.dc.b	178				
						
	.dc.b	179				
						
	.dc.b	128				
	.dc.b	161				
	.dc.b	12				
						
	.dc.b	83				
						
	.dc.b	128				
	.dc.b	167				
	.dc.b	102				
						
	.dc.b	19				
						
	.dc.b	128				
	.dc.b	173				
	.dc.b	191				
						
	.dc.b	211				
						
	.dc.b	128				
	.dc.b	180				
	.dc.b	25				
						
	.dc.b	179				
						
	.dc.b	128				
	.dc.b	186				
	.dc.b	115				
						
	.dc.b	147				
						
	.dc.b	128				
	.dc.b	192				
	.dc.b	205				
						
	.dc.b	147				
						
	.dc.b	128				
	.dc.b	199				
	.dc.b	39				
						
	.dc.b	179				
						
	.dc.b	128				
	.dc.b	205				
	.dc.b	129				
						
	.dc.b	211				
						
	.dc.b	128				
	.dc.b	211				
	.dc.b	220				
						
	.dc.b	19				
						
	.dc.b	128				
	.dc.b	218				
	.dc.b	54				
						
	.dc.b	115				
						
	.dc.b	128				
	.dc.b	224				
	.dc.b	144				
						
	.dc.b	211				
						
	.dc.b	128				
	.dc.b	230				
	.dc.b	235				
						
	.dc.b	83				
						
	.dc.b	128				
	.dc.b	237				
	.dc.b	69				
						
	.dc.b	211				
						
	.dc.b	128				
	.dc.b	243				
	.dc.b	160				
						
	.dc.b	115				
						
	.dc.b	128				
	.dc.b	249				
	.dc.b	251				
						
	.dc.b	51				
						
	.dc.b	129				
	.dc.b	0				
	.dc.b	85				
						
	.dc.b	243				
						
	.dc.b	129				
	.dc.b	6				
	.dc.b	176				
						
	.dc.b	211				
						
	.dc.b	129				
	.dc.b	13				
	.dc.b	11				
						
	.dc.b	211				
						
	.dc.b	129				
	.dc.b	19				
	.dc.b	102				
						
	.dc.b	211				
						
	.dc.b	129				
	.dc.b	25				
	.dc.b	193				
						
	.dc.b	243				
						
	.dc.b	129				
	.dc.b	32				
	.dc.b	29				
						
	.dc.b	19				
						
	.dc.b	129				
	.dc.b	38				
	.dc.b	120				
						
	.dc.b	83				
						
	.dc.b	129				
	.dc.b	44				
	.dc.b	211				
						
	.dc.b	179				
						
	.dc.b	129				
	.dc.b	51				
	.dc.b	47				
						
	.dc.b	19				
						
	.dc.b	129				
	.dc.b	57				
	.dc.b	138				
						
	.dc.b	147				
						
	.dc.b	129				
	.dc.b	63				
	.dc.b	230				
						
	.dc.b	51				
						
	.dc.b	129				
	.dc.b	70				
	.dc.b	65				
						
	.dc.b	211				
						
	.dc.b	129				
	.dc.b	76				
	.dc.b	157				
						
	.dc.b	147				
						
	.dc.b	129				
	.dc.b	82				
	.dc.b	249				
						
	.dc.b	115				
						
	.dc.b	129				
	.dc.b	89				
	.dc.b	85				
						
	.dc.b	83				
						
	.dc.b	129				
	.dc.b	95				
	.dc.b	177				
						
	.dc.b	51				
						
	.dc.b	129				
	.dc.b	102				
	.dc.b	13				
						
	.dc.b	83				
						
	.dc.b	129				
	.dc.b	108				
	.dc.b	105				
						
	.dc.b	115				
						
	.dc.b	129				
	.dc.b	114				
	.dc.b	197				
						
	.dc.b	147				
						
	.dc.b	129				
	.dc.b	121				
	.dc.b	33				
						
	.dc.b	211				
						
	.dc.b	129				
	.dc.b	127				
	.dc.b	126				
						
	.dc.b	51				
						
	.dc.b	129				
	.dc.b	133				
	.dc.b	218				
						
	.dc.b	179				
						
	.dc.b	129				
	.dc.b	140				
	.dc.b	55				
						
	.dc.b	51				
						
	.dc.b	129				
	.dc.b	146				
	.dc.b	147				
						
	.dc.b	211				
						
	.dc.b	129				
	.dc.b	152				
	.dc.b	240				
						
	.dc.b	115				
						
	.dc.b	129				
	.dc.b	159				
	.dc.b	77				
						
	.dc.b	51				
						
	.dc.b	129				
	.dc.b	165				
	.dc.b	169				
						
	.dc.b	243				
						
	.dc.b	129				
	.dc.b	172				
	.dc.b	6				
						
	.dc.b	243				
						
	.dc.b	129				
	.dc.b	178				
	.dc.b	99				
						
	.dc.b	211				
						
	.dc.b	129				
	.dc.b	184				
	.dc.b	192				
						
	.dc.b	243				
						
	.dc.b	129				
	.dc.b	191				
	.dc.b	30				
						
	.dc.b	19				
						
	.dc.b	129				
	.dc.b	197				
	.dc.b	123				
						
	.dc.b	83				
						
	.dc.b	129				
	.dc.b	203				
	.dc.b	216				
						
	.dc.b	147				
						
	.dc.b	129				
	.dc.b	210				
	.dc.b	53				
						
	.dc.b	243				
						
	.dc.b	129				
	.dc.b	216				
	.dc.b	147				
						
	.dc.b	115				
						
	.dc.b	129				
	.dc.b	222				
	.dc.b	240				
						
	.dc.b	243				
						
	.dc.b	129				
	.dc.b	229				
	.dc.b	78				
						
	.dc.b	147				
						
	.dc.b	129				
	.dc.b	235				
	.dc.b	172				
						
	.dc.b	51				
						
	.dc.b	129				
	.dc.b	242				
	.dc.b	9				
						
	.dc.b	243				
						
	.dc.b	129				
	.dc.b	248				
	.dc.b	103				
						
	.dc.b	211				
						
	.dc.b	129				
	.dc.b	254				
	.dc.b	197				
						
	.dc.b	179				
						
	.dc.b	130				
	.dc.b	5				
	.dc.b	35				
						
	.dc.b	179				
						
	.dc.b	130				
	.dc.b	11				
	.dc.b	129				
						
	.dc.b	211				
						
	.dc.b	130				
	.dc.b	17				
	.dc.b	223				
						
	.dc.b	243				
						
	.dc.b	130				
	.dc.b	24				
	.dc.b	62				
						
	.dc.b	51				
						
	.dc.b	130				
	.dc.b	30				
	.dc.b	156				
						
	.dc.b	115				
						
	.dc.b	130				
	.dc.b	36				
	.dc.b	250				
						
	.dc.b	211				
						
	.dc.b	130				
	.dc.b	43				
	.dc.b	89				
						
	.dc.b	83				
						
	.dc.b	130				
	.dc.b	49				
	.dc.b	183				
						
	.dc.b	211				
						
	.dc.b	130				
	.dc.b	56				
	.dc.b	22				
						
	.dc.b	115				
						
	.dc.b	130				
	.dc.b	62				
	.dc.b	117				
						
	.dc.b	51				
						
	.dc.b	130				
	.dc.b	68				
	.dc.b	211				
						
	.dc.b	243				
						
	.dc.b	130				
	.dc.b	75				
	.dc.b	50				
						
	.dc.b	211				
						
	.dc.b	130				
	.dc.b	81				
	.dc.b	145				
						
	.dc.b	179				
						
	.dc.b	130				
	.dc.b	87				
	.dc.b	240				
						
	.dc.b	179				
						
	.dc.b	130				
	.dc.b	94				
	.dc.b	79				
						
	.dc.b	211				
						
	.dc.b	130				
	.dc.b	100				
	.dc.b	174				
						
	.dc.b	243				
						
	.dc.b	130				
	.dc.b	107				
	.dc.b	14				
						
	.dc.b	51				
						
	.dc.b	130				
	.dc.b	113				
	.dc.b	109				
						
	.dc.b	147				
						
	.dc.b	130				
	.dc.b	119				
	.dc.b	204				
						
	.dc.b	243				
						
	.dc.b	130				
	.dc.b	126				
	.dc.b	44				
						
	.dc.b	115				
						
	.dc.b	130				
	.dc.b	132				
	.dc.b	139				
						
	.dc.b	243				
						
	.dc.b	130				
	.dc.b	138				
	.dc.b	235				
						
	.dc.b	147				
						
	.dc.b	130				
	.dc.b	145				
	.dc.b	75				
						
	.dc.b	83				
						
	.dc.b	130				
	.dc.b	151				
	.dc.b	171				
						
	.dc.b	19				
						
	.dc.b	130				
	.dc.b	158				
	.dc.b	10				
						
	.dc.b	243				
						
	.dc.b	130				
	.dc.b	164				
	.dc.b	106				
						
	.dc.b	211				
						
	.dc.b	130				
	.dc.b	170				
	.dc.b	202				
						
	.dc.b	243				
						
	.dc.b	130				
	.dc.b	177				
	.dc.b	42				
						
	.dc.b	243				
						
	.dc.b	130				
	.dc.b	183				
	.dc.b	139				
						
	.dc.b	51				
						
	.dc.b	130				
	.dc.b	189				
	.dc.b	235				
						
	.dc.b	115				
						
	.dc.b	130				
	.dc.b	196				
	.dc.b	75				
						
	.dc.b	179				
						
	.dc.b	130				
	.dc.b	202				
	.dc.b	172				
						
	.dc.b	51				
						
	.dc.b	130				
	.dc.b	209				
	.dc.b	12				
						
	.dc.b	147				
						
	.dc.b	130				
	.dc.b	215				
	.dc.b	109				
						
	.dc.b	51				
						
	.dc.b	130				
	.dc.b	221				
	.dc.b	205				
						
	.dc.b	211				
						
	.dc.b	130				
	.dc.b	228				
	.dc.b	46				
						
	.dc.b	147				
						
	.dc.b	130				
	.dc.b	234				
	.dc.b	143				
						
	.dc.b	83				
						
	.dc.b	130				
	.dc.b	240				
	.dc.b	240				
						
	.dc.b	51				
						
	.dc.b	130				
	.dc.b	247				
	.dc.b	81				
						
	.dc.b	51				
						
	.dc.b	130				
	.dc.b	253				
	.dc.b	178				
						
	.dc.b	51				
						
	.dc.b	131				
	.dc.b	4				
	.dc.b	19				
						
	.dc.b	83				
						
	.dc.b	131				
	.dc.b	10				
	.dc.b	116				
						
	.dc.b	115				
						
	.dc.b	131				
	.dc.b	16				
	.dc.b	213				
						
	.dc.b	179				
						
	.dc.b	131				
	.dc.b	23				
	.dc.b	55				
						
	.dc.b	19				
						
	.dc.b	131				
	.dc.b	29				
	.dc.b	152				
						
	.dc.b	115				
						
	.dc.b	131				
	.dc.b	35				
	.dc.b	249				
						
	.dc.b	243				
						
	.dc.b	131				
	.dc.b	42				
	.dc.b	91				
						
	.dc.b	147				
						
	.dc.b	131				
	.dc.b	48				
	.dc.b	189				
						
	.dc.b	51				
						
	.dc.b	131				
	.dc.b	55				
	.dc.b	30				
						
	.dc.b	243				
						
	.dc.b	131				
	.dc.b	61				
	.dc.b	128				
						
	.dc.b	179				
						
	.dc.b	131				
	.dc.b	67				
	.dc.b	226				
						
	.dc.b	179				
						
	.dc.b	131				
	.dc.b	74				
	.dc.b	68				
						
	.dc.b	147				
						
	.dc.b	131				
	.dc.b	80				
	.dc.b	166				
						
	.dc.b	147				
						
	.dc.b	131				
	.dc.b	87				
	.dc.b	8				
						
	.dc.b	179				
						
	.dc.b	131				
	.dc.b	93				
	.dc.b	106				
						
	.dc.b	243				
						
	.dc.b	131				
	.dc.b	99				
	.dc.b	205				
						
	.dc.b	51				
						
	.dc.b	131				
	.dc.b	106				
	.dc.b	47				
						
	.dc.b	147				
						
	.dc.b	131				
	.dc.b	112				
	.dc.b	145				
						
	.dc.b	243				
						
	.dc.b	131				
	.dc.b	118				
	.dc.b	244				
						
	.dc.b	115				
						
	.dc.b	131				
	.dc.b	125				
	.dc.b	87				
						
	.dc.b	19				
						
	.dc.b	131				
	.dc.b	131				
	.dc.b	185				
						
	.dc.b	179				
						
	.dc.b	131				
	.dc.b	138				
	.dc.b	28				
						
	.dc.b	115				
						
	.dc.b	131				
	.dc.b	144				
	.dc.b	127				
						
	.dc.b	83				
						
	.dc.b	131				
	.dc.b	150				
	.dc.b	226				
						
	.dc.b	51				
						
	.dc.b	131				
	.dc.b	157				
	.dc.b	69				
						
	.dc.b	19				
						
	.dc.b	131				
	.dc.b	163				
	.dc.b	168				
						
	.dc.b	51				
						
	.dc.b	131				
	.dc.b	170				
	.dc.b	11				
						
	.dc.b	83				
						
	.dc.b	131				
	.dc.b	176				
	.dc.b	110				
						
	.dc.b	115				
						
	.dc.b	131				
	.dc.b	182				
	.dc.b	209				
						
	.dc.b	211				
						
	.dc.b	131				
	.dc.b	189				
	.dc.b	53				
						
	.dc.b	19				
						
	.dc.b	131				
	.dc.b	195				
	.dc.b	152				
						
	.dc.b	147				
						
	.dc.b	131				
	.dc.b	201				
	.dc.b	252				
						
	.dc.b	19				
						
	.dc.b	131				
	.dc.b	208				
	.dc.b	95				
						
	.dc.b	179				
						
	.dc.b	131				
	.dc.b	214				
	.dc.b	195				
						
	.dc.b	83				
						
	.dc.b	131				
	.dc.b	221				
	.dc.b	39				
						
	.dc.b	19				
						
	.dc.b	131				
	.dc.b	227				
	.dc.b	138				
						
	.dc.b	243				
						
	.dc.b	131				
	.dc.b	233				
	.dc.b	238				
						
	.dc.b	211				
						
	.dc.b	131				
	.dc.b	240				
	.dc.b	82				
						
	.dc.b	211				
						
	.dc.b	131				
	.dc.b	246				
	.dc.b	182				
						
	.dc.b	211				
						
	.dc.b	131				
	.dc.b	253				
	.dc.b	26				
						
	.dc.b	243				
						
	.dc.b	132				
	.dc.b	3				
	.dc.b	127				
						
	.dc.b	51				
						
	.dc.b	132				
	.dc.b	9				
	.dc.b	227				
						
	.dc.b	115				
						
	.dc.b	132				
	.dc.b	16				
	.dc.b	71				
						
	.dc.b	211				
						
	.dc.b	132				
	.dc.b	22				
	.dc.b	172				
						
	.dc.b	51				
						
	.dc.b	132				
	.dc.b	29				
	.dc.b	16				
						
	.dc.b	179				
						
	.dc.b	132				
	.dc.b	35				
	.dc.b	117				
						
	.dc.b	83				
						
	.dc.b	132				
	.dc.b	41				
	.dc.b	218				
						
	.dc.b	19				
						
	.dc.b	132				
	.dc.b	48				
	.dc.b	62				
						
	.dc.b	211				
						
	.dc.b	132				
	.dc.b	54				
	.dc.b	163				
						
	.dc.b	147				
						
	.dc.b	132				
	.dc.b	61				
	.dc.b	8				
						
	.dc.b	115				
						
	.dc.b	132				
	.dc.b	67				
	.dc.b	109				
						
	.dc.b	115				
						
	.dc.b	132				
	.dc.b	73				
	.dc.b	210				
						
	.dc.b	147				
						
	.dc.b	132				
	.dc.b	80				
	.dc.b	55				
						
	.dc.b	179				
						
	.dc.b	132				
	.dc.b	86				
	.dc.b	156				
						
	.dc.b	211				
						
	.dc.b	132				
	.dc.b	93				
	.dc.b	2				
						
	.dc.b	51				
						
	.dc.b	132				
	.dc.b	99				
	.dc.b	103				
						
	.dc.b	147				
						
	.dc.b	132				
	.dc.b	105				
	.dc.b	204				
						
	.dc.b	243				
						
	.dc.b	132				
	.dc.b	112				
	.dc.b	50				
						
	.dc.b	115				
						
	.dc.b	132				
	.dc.b	118				
	.dc.b	152				
						
	.dc.b	19				
						
	.dc.b	132				
	.dc.b	124				
	.dc.b	253				
						
	.dc.b	211				
						
	.dc.b	132				
	.dc.b	131				
	.dc.b	99				
						
	.dc.b	147				
						
	.dc.b	132				
	.dc.b	137				
	.dc.b	201				
						
	.dc.b	83				
						
	.dc.b	132				
	.dc.b	144				
	.dc.b	47				
						
	.dc.b	51				
						
	.dc.b	132				
	.dc.b	150				
	.dc.b	149				
						
	.dc.b	51				
						
	.dc.b	132				
	.dc.b	156				
	.dc.b	251				
						
	.dc.b	83				
						
	.dc.b	132				
	.dc.b	163				
	.dc.b	97				
						
	.dc.b	115				
						
	.dc.b	132				
	.dc.b	169				
	.dc.b	199				
						
	.dc.b	179				
						
	.dc.b	132				
	.dc.b	176				
	.dc.b	45				
						
	.dc.b	243				
						
	.dc.b	132				
	.dc.b	182				
	.dc.b	148				
						
	.dc.b	83				
						
	.dc.b	132				
	.dc.b	188				
	.dc.b	250				
						
	.dc.b	211				
						
	.dc.b	132				
	.dc.b	195				
	.dc.b	97				
						
	.dc.b	83				
						
	.dc.b	132				
	.dc.b	201				
	.dc.b	199				
						
	.dc.b	243				
						
	.dc.b	132				
	.dc.b	208				
	.dc.b	46				
						
	.dc.b	147				
						
	.dc.b	132				
	.dc.b	214				
	.dc.b	149				
						
	.dc.b	83				
						
	.dc.b	132				
	.dc.b	220				
	.dc.b	252				
						
	.dc.b	51				
						
	.dc.b	132				
	.dc.b	227				
	.dc.b	99				
						
	.dc.b	19				
						
	.dc.b	132				
	.dc.b	233				
	.dc.b	202				
						
	.dc.b	19				
						
	.dc.b	132				
	.dc.b	240				
	.dc.b	49				
						
	.dc.b	19				
						
	.dc.b	132				
	.dc.b	246				
	.dc.b	152				
						
	.dc.b	83				
						
	.dc.b	132				
	.dc.b	252				
	.dc.b	255				
						
	.dc.b	115				
						
	.dc.b	133				
	.dc.b	3				
	.dc.b	102				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	9				
	.dc.b	206				
						
	.dc.b	51				
						
	.dc.b	133				
	.dc.b	16				
	.dc.b	53				
						
	.dc.b	147				
						
	.dc.b	133				
	.dc.b	22				
	.dc.b	157				
						
	.dc.b	19				
						
	.dc.b	133				
	.dc.b	29				
	.dc.b	4				
						
	.dc.b	179				
						
	.dc.b	133				
	.dc.b	35				
	.dc.b	108				
						
	.dc.b	115				
						
	.dc.b	133				
	.dc.b	41				
	.dc.b	212				
						
	.dc.b	51				
						
	.dc.b	133				
	.dc.b	48				
	.dc.b	59				
						
	.dc.b	243				
						
	.dc.b	133				
	.dc.b	54				
	.dc.b	163				
						
	.dc.b	243				
						
	.dc.b	133				
	.dc.b	61				
	.dc.b	11				
						
	.dc.b	243				
						
	.dc.b	133				
	.dc.b	67				
	.dc.b	115				
						
	.dc.b	243				
						
	.dc.b	133				
	.dc.b	73				
	.dc.b	220				
						
	.dc.b	19				
						
	.dc.b	133				
	.dc.b	80				
	.dc.b	68				
						
	.dc.b	83				
						
	.dc.b	133				
	.dc.b	86				
	.dc.b	172				
						
	.dc.b	147				
						
	.dc.b	133				
	.dc.b	93				
	.dc.b	20				
						
	.dc.b	243				
						
	.dc.b	133				
	.dc.b	99				
	.dc.b	125				
						
	.dc.b	115				
						
	.dc.b	133				
	.dc.b	105				
	.dc.b	229				
						
	.dc.b	243				
						
	.dc.b	133				
	.dc.b	112				
	.dc.b	78				
						
	.dc.b	147				
						
	.dc.b	133				
	.dc.b	118				
	.dc.b	183				
						
	.dc.b	83				
						
	.dc.b	133				
	.dc.b	125				
	.dc.b	32				
						
	.dc.b	19				
						
	.dc.b	133				
	.dc.b	131				
	.dc.b	136				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	137				
	.dc.b	241				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	144				
	.dc.b	90				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	150				
	.dc.b	195				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	157				
	.dc.b	44				
						
	.dc.b	243				
						
	.dc.b	133				
	.dc.b	163				
	.dc.b	150				
						
	.dc.b	51				
						
	.dc.b	133				
	.dc.b	169				
	.dc.b	255				
						
	.dc.b	115				
						
	.dc.b	133				
	.dc.b	176				
	.dc.b	104				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	182				
	.dc.b	210				
						
	.dc.b	83				
						
	.dc.b	133				
	.dc.b	189				
	.dc.b	59				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	195				
	.dc.b	165				
						
	.dc.b	115				
						
	.dc.b	133				
	.dc.b	202				
	.dc.b	15				
						
	.dc.b	19				
						
	.dc.b	133				
	.dc.b	208				
	.dc.b	120				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	214				
	.dc.b	226				
						
	.dc.b	179				
						
	.dc.b	133				
	.dc.b	221				
	.dc.b	76				
						
	.dc.b	147				
						
	.dc.b	133				
	.dc.b	227				
	.dc.b	182				
						
	.dc.b	147				
						
	.dc.b	133				
	.dc.b	234				
	.dc.b	32				
						
	.dc.b	179				
						
	.dc.b	133				
	.dc.b	240				
	.dc.b	138				
						
	.dc.b	211				
						
	.dc.b	133				
	.dc.b	246				
	.dc.b	245				
						
	.dc.b	19				
						
	.dc.b	133				
	.dc.b	253				
	.dc.b	95				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	3				
	.dc.b	201				
						
	.dc.b	179				
						
	.dc.b	134				
	.dc.b	10				
	.dc.b	52				
						
	.dc.b	51				
						
	.dc.b	134				
	.dc.b	16				
	.dc.b	158				
						
	.dc.b	179				
						
	.dc.b	134				
	.dc.b	23				
	.dc.b	9				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	29				
	.dc.b	115				
						
	.dc.b	243				
						
	.dc.b	134				
	.dc.b	35				
	.dc.b	222				
						
	.dc.b	179				
						
	.dc.b	134				
	.dc.b	42				
	.dc.b	73				
						
	.dc.b	147				
						
	.dc.b	134				
	.dc.b	48				
	.dc.b	180				
						
	.dc.b	115				
						
	.dc.b	134				
	.dc.b	55				
	.dc.b	31				
						
	.dc.b	115				
						
	.dc.b	134				
	.dc.b	61				
	.dc.b	138				
						
	.dc.b	147				
						
	.dc.b	134				
	.dc.b	67				
	.dc.b	245				
						
	.dc.b	179				
						
	.dc.b	134				
	.dc.b	74				
	.dc.b	96				
						
	.dc.b	211				
						
	.dc.b	134				
	.dc.b	80				
	.dc.b	204				
						
	.dc.b	51				
						
	.dc.b	134				
	.dc.b	87				
	.dc.b	55				
						
	.dc.b	147				
						
	.dc.b	134				
	.dc.b	93				
	.dc.b	162				
						
	.dc.b	243				
						
	.dc.b	134				
	.dc.b	100				
	.dc.b	14				
						
	.dc.b	147				
						
	.dc.b	134				
	.dc.b	106				
	.dc.b	122				
						
	.dc.b	19				
						
	.dc.b	134				
	.dc.b	112				
	.dc.b	229				
						
	.dc.b	211				
						
	.dc.b	134				
	.dc.b	119				
	.dc.b	81				
						
	.dc.b	147				
						
	.dc.b	134				
	.dc.b	125				
	.dc.b	189				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	132				
	.dc.b	41				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	138				
	.dc.b	149				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	145				
	.dc.b	1				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	151				
	.dc.b	109				
						
	.dc.b	115				
						
	.dc.b	134				
	.dc.b	157				
	.dc.b	217				
						
	.dc.b	179				
						
	.dc.b	134				
	.dc.b	164				
	.dc.b	69				
						
	.dc.b	243				
						
	.dc.b	134				
	.dc.b	170				
	.dc.b	178				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	177				
	.dc.b	30				
						
	.dc.b	211				
						
	.dc.b	134				
	.dc.b	183				
	.dc.b	139				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	189				
	.dc.b	247				
						
	.dc.b	243				
						
	.dc.b	134				
	.dc.b	196				
	.dc.b	100				
						
	.dc.b	147				
						
	.dc.b	134				
	.dc.b	202				
	.dc.b	209				
						
	.dc.b	83				
						
	.dc.b	134				
	.dc.b	209				
	.dc.b	62				
						
	.dc.b	51				
						
	.dc.b	134				
	.dc.b	215				
	.dc.b	171				
						
	.dc.b	19				
						
	.dc.b	134				
	.dc.b	222				
	.dc.b	24				
						
	.dc.b	19				
						
	.dc.b	134				
	.dc.b	228				
	.dc.b	133				
						
	.dc.b	19				
						
	.dc.b	134				
	.dc.b	234				
	.dc.b	242				
						
	.dc.b	51				
						
	.dc.b	134				
	.dc.b	241				
	.dc.b	95				
						
	.dc.b	115				
						
	.dc.b	134				
	.dc.b	247				
	.dc.b	204				
						
	.dc.b	179				
						
	.dc.b	134				
	.dc.b	254				
	.dc.b	58				
						
	.dc.b	19				
						
	.dc.b	135				
	.dc.b	4				
	.dc.b	167				
						
	.dc.b	147				
						
	.dc.b	135				
	.dc.b	11				
	.dc.b	21				
						
	.dc.b	19				
						
	.dc.b	135				
	.dc.b	17				
	.dc.b	130				
						
	.dc.b	147				
						
	.dc.b	135				
	.dc.b	23				
	.dc.b	240				
						
	.dc.b	83				
						
	.dc.b	135				
	.dc.b	30				
	.dc.b	94				
						
	.dc.b	19				
						
	.dc.b	135				
	.dc.b	36				
	.dc.b	203				
						
	.dc.b	211				
						
	.dc.b	135				
	.dc.b	43				
	.dc.b	57				
						
	.dc.b	179				
						
	.dc.b	135				
	.dc.b	49				
	.dc.b	167				
						
	.dc.b	179				
						
	.dc.b	135				
	.dc.b	56				
	.dc.b	21				
						
	.dc.b	211				
						
	.dc.b	135				
	.dc.b	62				
	.dc.b	131				
						
	.dc.b	243				
						
	.dc.b	135				
	.dc.b	68				
	.dc.b	242				
						
	.dc.b	19				
						
	.dc.b	135				
	.dc.b	75				
	.dc.b	96				
						
	.dc.b	83				
						
	.dc.b	135				
	.dc.b	81				
	.dc.b	206				
						
	.dc.b	179				
						
	.dc.b	135				
	.dc.b	88				
	.dc.b	61				
						
	.dc.b	51				
						
	.dc.b	135				
	.dc.b	94				
	.dc.b	171				
						
	.dc.b	179				
						
	.dc.b	135				
	.dc.b	101				
	.dc.b	26				
						
	.dc.b	83				
						
	.dc.b	135				
	.dc.b	107				
	.dc.b	136				
						
	.dc.b	243				
						
	.dc.b	135				
	.dc.b	113				
	.dc.b	247				
						
	.dc.b	179				
						
	.dc.b	135				
	.dc.b	120				
	.dc.b	102				
						
	.dc.b	115				
						
	.dc.b	135				
	.dc.b	126				
	.dc.b	213				
						
	.dc.b	83				
						
	.dc.b	135				
	.dc.b	133				
	.dc.b	68				
						
	.dc.b	83				
						
	.dc.b	135				
	.dc.b	139				
	.dc.b	179				
						
	.dc.b	83				
						
	.dc.b	135				
	.dc.b	146				
	.dc.b	34				
						
	.dc.b	115				
						
	.dc.b	135				
	.dc.b	152				
	.dc.b	145				
						
	.dc.b	179				
						
	.dc.b	135				
	.dc.b	159				
	.dc.b	0				
						
	.dc.b	243				
						
	.dc.b	135				
	.dc.b	165				
	.dc.b	112				
						
	.dc.b	83				
						
	.dc.b	135				
	.dc.b	171				
	.dc.b	223				
						
	.dc.b	179				
						
	.dc.b	135				
	.dc.b	178				
	.dc.b	79				
						
	.dc.b	51				
						
	.dc.b	135				
	.dc.b	184				
	.dc.b	190				
						
	.dc.b	211				
						
	.dc.b	135				
	.dc.b	191				
	.dc.b	46				
						
	.dc.b	115				
						
	.dc.b	135				
	.dc.b	197				
	.dc.b	158				
						
	.dc.b	51				
						
	.dc.b	135				
	.dc.b	204				
	.dc.b	14				
						
	.dc.b	19				
						
	.dc.b	135				
	.dc.b	210				
	.dc.b	125				
						
	.dc.b	243				
						
	.dc.b	135				
	.dc.b	216				
	.dc.b	237				
						
	.dc.b	211				
						
	.dc.b	135				
	.dc.b	223				
	.dc.b	93				
						
	.dc.b	243				
						
	.dc.b	135				
	.dc.b	229				
	.dc.b	205				
						
	.dc.b	243				
						
	.dc.b	135				
	.dc.b	236				
	.dc.b	62				
						
	.dc.b	51				
						
	.dc.b	135				
	.dc.b	242				
	.dc.b	174				
						
	.dc.b	115				
						
	.dc.b	135				
	.dc.b	249				
	.dc.b	30				
						
	.dc.b	211				
						
	.dc.b	135				
	.dc.b	255				
	.dc.b	143				
						
	.dc.b	51				
						
	.dc.b	136				
	.dc.b	5				
	.dc.b	255				
						
	.dc.b	179				
						
	.dc.b	136				
	.dc.b	12				
	.dc.b	112				
						
	.dc.b	83				
						
	.dc.b	136				
	.dc.b	18				
	.dc.b	224				
						
	.dc.b	243				
						
	.dc.b	136				
	.dc.b	25				
	.dc.b	81				
						
	.dc.b	179				
						
	.dc.b	136				
	.dc.b	31				
	.dc.b	194				
						
	.dc.b	115				
						
	.dc.b	136				
	.dc.b	38				
	.dc.b	51				
						
	.dc.b	83				
						
	.dc.b	136				
	.dc.b	44				
	.dc.b	164				
						
	.dc.b	83				
						
	.dc.b	136				
	.dc.b	51				
	.dc.b	21				
						
	.dc.b	83				
						
	.dc.b	136				
	.dc.b	57				
	.dc.b	134				
						
	.dc.b	115				
						
	.dc.b	136				
	.dc.b	63				
	.dc.b	247				
						
	.dc.b	147				
						
	.dc.b	136				
	.dc.b	70				
	.dc.b	104				
						
	.dc.b	211				
						
	.dc.b	136				
	.dc.b	76				
	.dc.b	218				
						
	.dc.b	51				
						
	.dc.b	136				
	.dc.b	83				
	.dc.b	75				
						
	.dc.b	147				
						
	.dc.b	136				
	.dc.b	89				
	.dc.b	189				
						
	.dc.b	19				
						
	.dc.b	136				
	.dc.b	96				
	.dc.b	46				
						
	.dc.b	147				
						
	.dc.b	136				
	.dc.b	102				
	.dc.b	160				
						
	.dc.b	51				
						
	.dc.b	136				
	.dc.b	109				
	.dc.b	17				
						
	.dc.b	243				
						
	.dc.b	136				
	.dc.b	115				
	.dc.b	131				
						
	.dc.b	179				
						
	.dc.b	136				
	.dc.b	121				
	.dc.b	245				
						
	.dc.b	147				
						
	.dc.b	136				
	.dc.b	128				
	.dc.b	103				
						
	.dc.b	147				
						
	.dc.b	136				
	.dc.b	134				
	.dc.b	217				
						
	.dc.b	147				
						
	.dc.b	136				
	.dc.b	141				
	.dc.b	75				
						
	.dc.b	179				
						
	.dc.b	136				
	.dc.b	147				
	.dc.b	189				
						
	.dc.b	211				
						
	.dc.b	136				
	.dc.b	154				
	.dc.b	48				
						
	.dc.b	19				
						
	.dc.b	136				
	.dc.b	160				
	.dc.b	162				
						
	.dc.b	115				
						
	.dc.b	136				
	.dc.b	167				
	.dc.b	20				
						
	.dc.b	211				
						
	.dc.b	136				
	.dc.b	173				
	.dc.b	135				
						
	.dc.b	51				
						
	.dc.b	136				
	.dc.b	179				
	.dc.b	249				
						
	.dc.b	211				
						
	.dc.b	136				
	.dc.b	186				
	.dc.b	108				
						
	.dc.b	115				
						
	.dc.b	136				
	.dc.b	192				
	.dc.b	223				
						
	.dc.b	19				
						
	.dc.b	136				
	.dc.b	199				
	.dc.b	81				
						
	.dc.b	243				
						
	.dc.b	136				
	.dc.b	205				
	.dc.b	196				
						
	.dc.b	179				
						
	.dc.b	136				
	.dc.b	212				
	.dc.b	55				
						
	.dc.b	179				
						
	.dc.b	136				
	.dc.b	218				
	.dc.b	170				
						
	.dc.b	179				
						
	.dc.b	136				
	.dc.b	225				
	.dc.b	29				
						
	.dc.b	211				
						
	.dc.b	136				
	.dc.b	231				
	.dc.b	144				
						
	.dc.b	243				
						
	.dc.b	136				
	.dc.b	238				
	.dc.b	4				
						
	.dc.b	51				
						
	.dc.b	136				
	.dc.b	244				
	.dc.b	119				
						
	.dc.b	115				
						
	.dc.b	136				
	.dc.b	250				
	.dc.b	234				
						
	.dc.b	211				
						
	.dc.b	137				
	.dc.b	1				
	.dc.b	94				
						
	.dc.b	83				
						
	.dc.b	137				
	.dc.b	7				
	.dc.b	209				
						
	.dc.b	211				
						
	.dc.b	137				
	.dc.b	14				
	.dc.b	69				
						
	.dc.b	115				
						
	.dc.b	137				
	.dc.b	20				
	.dc.b	185				
						
	.dc.b	51				
						
	.dc.b	137				
	.dc.b	27				
	.dc.b	44				
						
	.dc.b	243				
						
	.dc.b	137				
	.dc.b	33				
	.dc.b	160				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	40				
	.dc.b	20				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	46				
	.dc.b	136				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	52				
	.dc.b	252				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	59				
	.dc.b	112				
						
	.dc.b	211				
						
	.dc.b	137				
	.dc.b	65				
	.dc.b	229				
						
	.dc.b	19				
						
	.dc.b	137				
	.dc.b	72				
	.dc.b	89				
						
	.dc.b	83				
						
	.dc.b	137				
	.dc.b	78				
	.dc.b	205				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	85				
	.dc.b	66				
						
	.dc.b	51				
						
	.dc.b	137				
	.dc.b	91				
	.dc.b	182				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	98				
	.dc.b	43				
						
	.dc.b	83				
						
	.dc.b	137				
	.dc.b	104				
	.dc.b	159				
						
	.dc.b	243				
						
	.dc.b	137				
	.dc.b	111				
	.dc.b	20				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	117				
	.dc.b	137				
						
	.dc.b	147				
						
	.dc.b	137				
	.dc.b	123				
	.dc.b	254				
						
	.dc.b	115				
						
	.dc.b	137				
	.dc.b	130				
	.dc.b	115				
						
	.dc.b	115				
						
	.dc.b	137				
	.dc.b	136				
	.dc.b	232				
						
	.dc.b	115				
						
	.dc.b	137				
	.dc.b	143				
	.dc.b	93				
						
	.dc.b	147				
						
	.dc.b	137				
	.dc.b	149				
	.dc.b	210				
						
	.dc.b	211				
						
	.dc.b	137				
	.dc.b	156				
	.dc.b	72				
						
	.dc.b	19				
						
	.dc.b	137				
	.dc.b	162				
	.dc.b	189				
						
	.dc.b	115				
						
	.dc.b	137				
	.dc.b	169				
	.dc.b	50				
						
	.dc.b	243				
						
	.dc.b	137				
	.dc.b	175				
	.dc.b	168				
						
	.dc.b	115				
						
	.dc.b	137				
	.dc.b	182				
	.dc.b	29				
						
	.dc.b	243				
						
	.dc.b	137				
	.dc.b	188				
	.dc.b	147				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	195				
	.dc.b	9				
						
	.dc.b	115				
						
	.dc.b	137				
	.dc.b	201				
	.dc.b	127				
						
	.dc.b	51				
						
	.dc.b	137				
	.dc.b	207				
	.dc.b	245				
						
	.dc.b	19				
						
	.dc.b	137				
	.dc.b	214				
	.dc.b	107				
						
	.dc.b	19				
						
	.dc.b	137				
	.dc.b	220				
	.dc.b	225				
						
	.dc.b	19				
						
	.dc.b	137				
	.dc.b	227				
	.dc.b	87				
						
	.dc.b	51				
						
	.dc.b	137				
	.dc.b	233				
	.dc.b	205				
						
	.dc.b	115				
						
	.dc.b	137				
	.dc.b	240				
	.dc.b	67				
						
	.dc.b	179				
						
	.dc.b	137				
	.dc.b	246				
	.dc.b	185				
						
	.dc.b	243				
						
	.dc.b	137				
	.dc.b	253				
	.dc.b	48				
						
	.dc.b	115				
						
	.dc.b	138				
	.dc.b	3				
	.dc.b	166				
						
	.dc.b	243				
						
	.dc.b	138				
	.dc.b	10				
	.dc.b	29				
						
	.dc.b	115				
						
	.dc.b	138				
	.dc.b	16				
	.dc.b	148				
						
	.dc.b	19				
						
	.dc.b	138				
	.dc.b	23				
	.dc.b	10				
						
	.dc.b	211				
						
	.dc.b	138				
	.dc.b	29				
	.dc.b	129				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	35				
	.dc.b	248				
						
	.dc.b	147				
						
	.dc.b	138				
	.dc.b	42				
	.dc.b	111				
						
	.dc.b	115				
						
	.dc.b	138				
	.dc.b	48				
	.dc.b	230				
						
	.dc.b	115				
						
	.dc.b	138				
	.dc.b	55				
	.dc.b	93				
						
	.dc.b	147				
						
	.dc.b	138				
	.dc.b	61				
	.dc.b	212				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	68				
	.dc.b	75				
						
	.dc.b	243				
						
	.dc.b	138				
	.dc.b	74				
	.dc.b	195				
						
	.dc.b	83				
						
	.dc.b	138				
	.dc.b	81				
	.dc.b	58				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	87				
	.dc.b	178				
						
	.dc.b	51				
						
	.dc.b	138				
	.dc.b	94				
	.dc.b	41				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	100				
	.dc.b	161				
						
	.dc.b	83				
						
	.dc.b	138				
	.dc.b	107				
	.dc.b	25				
						
	.dc.b	19				
						
	.dc.b	138				
	.dc.b	113				
	.dc.b	144				
						
	.dc.b	211				
						
	.dc.b	138				
	.dc.b	120				
	.dc.b	8				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	126				
	.dc.b	128				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	132				
	.dc.b	248				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	139				
	.dc.b	112				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	145				
	.dc.b	232				
						
	.dc.b	211				
						
	.dc.b	138				
	.dc.b	152				
	.dc.b	97				
						
	.dc.b	19				
						
	.dc.b	138				
	.dc.b	158				
	.dc.b	217				
						
	.dc.b	115				
						
	.dc.b	138				
	.dc.b	165				
	.dc.b	81				
						
	.dc.b	211				
						
	.dc.b	138				
	.dc.b	171				
	.dc.b	202				
						
	.dc.b	51				
						
	.dc.b	138				
	.dc.b	178				
	.dc.b	66				
						
	.dc.b	211				
						
	.dc.b	138				
	.dc.b	184				
	.dc.b	187				
						
	.dc.b	115				
						
	.dc.b	138				
	.dc.b	191				
	.dc.b	52				
						
	.dc.b	19				
						
	.dc.b	138				
	.dc.b	197				
	.dc.b	172				
						
	.dc.b	211				
						
	.dc.b	138				
	.dc.b	204				
	.dc.b	37				
						
	.dc.b	179				
						
	.dc.b	138				
	.dc.b	210				
	.dc.b	158				
						
	.dc.b	147				
						
	.dc.b	138				
	.dc.b	217				
	.dc.b	23				
						
	.dc.b	147				
						
	.dc.b	138				
	.dc.b	223				
	.dc.b	144				
						
	.dc.b	147				
						
	.dc.b	138				
	.dc.b	230				
	.dc.b	9				
						
	.dc.b	211				
						
	.dc.b	138				
	.dc.b	236				
	.dc.b	130				
						
	.dc.b	243				
						
	.dc.b	138				
	.dc.b	242				
	.dc.b	252				
						
	.dc.b	83				
						
	.dc.b	138				
	.dc.b	249				
	.dc.b	117				
						
	.dc.b	147				
						
	.dc.b	138				
	.dc.b	255				
	.dc.b	239				
						
	.dc.b	19				
						
	.dc.b	139				
	.dc.b	6				
	.dc.b	104				
						
	.dc.b	147				
						
	.dc.b	139				
	.dc.b	12				
	.dc.b	226				
						
	.dc.b	51				
						
	.dc.b	139				
	.dc.b	19				
	.dc.b	91				
						
	.dc.b	211				
						
	.dc.b	139				
	.dc.b	25				
	.dc.b	213				
						
	.dc.b	147				
						
	.dc.b	139				
	.dc.b	32				
	.dc.b	79				
						
	.dc.b	115				
						
	.dc.b	139				
	.dc.b	38				
	.dc.b	201				
						
	.dc.b	83				
						
	.dc.b	139				
	.dc.b	45				
	.dc.b	67				
						
	.dc.b	51				
						
	.dc.b	139				
	.dc.b	51				
	.dc.b	189				
						
	.dc.b	83				
						
	.dc.b	139				
	.dc.b	58				
	.dc.b	55				
						
	.dc.b	115				
						
	.dc.b	139				
	.dc.b	64				
	.dc.b	177				
						
	.dc.b	147				
						
	.dc.b	139				
	.dc.b	71				
	.dc.b	43				
						
	.dc.b	211				
						
	.dc.b	139				
	.dc.b	77				
	.dc.b	166				
						
	.dc.b	51				
						
	.dc.b	139				
	.dc.b	84				
	.dc.b	32				
						
	.dc.b	147				
						
	.dc.b	139				
	.dc.b	90				
	.dc.b	155				
						
	.dc.b	19				
						
	.dc.b	139				
	.dc.b	97				
	.dc.b	21				
						
	.dc.b	179				
						
	.dc.b	139				
	.dc.b	103				
	.dc.b	144				
						
	.dc.b	83				
						
	.dc.b	139				
	.dc.b	110				
	.dc.b	11				
						
	.dc.b	19				
						
	.dc.b	139				
	.dc.b	116				
	.dc.b	133				
						
	.dc.b	211				
						
	.dc.b	139				
	.dc.b	123				
	.dc.b	0				
						
	.dc.b	179				
						
	.dc.b	139				
	.dc.b	129				
	.dc.b	123				
						
	.dc.b	179				
						
	.dc.b	139				
	.dc.b	135				
	.dc.b	246				
						
	.dc.b	179				
						
	.dc.b	139				
	.dc.b	142				
	.dc.b	113				
						
	.dc.b	211				
						
	.dc.b	139				
	.dc.b	148				
	.dc.b	236				
						
	.dc.b	243				
						
	.dc.b	139				
	.dc.b	155				
	.dc.b	104				
						
	.dc.b	51				
						
	.dc.b	139				
	.dc.b	161				
	.dc.b	227				
						
	.dc.b	115				
						
	.dc.b	139				
	.dc.b	168				
	.dc.b	94				
						
	.dc.b	243				
						
	.dc.b	139				
	.dc.b	174				
	.dc.b	218				
						
	.dc.b	83				
						
	.dc.b	139				
	.dc.b	181				
	.dc.b	85				
						
	.dc.b	243				
						
	.dc.b	139				
	.dc.b	187				
	.dc.b	209				
						
	.dc.b	147				
						
	.dc.b	139				
	.dc.b	194				
	.dc.b	77				
						
	.dc.b	51				
						
	.dc.b	139				
	.dc.b	200				
	.dc.b	200				
						
	.dc.b	243				
						
	.dc.b	139				
	.dc.b	207				
	.dc.b	68				
						
	.dc.b	211				
						
	.dc.b	139				
	.dc.b	213				
	.dc.b	192				
						
	.dc.b	211				
						
	.dc.b	139				
	.dc.b	220				
	.dc.b	60				
						
	.dc.b	211				
						
	.dc.b	139				
	.dc.b	226				
	.dc.b	184				
						
	.dc.b	211				
						
	.dc.b	139				
	.dc.b	233				
	.dc.b	52				
						
	.dc.b	243				
						
	.dc.b	139				
	.dc.b	239				
	.dc.b	177				
						
	.dc.b	51				
						
	.dc.b	139				
	.dc.b	246				
	.dc.b	45				
						
	.dc.b	147				
						
	.dc.b	139				
	.dc.b	252				
	.dc.b	169				
						
	.dc.b	243				
						
	.dc.b	140				
	.dc.b	3				
	.dc.b	38				
						
	.dc.b	83				
						
	.dc.b	140				
	.dc.b	9				
	.dc.b	162				
						
	.dc.b	211				
						
	.dc.b	140				
	.dc.b	16				
	.dc.b	31				
						
	.dc.b	115				
						
	.dc.b	140				
	.dc.b	22				
	.dc.b	156				
						
	.dc.b	51				
						
	.dc.b	140				
	.dc.b	29				
	.dc.b	24				
						
	.dc.b	243				
						
	.dc.b	140				
	.dc.b	35				
	.dc.b	149				
						
	.dc.b	179				
						
	.dc.b	140				
	.dc.b	42				
	.dc.b	18				
						
	.dc.b	147				
						
	.dc.b	140				
	.dc.b	48				
	.dc.b	143				
						
	.dc.b	147				
						
	.dc.b	140				
	.dc.b	55				
	.dc.b	12				
						
	.dc.b	147				
						
	.dc.b	140				
	.dc.b	61				
	.dc.b	137				
						
	.dc.b	179				
						
	.dc.b	140				
	.dc.b	68				
	.dc.b	6				
						
	.dc.b	243				
						
	.dc.b	140				
	.dc.b	74				
	.dc.b	132				
						
	.dc.b	51				
						
	.dc.b	140				
	.dc.b	81				
	.dc.b	1				
						
	.dc.b	147				
						
	.dc.b	140				
	.dc.b	87				
	.dc.b	126				
						
	.dc.b	243				
						
	.dc.b	140				
	.dc.b	93				
	.dc.b	252				
						
	.dc.b	115				
						
	.dc.b	140				
	.dc.b	100				
	.dc.b	122				
						
	.dc.b	19				
						
	.dc.b	140				
	.dc.b	106				
	.dc.b	247				
						
	.dc.b	179				
						
	.dc.b	140				
	.dc.b	113				
	.dc.b	117				
						
	.dc.b	115				
						
	.dc.b	140				
	.dc.b	119				
	.dc.b	243				
						
	.dc.b	51				
						
	.dc.b	140				
	.dc.b	126				
	.dc.b	113				
						
	.dc.b	19				
						
	.dc.b	140				
	.dc.b	132				
	.dc.b	239				
						
	.dc.b	19				
						
	.dc.b	140				
	.dc.b	139				
	.dc.b	109				
						
	.dc.b	19				
						
	.dc.b	140				
	.dc.b	145				
	.dc.b	235				
						
	.dc.b	51				
						
	.dc.b	140				
	.dc.b	152				
	.dc.b	105				
						
	.dc.b	83				
						
	.dc.b	140				
	.dc.b	158				
	.dc.b	231				
						
	.dc.b	147				
						
	.dc.b	140				
	.dc.b	165				
	.dc.b	101				
						
	.dc.b	243				
						
	.dc.b	140				
	.dc.b	171				
	.dc.b	228				
						
	.dc.b	83				
						
	.dc.b	140				
	.dc.b	178				
	.dc.b	98				
						
	.dc.b	211				
						
	.dc.b	140				
	.dc.b	184				
	.dc.b	225				
						
	.dc.b	83				
						
	.dc.b	140				
	.dc.b	191				
	.dc.b	95				
						
	.dc.b	243				
						
	.dc.b	140				
	.dc.b	197				
	.dc.b	222				
						
	.dc.b	179				
						
	.dc.b	140				
	.dc.b	204				
	.dc.b	93				
						
	.dc.b	115				
						
	.dc.b	140				
	.dc.b	210				
	.dc.b	220				
						
	.dc.b	83				
						
	.dc.b	140				
	.dc.b	217				
	.dc.b	91				
						
	.dc.b	51				
						
	.dc.b	140				
	.dc.b	223				
	.dc.b	218				
						
	.dc.b	51				
						
	.dc.b	140				
	.dc.b	230				
	.dc.b	89				
						
	.dc.b	83				
						
	.dc.b	140				
	.dc.b	236				
	.dc.b	216				
						
	.dc.b	115				
						
	.dc.b	140				
	.dc.b	243				
	.dc.b	87				
						
	.dc.b	179				
						
	.dc.b	140				
	.dc.b	249				
	.dc.b	214				
						
	.dc.b	243				
						
	.dc.b	141				
	.dc.b	0				
	.dc.b	86				
						
	.dc.b	83				
						
	.dc.b	141				
	.dc.b	6				
	.dc.b	213				
						
	.dc.b	211				
						
	.dc.b	141				
	.dc.b	13				
	.dc.b	85				
						
	.dc.b	83				
						
	.dc.b	141				
	.dc.b	19				
	.dc.b	212				
						
	.dc.b	243				
						
	.dc.b	141				
	.dc.b	26				
	.dc.b	84				
						
	.dc.b	147				
						
	.dc.b	141				
	.dc.b	32				
	.dc.b	212				
						
	.dc.b	83				
						
	.dc.b	141				
	.dc.b	39				
	.dc.b	84				
						
	.dc.b	51				
						
	.dc.b	141				
	.dc.b	45				
	.dc.b	212				
						
	.dc.b	19				
						
	.dc.b	141				
	.dc.b	52				
	.dc.b	84				
						
	.dc.b	19				
						
	.dc.b	141				
	.dc.b	58				
	.dc.b	212				
						
	.dc.b	19				
						
	.dc.b	141				
	.dc.b	65				
	.dc.b	84				
						
	.dc.b	51				
						
	.dc.b	141				
	.dc.b	71				
	.dc.b	212				
						
	.dc.b	115				
						
	.dc.b	141				
	.dc.b	78				
	.dc.b	84				
						
	.dc.b	179				
						
	.dc.b	141				
	.dc.b	84				
	.dc.b	213				
						
	.dc.b	19				
						
	.dc.b	141				
	.dc.b	91				
	.dc.b	85				
						
	.dc.b	115				
						
	.dc.b	141				
	.dc.b	97				
	.dc.b	213				
						
	.dc.b	243				
						
	.dc.b	141				
	.dc.b	104				
	.dc.b	86				
						
	.dc.b	115				
						
	.dc.b	141				
	.dc.b	110				
	.dc.b	215				
						
	.dc.b	51				
						
	.dc.b	141				
	.dc.b	117				
	.dc.b	87				
						
	.dc.b	211				
						
	.dc.b	141				
	.dc.b	123				
	.dc.b	216				
						
	.dc.b	179				
						
	.dc.b	141				
	.dc.b	130				
	.dc.b	89				
						
	.dc.b	147				
						
	.dc.b	141				
	.dc.b	136				
	.dc.b	218				
						
	.dc.b	115				
						
	.dc.b	141				
	.dc.b	143				
	.dc.b	91				
						
	.dc.b	115				
						
	.dc.b	141				
	.dc.b	149				
	.dc.b	220				
						
	.dc.b	147				
						
	.dc.b	141				
	.dc.b	156				
	.dc.b	93				
						
	.dc.b	211				
						
	.dc.b	141				
	.dc.b	162				
	.dc.b	222				
						
	.dc.b	243				
						
	.dc.b	141				
	.dc.b	169				
	.dc.b	96				
						
	.dc.b	83				
						
	.dc.b	141				
	.dc.b	175				
	.dc.b	225				
						
	.dc.b	179				
						
	.dc.b	141				
	.dc.b	182				
	.dc.b	99				
						
	.dc.b	51				
						
	.dc.b	141				
	.dc.b	188				
	.dc.b	228				
						
	.dc.b	179				
						
	.dc.b	141				
	.dc.b	195				
	.dc.b	102				
						
	.dc.b	83				
						
	.dc.b	141				
	.dc.b	201				
	.dc.b	232				
						
	.dc.b	19				
						
	.dc.b	141				
	.dc.b	208				
	.dc.b	105				
						
	.dc.b	211				
						
	.dc.b	141				
	.dc.b	214				
	.dc.b	235				
						
	.dc.b	147				
						
	.dc.b	141				
	.dc.b	221				
	.dc.b	109				
						
	.dc.b	147				
						
	.dc.b	141				
	.dc.b	227				
	.dc.b	239				
						
	.dc.b	147				
						
	.dc.b	141				
	.dc.b	234				
	.dc.b	113				
						
	.dc.b	147				
						
	.dc.b	141				
	.dc.b	240				
	.dc.b	243				
						
	.dc.b	179				
						
	.dc.b	141				
	.dc.b	247				
	.dc.b	117				
						
	.dc.b	243				
						
	.dc.b	141				
	.dc.b	253				
	.dc.b	248				
						
	.dc.b	51				
						
	.dc.b	142				
	.dc.b	4				
	.dc.b	122				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	10				
	.dc.b	253				
						
	.dc.b	19				
						
	.dc.b	142				
	.dc.b	17				
	.dc.b	127				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	24				
	.dc.b	2				
						
	.dc.b	51				
						
	.dc.b	142				
	.dc.b	30				
	.dc.b	132				
						
	.dc.b	211				
						
	.dc.b	142				
	.dc.b	37				
	.dc.b	7				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	43				
	.dc.b	138				
						
	.dc.b	83				
						
	.dc.b	142				
	.dc.b	50				
	.dc.b	13				
						
	.dc.b	51				
						
	.dc.b	142				
	.dc.b	56				
	.dc.b	144				
						
	.dc.b	51				
						
	.dc.b	142				
	.dc.b	63				
	.dc.b	19				
						
	.dc.b	51				
						
	.dc.b	142				
	.dc.b	69				
	.dc.b	150				
						
	.dc.b	83				
						
	.dc.b	142				
	.dc.b	76				
	.dc.b	25				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	82				
	.dc.b	156				
						
	.dc.b	211				
						
	.dc.b	142				
	.dc.b	89				
	.dc.b	32				
						
	.dc.b	19				
						
	.dc.b	142				
	.dc.b	95				
	.dc.b	163				
						
	.dc.b	115				
						
	.dc.b	142				
	.dc.b	102				
	.dc.b	38				
						
	.dc.b	243				
						
	.dc.b	142				
	.dc.b	108				
	.dc.b	170				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	115				
	.dc.b	46				
						
	.dc.b	51				
						
	.dc.b	142				
	.dc.b	121				
	.dc.b	177				
						
	.dc.b	211				
						
	.dc.b	142				
	.dc.b	128				
	.dc.b	53				
						
	.dc.b	179				
						
	.dc.b	142				
	.dc.b	134				
	.dc.b	185				
						
	.dc.b	115				
						
	.dc.b	142				
	.dc.b	141				
	.dc.b	61				
						
	.dc.b	115				
						
	.dc.b	142				
	.dc.b	147				
	.dc.b	193				
						
	.dc.b	115				
						
	.dc.b	142				
	.dc.b	154				
	.dc.b	69				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	160				
	.dc.b	201				
						
	.dc.b	179				
						
	.dc.b	142				
	.dc.b	167				
	.dc.b	77				
						
	.dc.b	243				
						
	.dc.b	142				
	.dc.b	173				
	.dc.b	210				
						
	.dc.b	51				
						
	.dc.b	142				
	.dc.b	180				
	.dc.b	86				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	186				
	.dc.b	218				
						
	.dc.b	243				
						
	.dc.b	142				
	.dc.b	193				
	.dc.b	95				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	199				
	.dc.b	228				
						
	.dc.b	19				
						
	.dc.b	142				
	.dc.b	206				
	.dc.b	104				
						
	.dc.b	211				
						
	.dc.b	142				
	.dc.b	212				
	.dc.b	237				
						
	.dc.b	147				
						
	.dc.b	142				
	.dc.b	219				
	.dc.b	114				
						
	.dc.b	83				
						
	.dc.b	142				
	.dc.b	225				
	.dc.b	247				
						
	.dc.b	83				
						
	.dc.b	142				
	.dc.b	232				
	.dc.b	124				
						
	.dc.b	51				
						
	.dc.b	142				
	.dc.b	239				
	.dc.b	1				
						
	.dc.b	83				
						
	.dc.b	142				
	.dc.b	245				
	.dc.b	134				
						
	.dc.b	115				
						
	.dc.b	142				
	.dc.b	252				
	.dc.b	11				
						
	.dc.b	147				
						
	.dc.b	143				
	.dc.b	2				
	.dc.b	144				
						
	.dc.b	211				
						
	.dc.b	143				
	.dc.b	9				
	.dc.b	22				
						
	.dc.b	51				
						
	.dc.b	143				
	.dc.b	15				
	.dc.b	155				
						
	.dc.b	147				
						
	.dc.b	143				
	.dc.b	22				
	.dc.b	33				
						
	.dc.b	19				
						
	.dc.b	143				
	.dc.b	28				
	.dc.b	166				
						
	.dc.b	179				
						
	.dc.b	143				
	.dc.b	35				
	.dc.b	44				
						
	.dc.b	83				
						
	.dc.b	143				
	.dc.b	41				
	.dc.b	177				
						
	.dc.b	243				
						
	.dc.b	143				
	.dc.b	48				
	.dc.b	55				
						
	.dc.b	211				
						
	.dc.b	143				
	.dc.b	54				
	.dc.b	189				
						
	.dc.b	179				
						
	.dc.b	143				
	.dc.b	61				
	.dc.b	67				
						
	.dc.b	147				
						
	.dc.b	143				
	.dc.b	67				
	.dc.b	201				
						
	.dc.b	147				
						
	.dc.b	143				
	.dc.b	74				
	.dc.b	79				
						
	.dc.b	179				
						
	.dc.b	143				
	.dc.b	80				
	.dc.b	213				
						
	.dc.b	211				
						
	.dc.b	143				
	.dc.b	87				
	.dc.b	92				
						
	.dc.b	19				
						
	.dc.b	143				
	.dc.b	93				
	.dc.b	226				
						
	.dc.b	83				
						
	.dc.b	143				
	.dc.b	100				
	.dc.b	104				
						
	.dc.b	211				
						
	.dc.b	143				
	.dc.b	106				
	.dc.b	239				
						
	.dc.b	51				
						
	.dc.b	143				
	.dc.b	113				
	.dc.b	117				
						
	.dc.b	179				
						
	.dc.b	143				
	.dc.b	119				
	.dc.b	252				
						
	.dc.b	83				
						
	.dc.b	143				
	.dc.b	126				
	.dc.b	131				
						
	.dc.b	19				
						
	.dc.b	143				
	.dc.b	133				
	.dc.b	9				
						
	.dc.b	211				
						
	.dc.b	143				
	.dc.b	139				
	.dc.b	144				
						
	.dc.b	147				
						
	.dc.b	143				
	.dc.b	146				
	.dc.b	23				
						
	.dc.b	115				
						
	.dc.b	143				
	.dc.b	152				
	.dc.b	158				
						
	.dc.b	115				
						
	.dc.b	143				
	.dc.b	159				
	.dc.b	37				
						
	.dc.b	147				
						
	.dc.b	143				
	.dc.b	165				
	.dc.b	172				
						
	.dc.b	179				
						
	.dc.b	143				
	.dc.b	172				
	.dc.b	51				
						
	.dc.b	211				
						
	.dc.b	143				
	.dc.b	178				
	.dc.b	187				
						
	.dc.b	19				
						
	.dc.b	143				
	.dc.b	185				
	.dc.b	66				
						
	.dc.b	115				
						
	.dc.b	143				
	.dc.b	191				
	.dc.b	201				
						
	.dc.b	211				
						
	.dc.b	143				
	.dc.b	198				
	.dc.b	81				
						
	.dc.b	83				
						
	.dc.b	143				
	.dc.b	204				
	.dc.b	216				
						
	.dc.b	243				
						
	.dc.b	143				
	.dc.b	211				
	.dc.b	96				
						
	.dc.b	147				
						
	.dc.b	143				
	.dc.b	217				
	.dc.b	232				
						
	.dc.b	83				
						
	.dc.b	143				
	.dc.b	224				
	.dc.b	112				
						
	.dc.b	19				
						
	.dc.b	143				
	.dc.b	230				
	.dc.b	247				
						
	.dc.b	243				
						
	.dc.b	143				
	.dc.b	237				
	.dc.b	127				
						
	.dc.b	243				
						
	.dc.b	143				
	.dc.b	244				
	.dc.b	7				
						
	.dc.b	243				
						
	.dc.b	143				
	.dc.b	250				
	.dc.b	143				
						
	.dc.b	243				
						
	.dc.b	144				
	.dc.b	1				
	.dc.b	24				
						
	.dc.b	51				
						
	.dc.b	144				
	.dc.b	7				
	.dc.b	160				
						
	.dc.b	83				
						
	.dc.b	144				
	.dc.b	14				
	.dc.b	40				
						
	.dc.b	179				
						
	.dc.b	144				
	.dc.b	20				
	.dc.b	177				
						
	.dc.b	19				
						
	.dc.b	144				
	.dc.b	27				
	.dc.b	57				
						
	.dc.b	147				
						
	.dc.b	144				
	.dc.b	33				
	.dc.b	194				
						
	.dc.b	19				
						
	.dc.b	144				
	.dc.b	40				
	.dc.b	74				
						
	.dc.b	179				
						
	.dc.b	144				
	.dc.b	46				
	.dc.b	211				
						
	.dc.b	83				
						
	.dc.b	144				
	.dc.b	53				
	.dc.b	92				
						
	.dc.b	19				
						
	.dc.b	144				
	.dc.b	59				
	.dc.b	228				
						
	.dc.b	243				
						
	.dc.b	144				
	.dc.b	66				
	.dc.b	109				
						
	.dc.b	211				
						
	.dc.b	144				
	.dc.b	72				
	.dc.b	246				
						
	.dc.b	211				
						
	.dc.b	144				
	.dc.b	79				
	.dc.b	127				
						
	.dc.b	211				
						
	.dc.b	144				
	.dc.b	86				
	.dc.b	8				
						
	.dc.b	243				
						
	.dc.b	144				
	.dc.b	92				
	.dc.b	146				
						
	.dc.b	51				
						
	.dc.b	144				
	.dc.b	99				
	.dc.b	27				
						
	.dc.b	115				
						
	.dc.b	144				
	.dc.b	105				
	.dc.b	164				
						
	.dc.b	211				
						
	.dc.b	144				
	.dc.b	112				
	.dc.b	46				
						
	.dc.b	51				
						
	.dc.b	144				
	.dc.b	118				
	.dc.b	183				
						
	.dc.b	179				
						
	.dc.b	144				
	.dc.b	125				
	.dc.b	65				
						
	.dc.b	83				
						
	.dc.b	144				
	.dc.b	131				
	.dc.b	202				
						
	.dc.b	243				
						
	.dc.b	144				
	.dc.b	138				
	.dc.b	84				
						
	.dc.b	147				
						
	.dc.b	144				
	.dc.b	144				
	.dc.b	222				
						
	.dc.b	115				
						
	.dc.b	144				
	.dc.b	151				
	.dc.b	104				
						
	.dc.b	83				
						
	.dc.b	144				
	.dc.b	157				
	.dc.b	242				
						
	.dc.b	51				
						
	.dc.b	144				
	.dc.b	164				
	.dc.b	124				
						
	.dc.b	51				
						
	.dc.b	144				
	.dc.b	171				
	.dc.b	6				
						
	.dc.b	83				
						
	.dc.b	144				
	.dc.b	177				
	.dc.b	144				
						
	.dc.b	115				
						
	.dc.b	144				
	.dc.b	184				
	.dc.b	26				
						
	.dc.b	179				
						
	.dc.b	144				
	.dc.b	190				
	.dc.b	164				
						
	.dc.b	243				
						
	.dc.b	144				
	.dc.b	197				
	.dc.b	47				
						
	.dc.b	83				
						
	.dc.b	144				
	.dc.b	203				
	.dc.b	185				
						
	.dc.b	211				
						
	.dc.b	144				
	.dc.b	210				
	.dc.b	68				
						
	.dc.b	83				
						
	.dc.b	144				
	.dc.b	216				
	.dc.b	206				
						
	.dc.b	243				
						
	.dc.b	144				
	.dc.b	223				
	.dc.b	89				
						
	.dc.b	147				
						
	.dc.b	144				
	.dc.b	229				
	.dc.b	228				
						
	.dc.b	83				
						
	.dc.b	144				
	.dc.b	236				
	.dc.b	111				
						
	.dc.b	51				
						
	.dc.b	144				
	.dc.b	242				
	.dc.b	250				
						
	.dc.b	19				
						
	.dc.b	144				
	.dc.b	249				
	.dc.b	133				
						
	.dc.b	19				
						
	.dc.b	145				
	.dc.b	0				
	.dc.b	16				
						
	.dc.b	19				
						
	.dc.b	145				
	.dc.b	6				
	.dc.b	155				
						
	.dc.b	51				
						
	.dc.b	145				
	.dc.b	13				
	.dc.b	38				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	19				
	.dc.b	177				
						
	.dc.b	179				
						
	.dc.b	145				
	.dc.b	26				
	.dc.b	61				
						
	.dc.b	19				
						
	.dc.b	145				
	.dc.b	32				
	.dc.b	200				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	39				
	.dc.b	83				
						
	.dc.b	243				
						
	.dc.b	145				
	.dc.b	45				
	.dc.b	223				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	52				
	.dc.b	107				
						
	.dc.b	19				
						
	.dc.b	145				
	.dc.b	58				
	.dc.b	246				
						
	.dc.b	211				
						
	.dc.b	145				
	.dc.b	65				
	.dc.b	130				
						
	.dc.b	147				
						
	.dc.b	145				
	.dc.b	72				
	.dc.b	14				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	78				
	.dc.b	154				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	85				
	.dc.b	38				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	91				
	.dc.b	178				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	98				
	.dc.b	62				
						
	.dc.b	179				
						
	.dc.b	145				
	.dc.b	104				
	.dc.b	202				
						
	.dc.b	211				
						
	.dc.b	145				
	.dc.b	111				
	.dc.b	87				
						
	.dc.b	51				
						
	.dc.b	145				
	.dc.b	117				
	.dc.b	227				
						
	.dc.b	147				
						
	.dc.b	145				
	.dc.b	124				
	.dc.b	111				
						
	.dc.b	243				
						
	.dc.b	145				
	.dc.b	130				
	.dc.b	252				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	137				
	.dc.b	137				
						
	.dc.b	19				
						
	.dc.b	145				
	.dc.b	144				
	.dc.b	21				
						
	.dc.b	179				
						
	.dc.b	145				
	.dc.b	150				
	.dc.b	162				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	157				
	.dc.b	47				
						
	.dc.b	83				
						
	.dc.b	145				
	.dc.b	163				
	.dc.b	188				
						
	.dc.b	51				
						
	.dc.b	145				
	.dc.b	170				
	.dc.b	73				
						
	.dc.b	51				
						
	.dc.b	145				
	.dc.b	176				
	.dc.b	214				
						
	.dc.b	51				
						
	.dc.b	145				
	.dc.b	183				
	.dc.b	99				
						
	.dc.b	83				
						
	.dc.b	145				
	.dc.b	189				
	.dc.b	240				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	196				
	.dc.b	125				
						
	.dc.b	179				
						
	.dc.b	145				
	.dc.b	203				
	.dc.b	11				
						
	.dc.b	19				
						
	.dc.b	145				
	.dc.b	209				
	.dc.b	152				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	216				
	.dc.b	37				
						
	.dc.b	243				
						
	.dc.b	145				
	.dc.b	222				
	.dc.b	179				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	229				
	.dc.b	65				
						
	.dc.b	19				
						
	.dc.b	145				
	.dc.b	235				
	.dc.b	206				
						
	.dc.b	211				
						
	.dc.b	145				
	.dc.b	242				
	.dc.b	92				
						
	.dc.b	147				
						
	.dc.b	145				
	.dc.b	248				
	.dc.b	234				
						
	.dc.b	115				
						
	.dc.b	145				
	.dc.b	255				
	.dc.b	120				
						
	.dc.b	83				
						
	.dc.b	146				
	.dc.b	6				
	.dc.b	6				
						
	.dc.b	83				
						
	.dc.b	146				
	.dc.b	12				
	.dc.b	148				
						
	.dc.b	115				
						
	.dc.b	146				
	.dc.b	19				
	.dc.b	34				
						
	.dc.b	147				
						
	.dc.b	146				
	.dc.b	25				
	.dc.b	176				
						
	.dc.b	211				
						
	.dc.b	146				
	.dc.b	32				
	.dc.b	63				
						
	.dc.b	19				
						
	.dc.b	146				
	.dc.b	38				
	.dc.b	205				
						
	.dc.b	115				
						
	.dc.b	146				
	.dc.b	45				
	.dc.b	91				
						
	.dc.b	211				
						
	.dc.b	146				
	.dc.b	51				
	.dc.b	234				
						
	.dc.b	83				
						
	.dc.b	146				
	.dc.b	58				
	.dc.b	120				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	65				
	.dc.b	7				
						
	.dc.b	147				
						
	.dc.b	146				
	.dc.b	71				
	.dc.b	150				
						
	.dc.b	83				
						
	.dc.b	146				
	.dc.b	78				
	.dc.b	37				
						
	.dc.b	19				
						
	.dc.b	146				
	.dc.b	84				
	.dc.b	179				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	91				
	.dc.b	66				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	97				
	.dc.b	209				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	104				
	.dc.b	97				
						
	.dc.b	19				
						
	.dc.b	146				
	.dc.b	110				
	.dc.b	240				
						
	.dc.b	51				
						
	.dc.b	146				
	.dc.b	117				
	.dc.b	127				
						
	.dc.b	115				
						
	.dc.b	146				
	.dc.b	124				
	.dc.b	14				
						
	.dc.b	211				
						
	.dc.b	146				
	.dc.b	130				
	.dc.b	158				
						
	.dc.b	51				
						
	.dc.b	146				
	.dc.b	137				
	.dc.b	45				
						
	.dc.b	147				
						
	.dc.b	146				
	.dc.b	143				
	.dc.b	189				
						
	.dc.b	51				
						
	.dc.b	146				
	.dc.b	150				
	.dc.b	76				
						
	.dc.b	211				
						
	.dc.b	146				
	.dc.b	156				
	.dc.b	220				
						
	.dc.b	115				
						
	.dc.b	146				
	.dc.b	163				
	.dc.b	108				
						
	.dc.b	51				
						
	.dc.b	146				
	.dc.b	169				
	.dc.b	252				
						
	.dc.b	19				
						
	.dc.b	146				
	.dc.b	176				
	.dc.b	139				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	183				
	.dc.b	27				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	189				
	.dc.b	171				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	196				
	.dc.b	60				
						
	.dc.b	19				
						
	.dc.b	146				
	.dc.b	202				
	.dc.b	204				
						
	.dc.b	83				
						
	.dc.b	146				
	.dc.b	209				
	.dc.b	92				
						
	.dc.b	147				
						
	.dc.b	146				
	.dc.b	215				
	.dc.b	236				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	222				
	.dc.b	125				
						
	.dc.b	83				
						
	.dc.b	146				
	.dc.b	229				
	.dc.b	13				
						
	.dc.b	211				
						
	.dc.b	146				
	.dc.b	235				
	.dc.b	158				
						
	.dc.b	83				
						
	.dc.b	146				
	.dc.b	242				
	.dc.b	46				
						
	.dc.b	243				
						
	.dc.b	146				
	.dc.b	248				
	.dc.b	191				
						
	.dc.b	179				
						
	.dc.b	146				
	.dc.b	255				
	.dc.b	80				
						
	.dc.b	115				
						
	.dc.b	147				
	.dc.b	5				
	.dc.b	225				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	12				
	.dc.b	114				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	19				
	.dc.b	3				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	25				
	.dc.b	148				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	32				
	.dc.b	37				
						
	.dc.b	147				
						
	.dc.b	147				
	.dc.b	38				
	.dc.b	182				
						
	.dc.b	179				
						
	.dc.b	147				
	.dc.b	45				
	.dc.b	72				
						
	.dc.b	19				
						
	.dc.b	147				
	.dc.b	51				
	.dc.b	217				
						
	.dc.b	115				
						
	.dc.b	147				
	.dc.b	58				
	.dc.b	106				
						
	.dc.b	211				
						
	.dc.b	147				
	.dc.b	64				
	.dc.b	252				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	71				
	.dc.b	141				
						
	.dc.b	243				
						
	.dc.b	147				
	.dc.b	78				
	.dc.b	31				
						
	.dc.b	147				
						
	.dc.b	147				
	.dc.b	84				
	.dc.b	177				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	91				
	.dc.b	67				
						
	.dc.b	51				
						
	.dc.b	147				
	.dc.b	97				
	.dc.b	213				
						
	.dc.b	19				
						
	.dc.b	147				
	.dc.b	104				
	.dc.b	102				
						
	.dc.b	243				
						
	.dc.b	147				
	.dc.b	110				
	.dc.b	249				
						
	.dc.b	19				
						
	.dc.b	147				
	.dc.b	117				
	.dc.b	139				
						
	.dc.b	19				
						
	.dc.b	147				
	.dc.b	124				
	.dc.b	29				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	130				
	.dc.b	175				
						
	.dc.b	147				
						
	.dc.b	147				
	.dc.b	137				
	.dc.b	65				
						
	.dc.b	211				
						
	.dc.b	147				
	.dc.b	143				
	.dc.b	212				
						
	.dc.b	51				
						
	.dc.b	147				
	.dc.b	150				
	.dc.b	102				
						
	.dc.b	179				
						
	.dc.b	147				
	.dc.b	156				
	.dc.b	249				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	163				
	.dc.b	139				
						
	.dc.b	211				
						
	.dc.b	147				
	.dc.b	170				
	.dc.b	30				
						
	.dc.b	147				
						
	.dc.b	147				
	.dc.b	176				
	.dc.b	177				
						
	.dc.b	83				
						
	.dc.b	147				
	.dc.b	183				
	.dc.b	68				
						
	.dc.b	51				
						
	.dc.b	147				
	.dc.b	189				
	.dc.b	215				
						
	.dc.b	19				
						
	.dc.b	147				
	.dc.b	196				
	.dc.b	106				
						
	.dc.b	19				
						
	.dc.b	147				
	.dc.b	202				
	.dc.b	253				
						
	.dc.b	19				
						
	.dc.b	147				
	.dc.b	209				
	.dc.b	144				
						
	.dc.b	51				
						
	.dc.b	147				
	.dc.b	216				
	.dc.b	35				
						
	.dc.b	115				
						
	.dc.b	147				
	.dc.b	222				
	.dc.b	182				
						
	.dc.b	179				
						
	.dc.b	147				
	.dc.b	229				
	.dc.b	74				
						
	.dc.b	19				
						
	.dc.b	147				
	.dc.b	235				
	.dc.b	221				
						
	.dc.b	115				
						
	.dc.b	147				
	.dc.b	242				
	.dc.b	112				
						
	.dc.b	243				
						
	.dc.b	147				
	.dc.b	249				
	.dc.b	4				
						
	.dc.b	147				
						
	.dc.b	147				
	.dc.b	255				
	.dc.b	152				
						
	.dc.b	51				
						
	.dc.b	148				
	.dc.b	6				
	.dc.b	43				
						
	.dc.b	211				
						
	.dc.b	148				
	.dc.b	12				
	.dc.b	191				
						
	.dc.b	179				
						
	.dc.b	148				
	.dc.b	19				
	.dc.b	83				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	25				
	.dc.b	231				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	32				
	.dc.b	123				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	39				
	.dc.b	15				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	45				
	.dc.b	163				
						
	.dc.b	179				
						
	.dc.b	148				
	.dc.b	52				
	.dc.b	55				
						
	.dc.b	211				
						
	.dc.b	148				
	.dc.b	58				
	.dc.b	204				
						
	.dc.b	51				
						
	.dc.b	148				
	.dc.b	65				
	.dc.b	96				
						
	.dc.b	147				
						
	.dc.b	148				
	.dc.b	71				
	.dc.b	244				
						
	.dc.b	243				
						
	.dc.b	148				
	.dc.b	78				
	.dc.b	137				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	85				
	.dc.b	30				
						
	.dc.b	19				
						
	.dc.b	148				
	.dc.b	91				
	.dc.b	178				
						
	.dc.b	179				
						
	.dc.b	148				
	.dc.b	98				
	.dc.b	71				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	104				
	.dc.b	220				
						
	.dc.b	83				
						
	.dc.b	148				
	.dc.b	111				
	.dc.b	113				
						
	.dc.b	51				
						
	.dc.b	148				
	.dc.b	118				
	.dc.b	6				
						
	.dc.b	19				
						
	.dc.b	148				
	.dc.b	124				
	.dc.b	155				
						
	.dc.b	19				
						
	.dc.b	148				
	.dc.b	131				
	.dc.b	48				
						
	.dc.b	51				
						
	.dc.b	148				
	.dc.b	137				
	.dc.b	197				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	144				
	.dc.b	90				
						
	.dc.b	179				
						
	.dc.b	148				
	.dc.b	150				
	.dc.b	239				
						
	.dc.b	243				
						
	.dc.b	148				
	.dc.b	157				
	.dc.b	133				
						
	.dc.b	83				
						
	.dc.b	148				
	.dc.b	164				
	.dc.b	26				
						
	.dc.b	211				
						
	.dc.b	148				
	.dc.b	170				
	.dc.b	176				
						
	.dc.b	83				
						
	.dc.b	148				
	.dc.b	177				
	.dc.b	69				
						
	.dc.b	243				
						
	.dc.b	148				
	.dc.b	183				
	.dc.b	219				
						
	.dc.b	179				
						
	.dc.b	148				
	.dc.b	190				
	.dc.b	113				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	197				
	.dc.b	7				
						
	.dc.b	51				
						
	.dc.b	148				
	.dc.b	203				
	.dc.b	157				
						
	.dc.b	19				
						
	.dc.b	148				
	.dc.b	210				
	.dc.b	51				
						
	.dc.b	19				
						
	.dc.b	148				
	.dc.b	216				
	.dc.b	201				
						
	.dc.b	19				
						
	.dc.b	148				
	.dc.b	223				
	.dc.b	95				
						
	.dc.b	51				
						
	.dc.b	148				
	.dc.b	229				
	.dc.b	245				
						
	.dc.b	115				
						
	.dc.b	148				
	.dc.b	236				
	.dc.b	139				
						
	.dc.b	179				
						
	.dc.b	148				
	.dc.b	243				
	.dc.b	34				
						
	.dc.b	19				
						
	.dc.b	148				
	.dc.b	249				
	.dc.b	184				
						
	.dc.b	115				
						
	.dc.b	149				
	.dc.b	0				
	.dc.b	78				
						
	.dc.b	243				
						
	.dc.b	149				
	.dc.b	6				
	.dc.b	229				
						
	.dc.b	115				
						
	.dc.b	149				
	.dc.b	13				
	.dc.b	124				
						
	.dc.b	19				
						
	.dc.b	149				
	.dc.b	20				
	.dc.b	18				
						
	.dc.b	211				
						
	.dc.b	149				
	.dc.b	26				
	.dc.b	169				
						
	.dc.b	147				
						
	.dc.b	149				
	.dc.b	33				
	.dc.b	64				
						
	.dc.b	115				
						
	.dc.b	149				
	.dc.b	39				
	.dc.b	215				
						
	.dc.b	83				
						
	.dc.b	149				
	.dc.b	46				
	.dc.b	110				
						
	.dc.b	83				
						
	.dc.b	149				
	.dc.b	53				
	.dc.b	5				
						
	.dc.b	115				
						
	.dc.b	149				
	.dc.b	59				
	.dc.b	156				
						
	.dc.b	147				
						
	.dc.b	149				
	.dc.b	66				
	.dc.b	51				
						
	.dc.b	179				
						
	.dc.b	149				
	.dc.b	72				
	.dc.b	203				
						
	.dc.b	19				
						
	.dc.b	149				
	.dc.b	79				
	.dc.b	98				
						
	.dc.b	115				
						
	.dc.b	149				
	.dc.b	85				
	.dc.b	249				
						
	.dc.b	211				
						
	.dc.b	149				
	.dc.b	92				
	.dc.b	145				
						
	.dc.b	83				
						
	.dc.b	149				
	.dc.b	99				
	.dc.b	40				
						
	.dc.b	243				
						
	.dc.b	149				
	.dc.b	105				
	.dc.b	192				
						
	.dc.b	147				
						
	.dc.b	149				
	.dc.b	112				
	.dc.b	88				
						
	.dc.b	83				
						
	.dc.b	149				
	.dc.b	118				
	.dc.b	240				
						
	.dc.b	19				
						
	.dc.b	149				
	.dc.b	125				
	.dc.b	135				
						
	.dc.b	243				
						
	.dc.b	149				
	.dc.b	132				
	.dc.b	31				
						
	.dc.b	211				
						
	.dc.b	149				
	.dc.b	138				
	.dc.b	183				
						
	.dc.b	211				
						
	.dc.b	149				
	.dc.b	145				
	.dc.b	79				
						
	.dc.b	243				
						
	.dc.b	149				
	.dc.b	151				
	.dc.b	232				
						
	.dc.b	19				
						
	.dc.b	149				
	.dc.b	158				
	.dc.b	128				
						
	.dc.b	83				
						
	.dc.b	149				
	.dc.b	165				
	.dc.b	24				
						
	.dc.b	179				
						
	.dc.b	149				
	.dc.b	171				
	.dc.b	177				
						
	.dc.b	19				
						
	.dc.b	149				
	.dc.b	178				
	.dc.b	73				
						
	.dc.b	115				
						
	.dc.b	149				
	.dc.b	184				
	.dc.b	225				
						
	.dc.b	243				
						
	.dc.b	149				
	.dc.b	191				
	.dc.b	122				
						
	.dc.b	147				
						
	.dc.b	149				
	.dc.b	198				
	.dc.b	19				
						
	.dc.b	51				
						
	.dc.b	149				
	.dc.b	204				
	.dc.b	171				
						
	.dc.b	243				
						
	.dc.b	149				
	.dc.b	211				
	.dc.b	68				
						
	.dc.b	211				
						
	.dc.b	149				
	.dc.b	217				
	.dc.b	221				
						
	.dc.b	179				
						
	.dc.b	149				
	.dc.b	224				
	.dc.b	118				
						
	.dc.b	147				
						
	.dc.b	149				
	.dc.b	231				
	.dc.b	15				
						
	.dc.b	179				
						
	.dc.b	149				
	.dc.b	237				
	.dc.b	168				
						
	.dc.b	179				
						
	.dc.b	149				
	.dc.b	244				
	.dc.b	65				
						
	.dc.b	243				
						
	.dc.b	149				
	.dc.b	250				
	.dc.b	219				
						
	.dc.b	51				
						
	.dc.b	150				
	.dc.b	1				
	.dc.b	116				
						
	.dc.b	115				
						
	.dc.b	150				
	.dc.b	8				
	.dc.b	13				
						
	.dc.b	211				
						
	.dc.b	150				
	.dc.b	14				
	.dc.b	167				
						
	.dc.b	83				
						
	.dc.b	150				
	.dc.b	21				
	.dc.b	64				
						
	.dc.b	211				
						
	.dc.b	150				
	.dc.b	27				
	.dc.b	218				
						
	.dc.b	115				
						
	.dc.b	150				
	.dc.b	34				
	.dc.b	116				
						
	.dc.b	51				
						
	.dc.b	150				
	.dc.b	41				
	.dc.b	13				
						
	.dc.b	243				
						
	.dc.b	150				
	.dc.b	47				
	.dc.b	167				
						
	.dc.b	179				
						
	.dc.b	150				
	.dc.b	54				
	.dc.b	65				
						
	.dc.b	147				
						
	.dc.b	150				
	.dc.b	60				
	.dc.b	219				
						
	.dc.b	147				
						
	.dc.b	150				
	.dc.b	67				
	.dc.b	117				
						
	.dc.b	179				
						
	.dc.b	150				
	.dc.b	74				
	.dc.b	15				
						
	.dc.b	179				
						
	.dc.b	150				
	.dc.b	80				
	.dc.b	169				
						
	.dc.b	243				
						
	.dc.b	150				
	.dc.b	87				
	.dc.b	68				
						
	.dc.b	51				
						
	.dc.b	150				
	.dc.b	93				
	.dc.b	222				
						
	.dc.b	147				
						
	.dc.b	150				
	.dc.b	100				
	.dc.b	120				
						
	.dc.b	243				
						
	.dc.b	150				
	.dc.b	107				
	.dc.b	19				
						
	.dc.b	115				
						
	.dc.b	150				
	.dc.b	113				
	.dc.b	173				
						
	.dc.b	243				
						
	.dc.b	150				
	.dc.b	120				
	.dc.b	72				
						
	.dc.b	147				
						
	.dc.b	150				
	.dc.b	126				
	.dc.b	227				
						
	.dc.b	83				
						
	.dc.b	150				
	.dc.b	133				
	.dc.b	126				
						
	.dc.b	19				
						
	.dc.b	150				
	.dc.b	140				
	.dc.b	24				
						
	.dc.b	243				
						
	.dc.b	150				
	.dc.b	146				
	.dc.b	179				
						
	.dc.b	211				
						
	.dc.b	150				
	.dc.b	153				
	.dc.b	78				
						
	.dc.b	211				
						
	.dc.b	150				
	.dc.b	159				
	.dc.b	233				
						
	.dc.b	211				
						
	.dc.b	150				
	.dc.b	166				
	.dc.b	132				
						
	.dc.b	243				
						
	.dc.b	150				
	.dc.b	173				
	.dc.b	32				
						
	.dc.b	51				
						
	.dc.b	150				
	.dc.b	179				
	.dc.b	187				
						
	.dc.b	115				
						
	.dc.b	150				
	.dc.b	186				
	.dc.b	86				
						
	.dc.b	211				
						
	.dc.b	150				
	.dc.b	192				
	.dc.b	242				
						
	.dc.b	51				
						
	.dc.b	150				
	.dc.b	199				
	.dc.b	141				
						
	.dc.b	179				
						
	.dc.b	150				
	.dc.b	206				
	.dc.b	41				
						
	.dc.b	83				
						
	.dc.b	150				
	.dc.b	212				
	.dc.b	196				
						
	.dc.b	243				
						
	.dc.b	150				
	.dc.b	219				
	.dc.b	96				
						
	.dc.b	179				
						
	.dc.b	150				
	.dc.b	225				
	.dc.b	252				
						
	.dc.b	115				
						
	.dc.b	150				
	.dc.b	232				
	.dc.b	152				
						
	.dc.b	83				
						
	.dc.b	150				
	.dc.b	239				
	.dc.b	52				
						
	.dc.b	51				
						
	.dc.b	150				
	.dc.b	245				
	.dc.b	208				
						
	.dc.b	51				
						
	.dc.b	150				
	.dc.b	252				
	.dc.b	108				
						
	.dc.b	83				
						
	.dc.b	151				
	.dc.b	3				
	.dc.b	8				
						
	.dc.b	115				
						
	.dc.b	151				
	.dc.b	9				
	.dc.b	164				
						
	.dc.b	147				
						
	.dc.b	151				
	.dc.b	16				
	.dc.b	64				
						
	.dc.b	243				
						
	.dc.b	151				
	.dc.b	22				
	.dc.b	221				
						
	.dc.b	83				
						
	.dc.b	151				
	.dc.b	29				
	.dc.b	121				
						
	.dc.b	179				
						
	.dc.b	151				
	.dc.b	36				
	.dc.b	22				
						
	.dc.b	51				
						
	.dc.b	151				
	.dc.b	42				
	.dc.b	178				
						
	.dc.b	211				
						
	.dc.b	151				
	.dc.b	49				
	.dc.b	79				
						
	.dc.b	115				
						
	.dc.b	151				
	.dc.b	55				
	.dc.b	236				
						
	.dc.b	51				
						
	.dc.b	151				
	.dc.b	62				
	.dc.b	136				
						
	.dc.b	243				
						
	.dc.b	151				
	.dc.b	69				
	.dc.b	37				
						
	.dc.b	211				
						
	.dc.b	151				
	.dc.b	75				
	.dc.b	194				
						
	.dc.b	211				
						
	.dc.b	151				
	.dc.b	82				
	.dc.b	95				
						
	.dc.b	211				
						
	.dc.b	151				
	.dc.b	88				
	.dc.b	252				
						
	.dc.b	211				
						
	.dc.b	151				
	.dc.b	95				
	.dc.b	154				
						
	.dc.b	19				
						
	.dc.b	151				
	.dc.b	102				
	.dc.b	55				
						
	.dc.b	51				
						
	.dc.b	151				
	.dc.b	108				
	.dc.b	212				
						
	.dc.b	147				
						
	.dc.b	151				
	.dc.b	115				
	.dc.b	113				
						
	.dc.b	243				
						
	.dc.b	151				
	.dc.b	122				
	.dc.b	15				
						
	.dc.b	83				
						
	.dc.b	151				
	.dc.b	128				
	.dc.b	172				
						
	.dc.b	211				
						
	.dc.b	151				
	.dc.b	135				
	.dc.b	74				
						
	.dc.b	115				
						
	.dc.b	151				
	.dc.b	141				
	.dc.b	232				
						
	.dc.b	19				
						
	.dc.b	151				
	.dc.b	148				
	.dc.b	133				
						
	.dc.b	211				
						
	.dc.b	151				
	.dc.b	155				
	.dc.b	35				
						
	.dc.b	179				
						
	.dc.b	151				
	.dc.b	161				
	.dc.b	193				
						
	.dc.b	147				
						
	.dc.b	151				
	.dc.b	168				
	.dc.b	95				
						
	.dc.b	115				
						
	.dc.b	151				
	.dc.b	174				
	.dc.b	253				
						
	.dc.b	147				
						
	.dc.b	151				
	.dc.b	181				
	.dc.b	155				
						
	.dc.b	147				
						
	.dc.b	151				
	.dc.b	188				
	.dc.b	57				
						
	.dc.b	211				
						
	.dc.b	151				
	.dc.b	194				
	.dc.b	216				
						
	.dc.b	19				
						
	.dc.b	151				
	.dc.b	201				
	.dc.b	118				
						
	.dc.b	83				
						
	.dc.b	151				
	.dc.b	208				
	.dc.b	20				
						
	.dc.b	179				
						
	.dc.b	151				
	.dc.b	214				
	.dc.b	179				
						
	.dc.b	51				
						
	.dc.b	151				
	.dc.b	221				
	.dc.b	81				
						
	.dc.b	179				
						
	.dc.b	151				
	.dc.b	227				
	.dc.b	240				
						
	.dc.b	83				
						
	.dc.b	151				
	.dc.b	234				
	.dc.b	142				
						
	.dc.b	243				
						
	.dc.b	151				
	.dc.b	241				
	.dc.b	45				
						
	.dc.b	179				
						
	.dc.b	151				
	.dc.b	247				
	.dc.b	204				
						
	.dc.b	147				
						
	.dc.b	151				
	.dc.b	254				
	.dc.b	107				
						
	.dc.b	115				
						
	.dc.b	152				
	.dc.b	5				
	.dc.b	10				
						
	.dc.b	83				
						
	.dc.b	152				
	.dc.b	11				
	.dc.b	169				
						
	.dc.b	115				
						
	.dc.b	152				
	.dc.b	18				
	.dc.b	72				
						
	.dc.b	115				
						
	.dc.b	152				
	.dc.b	24				
	.dc.b	231				
						
	.dc.b	179				
						
	.dc.b	152				
	.dc.b	31				
	.dc.b	134				
						
	.dc.b	243				
						
	.dc.b	152				
	.dc.b	38				
	.dc.b	38				
						
	.dc.b	51				
						
	.dc.b	152				
	.dc.b	44				
	.dc.b	197				
						
	.dc.b	179				
						
	.dc.b	152				
	.dc.b	51				
	.dc.b	101				
						
	.dc.b	19				
						
	.dc.b	152				
	.dc.b	58				
	.dc.b	4				
						
	.dc.b	179				
						
	.dc.b	152				
	.dc.b	64				
	.dc.b	164				
						
	.dc.b	51				
						
	.dc.b	152				
	.dc.b	71				
	.dc.b	67				
						
	.dc.b	243				
						
	.dc.b	152				
	.dc.b	77				
	.dc.b	227				
						
	.dc.b	179				
						
	.dc.b	152				
	.dc.b	84				
	.dc.b	131				
						
	.dc.b	115				
						
	.dc.b	152				
	.dc.b	91				
	.dc.b	35				
						
	.dc.b	115				
						
	.dc.b	152				
	.dc.b	97				
	.dc.b	195				
						
	.dc.b	83				
						
	.dc.b	152				
	.dc.b	104				
	.dc.b	99				
						
	.dc.b	115				
						
	.dc.b	152				
	.dc.b	111				
	.dc.b	3				
						
	.dc.b	147				
						
	.dc.b	152				
	.dc.b	117				
	.dc.b	163				
						
	.dc.b	179				
						
	.dc.b	152				
	.dc.b	124				
	.dc.b	67				
						
	.dc.b	243				
						
	.dc.b	152				
	.dc.b	130				
	.dc.b	228				
						
	.dc.b	83				
						
	.dc.b	152				
	.dc.b	137				
	.dc.b	132				
						
	.dc.b	179				
						
	.dc.b	152				
	.dc.b	144				
	.dc.b	37				
						
	.dc.b	51				
						
	.dc.b	152				
	.dc.b	150				
	.dc.b	197				
						
	.dc.b	179				
						
	.dc.b	152				
	.dc.b	157				
	.dc.b	102				
						
	.dc.b	83				
						
	.dc.b	152				
	.dc.b	164				
	.dc.b	7				
						
	.dc.b	19				
						
	.dc.b	152				
	.dc.b	170				
	.dc.b	167				
						
	.dc.b	211				
						
	.dc.b	152				
	.dc.b	177				
	.dc.b	72				
						
	.dc.b	147				
						
	.dc.b	152				
	.dc.b	183				
	.dc.b	233				
						
	.dc.b	147				
						
	.dc.b	152				
	.dc.b	190				
	.dc.b	138				
						
	.dc.b	115				
						
	.dc.b	152				
	.dc.b	197				
	.dc.b	43				
						
	.dc.b	147				
						
	.dc.b	152				
	.dc.b	203				
	.dc.b	204				
						
	.dc.b	179				
						
	.dc.b	152				
	.dc.b	210				
	.dc.b	109				
						
	.dc.b	211				
						
	.dc.b	152				
	.dc.b	217				
	.dc.b	15				
						
	.dc.b	19				
						
	.dc.b	152				
	.dc.b	223				
	.dc.b	176				
						
	.dc.b	115				
						
	.dc.b	152				
	.dc.b	230				
	.dc.b	81				
						
	.dc.b	211				
						
	.dc.b	152				
	.dc.b	236				
	.dc.b	243				
						
	.dc.b	83				
						
	.dc.b	152				
	.dc.b	243				
	.dc.b	148				
						
	.dc.b	243				
						
	.dc.b	152				
	.dc.b	250				
	.dc.b	54				
						
	.dc.b	147				
						
	.dc.b	153				
	.dc.b	0				
	.dc.b	216				
						
	.dc.b	51				
						
	.dc.b	153				
	.dc.b	7				
	.dc.b	121				
						
	.dc.b	243				
						
	.dc.b	153				
	.dc.b	14				
	.dc.b	27				
						
	.dc.b	211				
						
	.dc.b	153				
	.dc.b	20				
	.dc.b	189				
						
	.dc.b	179				
						
	.dc.b	153				
	.dc.b	27				
	.dc.b	95				
						
	.dc.b	179				
						
	.dc.b	153				
	.dc.b	34				
	.dc.b	1				
						
	.dc.b	179				
						
	.dc.b	153				
	.dc.b	40				
	.dc.b	163				
						
	.dc.b	211				
						
	.dc.b	153				
	.dc.b	47				
	.dc.b	70				
						
	.dc.b	19				
						
	.dc.b	153				
	.dc.b	53				
	.dc.b	232				
						
	.dc.b	83				
						
	.dc.b	153				
	.dc.b	60				
	.dc.b	138				
						
	.dc.b	179				
						
	.dc.b	153				
	.dc.b	67				
	.dc.b	45				
						
	.dc.b	19				
						
	.dc.b	153				
	.dc.b	73				
	.dc.b	207				
						
	.dc.b	147				
						
	.dc.b	153				
	.dc.b	80				
	.dc.b	114				
						
	.dc.b	51				
						
	.dc.b	153				
	.dc.b	87				
	.dc.b	20				
						
	.dc.b	211				
						
	.dc.b	153				
	.dc.b	93				
	.dc.b	183				
						
	.dc.b	115				
						
	.dc.b	153				
	.dc.b	100				
	.dc.b	90				
						
	.dc.b	51				
						
	.dc.b	153				
	.dc.b	106				
	.dc.b	253				
						
	.dc.b	19				
						
	.dc.b	153				
	.dc.b	113				
	.dc.b	160				
						
	.dc.b	19				
						
	.dc.b	153				
	.dc.b	120				
	.dc.b	66				
						
	.dc.b	243				
						
	.dc.b	153				
	.dc.b	126				
	.dc.b	230				
						
	.dc.b	19				
						
	.dc.b	153				
	.dc.b	133				
	.dc.b	137				
						
	.dc.b	51				
						
	.dc.b	153				
	.dc.b	140				
	.dc.b	44				
						
	.dc.b	115				
						
	.dc.b	153				
	.dc.b	146				
	.dc.b	207				
						
	.dc.b	179				
						
	.dc.b	153				
	.dc.b	153				
	.dc.b	115				
						
	.dc.b	19				
						
	.dc.b	153				
	.dc.b	160				
	.dc.b	22				
						
	.dc.b	115				
						
	.dc.b	153				
	.dc.b	166				
	.dc.b	185				
						
	.dc.b	243				
						
	.dc.b	153				
	.dc.b	173				
	.dc.b	93				
						
	.dc.b	115				
						
	.dc.b	153				
	.dc.b	180				
	.dc.b	1				
						
	.dc.b	19				
						
	.dc.b	153				
	.dc.b	186				
	.dc.b	164				
						
	.dc.b	211				
						
	.dc.b	153				
	.dc.b	193				
	.dc.b	72				
						
	.dc.b	147				
						
	.dc.b	153				
	.dc.b	199				
	.dc.b	236				
						
	.dc.b	115				
						
	.dc.b	153				
	.dc.b	206				
	.dc.b	144				
						
	.dc.b	83				
						
	.dc.b	153				
	.dc.b	213				
	.dc.b	52				
						
	.dc.b	83				
						
	.dc.b	153				
	.dc.b	219				
	.dc.b	216				
						
	.dc.b	115				
						
	.dc.b	153				
	.dc.b	226				
	.dc.b	124				
						
	.dc.b	147				
						
	.dc.b	153				
	.dc.b	233				
	.dc.b	32				
						
	.dc.b	211				
						
	.dc.b	153				
	.dc.b	239				
	.dc.b	197				
						
	.dc.b	19				
						
	.dc.b	153				
	.dc.b	246				
	.dc.b	105				
						
	.dc.b	115				
						
	.dc.b	153				
	.dc.b	253				
	.dc.b	13				
						
	.dc.b	211				
						
	.dc.b	154				
	.dc.b	3				
	.dc.b	178				
						
	.dc.b	83				
						
	.dc.b	154				
	.dc.b	10				
	.dc.b	86				
						
	.dc.b	211				
						
	.dc.b	154				
	.dc.b	16				
	.dc.b	251				
						
	.dc.b	115				
						
	.dc.b	154				
	.dc.b	23				
	.dc.b	160				
						
	.dc.b	51				
						
	.dc.b	154				
	.dc.b	30				
	.dc.b	68				
						
	.dc.b	243				
						
	.dc.b	154				
	.dc.b	36				
	.dc.b	233				
						
	.dc.b	211				
						
	.dc.b	154				
	.dc.b	43				
	.dc.b	142				
						
	.dc.b	211				
						
	.dc.b	154				
	.dc.b	50				
	.dc.b	51				
						
	.dc.b	211				
						
	.dc.b	154				
	.dc.b	56				
	.dc.b	216				
						
	.dc.b	211				
						
	.dc.b	154				
	.dc.b	63				
	.dc.b	125				
						
	.dc.b	243				
						
	.dc.b	154				
	.dc.b	70				
	.dc.b	35				
						
	.dc.b	51				
						
	.dc.b	154				
	.dc.b	76				
	.dc.b	200				
						
	.dc.b	115				
						
	.dc.b	154				
	.dc.b	83				
	.dc.b	109				
						
	.dc.b	211				
						
	.dc.b	154				
	.dc.b	90				
	.dc.b	19				
						
	.dc.b	51				
						
	.dc.b	154				
	.dc.b	96				
	.dc.b	184				
						
	.dc.b	179				
						
	.dc.b	154				
	.dc.b	103				
	.dc.b	94				
						
	.dc.b	83				
						
	.dc.b	154				
	.dc.b	110				
	.dc.b	3				
						
	.dc.b	243				
						
	.dc.b	154				
	.dc.b	116				
	.dc.b	169				
						
	.dc.b	179				
						
	.dc.b	154				
	.dc.b	123				
	.dc.b	79				
						
	.dc.b	115				
						
	.dc.b	154				
	.dc.b	129				
	.dc.b	245				
						
	.dc.b	83				
						
	.dc.b	154				
	.dc.b	136				
	.dc.b	155				
						
	.dc.b	51				
						
	.dc.b	154				
	.dc.b	143				
	.dc.b	65				
						
	.dc.b	51				
						
	.dc.b	154				
	.dc.b	149				
	.dc.b	231				
						
	.dc.b	83				
						
	.dc.b	154				
	.dc.b	156				
	.dc.b	141				
						
	.dc.b	115				
						
	.dc.b	154				
	.dc.b	163				
	.dc.b	51				
						
	.dc.b	147				
						
	.dc.b	154				
	.dc.b	169				
	.dc.b	217				
						
	.dc.b	243				
						
	.dc.b	154				
	.dc.b	176				
	.dc.b	128				
						
	.dc.b	51				
						
	.dc.b	154				
	.dc.b	183				
	.dc.b	38				
						
	.dc.b	179				
						
	.dc.b	154				
	.dc.b	189				
	.dc.b	205				
						
	.dc.b	51				
						
	.dc.b	154				
	.dc.b	196				
	.dc.b	115				
						
	.dc.b	179				
						
	.dc.b	154				
	.dc.b	203				
	.dc.b	26				
						
	.dc.b	83				
						
	.dc.b	154				
	.dc.b	209				
	.dc.b	193				
						
	.dc.b	19				
						
	.dc.b	154				
	.dc.b	216				
	.dc.b	103				
						
	.dc.b	211				
						
	.dc.b	154				
	.dc.b	223				
	.dc.b	14				
						
	.dc.b	179				
						
	.dc.b	154				
	.dc.b	229				
	.dc.b	181				
						
	.dc.b	179				
						
	.dc.b	154				
	.dc.b	236				
	.dc.b	92				
						
	.dc.b	179				
						
	.dc.b	154				
	.dc.b	243				
	.dc.b	3				
						
	.dc.b	179				
						
	.dc.b	154				
	.dc.b	249				
	.dc.b	170				
						
	.dc.b	211				
						
	.dc.b	155				
	.dc.b	0				
	.dc.b	82				
						
	.dc.b	19				
						
	.dc.b	155				
	.dc.b	6				
	.dc.b	249				
						
	.dc.b	83				
						
	.dc.b	155				
	.dc.b	13				
	.dc.b	160				
						
	.dc.b	179				
						
	.dc.b	155				
	.dc.b	20				
	.dc.b	72				
						
	.dc.b	19				
						
	.dc.b	155				
	.dc.b	26				
	.dc.b	239				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	33				
	.dc.b	151				
						
	.dc.b	51				
						
	.dc.b	155				
	.dc.b	40				
	.dc.b	62				
						
	.dc.b	211				
						
	.dc.b	155				
	.dc.b	46				
	.dc.b	230				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	53				
	.dc.b	142				
						
	.dc.b	83				
						
	.dc.b	155				
	.dc.b	60				
	.dc.b	54				
						
	.dc.b	51				
						
	.dc.b	155				
	.dc.b	66				
	.dc.b	222				
						
	.dc.b	19				
						
	.dc.b	155				
	.dc.b	73				
	.dc.b	134				
						
	.dc.b	19				
						
	.dc.b	155				
	.dc.b	80				
	.dc.b	46				
						
	.dc.b	51				
						
	.dc.b	155				
	.dc.b	86				
	.dc.b	214				
						
	.dc.b	83				
						
	.dc.b	155				
	.dc.b	93				
	.dc.b	126				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	100				
	.dc.b	38				
						
	.dc.b	211				
						
	.dc.b	155				
	.dc.b	106				
	.dc.b	207				
						
	.dc.b	51				
						
	.dc.b	155				
	.dc.b	113				
	.dc.b	119				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	120				
	.dc.b	32				
						
	.dc.b	19				
						
	.dc.b	155				
	.dc.b	126				
	.dc.b	200				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	133				
	.dc.b	113				
						
	.dc.b	83				
						
	.dc.b	155				
	.dc.b	140				
	.dc.b	25				
						
	.dc.b	243				
						
	.dc.b	155				
	.dc.b	146				
	.dc.b	194				
						
	.dc.b	211				
						
	.dc.b	155				
	.dc.b	153				
	.dc.b	107				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	160				
	.dc.b	20				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	166				
	.dc.b	189				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	173				
	.dc.b	102				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	180				
	.dc.b	15				
						
	.dc.b	179				
						
	.dc.b	155				
	.dc.b	186				
	.dc.b	184				
						
	.dc.b	243				
						
	.dc.b	155				
	.dc.b	193				
	.dc.b	98				
						
	.dc.b	51				
						
	.dc.b	155				
	.dc.b	200				
	.dc.b	11				
						
	.dc.b	147				
						
	.dc.b	155				
	.dc.b	206				
	.dc.b	180				
						
	.dc.b	243				
						
	.dc.b	155				
	.dc.b	213				
	.dc.b	94				
						
	.dc.b	115				
						
	.dc.b	155				
	.dc.b	220				
	.dc.b	8				
						
	.dc.b	19				
						
	.dc.b	155				
	.dc.b	226				
	.dc.b	177				
						
	.dc.b	179				
						
	.dc.b	155				
	.dc.b	233				
	.dc.b	91				
						
	.dc.b	115				
						
	.dc.b	155				
	.dc.b	240				
	.dc.b	5				
						
	.dc.b	51				
						
	.dc.b	155				
	.dc.b	246				
	.dc.b	175				
						
	.dc.b	19				
						
	.dc.b	155				
	.dc.b	253				
	.dc.b	88				
						
	.dc.b	243				
						
	.dc.b	156				
	.dc.b	4				
	.dc.b	2				
						
	.dc.b	243				
						
	.dc.b	156				
	.dc.b	10				
	.dc.b	172				
						
	.dc.b	243				
						
	.dc.b	156				
	.dc.b	17				
	.dc.b	87				
						
	.dc.b	19				
						
	.dc.b	156				
	.dc.b	24				
	.dc.b	1				
						
	.dc.b	83				
						
	.dc.b	156				
	.dc.b	30				
	.dc.b	171				
						
	.dc.b	147				
						
	.dc.b	156				
	.dc.b	37				
	.dc.b	85				
						
	.dc.b	243				
						
	.dc.b	156				
	.dc.b	44				
	.dc.b	0				
						
	.dc.b	83				
						
	.dc.b	156				
	.dc.b	50				
	.dc.b	170				
						
	.dc.b	211				
						
	.dc.b	156				
	.dc.b	57				
	.dc.b	85				
						
	.dc.b	115				
						
	.dc.b	156				
	.dc.b	64				
	.dc.b	0				
						
	.dc.b	19				
						
	.dc.b	156				
	.dc.b	70				
	.dc.b	170				
						
	.dc.b	179				
						
	.dc.b	156				
	.dc.b	77				
	.dc.b	85				
						
	.dc.b	147				
						
	.dc.b	156				
	.dc.b	84				
	.dc.b	0				
						
	.dc.b	83				
						
	.dc.b	156				
	.dc.b	90				
	.dc.b	171				
						
	.dc.b	83				
						
	.dc.b	156				
	.dc.b	97				
	.dc.b	86				
						
	.dc.b	83				
						
	.dc.b	156				
	.dc.b	104				
	.dc.b	1				
						
	.dc.b	83				
						
	.dc.b	156				
	.dc.b	110				
	.dc.b	172				
						
	.dc.b	115				
						
	.dc.b	156				
	.dc.b	117				
	.dc.b	87				
						
	.dc.b	179				
						
	.dc.b	156				
	.dc.b	124				
	.dc.b	2				
						
	.dc.b	243				
						
	.dc.b	156				
	.dc.b	130				
	.dc.b	174				
						
	.dc.b	83				
						
	.dc.b	156				
	.dc.b	137				
	.dc.b	89				
						
	.dc.b	179				
						
	.dc.b	156				
	.dc.b	144				
	.dc.b	5				
						
	.dc.b	51				
						
	.dc.b	156				
	.dc.b	150				
	.dc.b	176				
						
	.dc.b	179				
						
	.dc.b	156				
	.dc.b	157				
	.dc.b	92				
						
	.dc.b	83				
						
	.dc.b	156				
	.dc.b	164				
	.dc.b	8				
						
	.dc.b	19				
						
	.dc.b	156				
	.dc.b	170				
	.dc.b	179				
						
	.dc.b	211				
						
	.dc.b	156				
	.dc.b	177				
	.dc.b	95				
						
	.dc.b	179				
						
	.dc.b	156				
	.dc.b	184				
	.dc.b	11				
						
	.dc.b	147				
						
	.dc.b	156				
	.dc.b	190				
	.dc.b	183				
						
	.dc.b	147				
						
	.dc.b	156				
	.dc.b	197				
	.dc.b	99				
						
	.dc.b	147				
						
	.dc.b	156				
	.dc.b	204				
	.dc.b	15				
						
	.dc.b	179				
						
	.dc.b	156				
	.dc.b	210				
	.dc.b	187				
						
	.dc.b	243				
						
	.dc.b	156				
	.dc.b	217				
	.dc.b	104				
						
	.dc.b	51				
						
	.dc.b	156				
	.dc.b	224				
	.dc.b	20				
						
	.dc.b	115				
						
	.dc.b	156				
	.dc.b	230				
	.dc.b	192				
						
	.dc.b	243				
						
	.dc.b	156				
	.dc.b	237				
	.dc.b	109				
						
	.dc.b	115				
						
	.dc.b	156				
	.dc.b	244				
	.dc.b	25				
						
	.dc.b	243				
						
	.dc.b	156				
	.dc.b	250				
	.dc.b	198				
						
	.dc.b	147				
						
	.dc.b	157				
	.dc.b	1				
	.dc.b	115				
						
	.dc.b	51				
						
	.dc.b	157				
	.dc.b	8				
	.dc.b	32				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	14				
	.dc.b	204				
						
	.dc.b	211				
						
	.dc.b	157				
	.dc.b	21				
	.dc.b	121				
						
	.dc.b	179				
						
	.dc.b	157				
	.dc.b	28				
	.dc.b	38				
						
	.dc.b	179				
						
	.dc.b	157				
	.dc.b	34				
	.dc.b	211				
						
	.dc.b	211				
						
	.dc.b	157				
	.dc.b	41				
	.dc.b	128				
						
	.dc.b	243				
						
	.dc.b	157				
	.dc.b	48				
	.dc.b	46				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	54				
	.dc.b	219				
						
	.dc.b	83				
						
	.dc.b	157				
	.dc.b	61				
	.dc.b	136				
						
	.dc.b	179				
						
	.dc.b	157				
	.dc.b	68				
	.dc.b	54				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	74				
	.dc.b	227				
						
	.dc.b	147				
						
	.dc.b	157				
	.dc.b	81				
	.dc.b	145				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	88				
	.dc.b	62				
						
	.dc.b	179				
						
	.dc.b	157				
	.dc.b	94				
	.dc.b	236				
						
	.dc.b	83				
						
	.dc.b	157				
	.dc.b	101				
	.dc.b	154				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	108				
	.dc.b	71				
						
	.dc.b	243				
						
	.dc.b	157				
	.dc.b	114				
	.dc.b	245				
						
	.dc.b	211				
						
	.dc.b	157				
	.dc.b	121				
	.dc.b	163				
						
	.dc.b	211				
						
	.dc.b	157				
	.dc.b	128				
	.dc.b	81				
						
	.dc.b	211				
						
	.dc.b	157				
	.dc.b	134				
	.dc.b	255				
						
	.dc.b	243				
						
	.dc.b	157				
	.dc.b	141				
	.dc.b	174				
						
	.dc.b	51				
						
	.dc.b	157				
	.dc.b	148				
	.dc.b	92				
						
	.dc.b	115				
						
	.dc.b	157				
	.dc.b	155				
	.dc.b	10				
						
	.dc.b	179				
						
	.dc.b	157				
	.dc.b	161				
	.dc.b	185				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	168				
	.dc.b	103				
						
	.dc.b	147				
						
	.dc.b	157				
	.dc.b	175				
	.dc.b	22				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	181				
	.dc.b	196				
						
	.dc.b	179				
						
	.dc.b	157				
	.dc.b	188				
	.dc.b	115				
						
	.dc.b	83				
						
	.dc.b	157				
	.dc.b	195				
	.dc.b	34				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	201				
	.dc.b	208				
						
	.dc.b	243				
						
	.dc.b	157				
	.dc.b	208				
	.dc.b	127				
						
	.dc.b	211				
						
	.dc.b	157				
	.dc.b	215				
	.dc.b	46				
						
	.dc.b	211				
						
	.dc.b	157				
	.dc.b	221				
	.dc.b	221				
						
	.dc.b	211				
						
	.dc.b	157				
	.dc.b	228				
	.dc.b	140				
						
	.dc.b	243				
						
	.dc.b	157				
	.dc.b	235				
	.dc.b	60				
						
	.dc.b	19				
						
	.dc.b	157				
	.dc.b	241				
	.dc.b	235				
						
	.dc.b	83				
						
	.dc.b	157				
	.dc.b	248				
	.dc.b	154				
						
	.dc.b	179				
						
	.dc.b	157				
	.dc.b	255				
	.dc.b	74				
						
	.dc.b	19				
						
	.dc.b	158				
	.dc.b	5				
	.dc.b	249				
						
	.dc.b	115				
						
	.dc.b	158				
	.dc.b	12				
	.dc.b	168				
						
	.dc.b	243				
						
	.dc.b	158				
	.dc.b	19				
	.dc.b	88				
						
	.dc.b	147				
						
	.dc.b	158				
	.dc.b	26				
	.dc.b	8				
						
	.dc.b	51				
						
	.dc.b	158				
	.dc.b	32				
	.dc.b	183				
						
	.dc.b	243				
						
	.dc.b	158				
	.dc.b	39				
	.dc.b	103				
						
	.dc.b	211				
						
	.dc.b	158				
	.dc.b	46				
	.dc.b	23				
						
	.dc.b	179				
						
	.dc.b	158				
	.dc.b	52				
	.dc.b	199				
						
	.dc.b	147				
						
	.dc.b	158				
	.dc.b	59				
	.dc.b	119				
						
	.dc.b	179				
						
	.dc.b	158				
	.dc.b	66				
	.dc.b	39				
						
	.dc.b	179				
						
	.dc.b	158				
	.dc.b	72				
	.dc.b	215				
						
	.dc.b	243				
						
	.dc.b	158				
	.dc.b	79				
	.dc.b	136				
						
	.dc.b	19				
						
	.dc.b	158				
	.dc.b	86				
	.dc.b	56				
						
	.dc.b	115				
						
	.dc.b	158				
	.dc.b	92				
	.dc.b	232				
						
	.dc.b	211				
						
	.dc.b	158				
	.dc.b	99				
	.dc.b	153				
						
	.dc.b	51				
						
	.dc.b	158				
	.dc.b	106				
	.dc.b	73				
						
	.dc.b	179				
						
	.dc.b	158				
	.dc.b	112				
	.dc.b	250				
						
	.dc.b	83				
						
	.dc.b	158				
	.dc.b	119				
	.dc.b	170				
						
	.dc.b	243				
						
	.dc.b	158				
	.dc.b	126				
	.dc.b	91				
						
	.dc.b	179				
						
	.dc.b	158				
	.dc.b	133				
	.dc.b	12				
						
	.dc.b	147				
						
	.dc.b	158				
	.dc.b	139				
	.dc.b	189				
						
	.dc.b	83				
						
	.dc.b	158				
	.dc.b	146				
	.dc.b	110				
						
	.dc.b	83				
						
	.dc.b	158				
	.dc.b	153				
	.dc.b	31				
						
	.dc.b	83				
						
	.dc.b	158				
	.dc.b	159				
	.dc.b	208				
						
	.dc.b	115				
						
	.dc.b	158				
	.dc.b	166				
	.dc.b	129				
						
	.dc.b	147				
						
	.dc.b	158				
	.dc.b	173				
	.dc.b	50				
						
	.dc.b	211				
						
	.dc.b	158				
	.dc.b	179				
	.dc.b	228				
						
	.dc.b	19				
						
	.dc.b	158				
	.dc.b	186				
	.dc.b	149				
						
	.dc.b	115				
						
	.dc.b	158				
	.dc.b	193				
	.dc.b	70				
						
	.dc.b	211				
						
	.dc.b	158				
	.dc.b	199				
	.dc.b	248				
						
	.dc.b	83				
						
	.dc.b	158				
	.dc.b	206				
	.dc.b	169				
						
	.dc.b	243				
						
	.dc.b	158				
	.dc.b	213				
	.dc.b	91				
						
	.dc.b	147				
						
	.dc.b	158				
	.dc.b	220				
	.dc.b	13				
						
	.dc.b	83				
						
	.dc.b	158				
	.dc.b	226				
	.dc.b	191				
						
	.dc.b	19				
						
	.dc.b	158				
	.dc.b	233				
	.dc.b	112				
						
	.dc.b	243				
						
	.dc.b	158				
	.dc.b	240				
	.dc.b	34				
						
	.dc.b	211				
						
	.dc.b	158				
	.dc.b	246				
	.dc.b	212				
						
	.dc.b	211				
						
	.dc.b	158				
	.dc.b	253				
	.dc.b	134				
						
	.dc.b	243				
						
	.dc.b	159				
	.dc.b	4				
	.dc.b	57				
						
	.dc.b	19				
						
	.dc.b	159				
	.dc.b	10				
	.dc.b	235				
						
	.dc.b	51				
						
	.dc.b	159				
	.dc.b	17				
	.dc.b	157				
						
	.dc.b	147				
						
	.dc.b	159				
	.dc.b	24				
	.dc.b	79				
						
	.dc.b	211				
						
	.dc.b	159				
	.dc.b	31				
	.dc.b	2				
						
	.dc.b	83				
						
	.dc.b	159				
	.dc.b	37				
	.dc.b	180				
						
	.dc.b	211				
						
	.dc.b	159				
	.dc.b	44				
	.dc.b	103				
						
	.dc.b	83				
						
	.dc.b	159				
	.dc.b	51				
	.dc.b	25				
						
	.dc.b	243				
						
	.dc.b	159				
	.dc.b	57				
	.dc.b	204				
						
	.dc.b	179				
						
	.dc.b	159				
	.dc.b	64				
	.dc.b	127				
						
	.dc.b	115				
						
	.dc.b	159				
	.dc.b	71				
	.dc.b	50				
						
	.dc.b	83				
						
	.dc.b	159				
	.dc.b	77				
	.dc.b	229				
						
	.dc.b	51				
						
	.dc.b	159				
	.dc.b	84				
	.dc.b	152				
						
	.dc.b	51				
						
	.dc.b	159				
	.dc.b	91				
	.dc.b	75				
						
	.dc.b	51				
						
	.dc.b	159				
	.dc.b	97				
	.dc.b	254				
						
	.dc.b	83				
						
	.dc.b	159				
	.dc.b	104				
	.dc.b	177				
						
	.dc.b	147				
						
	.dc.b	159				
	.dc.b	111				
	.dc.b	100				
						
	.dc.b	211				
						
	.dc.b	159				
	.dc.b	118				
	.dc.b	24				
						
	.dc.b	51				
						
	.dc.b	159				
	.dc.b	124				
	.dc.b	203				
						
	.dc.b	147				
						
	.dc.b	159				
	.dc.b	131				
	.dc.b	127				
						
	.dc.b	19				
						
	.dc.b	159				
	.dc.b	138				
	.dc.b	50				
						
	.dc.b	147				
						
	.dc.b	159				
	.dc.b	144				
	.dc.b	230				
						
	.dc.b	51				
						
	.dc.b	159				
	.dc.b	151				
	.dc.b	153				
						
	.dc.b	211				
						
	.dc.b	159				
	.dc.b	158				
	.dc.b	77				
						
	.dc.b	147				
						
	.dc.b	159				
	.dc.b	165				
	.dc.b	1				
						
	.dc.b	115				
						
	.dc.b	159				
	.dc.b	171				
	.dc.b	181				
						
	.dc.b	83				
						
	.dc.b	159				
	.dc.b	178				
	.dc.b	105				
						
	.dc.b	83				
						
	.dc.b	159				
	.dc.b	185				
	.dc.b	29				
						
	.dc.b	83				
						
	.dc.b	159				
	.dc.b	191				
	.dc.b	209				
						
	.dc.b	115				
						
	.dc.b	159				
	.dc.b	198				
	.dc.b	133				
						
	.dc.b	147				
						
	.dc.b	159				
	.dc.b	205				
	.dc.b	57				
						
	.dc.b	211				
						
	.dc.b	159				
	.dc.b	211				
	.dc.b	238				
						
	.dc.b	51				
						
	.dc.b	159				
	.dc.b	218				
	.dc.b	162				
						
	.dc.b	147				
						
	.dc.b	159				
	.dc.b	225				
	.dc.b	87				
						
	.dc.b	19				
						
	.dc.b	159				
	.dc.b	232				
	.dc.b	11				
						
	.dc.b	147				
						
	.dc.b	159				
	.dc.b	238				
	.dc.b	192				
						
	.dc.b	51				
						
	.dc.b	159				
	.dc.b	245				
	.dc.b	116				
						
	.dc.b	211				
						
	.dc.b	159				
	.dc.b	252				
	.dc.b	41				
						
	.dc.b	147				
						
	.dc.b	160				
	.dc.b	2				
	.dc.b	222				
						
	.dc.b	115				
						
	.dc.b	160				
	.dc.b	9				
	.dc.b	147				
						
	.dc.b	83				
						
	.dc.b	160				
	.dc.b	16				
	.dc.b	72				
						
	.dc.b	51				
						
	.dc.b	160				
	.dc.b	22				
	.dc.b	253				
						
	.dc.b	51				
						
	.dc.b	160				
	.dc.b	29				
	.dc.b	178				
						
	.dc.b	83				
						
	.dc.b	160				
	.dc.b	36				
	.dc.b	103				
						
	.dc.b	115				
						
	.dc.b	160				
	.dc.b	43				
	.dc.b	28				
						
	.dc.b	179				
						
	.dc.b	160				
	.dc.b	49				
	.dc.b	210				
						
	.dc.b	19				
						
	.dc.b	160				
	.dc.b	56				
	.dc.b	135				
						
	.dc.b	115				
						
	.dc.b	160				
	.dc.b	63				
	.dc.b	60				
						
	.dc.b	211				
						
	.dc.b	160				
	.dc.b	69				
	.dc.b	242				
						
	.dc.b	83				
						
	.dc.b	160				
	.dc.b	76				
	.dc.b	167				
						
	.dc.b	243				
						
	.dc.b	160				
	.dc.b	83				
	.dc.b	93				
						
	.dc.b	147				
						
	.dc.b	160				
	.dc.b	90				
	.dc.b	19				
						
	.dc.b	83				
						
	.dc.b	160				
	.dc.b	96				
	.dc.b	201				
						
	.dc.b	19				
						
	.dc.b	160				
	.dc.b	103				
	.dc.b	126				
						
	.dc.b	243				
						
	.dc.b	160				
	.dc.b	110				
	.dc.b	52				
						
	.dc.b	243				
						
	.dc.b	160				
	.dc.b	116				
	.dc.b	234				
						
	.dc.b	243				
						
	.dc.b	160				
	.dc.b	123				
	.dc.b	160				
						
	.dc.b	243				
						
	.dc.b	160				
	.dc.b	130				
	.dc.b	87				
						
	.dc.b	51				
						
	.dc.b	160				
	.dc.b	137				
	.dc.b	13				
						
	.dc.b	83				
						
	.dc.b	160				
	.dc.b	143				
	.dc.b	195				
						
	.dc.b	179				
						
	.dc.b	160				
	.dc.b	150				
	.dc.b	121				
						
	.dc.b	243				
						
	.dc.b	160				
	.dc.b	157				
	.dc.b	48				
						
	.dc.b	115				
						
	.dc.b	160				
	.dc.b	163				
	.dc.b	230				
						
	.dc.b	243				
						
	.dc.b	160				
	.dc.b	170				
	.dc.b	157				
						
	.dc.b	115				
						
	.dc.b	160				
	.dc.b	177				
	.dc.b	84				
						
	.dc.b	19				
						
	.dc.b	160				
	.dc.b	184				
	.dc.b	10				
						
	.dc.b	211				
						
	.dc.b	160				
	.dc.b	190				
	.dc.b	193				
						
	.dc.b	147				
						
	.dc.b	160				
	.dc.b	197				
	.dc.b	120				
						
	.dc.b	115				
						
	.dc.b	160				
	.dc.b	204				
	.dc.b	47				
						
	.dc.b	83				
						
	.dc.b	160				
	.dc.b	210				
	.dc.b	230				
						
	.dc.b	83				
						
	.dc.b	160				
	.dc.b	217				
	.dc.b	157				
						
	.dc.b	115				
						
	.dc.b	160				
	.dc.b	224				
	.dc.b	84				
						
	.dc.b	147				
						
	.dc.b	160				
	.dc.b	231				
	.dc.b	11				
						
	.dc.b	179				
						
	.dc.b	160				
	.dc.b	237				
	.dc.b	194				
						
	.dc.b	243				
						
	.dc.b	160				
	.dc.b	244				
	.dc.b	122				
						
	.dc.b	83				
						
	.dc.b	160				
	.dc.b	251				
	.dc.b	49				
						
	.dc.b	179				
						
	.dc.b	161				
	.dc.b	1				
	.dc.b	233				
						
	.dc.b	51				
						
	.dc.b	161				
	.dc.b	8				
	.dc.b	160				
						
	.dc.b	211				
						
	.dc.b	161				
	.dc.b	15				
	.dc.b	88				
						
	.dc.b	83				
						
	.dc.b	161				
	.dc.b	22				
	.dc.b	16				
						
	.dc.b	19				
						
	.dc.b	161				
	.dc.b	28				
	.dc.b	199				
						
	.dc.b	211				
						
	.dc.b	161				
	.dc.b	35				
	.dc.b	127				
						
	.dc.b	179				
						
	.dc.b	161				
	.dc.b	42				
	.dc.b	55				
						
	.dc.b	147				
						
	.dc.b	161				
	.dc.b	48				
	.dc.b	239				
						
	.dc.b	147				
						
	.dc.b	161				
	.dc.b	55				
	.dc.b	167				
						
	.dc.b	147				
						
	.dc.b	161				
	.dc.b	62				
	.dc.b	95				
						
	.dc.b	179				
						
	.dc.b	161				
	.dc.b	69				
	.dc.b	23				
						
	.dc.b	211				
						
	.dc.b	161				
	.dc.b	75				
	.dc.b	208				
						
	.dc.b	19				
						
	.dc.b	161				
	.dc.b	82				
	.dc.b	136				
						
	.dc.b	115				
						
	.dc.b	161				
	.dc.b	89				
	.dc.b	64				
						
	.dc.b	211				
						
	.dc.b	161				
	.dc.b	95				
	.dc.b	249				
						
	.dc.b	51				
						
	.dc.b	161				
	.dc.b	102				
	.dc.b	177				
						
	.dc.b	211				
						
	.dc.b	161				
	.dc.b	109				
	.dc.b	106				
						
	.dc.b	83				
						
	.dc.b	161				
	.dc.b	116				
	.dc.b	35				
						
	.dc.b	19				
						
	.dc.b	161				
	.dc.b	122				
	.dc.b	219				
						
	.dc.b	211				
						
	.dc.b	161				
	.dc.b	129				
	.dc.b	148				
						
	.dc.b	147				
						
	.dc.b	161				
	.dc.b	136				
	.dc.b	77				
						
	.dc.b	115				
						
	.dc.b	161				
	.dc.b	143				
	.dc.b	6				
						
	.dc.b	115				
						
	.dc.b	161				
	.dc.b	149				
	.dc.b	191				
						
	.dc.b	115				
						
	.dc.b	161				
	.dc.b	156				
	.dc.b	120				
						
	.dc.b	147				
						
	.dc.b	161				
	.dc.b	163				
	.dc.b	49				
						
	.dc.b	179				
						
						
_pretab:					

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				
	.dc.b $01,$01,$01,$01,$02,$02,$03,$03
	.dc.b $03,$02
	.dc.b $00				
	.align	2				
						
						
_sfbwidth_table:				
						
	.dc.l	_sfb_48000_long			
						
	.dc.l	_sfb_48000_short		
						
	.dc.l	_sfb_48000_mixed		
						
	.dc.l	_sfb_44100_long			
						
	.dc.l	_sfb_44100_short		
						
	.dc.l	_sfb_44100_mixed		
						
	.dc.l	_sfb_32000_long			
						
	.dc.l	_sfb_32000_short		
						
	.dc.l	_sfb_32000_mixed		
						
	.dc.l	_sfb_24000_long			
						
	.dc.l	_sfb_24000_short		
						
	.dc.l	_sfb_24000_mixed		
						
	.dc.l	_sfb_22050_long			
						
	.dc.l	_sfb_22050_short		
						
	.dc.l	_sfb_22050_mixed		
						
	.dc.l	_sfb_22050_long			
						
	.dc.l	_sfb_16000_short		
						
	.dc.l	_sfb_16000_mixed		
						
	.dc.l	_sfb_22050_long			
						
	.dc.l	_sfb_16000_short		
						
	.dc.l	_sfb_16000_mixed		
						
	.dc.l	_sfb_22050_long			
						
	.dc.l	_sfb_16000_short		
						
	.dc.l	_sfb_16000_mixed		
						
	.dc.l	_sfb_8000_long			
						
	.dc.l	_sfb_8000_short			
						
	.dc.l	_sfb_8000_mixed			
						
						
_sfb_8000_mixed:				
	.dc.b $0c,$0c,$0c,$04,$04,$04,$08,$08
	.dc.b $08,$0c,$0c,$0c,$10,$10,$10,$14
	.dc.b $14,$14,$18,$18			
	.dc.b $18,$1c,$1c,$1c,$24,$24,$24,$02
	.dc.b $02,$02,$02,$02,$02,$02,$02,$02
	.dc.b $1a,$1a				
	.dc.b $1a				
						
						
_sfb_8000_short:				
	.dc.b $08,$08,$08,$08,$08,$08,$08,$08
	.dc.b $08,$0c,$0c,$0c,$10,$10,$10,$14
	.dc.b $14,$14,$18,$18,$18		
	.dc.b $1c,$1c,$1c,$24,$24,$24,$02,$02
	.dc.b $02,$02,$02,$02,$02,$02,$02,$1a
	.dc.b $1a,$1a				
						
						
_sfb_8000_long:					
	.dc.b $0c,$0c,$0c,$0c,$0c,$0c,$10,$14
	.dc.b $18,$1c,$20,$28,$30,$38,$40,$4c
	.dc.b $5a,$02,$02,$02,$02,$02		
						
						
_sfb_16000_mixed:				
	.dc.b $06,$06,$06,$06,$06,$06,$06,$06
	.dc.b $06,$08,$08,$08,$0a,$0a,$0a,$0c
	.dc.b $0c,$0c,$0e,$0e			
	.dc.b $0e,$12,$12,$12,$18,$18,$18,$1e
	.dc.b $1e,$1e,$28,$28,$28,$12,$12,$12	
						
						
_sfb_22050_mixed:				
	.dc.b $06,$06,$06,$06,$06,$06,$06,$06
	.dc.b $06,$06,$06,$06,$08,$08,$08,$0a
	.dc.b $0a,$0a				
	.dc.b $0e,$0e,$0e,$12,$12,$12,$1a,$1a
	.dc.b $1a,$20,$20,$20,$2a,$2a,$2a,$12
	.dc.b $12,$12				
						
						
_sfb_24000_mixed:				
	.dc.b $06,$06,$06,$06,$06,$06,$06,$06
	.dc.b $06,$08,$08,$08,$0a,$0a,$0a,$0c
	.dc.b $0c,$0c,$0e,$0e			
	.dc.b $0e,$12,$12,$12,$18,$18,$18,$20
	.dc.b $20,$20,$2c,$2c,$2c,$0c,$0c,$0c	
						
						
_sfb_16000_short:				
	.dc.b $04,$04,$04,$04,$04,$04,$04,$04
	.dc.b $04,$06,$06,$06,$08,$08,$08,$0a
	.dc.b $0a,$0a				
	.dc.b $0c,$0c,$0c,$0e,$0e,$0e,$12,$12
	.dc.b $12,$18,$18,$18,$1e,$1e,$1e,$28
	.dc.b $28,$28,$12			
	.dc.b $12,$12				
						
						
_sfb_22050_short:				
	.dc.b $04,$04,$04,$04,$04,$04,$04,$04
	.dc.b $04,$06,$06,$06,$06,$06,$06	
	.dc.b $08,$08,$08,$0a,$0a,$0a,$0e,$0e
	.dc.b $0e,$12,$12,$12,$1a,$1a,$1a,$20
	.dc.b $20,$20,$2a,$2a,$2a,$12,$12	
	.dc.b $12				
						
						
_sfb_24000_short:				
	.dc.b $04,$04,$04,$04,$04,$04,$04,$04
	.dc.b $04,$06,$06,$06,$08,$08,$08,$0a
	.dc.b $0a,$0a				
	.dc.b $0c,$0c,$0c,$0e,$0e,$0e,$12,$12
	.dc.b $12,$18,$18,$18,$20,$20,$20,$2c
	.dc.b $2c,$2c,$0c,$0c,$0c		
						
						
_sfb_22050_long:				
	.dc.b $06,$06,$06,$06,$06,$06,$08,$0a
	.dc.b $0c,$0e,$10,$14,$18,$1c,$20,$26
	.dc.b $2e,$34,$3c,$44,$3a,$36		
						
						
_sfb_24000_long:				
	.dc.b $06,$06,$06,$06,$06,$06,$08,$0a
	.dc.b $0c,$0e,$10,$12,$16,$1a,$20,$26
	.dc.b $2e,$36,$3e,$46,$4c,$24		
						
						
_sfb_32000_mixed:				
	.dc.b $04,$04,$04,$04,$04,$04,$06,$06
	.dc.b $04,$04,$04,$06,$06,$06,$08,$08	
	.dc.b $08,$0c,$0c,$0c,$10,$10,$10,$14
	.dc.b $14,$14,$1a,$1a,$1a,$22,$22,$22
	.dc.b $2a,$2a,$2a,$0c,$0c,$0c		
						
						
_sfb_44100_mixed:				
	.dc.b $04,$04,$04,$04,$04,$04,$06,$06
	.dc.b $04,$04,$04,$06,$06,$06,$08,$08	
	.dc.b $08,$0a,$0a,$0a,$0c,$0c,$0c,$0e
	.dc.b $0e,$0e,$12,$12,$12,$16,$16,$16
	.dc.b $1e,$1e,$1e			
	.dc.b $38,$38,$38			
						
						
_sfb_48000_mixed:				
	.dc.b $04,$04,$04,$04,$04,$04,$06,$06
	.dc.b $04,$04,$04,$06,$06,$06,$06	
	.dc.b $06,$06,$0a,$0a,$0a,$0c,$0c,$0c
	.dc.b $0e,$0e,$0e,$10,$10,$10,$14,$14
	.dc.b $14,$1a				
	.dc.b $1a,$1a,$42,$42,$42		
						
						
_sfb_32000_short:				
	.dc.b $04,$04,$04,$04,$04,$04,$04,$04
	.dc.b $04,$04,$04,$04,$06,$06,$06	
	.dc.b $08,$08,$08,$0c,$0c,$0c,$10,$10
	.dc.b $10,$14,$14,$14,$1a,$1a,$1a,$22
	.dc.b $22,$22,$2a,$2a,$2a,$0c,$0c	
	.dc.b $0c				
						
						
_sfb_44100_short:				
	.dc.b $04,$04,$04,$04,$04,$04,$04,$04
	.dc.b $04,$04,$04,$04,$06,$06,$06	
	.dc.b $08,$08,$08,$0a,$0a,$0a,$0c,$0c
	.dc.b $0c,$0e,$0e,$0e,$12,$12,$12,$16
	.dc.b $16,$16,$1e,$1e			
	.dc.b $1e,$38,$38,$38			
						
						
_sfb_48000_short:				
	.dc.b $04,$04,$04,$04,$04,$04,$04,$04
	.dc.b $04,$04,$04,$04,$06,$06,$06	
	.dc.b $06,$06,$06,$0a,$0a,$0a,$0c,$0c
	.dc.b $0c,$0e,$0e,$0e,$10,$10,$10,$14
	.dc.b $14,$14				
	.dc.b $1a,$1a,$1a,$42,$42,$42		
						
						
_sfb_32000_long:				
	.dc.b $04,$04,$04,$04,$04,$04,$06,$06
	.dc.b $08,$0a,$0c,$10,$14,$18,$1e,$26
	.dc.b $2e,$38,$44,$54,$66		
	.dc.b $1a				
						
						
_sfb_44100_long:				
	.dc.b $04,$04,$04,$04,$04,$04,$06,$06
	.dc.b $08,$08,$0a,$0c,$10,$14,$18,$1c
	.dc.b $22,$2a,$32			
	.dc.b $36,$4c,$9e			
						
						
_sfb_48000_long:				
	.dc.b $04,$04,$04,$04,$04,$04,$06,$06
	.dc.b $06,$08,$0a,$0c,$10,$12,$16,$1c
	.dc.b $22				
	.dc.b $28,$2e,$36,$36,$c0		
						
						
_nsfb_table:					
	.dc.b $06,$05,$05,$05			
	.dc.b $09,$09,$09,$09			
	.dc.b $06,$09,$09,$09			
	.dc.b $06,$05,$07,$03			
	.dc.b $09,$09,$0c,$06			
	.dc.b $06,$09,$0c,$06			
	.dc.b $0b,$0a
	.dc.b $00				

	.dc.b $00				
	.dc.b $12,$12
	.dc.b $00				

	.dc.b $00				
	.dc.b $0f,$12
	.dc.b $00				

	.dc.b $00				
	.dc.b $07,$07,$07
	.dc.b $00				
	.dc.b $0c,$0c,$0c
	.dc.b $00				
	.dc.b $06,$0f,$0c
	.dc.b $00				
	.dc.b $06,$06,$06,$03			
	.dc.b $0c,$09,$09,$06			
	.dc.b $06,$0c,$09,$06			
	.dc.b $08,$08,$05
	.dc.b $00				
	.dc.b $0f,$0c,$09
	.dc.b $00				
	.dc.b $06,$12,$09
	.dc.b $00				
						
						
_sflen_table:					
						
	.dc.b	0				
						
	.dc.b	0				
						
	.dc.b	0				
						
	.dc.b	1				
						
	.dc.b	0				
						
	.dc.b	2				
						
	.dc.b	0				
						
	.dc.b	3				
						
	.dc.b	3				
						
	.dc.b	0				
						
	.dc.b	1				
						
	.dc.b	1				
						
	.dc.b	1				
						
	.dc.b	2				
						
	.dc.b	1				
						
	.dc.b	3				
						
	.dc.b	2				
						
	.dc.b	1				
						
	.dc.b	2				
						
	.dc.b	2				
						
	.dc.b	2				
						
	.dc.b	3				
						
	.dc.b	3				
						
	.dc.b	1				
						
	.dc.b	3				
						
	.dc.b	2				
						
	.dc.b	3				
						
	.dc.b	3				
						
	.dc.b	4				
						
	.dc.b	2				
						
	.dc.b	4				
						
	.dc.b	3				
						
