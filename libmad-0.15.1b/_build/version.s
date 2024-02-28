* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"version.c"			
						
						
						
						
						
	.text					
	.globl	_mad_build			
	.data					
						
						
_mad_build:					
	.dc.b $46,$50,$4d,$5f,$44,$45,$46,$41
	.dc.b $55,$4c,$54,$20,$4f,$50,$54,$5f
	.dc.b $53,$50,$45,$45,$44,$20,$4f,$50
	.dc.b $54,$5f,$53,$53,$4f,$20
	.dc.b $00				
	.globl	_mad_author			
						
						
_mad_author:					
	.dc.b $55,$6e,$64,$65,$72,$62,$69,$74
	.dc.b $20,$54,$65,$63,$68,$6e,$6f,$6c
	.dc.b $6f,$67,$69,$65,$73,$2c,$20,$49
	.dc.b $6e,$63,$2e,$20,$3c,$69,$6e,$66
	.dc.b $6f,$40,$75,$6e,$64,$65,$72,$62
	.dc.b $69,$74,$2e,$63,$6f,$6d,$3e
	.dc.b $00				
	.globl	_mad_copyright			
						
						
_mad_copyright:					
	.dc.b $43,$6f,$70,$79,$72,$69,$67,$68
	.dc.b $74,$20,$28,$43,$29,$20,$32,$30
	.dc.b $30,$30,$2d,$32,$30,$30,$34,$20
	.dc.b $55,$6e,$64,$65,$72,$62,$69,$74
	.dc.b $20,$54,$65,$63,$68,$6e,$6f,$6c
	.dc.b $6f,$67,$69,$65,$73,$2c,$20,$49
	.dc.b $6e,$63,$2e
	.dc.b $00				
	.globl	_mad_version			
						
						
_mad_version:					
	.dc.b $4d,$50,$45,$47,$20,$41,$75,$64
	.dc.b $69,$6f,$20,$44,$65,$63,$6f,$64
	.dc.b $65,$72,$20,$30,$2e,$31,$35,$2e
	.dc.b $31,$20,$28,$62,$65,$74,$61,$29
	.dc.b $00				
						
