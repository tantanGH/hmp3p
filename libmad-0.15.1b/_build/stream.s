* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"stream.c"			
						
						
						
						
						
	.text					
	.align	2				
	.globl	_mad_stream_init		
						
_mad_stream_init:				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a3			
						
	clr.l (a3)				
						
	clr.l 4(a3)				
						
	clr.l 8(a3)				
						
	clr.l 12(a3)				
						
	clr.l 16(a3)				
						
	clr.l 20(a3)				
						
	clr.l 24(a3)				
						
	clr.l -(sp)				
	pea 28(a3)				
	lea _mad_bit_init,a4			
	jbsr (a4)				
						
	addq.l #4,sp				
	clr.l (sp)				
	pea 36(a3)				
	jbsr (a4)				
	addq.l #8,sp				
						
	clr.l 44(a3)				
						
	clr.l 48(a3)				
						
	clr.l 52(a3)				
						
	clr.l 56(a3)				
						
	clr.l 60(a3)				
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.align	2				
	.globl	_mad_stream_finish		
						
_mad_stream_finish:				
	move.l a3,-(sp)				
	move.l 8(sp),a3				
						
	move.l 48(a3),d0			
						
	jbeq _?L2				
						
	pea 1.w					
	move.l d0,-(sp)				
	jbsr _himem_free			
	addq.l #8,sp				
						
	clr.l 48(a3)				
_?L2:						
						
	move.l (sp)+,a3				
	rts					
						
	.align	2				
	.globl	_mad_stream_buffer		
						
_mad_stream_buffer:				
	move.l 4(sp),a0				
	move.l 8(sp),d0				
						
	move.l d0,(a0)				
						
	move.l d0,d1				
	add.l 12(sp),d1				
	move.l d1,4(a0)				
						
	move.l d0,20(a0)			
						
	move.l d0,24(a0)			
						
	moveq #1,d1				
	move.l d1,12(a0)			
						
	lea (28,a0),a0				
	move.l a0,4(sp)				
						
						
	jbra _mad_bit_init			
						
	.align	2				
	.globl	_mad_stream_skip		
						
_mad_stream_skip:				
	move.l 4(sp),a0				
						
	move.l 8(sp),d0				
	add.l d0,8(a0)				
						
	rts					
						
	.align	2				
	.globl	_mad_stream_sync		
						
_mad_stream_sync:				
	move.l a4,-(sp)				
	move.l a3,-(sp)				
	move.l 12(sp),a4			
						
	lea (28,a4),a3				
						
	move.l a3,-(sp)				
	jbsr _mad_bit_nextbyte			
	addq.l #4,sp				
						
	move.l 4(a4),d1				
	move.l d0,a0				
						
	move.l d1,d2				
	subq.l #1,d2				
_?L16:						
	move.l a0,a1				
						
	cmp.l a0,d2				
	jbhi _?L10				
_?L14:						
						
	sub.l a1,d1				
						
	moveq #7,d0				
	cmp.l d1,d0				
	jblt _?L17				
						
	moveq #-1,d0				
	jbra _?L9				
_?L10:						
	addq.l #1,a0				
						
	cmp.b #-1,(a1)				
	jbne _?L16				
						
	move.b (a0),d0				
	and.b #-32,d0				
	cmp.b #-32,d0				
	jbne _?L16				
	jbra _?L14				
_?L17:						
						
	move.l a1,-(sp)				
	move.l a3,-(sp)				
	jbsr _mad_bit_init			
	addq.l #8,sp				
						
	moveq #0,d0				
_?L9:						
						
	move.l (sp)+,a3				
	move.l (sp)+,a4				
	rts					
						
	.data					
_?LC0:						
	.dc.b $69,$6e,$70,$75,$74,$20,$62,$75
	.dc.b $66,$66,$65,$72,$20,$74,$6f,$6f
	.dc.b $20,$73,$6d,$61,$6c,$6c,$20,$28
	.dc.b $6f,$72,$20,$45,$4f,$46,$29
	.dc.b $00				
_?LC1:						
	.dc.b $6e,$6f,$20,$65,$72,$72,$6f,$72
	.dc.b $00				
_?LC2:						
	.dc.b $69,$6e,$76,$61,$6c,$69,$64,$20
	.dc.b $28,$6e,$75,$6c,$6c,$29,$20,$62
	.dc.b $75,$66,$66,$65,$72,$20,$70,$6f
	.dc.b $69,$6e,$74,$65,$72
	.dc.b $00				
_?LC3:						
	.dc.b $6e,$6f,$74,$20,$65,$6e,$6f,$75
	.dc.b $67,$68,$20,$6d,$65,$6d,$6f,$72
	.dc.b $79
	.dc.b $00				
_?LC4:						
	.dc.b $6c,$6f,$73,$74,$20,$73,$79,$6e
	.dc.b $63,$68,$72,$6f,$6e,$69,$7a,$61
	.dc.b $74,$69,$6f,$6e
	.dc.b $00				
_?LC5:						
	.dc.b $72,$65,$73,$65,$72,$76,$65,$64
	.dc.b $20,$68,$65,$61,$64,$65,$72,$20
	.dc.b $6c,$61,$79,$65,$72,$20,$76,$61
	.dc.b $6c,$75,$65
	.dc.b $00				
_?LC6:						
	.dc.b $66,$6f,$72,$62,$69,$64,$64,$65
	.dc.b $6e,$20,$62,$69,$74,$72,$61,$74
	.dc.b $65,$20,$76,$61,$6c,$75,$65
	.dc.b $00				
_?LC7:						
	.dc.b $72,$65,$73,$65,$72,$76,$65,$64
	.dc.b $20,$73,$61,$6d,$70,$6c,$65,$20
	.dc.b $66,$72,$65,$71,$75,$65,$6e,$63
	.dc.b $79,$20,$76,$61,$6c,$75,$65
	.dc.b $00				
_?LC8:						
	.dc.b $72,$65,$73,$65,$72,$76,$65,$64
	.dc.b $20,$65,$6d,$70,$68,$61,$73,$69
	.dc.b $73,$20,$76,$61,$6c,$75,$65
	.dc.b $00				
_?LC9:						
	.dc.b $43,$52,$43,$20,$63,$68,$65,$63
	.dc.b $6b,$20,$66,$61,$69,$6c,$65,$64
	.dc.b $00				
_?LC10:						
	.dc.b $66,$6f,$72,$62,$69,$64,$64,$65
	.dc.b $6e,$20,$62,$69,$74,$20,$61,$6c
	.dc.b $6c,$6f,$63,$61,$74,$69,$6f,$6e
	.dc.b $20,$76,$61,$6c,$75,$65
	.dc.b $00				
_?LC11:						
	.dc.b $62,$61,$64,$20,$73,$63,$61,$6c
	.dc.b $65,$66,$61,$63,$74,$6f,$72,$20
	.dc.b $69,$6e,$64,$65,$78
	.dc.b $00				
_?LC12:						
	.dc.b $62,$61,$64,$20,$62,$69,$74,$72
	.dc.b $61,$74,$65,$2f,$6d,$6f,$64,$65
	.dc.b $20,$63,$6f,$6d,$62,$69,$6e,$61
	.dc.b $74,$69,$6f,$6e
	.dc.b $00				
_?LC13:						
	.dc.b $62,$61,$64,$20,$66,$72,$61,$6d
	.dc.b $65,$20,$6c,$65,$6e,$67,$74,$68
	.dc.b $00				
_?LC14:						
	.dc.b $62,$61,$64,$20,$62,$69,$67,$5f
	.dc.b $76,$61,$6c,$75,$65,$73,$20,$63
	.dc.b $6f,$75,$6e,$74
	.dc.b $00				
_?LC15:						
	.dc.b $72,$65,$73,$65,$72,$76,$65,$64
	.dc.b $20,$62,$6c,$6f,$63,$6b,$5f,$74
	.dc.b $79,$70,$65
	.dc.b $00				
_?LC16:						
	.dc.b $62,$61,$64,$20,$73,$63,$61,$6c
	.dc.b $65,$66,$61,$63,$74,$6f,$72,$20
	.dc.b $73,$65,$6c,$65,$63,$74,$69,$6f
	.dc.b $6e,$20,$69,$6e,$66,$6f
	.dc.b $00				
_?LC17:						
	.dc.b $62,$61,$64,$20,$6d,$61,$69,$6e
	.dc.b $5f,$64,$61,$74,$61,$5f,$62,$65
	.dc.b $67,$69,$6e,$20,$70,$6f,$69,$6e
	.dc.b $74,$65,$72
	.dc.b $00				
_?LC18:						
	.dc.b $62,$61,$64,$20,$61,$75,$64,$69
	.dc.b $6f,$20,$64,$61,$74,$61,$20,$6c
	.dc.b $65,$6e,$67,$74,$68
	.dc.b $00				
_?LC19:						
	.dc.b $62,$61,$64,$20,$48,$75,$66,$66
	.dc.b $6d,$61,$6e,$20,$74,$61,$62,$6c
	.dc.b $65,$20,$73,$65,$6c,$65,$63,$74
	.dc.b $00				
_?LC20:						
	.dc.b $48,$75,$66,$66,$6d,$61,$6e,$20
	.dc.b $64,$61,$74,$61,$20,$6f,$76,$65
	.dc.b $72,$72,$75,$6e
	.dc.b $00				
_?LC21:						
	.dc.b $69,$6e,$63,$6f,$6d,$70,$61,$74
	.dc.b $69,$62,$6c,$65,$20,$62,$6c,$6f
	.dc.b $63,$6b,$5f,$74,$79,$70,$65,$20
	.dc.b $66,$6f,$72,$20,$4a,$53
	.dc.b $00				
	.text					
	.align	2				
	.globl	_mad_stream_errorstr		
						
_mad_stream_errorstr:				
						
	move.l 4(sp),a0				
	move.l 60(a0),d1			
						
	cmp.l #569,d1				
	jbhi _?L41				
	cmp.l #544,d1				
	jbhi _?L20				
	cmp.l #261,d1				
	jbhi _?L21				
	cmp.l #256,d1				
	jbhi _?L22				
						
	move.l #_?LC2,d0			
						
	moveq #2,d2				
	cmp.l d1,d2				
	jbeq _?L18				
	jbcs _?L23				
						
	move.l #_?LC1,d0			
						
	tst.l d1				
	jbeq _?L18				
	move.l #_?LC0,d0			
_?L18:						
						
	rts					
_?L20:						
						
	add.l #-545,d1				
	moveq #24,d0				
	cmp.l d1,d0				
	jbcs _?L41				
	add.l d1,d1				
	move.w _?L26(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L26:						
	.dc.w _?L44-_?L26			
	.dc.w _?L35-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L41-_?L26			
	.dc.w _?L34-_?L26			
	.dc.w _?L33-_?L26			
	.dc.w _?L32-_?L26			
	.dc.w _?L31-_?L26			
	.dc.w _?L30-_?L26			
	.dc.w _?L29-_?L26			
	.dc.w _?L28-_?L26			
	.dc.w _?L27-_?L26			
	.dc.w _?L25-_?L26			
_?L35:						
						
	move.l #_?LC12,d0			
	jbra _?L18				
_?L22:						
						
	add.l #-258,d1				
						
	move.l #_?LC4,d0			
						
	moveq #3,d2				
	cmp.l d1,d2				
	jbcs _?L18				
	add.l d1,d1				
	move.w _?L37(pc,d1.l),d0		
	jmp 2(pc,d0.w)				
	.align 2,0x284c				
						
_?L37:						
	.dc.w _?L40-_?L37			
	.dc.w _?L39-_?L37			
	.dc.w _?L38-_?L37			
	.dc.w _?L36-_?L37			
_?L40:						
						
	move.l #_?LC5,d0			
	jbra _?L18				
_?L23:						
						
	move.l #_?LC3,d0			
						
	moveq #49,d2				
	cmp.l d1,d2				
	jbeq _?L18				
_?L41:						
						
	moveq #0,d0				
	jbra _?L18				
_?L21:						
						
	move.l #_?LC9,d0			
						
	cmp.l #513,d1				
	jbeq _?L18				
						
	move.l #_?LC10,d0			
						
	cmp.l #529,d1				
	jbeq _?L18				
	jbra _?L41				
_?L39:						
						
	move.l #_?LC6,d0			
	jbra _?L18				
_?L38:						
						
	move.l #_?LC7,d0			
	jbra _?L18				
_?L36:						
						
	move.l #_?LC8,d0			
	jbra _?L18				
_?L34:						
						
	move.l #_?LC13,d0			
	jbra _?L18				
_?L33:						
						
	move.l #_?LC14,d0			
	jbra _?L18				
_?L32:						
						
	move.l #_?LC15,d0			
	jbra _?L18				
_?L31:						
						
	move.l #_?LC16,d0			
	jbra _?L18				
_?L30:						
						
	move.l #_?LC17,d0			
	jbra _?L18				
_?L29:						
						
	move.l #_?LC18,d0			
	jbra _?L18				
_?L28:						
						
	move.l #_?LC19,d0			
	jbra _?L18				
_?L27:						
						
	move.l #_?LC20,d0			
	jbra _?L18				
_?L25:						
						
	move.l #_?LC21,d0			
	jbra _?L18				
_?L44:						
						
	move.l #_?LC11,d0			
	jbra _?L18				
						
						
