* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"decoder.c"			
						
						
						
						
						
	.text					
	.align	2				
						
_error_default:					
	move.l 4(sp),a0				
	move.l 8(sp),a1				
						
	cmp.l #513,60(a1)			
	jbne _?L5				
						
	tst.l (a0)				
	jbeq _?L3				
						
	move.l 12(sp),-(sp)			
	jbsr _mad_frame_mute			
	addq.l #4,sp				
_?L4:						
						
	moveq #32,d0				
_?L1:						
						
	rts					
_?L3:						
						
	moveq #1,d0				
	move.l d0,(a0)				
	jbra _?L4				
_?L5:						
						
	moveq #0,d0				
	jbra _?L1				
						
	.align	2				
	.globl	_mad_decoder_init		
						
_mad_decoder_init:				
	move.l 4(sp),a0				
						
	moveq #-1,d0				
	move.l d0,(a0)				
						
	clr.l 4(a0)				
						
	clr.l 8(a0)				
						
	move.l d0,12(a0)			
						
	move.l d0,16(a0)			
						
	clr.l 20(a0)				
						
	move.l 8(sp),24(a0)			
						
	move.l 12(sp),28(a0)			
						
	move.l 16(sp),32(a0)			
						
	move.l 20(sp),36(a0)			
						
	move.l 24(sp),40(a0)			
						
	move.l 28(sp),44(a0)			
						
	move.l 32(sp),48(a0)			
						
	rts					
						
	.align	2				
	.globl	_mad_decoder_finish		
						
_mad_decoder_finish:				
						
	moveq #0,d0				
	rts					
						
	.align	2				
	.globl	_mad_decoder_run		
						
_mad_decoder_run:				
	subq.l #4,sp				
	movem.l d3/d4/a3/a4/a5/a6,-(sp)		
	move.l 32(sp),a4			
	move.l 36(sp),d0			
						
	move.l d0,(a4)				
						
	jbeq _?L9				
_?L11:						
						
	moveq #-1,d3				
_?L8:						
						
	move.l d3,d0				
	movem.l (sp)+,d3/d4/a3/a4/a5/a6		
	addq.l #4,sp				
	rts					
_?L9:						
						
	pea 1.w					
	pea 22656.w				
	jbsr _himem_malloc			
	addq.l #8,sp				
	move.l d0,a3				
						
	move.l d0,20(a4)			
						
	jbeq _?L11				
						
	clr.l 24(sp)				
						
	tst.l 28(a4)				
	jbeq _?L30				
						
	move.l 44(a4),a6			
						
	cmp.w #0,a6				
	jbeq _?L31				
						
	move.l 24(a4),d3			
_?L13:						
						
	lea (64,a3),a5				
						
	move.l a3,d4				
	add.l #9332,d4				
						
	move.l a3,-(sp)				
	jbsr _mad_stream_init			
						
	move.l a5,(sp)				
	jbsr _mad_frame_init			
						
	move.l d4,(sp)				
	jbsr _mad_synth_init			
	addq.l #4,sp				
						
	move.l 4(a4),56(a3)			
_?L28:						
						
	move.l a3,-(sp)				
	move.l 24(a4),-(sp)			
	move.l 28(a4),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	moveq #17,d1				
	cmp.l d0,d1				
	jbeq _?L18				
	moveq #32,d1				
	cmp.l d0,d1				
	jbeq _?L15				
_?L95:						
	moveq #16,d1				
	cmp.l d0,d1				
	jbeq _?L16				
_?L17:						
						
	tst.l 32(a4)				
	jbeq _?L19				
						
	move.l a3,-(sp)				
	move.l a5,-(sp)				
	jbsr _mad_header_decode			
	addq.l #8,sp				
						
	addq.l #1,d0				
	jbne _?L20				
						
	move.l 60(a3),d0			
	and.l #65280,d0				
						
	jbeq _?L15				
						
	move.l a5,-(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
_?L97:						
						
	lea (12,sp),sp				
						
	moveq #16,d1				
	cmp.l d0,d1				
	jbeq _?L16				
	moveq #17,d1				
	cmp.l d0,d1				
	jbne _?L17				
_?L18:						
						
	moveq #-1,d3				
_?L29:						
						
	move.l a5,-(sp)				
	jbsr _mad_frame_finish			
						
	move.l a3,(sp)				
	jbsr _mad_stream_finish			
	addq.l #4,sp				
_?L12:						
						
	move.l 20(a4),-(sp)			
	jbsr _free				
	addq.l #4,sp				
						
	clr.l 20(a4)				
						
	jbra _?L8				
_?L31:						
						
	moveq #24,d3				
	add.l sp,d3				
						
	lea _error_default,a6			
	jbra _?L13				
_?L20:						
						
	move.l a5,-(sp)				
	move.l 24(a4),-(sp)			
	move.l 32(a4),a0			
	jbsr (a0)				
	addq.l #8,sp				
						
	moveq #17,d1				
	cmp.l d0,d1				
	jbeq _?L18				
	moveq #32,d1				
	cmp.l d0,d1				
	jbeq _?L17				
	moveq #16,d1				
	cmp.l d0,d1				
	jbeq _?L16				
_?L19:						
						
	move.l a3,-(sp)				
	move.l a5,-(sp)				
	jbsr _mad_frame_decode			
	addq.l #8,sp				
						
	addq.l #1,d0				
	jbne _?L23				
						
	move.l 60(a3),d0			
	and.l #65280,d0				
						
	jbeq _?L15				
						
	move.l a5,-(sp)				
	move.l a3,-(sp)				
	move.l d3,-(sp)				
	jbsr (a6)				
	lea (12,sp),sp				
						
	moveq #17,d1				
	cmp.l d0,d1				
	jbeq _?L18				
	moveq #32,d1				
	cmp.l d0,d1				
	jbne _?L95				
_?L25:						
						
	move.l 36(a4),a0			
						
	cmp.w #0,a0				
	jbeq _?L26				
						
	move.l a5,-(sp)				
	move.l a3,-(sp)				
	move.l 24(a4),-(sp)			
	jbsr (a0)				
	lea (12,sp),sp				
						
	moveq #17,d1				
	cmp.l d0,d1				
	jbeq _?L18				
	moveq #32,d1				
	cmp.l d0,d1				
	jbeq _?L17				
	moveq #16,d1				
	cmp.l d0,d1				
	jbeq _?L16				
_?L26:						
						
	move.l a5,-(sp)				
	move.l d4,-(sp)				
	jbsr _mad_synth_frame			
	addq.l #8,sp				
						
	move.l 40(a4),a0			
						
	cmp.w #0,a0				
	jbeq _?L17				
						
	pea 13432(a3)				
	move.l a5,-(sp)				
	move.l 24(a4),-(sp)			
	jbsr (a0)				
	jbra _?L97				
_?L23:						
						
	clr.l 24(sp)				
	jbra _?L25				
_?L15:						
						
	moveq #1,d0				
	cmp.l 60(a3),d0				
	jbeq _?L28				
						
	jbra _?L18				
_?L16:						
						
	moveq #0,d3				
	jbra _?L29				
_?L30:						
						
	moveq #0,d3				
	jbra _?L12				
						
	.align	2				
	.globl	_mad_decoder_message		
						
_mad_decoder_message:				
						
	moveq #-1,d0				
	rts					
						
						
