* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"timer.c"			
						
						
						
						
						
	.text					
	.globl	___umodsi3			
	.globl	___udivsi3			
	.globl	___mulsi3			
	.align	2				
						
_scale_rational:				
	movem.l d3/d4/d5/d6/a3/a4/a5,-(sp)	
	move.l 32(sp),d6			
	move.l 36(sp),a4			
	move.l 40(sp),d5			
						
	move.l a4,d4				
	move.l d6,d3				
						
	lea ___umodsi3,a3			
_?L2:						
						
	tst.l d4				
	jbne _?L3				
						
	tst.l d3				
	jbne _?L4				
_?L7:						
	jbsr _abort				
_?L3:						
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d4,d3				
	move.l d0,d4				
	jbra _?L2				
_?L4:						
						
	lea ___udivsi3,a3			
	move.l d3,-(sp)				
	move.l d6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d6				
						
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,a4				
						
	move.l d0,d4				
	move.l d5,d3				
						
	lea ___umodsi3,a5			
_?L5:						
						
	tst.l d4				
	jbne _?L6				
						
	tst.l d3				
	jbeq _?L7				
						
	move.l d3,-(sp)				
	move.l d5,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d5				
						
	move.l d3,-(sp)				
	move.l a4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
						
	cmp.l d3,a4				
	jbcs _?L7				
	lea ___mulsi3,a4			
						
	cmp.l d5,d0				
	jbcc _?L8				
						
	move.l d0,-(sp)				
	move.l d5,-(sp)				
	jbsr ___umodsi3				
						
	addq.l #4,sp				
	move.l d6,(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
						
	addq.l #4,sp				
	move.l d4,(sp)				
	move.l d0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d3				
						
	move.l d4,-(sp)				
	move.l d5,-(sp)				
	jbsr (a3)				
						
	addq.l #4,sp				
	move.l d6,(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
_?L14:						
						
	addq.l #8,sp				
						
	add.l d3,d0				
_?L1:						
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5	
	rts					
_?L6:						
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d4,d3				
	move.l d0,d4				
	jbra _?L5				
_?L8:						
						
	cmp.l d0,d6				
	jbls _?L10				
						
	move.l d0,-(sp)				
	move.l d6,-(sp)				
	jbsr ___umodsi3				
						
	addq.l #4,sp				
	move.l d5,(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
						
	addq.l #4,sp				
	move.l d4,(sp)				
	move.l d0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d3				
						
	move.l d4,-(sp)				
	move.l d6,-(sp)				
	jbsr (a3)				
						
	addq.l #4,sp				
	move.l d5,(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	jbra _?L14				
_?L10:						
						
	move.l d6,-(sp)				
	move.l d5,-(sp)				
	jbsr (a4)				
						
	addq.l #4,sp				
	move.l d4,(sp)				
	move.l d0,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	jbra _?L1				
						
	.align	2				
	.globl	_mad_timer_compare		
						
_mad_timer_compare:				
	move.l 8(sp),d0				
	move.l 16(sp),a0			
						
	move.l 4(sp),d1				
	sub.l 12(sp),d1				
						
	jbmi _?L19				
						
	jbne _?L18				
						
	sub.l a0,d0				
						
	jbmi _?L19				
						
	sne d0					
	ext.w d0				
	ext.l d0				
	neg.l d0				
_?L15:						
						
	rts					
_?L18:						
						
	moveq #1,d0				
	jbra _?L15				
_?L19:						
						
	moveq #-1,d0				
	jbra _?L15				
						
	.align	2				
	.globl	_mad_timer_negate		
						
_mad_timer_negate:				
	move.l 4(sp),a0				
						
	move.l (a0),d1				
						
	move.l d1,d0				
	neg.l d0				
	move.l d0,(a0)				
						
	move.l 4(a0),d0				
						
	jbeq _?L20				
						
	not.l d1				
	move.l d1,(a0)				
						
	move.l #352800000,d1			
	sub.l d0,d1				
	move.l d1,4(a0)				
_?L20:						
						
	rts					
						
	.align	2				
	.globl	_mad_timer_abs			
						
_mad_timer_abs:					
	link.w a6,#0				
						
	tst.l 8(a6)				
	jbge _?L26				
						
	pea 8(a6)				
	jbsr _mad_timer_negate			
	addq.l #4,sp				
_?L26:						
						
	move.l 8(a6),d0				
	move.l 12(a6),d1			
	unlk a6					
	rts					
						
	.align	2				
	.globl	_mad_timer_set			
						
_mad_timer_set:					
	movem.l d3/d4/d5/a3,-(sp)		
	move.l 20(sp),a3			
	move.l 24(sp),d5			
	move.l 28(sp),d3			
	move.l 32(sp),d4			
						
	move.l d5,(a3)				
						
	cmp.l d3,d4				
	jbhi _?L28				
						
	tst.l d4				
	jbeq _?L29				
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr ___udivsi3				
	addq.l #8,sp				
						
	add.l d5,d0				
	move.l d0,(a3)				
						
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr ___umodsi3				
	addq.l #8,sp				
	move.l d0,d3				
_?L28:						
						
	cmp.l #22050,d4				
	jbeq _?L30				
	jbhi _?L31				
	cmp.l #11025,d4				
	jbeq _?L32				
	jbhi _?L33				
	cmp.l #1000,d4				
	jbeq _?L34				
	jbhi _?L35				
	moveq #1,d0				
	cmp.l d4,d0				
	jbcc _?L29				
_?L36:						
						
	move.l #352800000,-(sp)			
	move.l d4,-(sp)				
	move.l d3,-(sp)				
	jbsr _scale_rational			
	lea (12,sp),sp				
	jbra _?L53				
_?L35:						
						
	cmp.l #8000,d4				
	jbne _?L36				
						
	move.l #44100,-(sp)			
	move.l d3,-(sp)				
	jbsr ___mulsi3				
	jbra _?L54				
_?L33:						
						
	cmp.l #12000,d4				
	jbeq _?L38				
	cmp.l #16000,d4				
	jbne _?L36				
						
	pea 22050.w				
	move.l d3,-(sp)				
	jbsr ___mulsi3				
	jbra _?L54				
_?L31:						
						
	cmp.l #44100,d4				
	jbeq _?L40				
	jbhi _?L41				
	cmp.l #24000,d4				
	jbeq _?L42				
	cmp.l #32000,d4				
	jbne _?L36				
						
	move.l d3,d0				
	add.l d3,d0				
	add.l d3,d0				
	lsl.l #3,d0				
	add.l d3,d0				
	move.l d0,d1				
	lsl.l #3,d1				
	sub.l d0,d1				
	move.l d1,d3				
	lsl.l #6,d3				
	sub.l d1,d3				
						
	jbra _?L45				
_?L41:						
						
	cmp.l #48000,d4				
	jbeq _?L44				
	cmp.l #352800000,d4			
	jbne _?L36				
_?L45:						
						
	move.l d3,4(a3)				
						
	cmp.l #352799999,d3			
	jbls _?L27				
						
	move.l #352800000,-(sp)			
	move.l d3,-(sp)				
	jbsr ___udivsi3				
	addq.l #8,sp				
						
	add.l d0,(a3)				
						
	move.l #352800000,-(sp)			
	move.l d3,-(sp)				
	jbsr ___umodsi3				
	addq.l #8,sp				
	move.l d0,4(a3)				
						
	jbra _?L27				
_?L29:						
						
	clr.l 4(a3)				
_?L27:						
						
	movem.l (sp)+,d3/d4/d5/a3		
	rts					
_?L34:						
						
	move.l #352800,-(sp)			
	move.l d3,-(sp)				
	jbsr ___mulsi3				
_?L54:						
						
	addq.l #8,sp				
_?L53:						
						
	move.l d0,d3				
						
	jbra _?L45				
_?L32:						
						
	move.l d3,d0				
	lsl.l #5,d0				
	sub.l d3,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l d0,d3				
	lsl.l #8,d3				
						
	jbra _?L45				
_?L38:						
						
	pea 29400.w				
	move.l d3,-(sp)				
	jbsr ___mulsi3				
	jbra _?L54				
_?L30:						
						
	move.l d3,d0				
	lsl.l #5,d0				
	sub.l d3,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l d0,d3				
	lsl.l #7,d3				
						
	jbra _?L45				
_?L42:						
						
	pea 14700.w				
	move.l d3,-(sp)				
	jbsr ___mulsi3				
	jbra _?L54				
_?L40:						
						
	move.l d3,d0				
	lsl.l #5,d0				
	sub.l d3,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l d0,d3				
	lsl.l #6,d3				
						
	jbra _?L45				
_?L44:						
						
	pea 7350.w				
	move.l d3,-(sp)				
	jbsr ___mulsi3				
	jbra _?L54				
						
	.align	2				
	.globl	_mad_timer_add			
						
_mad_timer_add:					
	movem.l d3/d4/a3,-(sp)			
	move.l 16(sp),a3			
						
	move.l (a3),d4				
	add.l 20(sp),d4				
	move.l d4,(a3)				
						
	move.l 4(a3),d3				
	add.l 24(sp),d3				
	move.l d3,4(a3)				
						
	cmp.l #352799999,d3			
	jbls _?L55				
						
	move.l #352800000,-(sp)			
	move.l d3,-(sp)				
	jbsr ___udivsi3				
	addq.l #8,sp				
						
	add.l d4,d0				
	move.l d0,(a3)				
						
	move.l #352800000,-(sp)			
	move.l d3,-(sp)				
	jbsr ___umodsi3				
	addq.l #8,sp				
	move.l d0,4(a3)				
_?L55:						
						
	movem.l (sp)+,d3/d4/a3			
	rts					
						
	.align	2				
	.globl	_mad_timer_multiply		
						
_mad_timer_multiply:				
	subq.l #8,sp				
	movem.l d3/d4/a3/a4,-(sp)		
	move.l 28(sp),a3			
	move.l 32(sp),d3			
						
	jbpl _?L59				
						
	neg.l d3				
						
	move.l a3,-(sp)				
	jbsr _mad_timer_negate			
	addq.l #4,sp				
_?L59:						
						
	move.l (a3),d0				
	move.l 4(a3),d1				
	move.l d0,16(sp)			
	move.l d1,20(sp)			
						
	clr.l (a3)				
	clr.l 4(a3)				
	lea _mad_timer_add,a4			
						
	moveq #16,d4				
	add.l sp,d4				
_?L60:						
						
	tst.l d3				
	jbne _?L62				
						
	movem.l (sp)+,d3/d4/a3/a4		
	addq.l #8,sp				
	rts					
_?L62:						
						
	btst #0,d3				
	jbeq _?L61				
						
	move.l 20(sp),-(sp)			
	move.l 20(sp),-(sp)			
	move.l a3,-(sp)				
	jbsr (a4)				
	lea (12,sp),sp				
_?L61:						
						
	move.l 20(sp),-(sp)			
	move.l 20(sp),-(sp)			
	move.l d4,-(sp)				
	jbsr (a4)				
	lea (12,sp),sp				
						
	lsr.l #1,d3				
	jbra _?L60				
						
	.globl	___divsi3			
	.align	2				
	.globl	_mad_timer_count		
						
_mad_timer_count:				
	movem.l d4/d5/a3,-(sp)			
	move.l 16(sp),d4			
	move.l 20(sp),d5			
	move.l 24(sp),a3			
	move.l d4,d0				
						
	moveq #-1,d1				
	cmp.l a3,d1				
	jbeq _?L67				
	cmp.w #0,a3				
	jbge _?L68				
	moveq #-2,d0				
	cmp.l a3,d0				
	jbeq _?L69				
	moveq #-47,d1				
	cmp.l a3,d1				
	jble _?L70				
	moveq #-60,d0				
	cmp.l a3,d0				
	jble _?L71				
_?L83:						
						
	moveq #0,d0				
	jbra _?L66				
_?L78:						
						
	moveq #-30,d0				
	add.l a3,d0				
	move.l #1075052545,d1			
	btst d0,d1				
	jbeq _?L83				
_?L73:						
						
	move.l d4,-(sp)				
	move.l a3,-(sp)				
	jbsr ___mulsi3				
	addq.l #8,sp				
	move.l d0,d4				
						
	move.l a3,-(sp)				
	move.l #352800000,-(sp)			
	move.l d5,-(sp)				
	jbsr _scale_rational			
	lea (12,sp),sp				
						
	add.l d4,d0				
	jbra _?L66				
_?L71:						
						
	moveq #60,d0				
	add.l a3,d0				
	move.l #5121,d1				
	btst d0,d1				
	jbeq _?L83				
_?L74:						
						
	move.l a3,d1				
	neg.l d1				
	move.l d1,-(sp)				
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	jbsr _mad_timer_count			
	lea (12,sp),sp				
						
	addq.l #1,d0				
						
	move.l d0,d1				
	lsl.l #5,d1				
	sub.l d0,d1				
	add.l d1,d1				
	add.l d1,d1				
	add.l d1,d0				
	lsl.l #3,d0				
						
	pea 1001.w				
	move.l d0,-(sp)				
	jbsr ___divsi3				
	jbra _?L129				
_?L70:						
						
	moveq #-30,d1				
	cmp.l a3,d1				
	jbeq _?L74				
	jbgt _?L83				
	lea (25,a3),a0				
	moveq #1,d0				
	cmp.l a0,d0				
	jbcc _?L74				
	jbra _?L83				
_?L68:						
	moveq #10,d1				
	cmp.l a3,d1				
	jbeq _?L73				
	jblt _?L75				
	cmp.w #0,a3				
	jbne _?L83				
_?L66:						
						
	movem.l (sp)+,d4/d5/a3			
	rts					
_?L75:						
						
	cmp.w #8000,a3				
	jbeq _?L73				
	jbgt _?L76				
	moveq #60,d0				
	cmp.l a3,d0				
	jblt _?L77				
	moveq #29,d1				
	cmp.l a3,d1				
	jblt _?L78				
	lea (-24,a3),a0				
	moveq #1,d0				
	cmp.l a0,d0				
	jbcs _?L83				
	jbra _?L73				
_?L77:						
	moveq #100,d1				
	cmp.l a3,d1				
	jbeq _?L73				
	cmp.w #1000,a3				
	jbeq _?L73				
	moveq #75,d0				
	cmp.l a3,d0				
	jbeq _?L73				
	jbra _?L83				
_?L76:						
	cmp.w #24000,a3				
	jbeq _?L73				
	jbgt _?L79				
	cmp.w #16000,a3				
	jbeq _?L73				
	jbgt _?L80				
	cmp.w #11025,a3				
	jbeq _?L73				
	cmp.w #12000,a3				
	jbeq _?L73				
	jbra _?L83				
_?L80:						
	cmp.w #22050,a3				
	jbeq _?L73				
	jbra _?L83				
_?L79:						
	cmp.l #44100,a3				
	jbeq _?L73				
	cmp.l #48000,a3				
	jbeq _?L73				
	cmp.w #32000,a3				
	jbeq _?L73				
	jbra _?L83				
_?L69:						
						
	pea 3600.w				
	move.l d4,-(sp)				
	jbsr ___divsi3				
_?L129:						
						
	addq.l #8,sp				
	jbra _?L66				
_?L67:						
						
	pea 60.w				
	move.l d4,-(sp)				
	jbsr ___divsi3				
	jbra _?L129				
						
	.align	2				
	.globl	_mad_timer_fraction		
						
_mad_timer_fraction:				
	move.l d3,-(sp)				
	move.l 16(sp),d3			
						
	move.l 12(sp),-(sp)			
	move.l 12(sp),-(sp)			
	jbsr _mad_timer_abs			
	addq.l #8,sp				
	move.l d1,d0				
						
	tst.l d3				
	jbeq _?L131				
	cmp.l #352800000,d3			
	jbeq _?L130				
						
	move.l d3,16(sp)			
	move.l #352800000,12(sp)		
	move.l d1,8(sp)				
						
	move.l (sp)+,d3				
						
	jbra _scale_rational			
_?L131:						
						
	tst.l d1				
	jbeq _?L134				
						
	move.l d1,-(sp)				
	move.l #352800000,-(sp)			
	jbsr ___udivsi3				
	addq.l #8,sp				
_?L130:						
						
	move.l (sp)+,d3				
	rts					
_?L134:						
						
	move.l #352800001,d0			
	jbra _?L130				
						
	.globl	___modsi3			
	.align	2				
	.globl	_mad_timer_string		
						
_mad_timer_string:				
	subq.l #8,sp				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 56(sp),36(sp)			
	move.l 60(sp),40(sp)			
	move.l 64(sp),a4			
	move.l 68(sp),d7			
	move.l 72(sp),a3			
						
	move.l 52(sp),-(sp)			
	move.l 52(sp),-(sp)			
	jbsr _mad_timer_abs			
	addq.l #8,sp				
	move.l d0,d4				
	move.l d1,d5				
	move.l d1,d3				
						
	move.l d4,d6				
						
	moveq #10,d0				
	cmp.l d7,d0				
	jbeq _?L140				
	jblt _?L141				
	moveq #-60,d1				
	cmp.l d7,d1				
	jbeq _?L142				
	moveq #50,d0				
	add.l d7,d0				
	moveq #26,d1				
	cmp.l d0,d1				
	jbcc _?L250				
_?L168:						
	sub.l a6,a6				
	jbra _?L251				
_?L147:						
	move.l #1075052545,d1			
	moveq #-30,d0				
	add.l d7,d0				
	btst d0,d1				
	jbeq _?L168				
_?L140:						
						
	lea ___udivsi3,a6			
	move.l d7,-(sp)				
	move.l #352800000,-(sp)			
	jbsr (a6)				
	addq.l #8,sp				
	move.l d0,a5				
						
	move.l d0,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d0,a6				
						
	move.l a3,-(sp)				
	move.l a5,-(sp)				
	move.l a5,-(sp)				
	move.l d3,-(sp)				
	jbsr ___umodsi3				
	addq.l #4,sp				
	move.l d0,(sp)				
	jbsr _scale_rational			
	lea (12,sp),sp				
	move.l d0,d3				
_?L143:						
						
	moveq #-1,d0				
	cmp.l a4,d0				
	jbeq _?L151				
	cmp.w #0,a4				
	jbge _?L152				
	moveq #-2,d1				
	cmp.l a4,d1				
	jbeq _?L153				
	moveq #-47,d0				
	cmp.l a4,d0				
	jble _?L154				
	moveq #-60,d1				
	cmp.l a4,d1				
	jble _?L155				
_?L139:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
	rts					
_?L250:						
						
	move.l #101711877,d1			
	btst d0,d1				
	jbeq _?L168				
_?L142:						
						
	move.l d7,-(sp)				
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	jbsr _mad_timer_count			
	lea (12,sp),sp				
	move.l d0,d3				
						
	move.l d7,d0				
	add.l d7,d0				
	add.l d0,d0				
	add.l d7,d0				
	move.l d0,d1				
	lsl.l #4,d1				
	sub.l d1,d0				
	lsl.l #3,d0				
						
	move.w #-18,a3				
	add.l d0,a3				
						
	lea ___umodsi3,a6			
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d0,d6				
						
	lea ___udivsi3,a5			
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d0,d1				
	lsl.l #3,d1				
	add.l d0,d1				
	add.l d1,d1				
						
	add.l d1,d3				
						
	moveq #2,d1				
	cmp.l d6,d1				
	jbcc _?L150				
						
	subq.l #2,d6				
						
	pea 10.w				
	move.l a3,-(sp)				
	jbsr (a5)				
						
	addq.l #4,sp				
	move.l d0,(sp)				
	move.l d6,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	add.l d0,d0				
						
	add.l d0,d3				
_?L150:						
						
	move.l d7,d6				
	neg.l d6				
						
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
	addq.l #8,sp				
	move.l d0,a6				
						
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,d6				
_?L251:						
						
	moveq #0,d3				
	jbra _?L143				
_?L141:						
	cmp.l #8000,d7				
	jbeq _?L140				
	jbgt _?L145				
	moveq #60,d0				
	cmp.l d7,d0				
	jblt _?L146				
	moveq #29,d1				
	cmp.l d7,d1				
	jblt _?L147				
	move.w #-24,a2				
	add.l d7,a2				
	moveq #1,d0				
	cmp.l a2,d0				
	jbcs _?L168				
	jbra _?L140				
_?L146:						
	moveq #100,d1				
	cmp.l d7,d1				
	jbeq _?L140				
	cmp.l #1000,d7				
	jbeq _?L140				
	moveq #75,d0				
	cmp.l d7,d0				
	jbne _?L168				
	jbra _?L140				
_?L145:						
	cmp.l #24000,d7				
	jbeq _?L140				
	jbgt _?L148				
	cmp.l #16000,d7				
	jbeq _?L140				
	jbgt _?L149				
	cmp.l #11025,d7				
	jbeq _?L140				
	cmp.l #12000,d7				
	jbeq _?L140				
	jbra _?L168				
_?L149:						
	cmp.l #22050,d7				
	jbne _?L168				
	jbra _?L140				
_?L148:						
	cmp.l #44100,d7				
	jbeq _?L140				
	cmp.l #48000,d7				
	jbeq _?L140				
	cmp.l #32000,d7				
	jbne _?L168				
	jbra _?L140				
_?L163:						
						
	move.l #1075052545,d1			
	moveq #-30,d0				
	add.l a4,d0				
	btst d0,d1				
	jbeq _?L139				
_?L157:						
						
	move.l a4,-(sp)				
	move.l d5,-(sp)				
	move.l d4,-(sp)				
	jbsr _mad_timer_count			
	lea (12,sp),sp				
	move.l d3,60(sp)			
	move.l d0,56(sp)			
	move.l 40(sp),52(sp)			
	move.l 36(sp),48(sp)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
						
	jbra _sprintf				
_?L155:						
						
	move.l #5121,d1				
	moveq #60,d0				
	add.l a4,d0				
	btst d0,d1				
	jbeq _?L139				
_?L158:						
						
	tst.l d7				
	jbge _?L157				
						
	moveq #0,d3				
	jbra _?L157				
_?L154:						
						
	moveq #-30,d0				
	cmp.l a4,d0				
	jbeq _?L158				
	jbgt _?L139				
	lea (25,a4),a2				
	moveq #1,d1				
	cmp.l a2,d1				
	jbcc _?L158				
	jbra _?L139				
_?L152:						
	moveq #10,d0				
	cmp.l a4,d0				
	jbeq _?L157				
	jblt _?L159				
	cmp.w #0,a4				
	jbne _?L139				
						
	move.l d3,64(sp)			
	move.l a6,60(sp)			
	move.l d6,56(sp)			
	move.l 40(sp),52(sp)			
	move.l 36(sp),48(sp)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
						
	jbra _sprintf				
_?L159:						
						
	cmp.w #8000,a4				
	jbeq _?L157				
	jbgt _?L161				
	moveq #60,d1				
	cmp.l a4,d1				
	jblt _?L162				
	moveq #29,d0				
	cmp.l a4,d0				
	jblt _?L163				
	lea (-24,a4),a1				
	moveq #1,d1				
	cmp.l a1,d1				
	jbcs _?L139				
	jbra _?L157				
_?L162:						
	moveq #100,d0				
	cmp.l a4,d0				
	jbeq _?L157				
	cmp.w #1000,a4				
	jbeq _?L157				
	moveq #75,d1				
	cmp.l a4,d1				
	jbeq _?L157				
	jbra _?L139				
_?L161:						
	cmp.w #24000,a4				
	jbeq _?L157				
	jbgt _?L164				
	cmp.w #16000,a4				
	jbeq _?L157				
	jbgt _?L165				
	cmp.w #11025,a4				
	jbeq _?L157				
	cmp.w #12000,a4				
	jbeq _?L157				
	jbra _?L139				
_?L165:						
	cmp.w #22050,a4				
	jbeq _?L157				
	jbra _?L139				
_?L164:						
	cmp.l #44100,a4				
	jbeq _?L157				
	cmp.l #48000,a4				
	jbeq _?L157				
	cmp.w #32000,a4				
	jbeq _?L157				
	jbra _?L139				
_?L153:						
						
	lea ___udivsi3,a3			
	pea 60.w				
	move.l d6,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
	move.l d0,d4				
						
	move.l d3,72(sp)			
	move.l a6,68(sp)			
						
	lea ___umodsi3,a5			
	pea 60.w				
	move.l d6,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d0,64(sp)			
						
	pea 60.w				
	move.l d4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d0,60(sp)			
						
	pea 60.w				
	move.l d4,-(sp)				
	jbsr (a3)				
	addq.l #8,sp				
						
	move.l d0,56(sp)			
	move.l 40(sp),52(sp)			
	move.l 36(sp),48(sp)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
						
	jbra _sprintf				
_?L151:						
						
	move.l d3,68(sp)			
	move.l a6,64(sp)			
						
	pea 60.w				
	move.l d6,-(sp)				
	jbsr ___umodsi3				
	addq.l #8,sp				
						
	move.l d0,60(sp)			
						
	pea 60.w				
	move.l d6,-(sp)				
	jbsr ___udivsi3				
	addq.l #8,sp				
						
	move.l d0,56(sp)			
	move.l 40(sp),52(sp)			
	move.l 36(sp),48(sp)			
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	addq.l #8,sp				
						
	jbra _sprintf				
						
	.globl	_mad_timer_zero			
	.data					
	.align	2				
						
						
_mad_timer_zero:				
	.ds.b	8				
						
