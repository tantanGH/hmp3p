* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"fixed.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_mad_f_abs			
						
_mad_f_abs:					
						
	move.l 4(sp),d0				
	jbpl _?L2				
	neg.l d0				
_?L2:						
						
	rts					
						
	.globl	___divsi3			
	.globl	___modsi3			
	.align	2				
	.globl	_mad_f_div			
						
_mad_f_div:					
	movem.l d3/d4/d5/d6,-(sp)		
	move.l 20(sp),d4			
	move.l 24(sp),d3			
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr ___divsi3				
	addq.l #8,sp				
	move.l d0,d6				
						
	jbpl _?L4				
	neg.l d6				
_?L4:						
	move.l d6,d5				
						
	tst.l d4				
	jbge _?L5				
						
	neg.l d4				
						
	neg.l d3				
_?L5:						
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr ___modsi3				
	addq.l #8,sp				
						
	tst.l d3				
	jbge _?L6				
						
	neg.l d4				
						
	neg.l d3				
_?L6:						
						
	moveq #7,d1				
	cmp.l d6,d1				
	jbge _?L7				
						
	subq.l #8,d6				
	jbne _?L15				
						
	tst.l d0				
	jbne _?L15				
						
	move.l d4,d1				
	eor.l d3,d1				
						
	jbpl _?L3				
	moveq #28,d1				
_?L9:						
						
	add.l d0,d0				
						
	cmp.l d0,d3				
	jbgt _?L12				
						
	addq.l #1,d5				
_?L12:						
						
	eor.l d3,d4				
						
	jbpl _?L13				
						
	neg.l d5				
_?L13:						
						
	move.l d5,d0				
	lsl.l d1,d0				
_?L3:						
						
	movem.l (sp)+,d3/d4/d5/d6		
	rts					
_?L7:						
						
	moveq #28,d1				
_?L21:						
	tst.l d0				
	jbeq _?L9				
						
	add.l d5,d5				
						
	add.l d0,d0				
						
	cmp.l d3,d0				
	jblt _?L10				
						
	sub.l d3,d0				
						
	addq.l #1,d5				
_?L10:						
						
	subq.l #1,d1				
						
	jbne _?L21				
	jbra _?L9				
_?L15:						
						
	moveq #0,d0				
	jbra _?L3				
						
						
