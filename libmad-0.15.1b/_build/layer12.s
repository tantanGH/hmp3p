* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"layer12.c"			
						
						
						
						
						
	.text					
	.globl	___mulsi3			
	.align	2				
						
_I_sample:					
	move.l d3,-(sp)				
	move.l 12(sp),d3			
						
	move.l d3,-(sp)				
	move.l 12(sp),-(sp)			
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	move.l d3,d2				
	subq.l #1,d2				
						
	moveq #1,d1				
	lsl.l d2,d1				
						
	eor.l d1,d0				
						
	and.l d0,d1				
						
	neg.l d1				
						
	or.l d0,d1				
						
	moveq #29,d0				
	sub.l d3,d0				
						
	lsl.l d0,d1				
						
	move.l #268435456,d0			
	asr.l d2,d0				
						
	add.l d1,d0				
						
	moveq #12,d1				
	asr.l d1,d0				
	subq.l #2,d3				
	add.l d3,d3				
	add.l d3,d3				
	lea _linear_table,a0			
	move.w (a0,d3.l),a0			
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr ___mulsi3				
	addq.l #8,sp				
						
	move.l (sp)+,d3				
	rts					
						
	.globl	___umodsi3			
	.globl	___udivsi3			
	.align	2				
						
_II_samples:					
	lea (-12,sp),sp				
	movem.l d3/d4/d5/d6/a3/a4/a5/a6,-(sp)	
	move.l 48(sp),d3			
	move.l 52(sp),a3			
						
	moveq #0,d5				
	move.b 2(a3),d5				
						
	moveq #0,d6				
	move.b 3(a3),d6				
	lea _mad_bit_read,a5			
						
	tst.l d5				
	jbeq _?L3				
						
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,d4				
						
	moveq #0,d3				
	move.w (a3),d3				
						
	lea ___umodsi3,a4			
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,32(sp)			
						
	lea ___udivsi3,a5			
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
	move.l d0,d4				
						
	move.l d3,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,36(sp)			
						
	move.l d3,-(sp)				
	move.l d4,-(sp)				
	jbsr (a5)				
						
	addq.l #4,sp				
	move.l d3,(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l d0,40(sp)			
	move.l d5,d6				
_?L4:						
						
	move.l d6,d0				
	subq.l #1,d0				
						
	moveq #1,d3				
	lsl.l d0,d3				
	moveq #0,d5				
						
	moveq #29,d4				
	sub.l d6,d4				
						
	lea ___mulsi3,a4			
_?L6:						
						
	move.l 32(sp,d5.l),d1			
	eor.l d3,d1				
						
	move.l d3,d0				
	and.l d1,d0				
						
	neg.l d0				
						
	or.l d1,d0				
						
	lsl.l d4,d0				
						
	add.l 8(a3),d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.w 4(a3),a0				
	move.l a0,-(sp)				
	move.l d0,-(sp)				
	jbsr (a4)				
	addq.l #8,sp				
						
	move.l 56(sp),a0			
	move.l d0,(a0,d5.l)			
						
	addq.l #4,d5				
	moveq #12,d0				
	cmp.l d5,d0				
	jbne _?L6				
						
	movem.l (sp)+,d3/d4/d5/d6/a3/a4/a5/a6	
	lea (12,sp),sp				
	rts					
_?L3:						
	lea (32,sp),a4				
	lea (44,sp),a6				
_?L5:						
						
	move.l d6,-(sp)				
	move.l d3,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	move.l d0,(a4)+				
						
	cmp.l a6,a4				
	jbne _?L5				
	jbra _?L4				
						
	.align	2				
	.globl	_mad_layer_I			
						
_mad_layer_I:					
	lea (-136,sp),sp			
	movem.l d3/d4/d5/d6/d7/a3/a4/a5/a6,-(sp)
	move.l 176(sp),a5			
	move.l 180(sp),a3			
						
	move.l 4(a3),a4				
	cmp.w #0,a4				
	jbeq _?L37				
						
	moveq #2,d0				
	cmp.l a4,d0				
	jbne _?L38				
						
	or.w #256,30(a3)			
						
	move.l 8(a3),d3				
	addq.l #1,d3				
	add.l d3,d3				
	add.l d3,d3				
_?L10:						
						
	btst #4,31(a3)				
	jbne _?L11				
_?L13:						
						
	moveq #0,d5				
						
	moveq #28,d7				
	add.l a5,d7				
_?L12:						
	lea (44,sp),a6				
						
	cmp.l d3,d5				
	jbne _?L19				
	add.l d3,a6				
						
	move.l d3,d5				
						
	moveq #28,d6				
	add.l a5,d6				
	move.l #_mad_bit_read,d4		
_?L20:						
						
	moveq #32,d2				
	cmp.l d5,d2				
	jbne _?L23				
						
	moveq #0,d4				
						
	moveq #28,d6				
	add.l a5,d6				
	move.l #_mad_bit_read,d7		
_?L24:						
						
	move.l d4,a6				
						
	moveq #0,d5				
_?L26:						
						
	tst.b 44(sp,a6.l)			
	jbeq _?L25				
						
	pea 6.w					
	move.l d6,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.b d0,108(sp,a6.l)			
_?L25:						
						
	addq.l #1,d5				
						
	lea (32,a6),a6				
	cmp.l d5,a4				
	jbne _?L26				
						
	addq.l #1,d4				
						
	moveq #32,d0				
	cmp.l d4,d0				
	jbne _?L24				
	move.l d3,d5				
	add.l d3,d5				
	add.l d5,d5				
						
	sub.l a6,a6				
						
	lea (28,a5),a5				
	move.l a5,40(sp)			
_?L27:						
	moveq #48,d7				
	add.l a3,d7				
						
	moveq #0,d4				
	jbra _?L36				
_?L37:						
						
	move.w #1,a4				
_?L52:						
						
	moveq #32,d3				
	jbra _?L10				
_?L38:						
						
	move.w #2,a4				
	jbra _?L52				
_?L11:						
						
	moveq #0,d0				
	move.w 24(a3),d0			
	move.l d0,-(sp)				
						
	move.l d3,-(sp)				
	pea -1(a4)				
	jbsr ___mulsi3				
	addq.l #8,sp				
	moveq #32,d1				
	add.l d1,d0				
						
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,-(sp)				
	move.l 32(a5),-(sp)			
	move.l 28(a5),-(sp)			
	jbsr _mad_bit_crc			
	lea (16,sp),sp				
						
	move.w d0,24(a3)			
						
	cmp.w 26(a3),d0				
	jbeq _?L13				
						
	btst #0,47(a3)				
	jbne _?L13				
	move.l #513,d0				
	jbra _?L14				
_?L19:						
	add.l d5,a6				
						
	moveq #0,d6				
						
	move.l #_mad_bit_read,d4		
_?L18:						
	pea 4.w					
	move.l d7,-(sp)				
	move.l d4,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	moveq #15,d1				
	cmp.l d0,d1				
	jbne _?L15				
_?L21:						
						
	move.l #529,d0				
_?L14:						
						
	move.l d0,60(a5)			
						
	moveq #-1,d0				
_?L9:						
						
	movem.l (sp)+,d3/d4/d5/d6/d7/a3/a4/a5/a6
	lea (136,sp),sp				
	rts					
_?L15:						
						
	tst.l d0				
	jbeq _?L40				
						
	addq.b #1,d0				
_?L17:						
						
	move.b d0,(a6)				
						
	addq.l #1,d6				
						
	lea (32,a6),a6				
	cmp.l d6,a4				
	jbne _?L18				
						
	addq.l #1,d5				
	jbra _?L12				
_?L40:						
						
	clr.b d0				
	jbra _?L17				
_?L23:						
						
	pea 4.w					
	move.l d6,-(sp)				
	move.l d4,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	moveq #15,d1				
	cmp.l d0,d1				
	jbeq _?L21				
						
	tst.l d0				
	jbeq _?L41				
						
	addq.b #1,d0				
_?L22:						
						
	move.b d0,32(a6)			
						
	move.b d0,(a6)+				
						
	addq.l #1,d5				
	jbra _?L20				
_?L41:						
						
	clr.b d0				
	jbra _?L22				
_?L43:						
	move.l d4,d6				
	move.l d7,a1				
						
	sub.l a5,a5				
_?L29:						
						
	moveq #0,d0				
	move.b 44(sp,d6.l),d0			
						
	tst.l d0				
	jbeq _?L42				
						
	move.l d0,-(sp)				
	move.l 44(sp),-(sp)			
	move.l a1,44(sp)			
	jbsr _I_sample				
	addq.l #8,sp				
	moveq #0,d1				
	move.b 108(sp,d6.l),d1			
	add.l d1,d1				
	add.l d1,d1				
	moveq #12,d2				
	asr.l d2,d0				
						
	move.l d0,-(sp)				
	lea _sf_table,a2			
	move.w (a2,d1.l),a2			
	move.l a2,-(sp)				
	jbsr ___mulsi3				
	addq.l #8,sp				
	move.l 36(sp),a1			
_?L28:						
						
	move.l d0,(a1)				
						
	addq.l #1,a5				
						
	lea (4608,a1),a1			
	moveq #32,d0				
	add.l d0,d6				
	cmp.l a5,a4				
	jbne _?L29				
						
	addq.l #1,d4				
	addq.l #4,d7				
_?L36:						
						
	cmp.l d3,d4				
	jbne _?L43				
	lea (a3,d5.l),a5			
						
	move.l d3,d4				
_?L30:						
						
	moveq #32,d0				
	cmp.l d4,d0				
	jbne _?L35				
						
	lea (128,a3),a3				
	lea (32,a6),a6				
	cmp.w #384,a6				
	jbne _?L27				
						
	moveq #0,d0				
	jbra _?L9				
_?L42:						
						
	moveq #0,d0				
	jbra _?L28				
_?L35:						
						
	moveq #0,d0				
	move.b 44(sp,d4.l),d0			
						
	tst.l d0				
	jbne _?L31				
						
	clr.l 48(a5)				
						
	moveq #2,d1				
	cmp.l a4,d1				
	jbne _?L33				
						
	clr.l 4656(a5)				
_?L33:						
						
	addq.l #1,d4				
	addq.l #4,a5				
	jbra _?L30				
_?L31:						
						
	move.l d0,-(sp)				
	move.l 44(sp),-(sp)			
	jbsr _I_sample				
	addq.l #8,sp				
						
	move.l d0,d6				
	moveq #12,d2				
	asr.l d2,d6				
	lea _sf_table,a1			
	moveq #0,d0				
	move.b 108(sp,d4.l),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l #___mulsi3,d7			
	move.l d6,-(sp)				
	move.w (a1,d0.l),a0			
	move.l a0,-(sp)				
	move.l a1,44(sp)			
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l d0,48(a5)			
						
	move.l 36(sp),a1			
	moveq #2,d0				
	cmp.l a4,d0				
	jbne _?L33				
						
	lea (140,sp),a0				
	moveq #0,d1				
	move.b (a0,d4.l),d1			
	add.l d1,d1				
	add.l d1,d1				
	move.l d6,-(sp)				
	move.w (a1,d1.l),a1			
	move.l a1,-(sp)				
	move.l d7,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.l d0,4656(a5)			
	jbra _?L33				
						
	.align	2				
	.globl	_mad_layer_II			
						
_mad_layer_II:					
	link.w a6,#-408				
	movem.l d3/d4/d5/d6/d7/a3/a4/a5,-(sp)	
	move.l 12(a6),a3			
						
	move.l 4(a3),a0				
						
	move.l 28(a3),d2			
						
	move.l d2,d0				
	and.l #4096,d0				
						
	cmp.w #0,a0				
	jbne _?L54				
						
	tst.l d0				
	jbne _?L103				
						
	btst #10,d2				
	jbne _?L106				
						
	move.l 16(a3),d0			
						
	cmp.l #192000,d0			
	jbhi _?L107				
						
	moveq #1,d3				
	jbra _?L59				
_?L54:						
						
	tst.l d0				
	jbne _?L104				
						
	btst #10,d2				
	jbne _?L105				
						
	move.l 16(a3),d0			
						
	lsr.l #1,d0				
						
	moveq #2,d3				
_?L59:						
						
	cmp.l #48000,d0				
	jbhi _?L61				
						
	cmp.l #32000,20(a3)			
	jbne _?L108				
	moveq #3,d0				
_?L57:						
						
	move.l d0,d1				
	lsl.l #4,d1				
	add.l d1,d0				
	add.l d0,d0				
	lea _sbquant_table,a1			
	move.l (a1,d0.l),-392(a6)		
						
	add.l #_sbquant_table+4,d0		
	move.l d0,-380(a6)			
						
	moveq #2,d0				
	cmp.l a0,d0				
	jbne _?L110				
						
	or.w #256,d2				
	move.l d2,28(a3)			
						
	move.l 8(a3),d0				
	addq.l #1,d0				
	add.l d0,d0				
	add.l d0,d0				
_?L55:						
	move.l d0,-384(a6)			
	cmp.l -392(a6),d0			
	jbls _?L62				
	move.l -392(a6),-384(a6)		
_?L62:						
						
	move.l 8(a6),a0				
	move.l 28(a0),d0			
	move.l 32(a0),d1			
	move.l d0,-340(a6)			
	move.l d1,-336(a6)			
	move.l -380(a6),a4			
	move.l -384(a6),d5			
	add.l a4,d5				
						
	lea (-320,a6),a5			
						
	move.l #_bitalloc_table,d6		
						
	move.w #28,a0				
	add.l 8(a6),a0				
	move.l a0,-388(a6)			
	move.l #_mad_bit_read,d4		
_?L63:						
						
	cmp.l a4,d5				
	jbne _?L65				
	lea (-320,a6),a4			
	add.l -384(a6),a4			
						
	move.l -384(a6),d4			
						
	move.l #_bitalloc_table,d5		
						
	move.w #28,a5				
	add.l 8(a6),a5				
_?L66:						
						
	cmp.l -392(a6),d4			
	jbcs _?L67				
						
	moveq #0,d4				
						
	move.w #28,a4				
	add.l 8(a6),a4				
	lea _mad_bit_read,a5			
_?L68:						
						
	cmp.l -392(a6),d4			
	jbne _?L111				
						
	btst #4,31(a3)				
	jbne _?L71				
_?L73:						
						
	lea (-192,a6),a0			
	move.l a0,-388(a6)			
	sub.l a4,a4				
						
	move.w #28,a0				
	add.l 8(a6),a0				
	move.l a0,-376(a6)			
	move.l #_mad_bit_read,d5		
_?L72:						
						
	cmp.l -392(a6),a4			
	jbne _?L112				
	moveq #12,d0				
	add.l -384(a6),d0			
	add.l d0,d0				
	add.l d0,d0				
	add.l a3,d0				
	move.l d0,-388(a6)			
	lea (48,a3),a3				
	move.l a3,-368(a6)			
	move.l -392(a6),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,-348(a6)			
						
	moveq #32,d1				
	cmp.l -392(a6),d1			
	jbcs _?L85				
	moveq #32,d0				
	sub.l -392(a6),d0			
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,-356(a6)			
_?L86:						
	move.l d3,d0				
	lsl.l #5,d0				
	move.l #-320,d2				
	add.l a6,d2				
	add.l d0,d2				
	move.l d2,-352(a6)			
						
	clr.l -372(a6)				
_?L87:						
						
	move.l -372(a6),d6			
	lsr.l #2,d6				
	moveq #-65,d2				
	not.b d2				
	add.l a6,d2				
	add.l d6,d2				
	move.l d2,-376(a6)			
	move.l -368(a6),d5			
						
	moveq #0,d4				
						
	move.w #28,a0				
	add.l 8(a6),a0				
	move.l a0,-344(a6)			
	jbra _?L102				
_?L61:						
						
	cmp.l #80000,d0				
	jbls _?L109				
_?L58:						
						
	cmp.l #48000,20(a3)			
	sne d0					
	ext.w d0				
	ext.l d0				
	neg.l d0				
	jbra _?L57				
_?L105:						
						
	moveq #2,d3				
	jbra _?L58				
_?L106:						
	moveq #1,d3				
	jbra _?L58				
_?L104:						
	moveq #2,d3				
						
	moveq #4,d0				
	jbra _?L57				
_?L108:						
						
	moveq #2,d0				
	jbra _?L57				
_?L109:						
						
	moveq #0,d0				
	jbra _?L57				
_?L103:						
						
	move.l #_sbquant_table+140,-380(a6)	
						
	moveq #30,d1				
	move.l d1,-392(a6)			
						
	moveq #1,d3				
_?L110:						
						
	moveq #32,d0				
	jbra _?L55				
_?L65:						
						
	moveq #0,d0				
	move.b (a4)+,d0				
						
	add.l d0,d0				
	add.l d0,d0				
						
	move.l d0,a0				
	moveq #0,d7				
	move.w (a0,d6.l),d7			
						
	move.l d7,-(sp)				
	move.l -388(a6),-(sp)			
	move.l d4,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.b d0,(a5)+				
						
	moveq #2,d0				
	cmp.l d3,d0				
	jbne _?L63				
						
	move.l d7,-(sp)				
	move.l -388(a6),-(sp)			
	move.l d4,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.b d0,31(a5)			
	jbra _?L63				
_?L67:						
						
	move.l -380(a6),a0			
	moveq #0,d0				
	move.b (a0,d4.l),d0			
						
	add.l d0,d0				
	add.l d0,d0				
						
	move.l d0,a0				
	moveq #0,d0				
	move.w (a0,d5.l),d0			
						
	move.l d0,-(sp)				
	move.l a5,-(sp)				
	jbsr _mad_bit_read			
	addq.l #8,sp				
						
	move.b d0,32(a4)			
						
	move.b d0,(a4)+				
						
	addq.l #1,d4				
	jbra _?L66				
_?L111:						
	move.l d4,-388(a6)			
						
	moveq #0,d5				
_?L70:						
						
	lea (-320,a6),a0			
	move.l -388(a6),d1			
	tst.b (a0,d1.l)				
	jbeq _?L69				
						
	pea 2.w					
	move.l a4,-(sp)				
	jbsr (a5)				
	addq.l #8,sp				
						
	lea (-256,a6),a0			
	move.l -388(a6),d1			
	move.b d0,(a0,d1.l)			
_?L69:						
						
	addq.l #1,d5				
						
	moveq #32,d2				
	add.l d2,-388(a6)			
	cmp.l d5,d3				
	jbne _?L70				
						
	addq.l #1,d4				
	jbra _?L68				
_?L71:						
						
	moveq #0,d4				
	move.w 24(a3),d4			
	move.l 8(a6),a0				
	pea 28(a0)				
	pea -340(a6)				
	jbsr _mad_bit_length			
	addq.l #4,sp				
	move.l d4,(sp)				
	move.l d0,-(sp)				
	move.l -336(a6),-(sp)			
	move.l -340(a6),-(sp)			
	jbsr _mad_bit_crc			
	lea (16,sp),sp				
						
	move.w d0,24(a3)			
						
	cmp.w 26(a3),d0				
	jbeq _?L73				
	move.l #513,d0				
						
	btst #0,47(a3)				
	jbne _?L73				
_?L60:						
						
	move.l 8(a6),a0				
	move.l d0,60(a0)			
						
	moveq #-1,d0				
_?L53:						
						
	movem.l -440(a6),d3/d4/d5/d6/d7/a3/a4/a5
	unlk a6					
	rts					
_?L107:						
	move.l #546,d0				
	jbra _?L60				
_?L112:						
	move.l a4,d6				
	move.l -388(a6),a5			
						
	moveq #0,d4				
_?L84:						
						
	lea (-320,a6),a0			
	tst.b (a0,d6.l)				
	jbeq _?L76				
						
	pea 6.w					
	move.l -376(a6),-(sp)			
	move.l d5,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.b d0,(a5)				
						
	lea (-256,a6),a0			
	move.b (a0,d6.l),d7			
						
	cmp.b #2,d7				
	jbeq _?L77				
	jbhi _?L78				
	tst.b d7				
	jbeq _?L79				
_?L80:						
						
	pea 6.w					
	move.l -376(a6),-(sp)			
	move.l d5,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.b d0,2(a5)				
_?L82:						
						
	moveq #0,d0				
	move.b d7,d0				
						
	lea (a4,a4.l),a1			
	add.l a4,a1				
	move.l d4,d1				
	add.l d4,d1				
	add.l d4,d1				
	lsl.l #5,d1				
	add.l a1,d1				
	add.l a6,d1				
	move.l d1,a1				
	add.l d0,a1				
						
	move.b -193(a1),1(a5)			
	jbra _?L76				
_?L78:						
						
	cmp.b #3,d7				
	jbeq _?L80				
						
	btst #0,d7				
	jbne _?L82				
	jbra _?L76				
_?L77:						
						
	move.b d0,1(a5)				
_?L129:						
						
	move.b d0,2(a5)				
_?L76:						
						
	addq.l #1,d4				
						
	lea (96,a5),a5				
	moveq #32,d0				
	add.l d0,d6				
	cmp.l d4,d3				
	jbne _?L84				
						
	addq.l #1,a4				
	addq.l #3,-388(a6)			
	jbra _?L72				
_?L79:						
						
	pea 6.w					
	move.l -376(a6),-(sp)			
	move.l d5,a0				
	jbsr (a0)				
	addq.l #8,sp				
						
	move.b d0,1(a5)				
						
	pea 6.w					
	move.l -376(a6),-(sp)			
	move.l d5,a0				
	jbsr (a0)				
	addq.l #8,sp				
	jbra _?L129				
_?L85:						
						
	clr.l -356(a6)				
	jbra _?L86				
_?L92:						
	lea (-320,a6),a3			
	add.l d4,a3				
	move.l d5,d7				
	add.l #128,d7				
	move.l d5,a0				
	lea (256,a0),a0				
	move.l a0,-408(a6)			
	move.l -352(a6),d1			
	add.l d4,d1				
	move.l d1,-360(a6)			
						
	move.l -376(a6),a5			
	move.l d5,a4				
_?L91:						
						
	moveq #0,d1				
	move.b (a3),d1				
						
	tst.l d1				
	jbne _?L88				
						
	clr.l (a4)				
	move.l d7,a0				
	clr.l (a0)				
	move.l -408(a6),a0			
	clr.l (a0)				
_?L89:						
						
	lea (32,a3),a3				
	lea (4608,a4),a4			
	add.l #4608,d7				
	add.l #4608,-408(a6)			
	lea (96,a5),a5				
	cmp.l -360(a6),a3			
	jbne _?L91				
						
	addq.l #1,d4				
	addq.l #4,d5				
	addq.l #3,-376(a6)			
_?L102:						
						
	cmp.l -384(a6),d4			
	jbne _?L92				
	move.w #80,a0				
	add.l -388(a6),a0			
	move.l a0,-344(a6)			
	move.l -388(a6),d4			
	add.l #208,d4				
						
	move.l -388(a6),a5			
	move.l -384(a6),a3			
						
	move.w #28,a0				
	add.l 8(a6),a0				
	move.l a0,-364(a6)			
	moveq #-65,d1				
	not.b d1				
	add.l a6,d1				
	add.l d6,d1				
	move.l d1,-360(a6)			
_?L93:						
						
	cmp.l -392(a6),a3			
	jbcs _?L98				
	move.l -348(a6),d6			
	add.l -368(a6),d6			
						
	moveq #0,d7				
						
	lea _memset,a3				
_?L99:						
						
	move.l d6,d5				
						
	moveq #0,d4				
_?L100:						
						
	move.l -356(a6),-(sp)			
	clr.l -(sp)				
	move.l d5,-(sp)				
	jbsr (a3)				
	lea (12,sp),sp				
						
	addq.l #1,d4				
						
	add.l #128,d5				
	moveq #3,d0				
	cmp.l d4,d0				
	jbne _?L100				
						
	addq.l #1,d7				
						
	add.l #4608,d6				
	cmp.l d7,d3				
	jbne _?L99				
						
	addq.l #1,-372(a6)			
						
	add.l #384,-388(a6)			
	add.l #384,-368(a6)			
	moveq #12,d1				
	cmp.l -372(a6),d1			
	jbne _?L87				
						
	moveq #0,d0				
	jbra _?L53				
_?L88:						
						
	pea -332(a6)				
						
	move.l -380(a6),a0			
	moveq #0,d0				
	move.b (a0,d4.l),d0			
						
	add.l d0,d0				
	add.l d0,d0				
	lea _bitalloc_table,a0			
	moveq #0,d2				
	move.w 2(a0,d0.l),d2			
						
	move.l d2,d0				
	lsl.l #4,d0				
	sub.l d2,d0				
	lea _offset_table,a1			
	add.l d0,a1				
						
	moveq #0,d0				
	move.b -1(a1,d1.l),d0			
	move.l d0,d1				
	add.l d0,d1				
	add.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l #_qc_table,d0			
	move.l d0,-(sp)				
	move.l -344(a6),-(sp)			
	jbsr _II_samples			
	lea (12,sp),sp				
						
	moveq #0,d0				
	move.b (a5),d0				
	add.l d0,d0				
	add.l d0,d0				
	lea _sf_table,a1			
	move.w (a1,d0.l),a1			
	move.l a1,-364(a6)			
	lea (-332,a6),a1			
	move.l a4,a2				
						
	moveq #0,d1				
_?L90:						
						
	move.l (a1)+,d0				
	moveq #12,d2				
	asr.l d2,d0				
	move.l -364(a6),-(sp)			
	move.l d0,-(sp)				
	move.l d1,-396(a6)			
	move.l a1,-404(a6)			
	move.l a2,-400(a6)			
	jbsr ___mulsi3				
	addq.l #8,sp				
						
	move.l -400(a6),a2			
	move.l d0,(a2)				
						
	move.l -396(a6),d1			
	addq.l #1,d1				
						
	lea (128,a2),a2				
	move.l -404(a6),a1			
	moveq #3,d0				
	cmp.l d1,d0				
	jbne _?L90				
	jbra _?L89				
_?L98:						
						
	lea (-320,a3),a0			
	moveq #0,d1				
	move.b (a0,a6.l),d1			
						
	tst.l d1				
	jbeq _?L94				
						
	pea -332(a6)				
						
	move.l -380(a6),a0			
	moveq #0,d0				
	move.b (a0,a3.l),d0			
						
	add.l d0,d0				
	add.l d0,d0				
	move.l d0,a0				
	add.l #_bitalloc_table+2,a0		
	moveq #0,d2				
	move.w (a0),d2				
						
	move.l d2,d0				
	lsl.l #4,d0				
	sub.l d2,d0				
	move.l d0,a0				
	add.l #_offset_table,a0			
						
	moveq #0,d0				
	move.b -1(a0,d1.l),d0			
	move.l d0,d1				
	add.l d0,d1				
	add.l d1,d0				
	add.l d0,d0				
	add.l d0,d0				
	add.l #_qc_table,d0			
	move.l d0,-(sp)				
	move.l -364(a6),-(sp)			
	jbsr _II_samples			
	lea (12,sp),sp				
	lea (a3,a3.l),a4			
	add.l a3,a4				
	add.l -360(a6),a4			
	move.l a5,d7				
						
	moveq #0,d6				
_?L95:						
						
	moveq #0,d0				
	move.b (a4),d0				
	add.l d0,d0				
	add.l d0,d0				
	lea _sf_table,a0			
	move.w (a0,d0.l),a0			
	move.l a0,-376(a6)			
	lea (-332,a6),a1			
	move.l d7,a0				
						
	moveq #0,d5				
_?L96:						
						
	move.l (a1)+,d0				
	moveq #12,d1				
	asr.l d1,d0				
	move.l -376(a6),-(sp)			
	move.l d0,-(sp)				
	move.l a0,-396(a6)			
	move.l a1,-404(a6)			
	jbsr ___mulsi3				
	addq.l #8,sp				
						
	move.l -396(a6),a0			
	move.l d0,(a0)				
						
	addq.l #1,d5				
						
	lea (128,a0),a0				
	move.l -404(a6),a1			
	moveq #3,d2				
	cmp.l d5,d2				
	jbne _?L96				
						
	addq.l #1,d6				
						
	lea (96,a4),a4				
	add.l #4608,d7				
	cmp.l d6,d3				
	jbne _?L95				
_?L97:						
						
	addq.l #1,a3				
	addq.l #4,a5				
	addq.l #4,-344(a6)			
	addq.l #4,d4				
	jbra _?L93				
_?L94:						
						
	clr.l (a5)				
	move.l -344(a6),a0			
	clr.l 48(a0)				
	move.l d4,a0				
	clr.l 48(a0)				
						
	moveq #2,d0				
	cmp.l d3,d0				
	jbne _?L97				
						
	clr.l 4608(a5)				
	move.l -344(a6),a0			
	clr.l 4656(a0)				
	move.l d4,a0				
	clr.l 4656(a0)				
	jbra _?L97				
						
	.data					
	.align	2				
						
						
_qc_table:					
						
	.dc.w	3				
						
	.dc.b	2				
						
	.dc.b	5				
						
	.dc.l	357913941			
						
	.dc.l	134217728			
						
	.dc.w	5				
						
	.dc.b	3				
						
	.dc.b	7				
						
	.dc.l	429496730			
						
	.dc.l	134217728			
						
	.dc.w	7				
						
	.dc.b	0				
						
	.dc.b	3				
						
	.dc.l	306783378			
						
	.dc.l	67108864			
						
	.dc.w	9				
						
	.dc.b	4				
						
	.dc.b	10				
						
	.dc.l	477218588			
						
	.dc.l	134217728			
						
	.dc.w	15				
						
	.dc.b	0				
						
	.dc.b	4				
						
	.dc.l	286331153			
						
	.dc.l	33554432			
						
	.dc.w	31				
						
	.dc.b	0				
						
	.dc.b	5				
						
	.dc.l	277094664			
						
	.dc.l	16777216			
						
	.dc.w	63				
						
	.dc.b	0				
						
	.dc.b	6				
						
	.dc.l	272696336			
						
	.dc.l	8388608				
						
	.dc.w	127				
						
	.dc.b	0				
						
	.dc.b	7				
						
	.dc.l	270549121			
						
	.dc.l	4194304				
						
	.dc.w	255				
						
	.dc.b	0				
						
	.dc.b	8				
						
	.dc.l	269488144			
						
	.dc.l	2097152				
						
	.dc.w	511				
						
	.dc.b	0				
						
	.dc.b	9				
						
	.dc.l	268960770			
						
	.dc.l	1048576				
						
	.dc.w	1023				
						
	.dc.b	0				
						
	.dc.b	10				
						
	.dc.l	268697856			
						
	.dc.l	524288				
						
	.dc.w	2047				
						
	.dc.b	0				
						
	.dc.b	11				
						
	.dc.l	268566592			
						
	.dc.l	262144				
						
	.dc.w	4095				
						
	.dc.b	0				
						
	.dc.b	12				
						
	.dc.l	268501008			
						
	.dc.l	131072				
						
	.dc.w	8191				
						
	.dc.b	0				
						
	.dc.b	13				
						
	.dc.l	268468228			
						
	.dc.l	65536				
						
	.dc.w	16383				
						
	.dc.b	0				
						
	.dc.b	14				
						
	.dc.l	268451841			
						
	.dc.l	32768				
						
	.dc.w	32767				
						
	.dc.b	0				
						
	.dc.b	15				
						
	.dc.l	268443648			
						
	.dc.l	16384				
						
	.dc.w	-1				
						
	.dc.b	0				
						
	.dc.b	16				
						
	.dc.l	268439552			
						
	.dc.l	8192				
						
						
_offset_table:					

	.dc.b $00				
	.dc.b $01,$10
	.dc.b $00				
	.ds.b	11				

	.dc.b $00				
	.dc.b $01,$02,$03,$04,$05,$10
	.dc.b $00				
	.ds.b	7				

	.dc.b $00				
	.dc.b $01,$02,$03,$04,$05,$06,$07,$08
	.dc.b $09,$0a,$0b,$0c,$0d,$0e		

	.dc.b $00				
	.dc.b $01,$03,$04,$05,$06,$07,$08,$09
	.dc.b $0a,$0b,$0c,$0d,$0e,$0f		

	.dc.b $00				
	.dc.b $01,$02,$03,$04,$05,$06,$07,$08
	.dc.b $09,$0a,$0b,$0c,$0d,$10		

	.dc.b $00				
	.dc.b $02,$04,$05,$06,$07,$08,$09,$0a
	.dc.b $0b,$0c,$0d,$0e,$0f,$10		
	.align	2				
						
						
_bitalloc_table:				
						
	.dc.w	2				
						
	.dc.w	0				
						
	.dc.w	2				
						
	.dc.w	3				
						
	.dc.w	3				
						
	.dc.w	3				
						
	.dc.w	3				
						
	.dc.w	1				
						
	.dc.w	4				
						
	.dc.w	2				
						
	.dc.w	4				
						
	.dc.w	3				
						
	.dc.w	4				
						
	.dc.w	4				
						
	.dc.w	4				
						
	.dc.w	5				
	.align	2				
						
						
_sbquant_table:					
						
	.dc.l	27				
						
	.dc.b $07,$07,$07,$06,$06,$06,$06,$06
	.dc.b $06,$06,$06,$03,$03,$03,$03,$03
	.dc.b $03,$03,$03,$03,$03,$03,$03
	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				
	.ds.b	2				
						
	.dc.l	30				
						
	.dc.b $07,$07,$07,$06,$06,$06,$06,$06
	.dc.b $06,$06,$06,$03,$03,$03,$03,$03
	.dc.b $03,$03,$03,$03,$03,$03,$03
	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				

	.dc.b $00				
						
	.dc.l	8				
						
	.dc.b $05,$05,$02,$02,$02,$02,$02,$02
	.dc.b $00				
	.ds.b	21				
						
	.dc.l	12				
						
	.dc.b $05,$05,$02,$02,$02,$02,$02,$02
	.dc.b $02,$02,$02,$02
	.dc.b $00				
	.ds.b	17				
						
	.dc.l	30				
						
	.dc.b $04,$04,$04,$04,$02,$02,$02,$02
	.dc.b $02,$02,$02,$01,$01,$01,$01	
	.dc.b $01,$01,$01,$01,$01,$01,$01,$01
	.dc.b $01,$01,$01,$01,$01,$01,$01	
	.align	2				
						
						
_linear_table:					
	.dc.l	357913941			
	.dc.l	306783378			
	.dc.l	286331153			
	.dc.l	277094664			
	.dc.l	272696336			
	.dc.l	270549121			
	.dc.l	269488144			
	.dc.l	268960770			
	.dc.l	268697856			
	.dc.l	268566592			
	.dc.l	268501008			
	.dc.l	268468228			
	.dc.l	268451841			
	.dc.l	268443648			
	.align	2				
						
						
_sf_table:					
	.dc.l	536870912			
	.dc.l	426114725			
	.dc.l	338207482			
	.dc.l	268435456			
	.dc.l	213057363			
	.dc.l	169103741			
	.dc.l	134217728			
	.dc.l	106528681			
	.dc.l	84551870			
	.dc.l	67108864			
	.dc.l	53264341			
	.dc.l	42275935			
	.dc.l	33554432			
	.dc.l	26632170			
	.dc.l	21137968			
	.dc.l	16777216			
	.dc.l	13316085			
	.dc.l	10568984			
	.dc.l	8388608				
	.dc.l	6658043				
	.dc.l	5284492				
	.dc.l	4194304				
	.dc.l	3329021				
	.dc.l	2642246				
	.dc.l	2097152				
	.dc.l	1664511				
	.dc.l	1321123				
	.dc.l	1048576				
	.dc.l	832255				
	.dc.l	660561				
	.dc.l	524288				
	.dc.l	416128				
	.dc.l	330281				
	.dc.l	262144				
	.dc.l	208064				
	.dc.l	165140				
	.dc.l	131072				
	.dc.l	104032				
	.dc.l	82570				
	.dc.l	65536				
	.dc.l	52016				
	.dc.l	41285				
	.dc.l	32768				
	.dc.l	26008				
	.dc.l	20643				
	.dc.l	16384				
	.dc.l	13004				
	.dc.l	10321				
	.dc.l	8192				
	.dc.l	6502				
	.dc.l	5161				
	.dc.l	4096				
	.dc.l	3251				
	.dc.l	2580				
	.dc.l	2048				
	.dc.l	1625				
	.dc.l	1290				
	.dc.l	1024				
	.dc.l	813				
	.dc.l	645				
	.dc.l	512				
	.dc.l	406				
	.dc.l	323				
	.dc.l	0				
						
