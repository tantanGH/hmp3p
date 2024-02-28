* NO_APP
RUNS_HUMAN_VERSION	equ	3
	.cpu 68000
	.include doscall.inc
	.include iocscall.inc
* X68 GCC Develop
	.file	"huffman.c"			
						
						
						
						
						
	.text					
	.globl	_mad_huff_pair_table		
	.data					
	.align	2				
						
						
_mad_huff_pair_table:				
						
	.dc.l	_hufftab0			
						
	.dc.w	0				
						
	.dc.w	0				
						
	.dc.l	_hufftab1			
						
	.dc.w	0				
						
	.dc.w	3				
						
	.dc.l	_hufftab2			
						
	.dc.w	0				
						
	.dc.w	3				
						
	.dc.l	_hufftab3			
						
	.dc.w	0				
						
	.dc.w	3				
						
	.dc.l	0				
	.ds.b	4				
						
	.dc.l	_hufftab5			
						
	.dc.w	0				
						
	.dc.w	3				
						
	.dc.l	_hufftab6			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	_hufftab7			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	_hufftab8			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	_hufftab9			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	_hufftab10			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	_hufftab11			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	_hufftab12			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	_hufftab13			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	0				
	.ds.b	4				
						
	.dc.l	_hufftab15			
						
	.dc.w	0				
						
	.dc.w	4				
						
	.dc.l	_hufftab16			
						
	.dc.w	1				
						
	.dc.w	4				
						
	.dc.l	_hufftab16			
						
	.dc.w	2				
						
	.dc.w	4				
						
	.dc.l	_hufftab16			
						
	.dc.w	3				
						
	.dc.w	4				
						
	.dc.l	_hufftab16			
						
	.dc.w	4				
						
	.dc.w	4				
						
	.dc.l	_hufftab16			
						
	.dc.w	6				
						
	.dc.w	4				
						
	.dc.l	_hufftab16			
						
	.dc.w	8				
						
	.dc.w	4				
						
	.dc.l	_hufftab16			
						
	.dc.w	10				
						
	.dc.w	4				
						
	.dc.l	_hufftab16			
						
	.dc.w	13				
						
	.dc.w	4				
						
	.dc.l	_hufftab24			
						
	.dc.w	4				
						
	.dc.w	4				
						
	.dc.l	_hufftab24			
						
	.dc.w	5				
						
	.dc.w	4				
						
	.dc.l	_hufftab24			
						
	.dc.w	6				
						
	.dc.w	4				
						
	.dc.l	_hufftab24			
						
	.dc.w	7				
						
	.dc.w	4				
						
	.dc.l	_hufftab24			
						
	.dc.w	8				
						
	.dc.w	4				
						
	.dc.l	_hufftab24			
						
	.dc.w	9				
						
	.dc.w	4				
						
	.dc.l	_hufftab24			
						
	.dc.w	11				
						
	.dc.w	4				
						
	.dc.l	_hufftab24			
						
	.dc.w	13				
						
	.dc.w	4				
	.globl	_mad_huff_quad_table		
	.align	2				
						
						
_mad_huff_quad_table:				
	.dc.l	_hufftabA			
	.dc.l	_hufftabB			
	.align	2				
						
						
_hufftab24:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
	.dc.b	64				
	.dc.b	48				
						
						
						
						
						
	.dc.b	207				
	.dc.b	240				
						
						
						
						
	.dc.b	64				
	.dc.b	64				
						
						
						
						
	.dc.b	64				
	.dc.b	80				
						
						
						
						
	.dc.b	64				
	.dc.b	96				
						
						
						
						
	.dc.b	64				
	.dc.b	112				
						
						
						
						
	.dc.b	64				
	.dc.b	128				
						
						
						
						
	.dc.b	64				
	.dc.b	144				
						
						
						
						
	.dc.b	48				
	.dc.b	160				
						
						
						
						
	.dc.b	32				
	.dc.b	168				
						
						
						
						
						
	.dc.b	193				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	16				
						
						
						
						
						
	.dc.b	193				
	.dc.b	0				
						
						
						
						
						
	.dc.b	192				
	.dc.b	0				
						
						
						
						
						
	.dc.b	206				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	224				
						
						
						
						
						
	.dc.b	205				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	208				
						
						
						
						
						
	.dc.b	204				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	192				
						
						
						
						
						
	.dc.b	203				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	176				
						
						
						
						
						
	.dc.b	191				
	.dc.b	160				
						
						
						
						
						
	.dc.b	191				
	.dc.b	160				
						
						
						
						
						
	.dc.b	202				
	.dc.b	240				
						
						
						
						
						
	.dc.b	201				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	144				
						
						
						
						
						
	.dc.b	191				
	.dc.b	144				
						
						
						
						
						
	.dc.b	191				
	.dc.b	128				
						
						
						
						
						
	.dc.b	191				
	.dc.b	128				
						
						
						
						
						
	.dc.b	200				
	.dc.b	240				
						
						
						
						
						
	.dc.b	199				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	112				
						
						
						
						
						
	.dc.b	191				
	.dc.b	112				
						
						
						
						
						
	.dc.b	182				
	.dc.b	240				
						
						
						
						
						
	.dc.b	182				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	96				
						
						
						
						
						
	.dc.b	191				
	.dc.b	96				
						
						
						
						
						
	.dc.b	181				
	.dc.b	240				
						
						
						
						
						
	.dc.b	181				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	80				
						
						
						
						
						
	.dc.b	191				
	.dc.b	80				
						
						
						
						
						
	.dc.b	180				
	.dc.b	240				
						
						
						
						
						
	.dc.b	180				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	64				
						
						
						
						
						
	.dc.b	191				
	.dc.b	64				
						
						
						
						
						
	.dc.b	179				
	.dc.b	240				
						
						
						
						
						
	.dc.b	179				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	48				
						
						
						
						
						
	.dc.b	191				
	.dc.b	48				
						
						
						
						
						
	.dc.b	178				
	.dc.b	240				
						
						
						
						
						
	.dc.b	178				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	32				
						
						
						
						
						
	.dc.b	191				
	.dc.b	32				
						
						
						
						
						
	.dc.b	191				
	.dc.b	16				
						
						
						
						
						
	.dc.b	191				
	.dc.b	16				
						
						
						
						
						
	.dc.b	193				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	0				
						
						
						
						
	.dc.b	48				
	.dc.b	172				
						
						
						
						
	.dc.b	48				
	.dc.b	180				
						
						
						
						
	.dc.b	48				
	.dc.b	188				
						
						
						
						
	.dc.b	48				
	.dc.b	196				
						
						
						
						
	.dc.b	64				
	.dc.b	204				
						
						
						
						
	.dc.b	48				
	.dc.b	220				
						
						
						
						
	.dc.b	48				
	.dc.b	228				
						
						
						
						
	.dc.b	48				
	.dc.b	236				
						
						
						
						
	.dc.b	32				
	.dc.b	244				
						
						
						
						
	.dc.b	32				
	.dc.b	248				
						
						
						
						
	.dc.b	32				
	.dc.b	252				
						
						
						
						
	.dc.b	33				
	.dc.b	0				
						
						
						
						
	.dc.b	33				
	.dc.b	4				
						
						
						
						
	.dc.b	33				
	.dc.b	8				
						
						
						
						
	.dc.b	33				
	.dc.b	12				
						
						
						
						
	.dc.b	33				
	.dc.b	16				
						
						
						
						
	.dc.b	33				
	.dc.b	20				
						
						
						
						
	.dc.b	49				
	.dc.b	24				
						
						
						
						
	.dc.b	33				
	.dc.b	32				
						
						
						
						
	.dc.b	33				
	.dc.b	36				
						
						
						
						
	.dc.b	33				
	.dc.b	40				
						
						
						
						
	.dc.b	49				
	.dc.b	44				
						
						
						
						
	.dc.b	33				
	.dc.b	52				
						
						
						
						
	.dc.b	49				
	.dc.b	56				
						
						
						
						
	.dc.b	17				
	.dc.b	64				
						
						
						
						
	.dc.b	33				
	.dc.b	66				
						
						
						
						
	.dc.b	33				
	.dc.b	70				
						
						
						
						
	.dc.b	17				
	.dc.b	74				
						
						
						
						
	.dc.b	33				
	.dc.b	76				
						
						
						
						
	.dc.b	17				
	.dc.b	80				
						
						
						
						
	.dc.b	17				
	.dc.b	82				
						
						
						
						
	.dc.b	17				
	.dc.b	84				
						
						
						
						
	.dc.b	17				
	.dc.b	86				
						
						
						
						
	.dc.b	17				
	.dc.b	88				
						
						
						
						
	.dc.b	17				
	.dc.b	90				
						
						
						
						
	.dc.b	17				
	.dc.b	92				
						
						
						
						
	.dc.b	17				
	.dc.b	94				
						
						
						
						
	.dc.b	17				
	.dc.b	96				
						
						
						
						
	.dc.b	17				
	.dc.b	98				
						
						
						
						
	.dc.b	17				
	.dc.b	100				
						
						
						
						
	.dc.b	17				
	.dc.b	102				
						
						
						
						
	.dc.b	17				
	.dc.b	104				
						
						
						
						
	.dc.b	17				
	.dc.b	106				
						
						
						
						
	.dc.b	17				
	.dc.b	108				
						
						
						
						
	.dc.b	17				
	.dc.b	110				
						
						
						
						
	.dc.b	17				
	.dc.b	112				
						
						
						
						
	.dc.b	33				
	.dc.b	114				
						
						
						
						
	.dc.b	17				
	.dc.b	118				
						
						
						
						
	.dc.b	33				
	.dc.b	120				
						
						
						
						
						
	.dc.b	199				
	.dc.b	48				
						
						
						
						
	.dc.b	17				
	.dc.b	124				
						
						
						
						
						
	.dc.b	199				
	.dc.b	32				
						
						
						
						
						
	.dc.b	196				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	64				
						
						
						
						
						
	.dc.b	197				
	.dc.b	80				
						
						
						
						
						
	.dc.b	199				
	.dc.b	16				
						
						
						
						
						
	.dc.b	195				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	48				
						
						
						
						
						
	.dc.b	196				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	64				
						
						
						
						
						
	.dc.b	194				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	16				
						
						
						
						
	.dc.b	17				
	.dc.b	126				
						
						
						
						
						
	.dc.b	195				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	48				
						
						
						
						
						
	.dc.b	196				
	.dc.b	64				
						
						
						
						
						
	.dc.b	194				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	80				
						
						
						
						
	.dc.b	17				
	.dc.b	128				
						
						
						
						
						
	.dc.b	181				
	.dc.b	16				
						
						
						
						
						
	.dc.b	181				
	.dc.b	16				
						
						
						
						
						
	.dc.b	195				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	48				
						
						
						
						
						
	.dc.b	178				
	.dc.b	64				
						
						
						
						
						
	.dc.b	178				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	32				
						
						
						
						
						
	.dc.b	180				
	.dc.b	32				
						
						
						
						
						
	.dc.b	179				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	48				
						
						
						
						
						
	.dc.b	177				
	.dc.b	64				
						
						
						
						
						
	.dc.b	177				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	16				
						
						
						
						
						
	.dc.b	180				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	48				
						
						
						
						
						
	.dc.b	178				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	32				
						
						
						
						
						
	.dc.b	179				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	0				
						
						
						
						
						
	.dc.b	162				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	32				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	240				
						
						
						
						
						
	.dc.b	144				
	.dc.b	240				
						
						
						
						
						
	.dc.b	144				
	.dc.b	240				
						
						
						
						
						
	.dc.b	144				
	.dc.b	240				
						
						
						
						
						
	.dc.b	190				
	.dc.b	224				
						
						
						
						
						
	.dc.b	189				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	208				
						
						
						
						
						
	.dc.b	188				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	192				
						
						
						
						
						
	.dc.b	189				
	.dc.b	208				
						
						
						
						
						
	.dc.b	187				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	176				
						
						
						
						
						
	.dc.b	188				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	192				
						
						
						
						
						
	.dc.b	186				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	160				
						
						
						
						
						
	.dc.b	187				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	176				
						
						
						
						
						
	.dc.b	188				
	.dc.b	192				
						
						
						
						
						
	.dc.b	185				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	144				
						
						
						
						
						
	.dc.b	186				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	160				
						
						
						
						
						
	.dc.b	187				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	176				
						
						
						
						
						
	.dc.b	184				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	128				
						
						
						
						
						
	.dc.b	185				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	144				
						
						
						
						
						
	.dc.b	183				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	112				
						
						
						
						
						
	.dc.b	186				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	160				
						
						
						
						
						
	.dc.b	188				
	.dc.b	160				
						
						
						
						
						
	.dc.b	187				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	176				
						
						
						
						
						
	.dc.b	184				
	.dc.b	208				
						
						
						
						
						
	.dc.b	184				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	128				
						
						
						
						
						
	.dc.b	189				
	.dc.b	128				
						
						
						
						
						
	.dc.b	192				
	.dc.b	224				
						
						
						
						
						
	.dc.b	206				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	208				
						
						
						
						
						
	.dc.b	176				
	.dc.b	208				
						
						
						
						
						
	.dc.b	174				
	.dc.b	96				
						
						
						
						
						
	.dc.b	174				
	.dc.b	96				
						
						
						
						
						
	.dc.b	174				
	.dc.b	96				
						
						
						
						
						
	.dc.b	174				
	.dc.b	96				
						
						
						
						
						
	.dc.b	182				
	.dc.b	224				
						
						
						
						
						
	.dc.b	185				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	144				
						
						
						
						
						
	.dc.b	172				
	.dc.b	144				
						
						
						
						
						
	.dc.b	165				
	.dc.b	224				
						
						
						
						
						
	.dc.b	165				
	.dc.b	224				
						
						
						
						
						
	.dc.b	171				
	.dc.b	160				
						
						
						
						
						
	.dc.b	171				
	.dc.b	160				
						
						
						
						
						
	.dc.b	174				
	.dc.b	80				
						
						
						
						
						
	.dc.b	174				
	.dc.b	80				
						
						
						
						
						
	.dc.b	186				
	.dc.b	176				
						
						
						
						
						
	.dc.b	183				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	112				
						
						
						
						
						
	.dc.b	173				
	.dc.b	112				
						
						
						
						
						
	.dc.b	174				
	.dc.b	64				
						
						
						
						
						
	.dc.b	174				
	.dc.b	64				
						
						
						
						
						
	.dc.b	168				
	.dc.b	192				
						
						
						
						
						
	.dc.b	168				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	128				
						
						
						
						
						
	.dc.b	172				
	.dc.b	128				
						
						
						
						
						
	.dc.b	180				
	.dc.b	224				
						
						
						
						
						
	.dc.b	178				
	.dc.b	224				
						
						
						
						
						
	.dc.b	163				
	.dc.b	224				
						
						
						
						
						
	.dc.b	163				
	.dc.b	224				
						
						
						
						
						
	.dc.b	166				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	96				
						
						
						
						
						
	.dc.b	174				
	.dc.b	48				
						
						
						
						
						
	.dc.b	169				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	144				
						
						
						
						
						
	.dc.b	170				
	.dc.b	160				
						
						
						
						
						
	.dc.b	174				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	224				
						
						
						
						
						
	.dc.b	174				
	.dc.b	16				
						
						
						
						
						
	.dc.b	165				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	80				
						
						
						
						
						
	.dc.b	167				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	112				
						
						
						
						
						
	.dc.b	164				
	.dc.b	208				
						
						
						
						
						
	.dc.b	168				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	128				
						
						
						
						
						
	.dc.b	173				
	.dc.b	64				
						
						
						
						
						
	.dc.b	169				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	144				
						
						
						
						
						
	.dc.b	166				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	96				
						
						
						
						
						
	.dc.b	163				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	48				
						
						
						
						
						
	.dc.b	162				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	208				
						
						
						
						
						
	.dc.b	167				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	112				
						
						
						
						
						
	.dc.b	173				
	.dc.b	16				
						
						
						
						
						
	.dc.b	165				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	80				
						
						
						
						
						
	.dc.b	168				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	128				
						
						
						
						
						
	.dc.b	169				
	.dc.b	144				
						
						
						
						
						
	.dc.b	164				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	64				
						
						
						
						
						
	.dc.b	166				
	.dc.b	176				
						
						
						
						
						
	.dc.b	166				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	96				
						
						
						
						
						
	.dc.b	171				
	.dc.b	96				
						
						
						
						
						
	.dc.b	189				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	192				
						
						
						
						
						
	.dc.b	163				
	.dc.b	192				
						
						
						
						
						
	.dc.b	163				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	48				
						
						
						
						
						
	.dc.b	167				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	112				
						
						
						
						
						
	.dc.b	162				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	32				
						
						
						
						
						
	.dc.b	165				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	80				
						
						
						
						
						
	.dc.b	161				
	.dc.b	192				
						
						
						
						
						
	.dc.b	168				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	128				
						
						
						
						
						
	.dc.b	172				
	.dc.b	16				
						
						
						
						
						
	.dc.b	164				
	.dc.b	176				
						
						
						
						
						
	.dc.b	188				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	176				
						
						
						
						
						
	.dc.b	163				
	.dc.b	176				
						
						
						
						
						
	.dc.b	163				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	160				
						
						
						
						
						
	.dc.b	161				
	.dc.b	160				
						
						
						
						
						
	.dc.b	161				
	.dc.b	160				
						
						
						
						
						
	.dc.b	155				
	.dc.b	64				
						
						
						
						
						
	.dc.b	155				
	.dc.b	64				
						
						
						
						
						
	.dc.b	166				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	96				
						
						
						
						
						
	.dc.b	167				
	.dc.b	144				
						
						
						
						
						
	.dc.b	167				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	112				
						
						
						
						
						
	.dc.b	169				
	.dc.b	112				
						
						
						
						
						
	.dc.b	186				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	0				
						
						
						
						
						
	.dc.b	169				
	.dc.b	0				
						
						
						
						
						
	.dc.b	155				
	.dc.b	48				
						
						
						
						
						
	.dc.b	152				
	.dc.b	128				
						
						
						
						
						
	.dc.b	162				
	.dc.b	176				
						
						
						
						
						
	.dc.b	165				
	.dc.b	160				
						
						
						
						
						
	.dc.b	155				
	.dc.b	32				
						
						
						
						
						
	.dc.b	155				
	.dc.b	32				
						
						
						
						
						
	.dc.b	170				
	.dc.b	80				
						
						
						
						
						
	.dc.b	161				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	16				
						
						
						
						
						
	.dc.b	166				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	96				
						
						
						
						
						
	.dc.b	154				
	.dc.b	64				
						
						
						
						
						
	.dc.b	164				
	.dc.b	160				
						
						
						
						
						
	.dc.b	167				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	112				
						
						
						
						
						
	.dc.b	152				
	.dc.b	112				
						
						
						
						
						
	.dc.b	147				
	.dc.b	160				
						
						
						
						
						
	.dc.b	154				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	80				
						
						
						
						
						
	.dc.b	146				
	.dc.b	160				
						
						
						
						
						
	.dc.b	154				
	.dc.b	32				
						
						
						
						
						
	.dc.b	154				
	.dc.b	16				
						
						
						
						
						
	.dc.b	150				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	96				
						
						
						
						
						
	.dc.b	151				
	.dc.b	112				
						
						
						
						
						
	.dc.b	148				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	64				
						
						
						
						
						
	.dc.b	147				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	80				
						
						
						
						
						
	.dc.b	146				
	.dc.b	144				
						
						
						
						
						
	.dc.b	150				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	96				
						
						
						
						
						
	.dc.b	153				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	16				
						
						
						
						
						
	.dc.b	148				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	64				
						
						
						
						
						
	.dc.b	149				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	80				
						
						
						
						
						
	.dc.b	147				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	48				
						
						
						
						
						
	.dc.b	150				
	.dc.b	96				
						
						
						
						
						
	.dc.b	146				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	128				
						
						
						
						
						
	.dc.b	148				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	64				
						
						
						
						
						
	.dc.b	152				
	.dc.b	16				
						
						
						
						
						
	.dc.b	152				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	128				
						
						
						
						
						
	.dc.b	168				
	.dc.b	0				
						
						
						
						
						
	.dc.b	149				
	.dc.b	96				
						
						
						
						
						
	.dc.b	150				
	.dc.b	80				
						
						
						
						
						
	.dc.b	145				
	.dc.b	112				
						
						
						
						
						
	.dc.b	145				
	.dc.b	112				
						
						
						
						
						
	.dc.b	160				
	.dc.b	112				
						
						
						
						
						
	.dc.b	167				
	.dc.b	0				
						
						
						
						
						
	.dc.b	147				
	.dc.b	112				
						
						
						
						
						
	.dc.b	146				
	.dc.b	112				
						
						
						
						
						
	.dc.b	144				
	.dc.b	96				
						
						
						
						
						
	.dc.b	150				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	0				
	.align	2				
						
						
_hufftab16:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
	.dc.b	64				
	.dc.b	48				
						
						
						
						
	.dc.b	32				
	.dc.b	64				
						
						
						
						
						
	.dc.b	193				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
	.dc.b	48				
	.dc.b	68				
						
						
						
						
	.dc.b	48				
	.dc.b	76				
						
						
						
						
	.dc.b	32				
	.dc.b	84				
						
						
						
						
						
	.dc.b	207				
	.dc.b	240				
						
						
						
						
	.dc.b	32				
	.dc.b	88				
						
						
						
						
	.dc.b	16				
	.dc.b	92				
						
						
						
						
	.dc.b	64				
	.dc.b	94				
						
						
						
						
						
	.dc.b	207				
	.dc.b	32				
						
						
						
						
	.dc.b	16				
	.dc.b	110				
						
						
						
						
						
	.dc.b	193				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	112				
						
						
						
						
	.dc.b	64				
	.dc.b	128				
						
						
						
						
	.dc.b	64				
	.dc.b	144				
						
						
						
						
	.dc.b	64				
	.dc.b	160				
						
						
						
						
	.dc.b	64				
	.dc.b	176				
						
						
						
						
	.dc.b	64				
	.dc.b	192				
						
						
						
						
	.dc.b	48				
	.dc.b	208				
						
						
						
						
	.dc.b	48				
	.dc.b	216				
						
						
						
						
	.dc.b	48				
	.dc.b	224				
						
						
						
						
	.dc.b	48				
	.dc.b	232				
						
						
						
						
	.dc.b	48				
	.dc.b	240				
						
						
						
						
	.dc.b	48				
	.dc.b	248				
						
						
						
						
	.dc.b	49				
	.dc.b	0				
						
						
						
						
	.dc.b	33				
	.dc.b	8				
						
						
						
						
	.dc.b	33				
	.dc.b	12				
						
						
						
						
	.dc.b	17				
	.dc.b	16				
						
						
						
						
	.dc.b	33				
	.dc.b	18				
						
						
						
						
	.dc.b	33				
	.dc.b	22				
						
						
						
						
	.dc.b	17				
	.dc.b	26				
						
						
						
						
						
	.dc.b	197				
	.dc.b	16				
						
						
						
						
	.dc.b	17				
	.dc.b	28				
						
						
						
						
	.dc.b	17				
	.dc.b	30				
						
						
						
						
	.dc.b	17				
	.dc.b	32				
						
						
						
						
	.dc.b	17				
	.dc.b	34				
						
						
						
						
						
	.dc.b	193				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	16				
						
						
						
						
	.dc.b	17				
	.dc.b	36				
						
						
						
						
						
	.dc.b	194				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	48				
						
						
						
						
						
	.dc.b	177				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	190				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	224				
						
						
						
						
						
	.dc.b	189				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	208				
						
						
						
						
						
	.dc.b	188				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	192				
						
						
						
						
						
	.dc.b	187				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	176				
						
						
						
						
						
	.dc.b	170				
	.dc.b	240				
						
						
						
						
						
	.dc.b	170				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	160				
						
						
						
						
						
	.dc.b	185				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	144				
						
						
						
						
						
	.dc.b	191				
	.dc.b	128				
						
						
						
						
						
	.dc.b	168				
	.dc.b	240				
						
						
						
						
						
	.dc.b	168				
	.dc.b	240				
						
						
						
						
						
	.dc.b	167				
	.dc.b	240				
						
						
						
						
						
	.dc.b	175				
	.dc.b	112				
						
						
						
						
						
	.dc.b	166				
	.dc.b	240				
						
						
						
						
						
	.dc.b	175				
	.dc.b	96				
						
						
						
						
						
	.dc.b	165				
	.dc.b	240				
						
						
						
						
						
	.dc.b	175				
	.dc.b	80				
						
						
						
						
						
	.dc.b	148				
	.dc.b	240				
						
						
						
						
						
	.dc.b	148				
	.dc.b	240				
						
						
						
						
						
	.dc.b	159				
	.dc.b	64				
						
						
						
						
						
	.dc.b	159				
	.dc.b	48				
						
						
						
						
						
	.dc.b	159				
	.dc.b	0				
						
						
						
						
						
	.dc.b	159				
	.dc.b	0				
						
						
						
						
						
	.dc.b	159				
	.dc.b	0				
						
						
						
						
						
	.dc.b	159				
	.dc.b	0				
						
						
						
						
						
	.dc.b	159				
	.dc.b	0				
						
						
						
						
						
	.dc.b	159				
	.dc.b	0				
						
						
						
						
						
	.dc.b	159				
	.dc.b	0				
						
						
						
						
						
	.dc.b	159				
	.dc.b	0				
						
						
						
						
						
	.dc.b	163				
	.dc.b	240				
						
						
						
						
						
	.dc.b	163				
	.dc.b	240				
						
						
						
						
						
	.dc.b	163				
	.dc.b	240				
						
						
						
						
						
	.dc.b	163				
	.dc.b	240				
						
						
						
						
	.dc.b	65				
	.dc.b	38				
						
						
						
						
	.dc.b	49				
	.dc.b	54				
						
						
						
						
	.dc.b	49				
	.dc.b	62				
						
						
						
						
	.dc.b	49				
	.dc.b	70				
						
						
						
						
						
	.dc.b	146				
	.dc.b	240				
						
						
						
						
						
	.dc.b	144				
	.dc.b	240				
						
						
						
						
	.dc.b	33				
	.dc.b	78				
						
						
						
						
	.dc.b	33				
	.dc.b	82				
						
						
						
						
	.dc.b	33				
	.dc.b	86				
						
						
						
						
	.dc.b	17				
	.dc.b	90				
						
						
						
						
	.dc.b	33				
	.dc.b	92				
						
						
						
						
	.dc.b	33				
	.dc.b	96				
						
						
						
						
	.dc.b	17				
	.dc.b	100				
						
						
						
						
	.dc.b	33				
	.dc.b	102				
						
						
						
						
	.dc.b	33				
	.dc.b	106				
						
						
						
						
	.dc.b	33				
	.dc.b	110				
						
						
						
						
	.dc.b	33				
	.dc.b	114				
						
						
						
						
						
	.dc.b	206				
	.dc.b	48				
						
						
						
						
	.dc.b	17				
	.dc.b	118				
						
						
						
						
	.dc.b	17				
	.dc.b	120				
						
						
						
						
	.dc.b	17				
	.dc.b	122				
						
						
						
						
	.dc.b	17				
	.dc.b	124				
						
						
						
						
	.dc.b	17				
	.dc.b	126				
						
						
						
						
	.dc.b	17				
	.dc.b	128				
						
						
						
						
	.dc.b	17				
	.dc.b	130				
						
						
						
						
						
	.dc.b	192				
	.dc.b	208				
						
						
						
						
	.dc.b	17				
	.dc.b	132				
						
						
						
						
	.dc.b	17				
	.dc.b	134				
						
						
						
						
	.dc.b	17				
	.dc.b	136				
						
						
						
						
						
	.dc.b	195				
	.dc.b	192				
						
						
						
						
	.dc.b	17				
	.dc.b	138				
						
						
						
						
						
	.dc.b	193				
	.dc.b	192				
						
						
						
						
						
	.dc.b	204				
	.dc.b	0				
						
						
						
						
	.dc.b	17				
	.dc.b	140				
						
						
						
						
						
	.dc.b	190				
	.dc.b	32				
						
						
						
						
						
	.dc.b	190				
	.dc.b	32				
						
						
						
						
						
	.dc.b	194				
	.dc.b	224				
						
						
						
						
						
	.dc.b	193				
	.dc.b	224				
						
						
						
						
						
	.dc.b	205				
	.dc.b	48				
						
						
						
						
						
	.dc.b	194				
	.dc.b	208				
						
						
						
						
						
	.dc.b	205				
	.dc.b	32				
						
						
						
						
						
	.dc.b	205				
	.dc.b	16				
						
						
						
						
						
	.dc.b	195				
	.dc.b	176				
						
						
						
						
	.dc.b	17				
	.dc.b	142				
						
						
						
						
						
	.dc.b	177				
	.dc.b	208				
						
						
						
						
						
	.dc.b	177				
	.dc.b	208				
						
						
						
						
						
	.dc.b	204				
	.dc.b	64				
						
						
						
						
						
	.dc.b	198				
	.dc.b	176				
						
						
						
						
						
	.dc.b	204				
	.dc.b	48				
						
						
						
						
						
	.dc.b	202				
	.dc.b	112				
						
						
						
						
						
	.dc.b	178				
	.dc.b	192				
						
						
						
						
						
	.dc.b	178				
	.dc.b	192				
						
						
						
						
						
	.dc.b	204				
	.dc.b	32				
						
						
						
						
						
	.dc.b	203				
	.dc.b	80				
						
						
						
						
						
	.dc.b	204				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	192				
						
						
						
						
						
	.dc.b	196				
	.dc.b	176				
						
						
						
						
						
	.dc.b	203				
	.dc.b	64				
						
						
						
						
						
	.dc.b	198				
	.dc.b	160				
						
						
						
						
						
	.dc.b	202				
	.dc.b	96				
						
						
						
						
						
	.dc.b	187				
	.dc.b	48				
						
						
						
						
						
	.dc.b	187				
	.dc.b	48				
						
						
						
						
						
	.dc.b	197				
	.dc.b	160				
						
						
						
						
						
	.dc.b	202				
	.dc.b	80				
						
						
						
						
						
	.dc.b	178				
	.dc.b	176				
						
						
						
						
						
	.dc.b	178				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	32				
						
						
						
						
						
	.dc.b	187				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	176				
						
						
						
						
						
	.dc.b	177				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	16				
						
						
						
						
						
	.dc.b	187				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	176				
						
						
						
						
						
	.dc.b	203				
	.dc.b	0				
						
						
						
						
						
	.dc.b	198				
	.dc.b	144				
						
						
						
						
						
	.dc.b	201				
	.dc.b	96				
						
						
						
						
						
	.dc.b	196				
	.dc.b	160				
						
						
						
						
						
	.dc.b	202				
	.dc.b	64				
						
						
						
						
						
	.dc.b	199				
	.dc.b	128				
						
						
						
						
						
	.dc.b	200				
	.dc.b	112				
						
						
						
						
						
	.dc.b	186				
	.dc.b	48				
						
						
						
						
						
	.dc.b	186				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	160				
						
						
						
						
						
	.dc.b	197				
	.dc.b	144				
						
						
						
						
						
	.dc.b	178				
	.dc.b	160				
						
						
						
						
						
	.dc.b	178				
	.dc.b	160				
						
						
						
						
						
	.dc.b	201				
	.dc.b	80				
						
						
						
						
						
	.dc.b	198				
	.dc.b	128				
						
						
						
						
						
	.dc.b	186				
	.dc.b	16				
						
						
						
						
						
	.dc.b	186				
	.dc.b	16				
						
						
						
						
						
	.dc.b	200				
	.dc.b	96				
						
						
						
						
						
	.dc.b	199				
	.dc.b	112				
						
						
						
						
						
	.dc.b	185				
	.dc.b	64				
						
						
						
						
						
	.dc.b	185				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	144				
						
						
						
						
						
	.dc.b	197				
	.dc.b	112				
						
						
						
						
						
	.dc.b	182				
	.dc.b	112				
						
						
						
						
						
	.dc.b	182				
	.dc.b	112				
						
						
						
						
						
	.dc.b	170				
	.dc.b	32				
						
						
						
						
						
	.dc.b	170				
	.dc.b	32				
						
						
						
						
						
	.dc.b	170				
	.dc.b	32				
						
						
						
						
						
	.dc.b	170				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	160				
						
						
						
						
						
	.dc.b	161				
	.dc.b	160				
						
						
						
						
						
	.dc.b	176				
	.dc.b	160				
						
						
						
						
						
	.dc.b	186				
	.dc.b	0				
						
						
						
						
						
	.dc.b	179				
	.dc.b	144				
						
						
						
						
						
	.dc.b	185				
	.dc.b	48				
						
						
						
						
						
	.dc.b	181				
	.dc.b	128				
						
						
						
						
						
	.dc.b	184				
	.dc.b	80				
						
						
						
						
						
	.dc.b	162				
	.dc.b	144				
						
						
						
						
						
	.dc.b	162				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	32				
						
						
						
						
						
	.dc.b	169				
	.dc.b	32				
						
						
						
						
						
	.dc.b	183				
	.dc.b	96				
						
						
						
						
						
	.dc.b	176				
	.dc.b	144				
						
						
						
						
						
	.dc.b	161				
	.dc.b	144				
						
						
						
						
						
	.dc.b	161				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	16				
						
						
						
						
						
	.dc.b	169				
	.dc.b	16				
						
						
						
						
						
	.dc.b	185				
	.dc.b	0				
						
						
						
						
						
	.dc.b	180				
	.dc.b	128				
						
						
						
						
						
	.dc.b	184				
	.dc.b	64				
						
						
						
						
						
	.dc.b	183				
	.dc.b	80				
						
						
						
						
						
	.dc.b	179				
	.dc.b	128				
						
						
						
						
						
	.dc.b	184				
	.dc.b	48				
						
						
						
						
						
	.dc.b	182				
	.dc.b	96				
						
						
						
						
						
	.dc.b	178				
	.dc.b	128				
						
						
						
						
						
	.dc.b	168				
	.dc.b	32				
						
						
						
						
						
	.dc.b	168				
	.dc.b	32				
						
						
						
						
						
	.dc.b	180				
	.dc.b	112				
						
						
						
						
						
	.dc.b	183				
	.dc.b	64				
						
						
						
						
						
	.dc.b	161				
	.dc.b	128				
						
						
						
						
						
	.dc.b	161				
	.dc.b	128				
						
						
						
						
						
	.dc.b	168				
	.dc.b	16				
						
						
						
						
						
	.dc.b	168				
	.dc.b	16				
						
						
						
						
						
	.dc.b	168				
	.dc.b	0				
						
						
						
						
						
	.dc.b	168				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	128				
						
						
						
						
						
	.dc.b	181				
	.dc.b	96				
						
						
						
						
						
	.dc.b	163				
	.dc.b	112				
						
						
						
						
						
	.dc.b	163				
	.dc.b	112				
						
						
						
						
						
	.dc.b	167				
	.dc.b	48				
						
						
						
						
						
	.dc.b	167				
	.dc.b	48				
						
						
						
						
						
	.dc.b	182				
	.dc.b	80				
						
						
						
						
						
	.dc.b	180				
	.dc.b	96				
						
						
						
						
						
	.dc.b	162				
	.dc.b	112				
						
						
						
						
						
	.dc.b	162				
	.dc.b	112				
						
						
						
						
						
	.dc.b	167				
	.dc.b	32				
						
						
						
						
						
	.dc.b	167				
	.dc.b	32				
						
						
						
						
						
	.dc.b	182				
	.dc.b	64				
						
						
						
						
						
	.dc.b	181				
	.dc.b	80				
						
						
						
						
						
	.dc.b	160				
	.dc.b	112				
						
						
						
						
						
	.dc.b	160				
	.dc.b	112				
						
						
						
						
						
	.dc.b	145				
	.dc.b	112				
						
						
						
						
						
	.dc.b	145				
	.dc.b	112				
						
						
						
						
						
	.dc.b	145				
	.dc.b	112				
						
						
						
						
						
	.dc.b	145				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	16				
						
						
						
						
						
	.dc.b	151				
	.dc.b	16				
						
						
						
						
						
	.dc.b	167				
	.dc.b	0				
						
						
						
						
						
	.dc.b	163				
	.dc.b	96				
						
						
						
						
						
	.dc.b	166				
	.dc.b	48				
						
						
						
						
						
	.dc.b	164				
	.dc.b	80				
						
						
						
						
						
	.dc.b	165				
	.dc.b	64				
						
						
						
						
						
	.dc.b	162				
	.dc.b	96				
						
						
						
						
						
	.dc.b	150				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	96				
						
						
						
						
						
	.dc.b	150				
	.dc.b	16				
						
						
						
						
						
	.dc.b	150				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	96				
						
						
						
						
						
	.dc.b	166				
	.dc.b	0				
						
						
						
						
						
	.dc.b	149				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	80				
						
						
						
						
						
	.dc.b	164				
	.dc.b	64				
						
						
						
						
						
	.dc.b	146				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	80				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
						
						
						
						
						
	.dc.b	147				
	.dc.b	64				
						
						
						
						
						
	.dc.b	148				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	0				
						
						
						
						
						
	.dc.b	146				
	.dc.b	64				
						
						
						
						
						
	.dc.b	148				
	.dc.b	32				
						
						
						
						
						
	.dc.b	147				
	.dc.b	48				
						
						
						
						
						
	.dc.b	144				
	.dc.b	64				
						
						
						
						
						
	.dc.b	148				
	.dc.b	0				
						
						
						
						
						
	.dc.b	204				
	.dc.b	224				
						
						
						
						
	.dc.b	17				
	.dc.b	144				
						
						
						
						
						
	.dc.b	189				
	.dc.b	224				
						
						
						
						
						
	.dc.b	189				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	144				
						
						
						
						
						
	.dc.b	190				
	.dc.b	144				
						
						
						
						
						
	.dc.b	206				
	.dc.b	160				
						
						
						
						
						
	.dc.b	205				
	.dc.b	144				
						
						
						
						
						
	.dc.b	174				
	.dc.b	224				
						
						
						
						
						
	.dc.b	174				
	.dc.b	224				
						
						
						
						
						
	.dc.b	174				
	.dc.b	224				
						
						
						
						
						
	.dc.b	174				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	208				
						
						
						
						
						
	.dc.b	190				
	.dc.b	208				
						
						
						
						
						
	.dc.b	190				
	.dc.b	176				
						
						
						
						
						
	.dc.b	190				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	224				
						
						
						
						
						
	.dc.b	171				
	.dc.b	224				
						
						
						
						
						
	.dc.b	172				
	.dc.b	208				
						
						
						
						
						
	.dc.b	172				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	192				
						
						
						
						
						
	.dc.b	189				
	.dc.b	176				
						
						
						
						
						
	.dc.b	170				
	.dc.b	224				
						
						
						
						
						
	.dc.b	170				
	.dc.b	224				
						
						
						
						
						
	.dc.b	172				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	192				
						
						
						
						
						
	.dc.b	186				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	160				
						
						
						
						
						
	.dc.b	183				
	.dc.b	224				
						
						
						
						
						
	.dc.b	186				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	160				
						
						
						
						
						
	.dc.b	172				
	.dc.b	160				
						
						
						
						
						
	.dc.b	188				
	.dc.b	144				
						
						
						
						
						
	.dc.b	183				
	.dc.b	208				
						
						
						
						
						
	.dc.b	165				
	.dc.b	224				
						
						
						
						
						
	.dc.b	165				
	.dc.b	224				
						
						
						
						
						
	.dc.b	155				
	.dc.b	208				
						
						
						
						
						
	.dc.b	155				
	.dc.b	208				
						
						
						
						
						
	.dc.b	155				
	.dc.b	208				
						
						
						
						
						
	.dc.b	155				
	.dc.b	208				
						
						
						
						
						
	.dc.b	153				
	.dc.b	224				
						
						
						
						
						
	.dc.b	153				
	.dc.b	224				
						
						
						
						
						
	.dc.b	171				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	176				
						
						
						
						
						
	.dc.b	168				
	.dc.b	224				
						
						
						
						
						
	.dc.b	174				
	.dc.b	128				
						
						
						
						
						
	.dc.b	169				
	.dc.b	208				
						
						
						
						
						
	.dc.b	174				
	.dc.b	112				
						
						
						
						
						
	.dc.b	171				
	.dc.b	176				
						
						
						
						
						
	.dc.b	168				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	128				
						
						
						
						
						
	.dc.b	166				
	.dc.b	224				
						
						
						
						
						
	.dc.b	158				
	.dc.b	96				
						
						
						
						
						
	.dc.b	153				
	.dc.b	192				
						
						
						
						
						
	.dc.b	170				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	160				
						
						
						
						
						
	.dc.b	174				
	.dc.b	80				
						
						
						
						
						
	.dc.b	173				
	.dc.b	112				
						
						
						
						
						
	.dc.b	148				
	.dc.b	224				
						
						
						
						
						
	.dc.b	148				
	.dc.b	224				
						
						
						
						
						
	.dc.b	174				
	.dc.b	64				
						
						
						
						
						
	.dc.b	168				
	.dc.b	192				
						
						
						
						
						
	.dc.b	156				
	.dc.b	128				
						
						
						
						
						
	.dc.b	147				
	.dc.b	224				
						
						
						
						
						
	.dc.b	150				
	.dc.b	208				
						
						
						
						
						
	.dc.b	150				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	96				
						
						
						
						
						
	.dc.b	169				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	144				
						
						
						
						
						
	.dc.b	170				
	.dc.b	160				
						
						
						
						
						
	.dc.b	158				
	.dc.b	16				
						
						
						
						
						
	.dc.b	158				
	.dc.b	16				
						
						
						
						
						
	.dc.b	157				
	.dc.b	64				
						
						
						
						
						
	.dc.b	157				
	.dc.b	64				
						
						
						
						
						
	.dc.b	171				
	.dc.b	128				
						
						
						
						
						
	.dc.b	170				
	.dc.b	144				
						
						
						
						
						
	.dc.b	151				
	.dc.b	176				
						
						
						
						
						
	.dc.b	151				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	112				
						
						
						
						
						
	.dc.b	173				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	224				
						
						
						
						
						
	.dc.b	158				
	.dc.b	0				
						
						
						
						
						
	.dc.b	149				
	.dc.b	208				
						
						
						
						
						
	.dc.b	157				
	.dc.b	80				
						
						
						
						
						
	.dc.b	151				
	.dc.b	192				
						
						
						
						
						
	.dc.b	156				
	.dc.b	112				
						
						
						
						
						
	.dc.b	148				
	.dc.b	208				
						
						
						
						
						
	.dc.b	152				
	.dc.b	176				
						
						
						
						
						
	.dc.b	153				
	.dc.b	160				
						
						
						
						
						
	.dc.b	150				
	.dc.b	192				
						
						
						
						
						
	.dc.b	156				
	.dc.b	96				
						
						
						
						
						
	.dc.b	147				
	.dc.b	208				
						
						
						
						
						
	.dc.b	149				
	.dc.b	192				
						
						
						
						
						
	.dc.b	156				
	.dc.b	80				
						
						
						
						
						
	.dc.b	152				
	.dc.b	160				
						
						
						
						
						
	.dc.b	154				
	.dc.b	128				
						
						
						
						
						
	.dc.b	153				
	.dc.b	144				
						
						
						
						
						
	.dc.b	148				
	.dc.b	192				
						
						
						
						
						
	.dc.b	155				
	.dc.b	96				
						
						
						
						
						
	.dc.b	151				
	.dc.b	160				
						
						
						
						
						
	.dc.b	149				
	.dc.b	176				
						
						
						
						
						
	.dc.b	152				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	128				
						
						
						
						
						
	.dc.b	151				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	112				
						
						
						
						
						
	.dc.b	152				
	.dc.b	128				
						
						
						
						
						
	.dc.b	158				
	.dc.b	192				
						
						
						
						
						
	.dc.b	157				
	.dc.b	208				
	.align	2				
						
						
_hufftab15:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
	.dc.b	64				
	.dc.b	48				
						
						
						
						
	.dc.b	64				
	.dc.b	64				
						
						
						
						
	.dc.b	64				
	.dc.b	80				
						
						
						
						
	.dc.b	48				
	.dc.b	96				
						
						
						
						
	.dc.b	48				
	.dc.b	104				
						
						
						
						
	.dc.b	32				
	.dc.b	112				
						
						
						
						
	.dc.b	16				
	.dc.b	116				
						
						
						
						
	.dc.b	16				
	.dc.b	118				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	16				
						
						
						
						
						
	.dc.b	193				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	0				
						
						
						
						
	.dc.b	64				
	.dc.b	120				
						
						
						
						
	.dc.b	64				
	.dc.b	136				
						
						
						
						
	.dc.b	64				
	.dc.b	152				
						
						
						
						
	.dc.b	64				
	.dc.b	168				
						
						
						
						
	.dc.b	64				
	.dc.b	184				
						
						
						
						
	.dc.b	48				
	.dc.b	200				
						
						
						
						
	.dc.b	48				
	.dc.b	208				
						
						
						
						
	.dc.b	64				
	.dc.b	216				
						
						
						
						
	.dc.b	48				
	.dc.b	232				
						
						
						
						
	.dc.b	48				
	.dc.b	240				
						
						
						
						
	.dc.b	48				
	.dc.b	248				
						
						
						
						
	.dc.b	49				
	.dc.b	0				
						
						
						
						
	.dc.b	33				
	.dc.b	8				
						
						
						
						
	.dc.b	49				
	.dc.b	12				
						
						
						
						
	.dc.b	49				
	.dc.b	20				
						
						
						
						
	.dc.b	33				
	.dc.b	28				
						
						
						
						
	.dc.b	33				
	.dc.b	32				
						
						
						
						
	.dc.b	33				
	.dc.b	36				
						
						
						
						
	.dc.b	33				
	.dc.b	40				
						
						
						
						
	.dc.b	33				
	.dc.b	44				
						
						
						
						
	.dc.b	33				
	.dc.b	48				
						
						
						
						
	.dc.b	33				
	.dc.b	52				
						
						
						
						
	.dc.b	33				
	.dc.b	56				
						
						
						
						
	.dc.b	33				
	.dc.b	60				
						
						
						
						
	.dc.b	17				
	.dc.b	64				
						
						
						
						
	.dc.b	17				
	.dc.b	66				
						
						
						
						
	.dc.b	17				
	.dc.b	68				
						
						
						
						
	.dc.b	33				
	.dc.b	70				
						
						
						
						
	.dc.b	17				
	.dc.b	74				
						
						
						
						
	.dc.b	17				
	.dc.b	76				
						
						
						
						
	.dc.b	33				
	.dc.b	78				
						
						
						
						
	.dc.b	17				
	.dc.b	82				
						
						
						
						
	.dc.b	17				
	.dc.b	84				
						
						
						
						
	.dc.b	17				
	.dc.b	86				
						
						
						
						
						
	.dc.b	201				
	.dc.b	16				
						
						
						
						
	.dc.b	17				
	.dc.b	88				
						
						
						
						
	.dc.b	17				
	.dc.b	90				
						
						
						
						
	.dc.b	17				
	.dc.b	92				
						
						
						
						
	.dc.b	17				
	.dc.b	94				
						
						
						
						
	.dc.b	17				
	.dc.b	96				
						
						
						
						
						
	.dc.b	194				
	.dc.b	128				
						
						
						
						
						
	.dc.b	200				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	128				
						
						
						
						
						
	.dc.b	200				
	.dc.b	16				
						
						
						
						
	.dc.b	17				
	.dc.b	98				
						
						
						
						
	.dc.b	17				
	.dc.b	100				
						
						
						
						
	.dc.b	17				
	.dc.b	102				
						
						
						
						
	.dc.b	17				
	.dc.b	104				
						
						
						
						
						
	.dc.b	194				
	.dc.b	112				
						
						
						
						
						
	.dc.b	199				
	.dc.b	32				
						
						
						
						
						
	.dc.b	198				
	.dc.b	64				
						
						
						
						
						
	.dc.b	193				
	.dc.b	112				
						
						
						
						
						
	.dc.b	197				
	.dc.b	80				
						
						
						
						
						
	.dc.b	199				
	.dc.b	16				
						
						
						
						
	.dc.b	17				
	.dc.b	106				
						
						
						
						
						
	.dc.b	195				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	48				
						
						
						
						
						
	.dc.b	196				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	64				
						
						
						
						
						
	.dc.b	194				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	96				
						
						
						
						
	.dc.b	17				
	.dc.b	108				
						
						
						
						
						
	.dc.b	195				
	.dc.b	80				
						
						
						
						
						
	.dc.b	182				
	.dc.b	16				
						
						
						
						
						
	.dc.b	182				
	.dc.b	16				
						
						
						
						
						
	.dc.b	197				
	.dc.b	48				
						
						
						
						
						
	.dc.b	196				
	.dc.b	64				
						
						
						
						
						
	.dc.b	178				
	.dc.b	80				
						
						
						
						
						
	.dc.b	178				
	.dc.b	80				
						
						
						
						
						
	.dc.b	181				
	.dc.b	32				
						
						
						
						
						
	.dc.b	181				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	80				
						
						
						
						
						
	.dc.b	177				
	.dc.b	80				
						
						
						
						
						
	.dc.b	181				
	.dc.b	16				
						
						
						
						
						
	.dc.b	181				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	0				
						
						
						
						
						
	.dc.b	179				
	.dc.b	64				
						
						
						
						
						
	.dc.b	179				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	48				
						
						
						
						
						
	.dc.b	178				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	32				
						
						
						
						
						
	.dc.b	179				
	.dc.b	48				
						
						
						
						
						
	.dc.b	164				
	.dc.b	16				
						
						
						
						
						
	.dc.b	164				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	64				
						
						
						
						
						
	.dc.b	176				
	.dc.b	64				
						
						
						
						
						
	.dc.b	162				
	.dc.b	48				
						
						
						
						
						
	.dc.b	162				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	32				
						
						
						
						
						
	.dc.b	163				
	.dc.b	32				
						
						
						
						
						
	.dc.b	180				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	48				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	163				
	.dc.b	0				
						
						
						
						
						
	.dc.b	146				
	.dc.b	32				
						
						
						
						
						
	.dc.b	146				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	32				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	144				
	.dc.b	32				
						
						
						
						
						
	.dc.b	146				
	.dc.b	0				
						
						
						
						
	.dc.b	17				
	.dc.b	110				
						
						
						
						
	.dc.b	17				
	.dc.b	112				
						
						
						
						
						
	.dc.b	206				
	.dc.b	224				
						
						
						
						
	.dc.b	17				
	.dc.b	114				
						
						
						
						
	.dc.b	17				
	.dc.b	116				
						
						
						
						
	.dc.b	17				
	.dc.b	118				
						
						
						
						
						
	.dc.b	207				
	.dc.b	176				
						
						
						
						
	.dc.b	17				
	.dc.b	120				
						
						
						
						
						
	.dc.b	205				
	.dc.b	208				
						
						
						
						
						
	.dc.b	202				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	160				
						
						
						
						
						
	.dc.b	203				
	.dc.b	224				
						
						
						
						
						
	.dc.b	206				
	.dc.b	176				
						
						
						
						
						
	.dc.b	204				
	.dc.b	208				
						
						
						
						
						
	.dc.b	205				
	.dc.b	192				
						
						
						
						
						
	.dc.b	201				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	144				
						
						
						
						
						
	.dc.b	206				
	.dc.b	160				
						
						
						
						
						
	.dc.b	203				
	.dc.b	208				
						
						
						
						
						
	.dc.b	205				
	.dc.b	176				
						
						
						
						
						
	.dc.b	200				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	128				
						
						
						
						
						
	.dc.b	204				
	.dc.b	192				
						
						
						
						
						
	.dc.b	201				
	.dc.b	224				
						
						
						
						
						
	.dc.b	206				
	.dc.b	144				
						
						
						
						
						
	.dc.b	199				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	112				
						
						
						
						
						
	.dc.b	202				
	.dc.b	208				
						
						
						
						
						
	.dc.b	205				
	.dc.b	160				
						
						
						
						
						
	.dc.b	203				
	.dc.b	192				
						
						
						
						
						
	.dc.b	198				
	.dc.b	240				
						
						
						
						
	.dc.b	17				
	.dc.b	122				
						
						
						
						
						
	.dc.b	188				
	.dc.b	176				
						
						
						
						
						
	.dc.b	188				
	.dc.b	176				
						
						
						
						
						
	.dc.b	191				
	.dc.b	96				
						
						
						
						
						
	.dc.b	191				
	.dc.b	96				
						
						
						
						
						
	.dc.b	200				
	.dc.b	224				
						
						
						
						
						
	.dc.b	206				
	.dc.b	128				
						
						
						
						
						
	.dc.b	197				
	.dc.b	240				
						
						
						
						
						
	.dc.b	201				
	.dc.b	208				
						
						
						
						
						
	.dc.b	191				
	.dc.b	80				
						
						
						
						
						
	.dc.b	191				
	.dc.b	80				
						
						
						
						
						
	.dc.b	183				
	.dc.b	224				
						
						
						
						
						
	.dc.b	183				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	112				
						
						
						
						
						
	.dc.b	190				
	.dc.b	112				
						
						
						
						
						
	.dc.b	186				
	.dc.b	192				
						
						
						
						
						
	.dc.b	186				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	160				
						
						
						
						
						
	.dc.b	188				
	.dc.b	160				
						
						
						
						
						
	.dc.b	187				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	176				
						
						
						
						
						
	.dc.b	205				
	.dc.b	144				
						
						
						
						
						
	.dc.b	200				
	.dc.b	208				
						
						
						
						
						
	.dc.b	180				
	.dc.b	240				
						
						
						
						
						
	.dc.b	180				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	64				
						
						
						
						
						
	.dc.b	191				
	.dc.b	64				
						
						
						
						
						
	.dc.b	179				
	.dc.b	240				
						
						
						
						
						
	.dc.b	179				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	48				
						
						
						
						
						
	.dc.b	191				
	.dc.b	48				
						
						
						
						
						
	.dc.b	189				
	.dc.b	128				
						
						
						
						
						
	.dc.b	189				
	.dc.b	128				
						
						
						
						
						
	.dc.b	190				
	.dc.b	96				
						
						
						
						
						
	.dc.b	190				
	.dc.b	96				
						
						
						
						
						
	.dc.b	178				
	.dc.b	240				
						
						
						
						
						
	.dc.b	178				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	32				
						
						
						
						
						
	.dc.b	191				
	.dc.b	32				
						
						
						
						
						
	.dc.b	198				
	.dc.b	224				
						
						
						
						
						
	.dc.b	207				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	240				
						
						
						
						
						
	.dc.b	177				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	16				
						
						
						
						
						
	.dc.b	191				
	.dc.b	16				
						
						
						
						
						
	.dc.b	185				
	.dc.b	192				
						
						
						
						
						
	.dc.b	185				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	144				
						
						
						
						
						
	.dc.b	188				
	.dc.b	144				
						
						
						
						
						
	.dc.b	181				
	.dc.b	224				
						
						
						
						
						
	.dc.b	186				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	160				
						
						
						
						
						
	.dc.b	190				
	.dc.b	80				
						
						
						
						
						
	.dc.b	183				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	112				
						
						
						
						
						
	.dc.b	180				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	64				
						
						
						
						
						
	.dc.b	184				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	128				
						
						
						
						
						
	.dc.b	179				
	.dc.b	224				
						
						
						
						
						
	.dc.b	182				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	96				
						
						
						
						
						
	.dc.b	190				
	.dc.b	48				
						
						
						
						
						
	.dc.b	185				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	144				
						
						
						
						
						
	.dc.b	178				
	.dc.b	224				
						
						
						
						
						
	.dc.b	178				
	.dc.b	224				
						
						
						
						
						
	.dc.b	186				
	.dc.b	160				
						
						
						
						
						
	.dc.b	186				
	.dc.b	160				
						
						
						
						
						
	.dc.b	190				
	.dc.b	32				
						
						
						
						
						
	.dc.b	190				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	224				
						
						
						
						
						
	.dc.b	177				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	16				
						
						
						
						
						
	.dc.b	190				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	224				
						
						
						
						
						
	.dc.b	206				
	.dc.b	0				
						
						
						
						
						
	.dc.b	181				
	.dc.b	208				
						
						
						
						
						
	.dc.b	181				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	80				
						
						
						
						
						
	.dc.b	189				
	.dc.b	80				
						
						
						
						
						
	.dc.b	183				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	112				
						
						
						
						
						
	.dc.b	180				
	.dc.b	208				
						
						
						
						
						
	.dc.b	184				
	.dc.b	176				
						
						
						
						
						
	.dc.b	173				
	.dc.b	64				
						
						
						
						
						
	.dc.b	173				
	.dc.b	64				
						
						
						
						
						
	.dc.b	187				
	.dc.b	128				
						
						
						
						
						
	.dc.b	185				
	.dc.b	160				
						
						
						
						
						
	.dc.b	186				
	.dc.b	144				
						
						
						
						
						
	.dc.b	182				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	96				
						
						
						
						
						
	.dc.b	179				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	48				
						
						
						
						
						
	.dc.b	173				
	.dc.b	48				
						
						
						
						
						
	.dc.b	173				
	.dc.b	32				
						
						
						
						
						
	.dc.b	173				
	.dc.b	32				
						
						
						
						
						
	.dc.b	178				
	.dc.b	208				
						
						
						
						
						
	.dc.b	176				
	.dc.b	208				
						
						
						
						
						
	.dc.b	161				
	.dc.b	208				
						
						
						
						
						
	.dc.b	161				
	.dc.b	208				
						
						
						
						
						
	.dc.b	167				
	.dc.b	176				
						
						
						
						
						
	.dc.b	167				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	112				
						
						
						
						
						
	.dc.b	171				
	.dc.b	112				
						
						
						
						
						
	.dc.b	173				
	.dc.b	16				
						
						
						
						
						
	.dc.b	173				
	.dc.b	16				
						
						
						
						
						
	.dc.b	181				
	.dc.b	192				
						
						
						
						
						
	.dc.b	189				
	.dc.b	0				
						
						
						
						
						
	.dc.b	172				
	.dc.b	80				
						
						
						
						
						
	.dc.b	172				
	.dc.b	80				
						
						
						
						
						
	.dc.b	168				
	.dc.b	160				
						
						
						
						
						
	.dc.b	168				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	128				
						
						
						
						
						
	.dc.b	164				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	64				
						
						
						
						
						
	.dc.b	166				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	96				
						
						
						
						
						
	.dc.b	171				
	.dc.b	96				
						
						
						
						
						
	.dc.b	185				
	.dc.b	144				
						
						
						
						
						
	.dc.b	176				
	.dc.b	192				
						
						
						
						
						
	.dc.b	163				
	.dc.b	192				
						
						
						
						
						
	.dc.b	163				
	.dc.b	192				
						
						
						
						
						
	.dc.b	172				
	.dc.b	48				
						
						
						
						
						
	.dc.b	172				
	.dc.b	48				
						
						
						
						
						
	.dc.b	167				
	.dc.b	160				
						
						
						
						
						
	.dc.b	167				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	112				
						
						
						
						
						
	.dc.b	170				
	.dc.b	112				
						
						
						
						
						
	.dc.b	170				
	.dc.b	96				
						
						
						
						
						
	.dc.b	170				
	.dc.b	96				
						
						
						
						
						
	.dc.b	188				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	176				
						
						
						
						
						
	.dc.b	156				
	.dc.b	32				
						
						
						
						
						
	.dc.b	156				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	192				
						
						
						
						
						
	.dc.b	165				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	80				
						
						
						
						
						
	.dc.b	161				
	.dc.b	192				
						
						
						
						
						
	.dc.b	168				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	128				
						
						
						
						
						
	.dc.b	172				
	.dc.b	16				
						
						
						
						
						
	.dc.b	164				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	64				
						
						
						
						
						
	.dc.b	166				
	.dc.b	160				
						
						
						
						
						
	.dc.b	163				
	.dc.b	176				
						
						
						
						
						
	.dc.b	167				
	.dc.b	144				
						
						
						
						
						
	.dc.b	155				
	.dc.b	48				
						
						
						
						
						
	.dc.b	155				
	.dc.b	48				
						
						
						
						
						
	.dc.b	169				
	.dc.b	112				
						
						
						
						
						
	.dc.b	168				
	.dc.b	128				
						
						
						
						
						
	.dc.b	162				
	.dc.b	176				
						
						
						
						
						
	.dc.b	165				
	.dc.b	160				
						
						
						
						
						
	.dc.b	155				
	.dc.b	32				
						
						
						
						
						
	.dc.b	155				
	.dc.b	32				
						
						
						
						
						
	.dc.b	170				
	.dc.b	80				
						
						
						
						
						
	.dc.b	161				
	.dc.b	176				
						
						
						
						
						
	.dc.b	155				
	.dc.b	16				
						
						
						
						
						
	.dc.b	155				
	.dc.b	16				
						
						
						
						
						
	.dc.b	171				
	.dc.b	0				
						
						
						
						
						
	.dc.b	166				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	96				
						
						
						
						
						
	.dc.b	164				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	64				
						
						
						
						
						
	.dc.b	167				
	.dc.b	128				
						
						
						
						
						
	.dc.b	168				
	.dc.b	112				
						
						
						
						
						
	.dc.b	163				
	.dc.b	160				
						
						
						
						
						
	.dc.b	154				
	.dc.b	48				
						
						
						
						
						
	.dc.b	154				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	80				
						
						
						
						
						
	.dc.b	146				
	.dc.b	160				
						
						
						
						
						
	.dc.b	154				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	160				
						
						
						
						
						
	.dc.b	154				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	0				
						
						
						
						
						
	.dc.b	150				
	.dc.b	128				
						
						
						
						
						
	.dc.b	150				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	96				
						
						
						
						
						
	.dc.b	148				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	64				
						
						
						
						
						
	.dc.b	147				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	48				
						
						
						
						
						
	.dc.b	153				
	.dc.b	48				
						
						
						
						
						
	.dc.b	167				
	.dc.b	112				
						
						
						
						
						
	.dc.b	160				
	.dc.b	144				
						
						
						
						
						
	.dc.b	149				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	80				
						
						
						
						
						
	.dc.b	146				
	.dc.b	144				
						
						
						
						
						
	.dc.b	150				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	96				
						
						
						
						
						
	.dc.b	153				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	0				
						
						
						
						
						
	.dc.b	148				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	64				
						
						
						
						
						
	.dc.b	149				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	80				
						
						
						
						
						
	.dc.b	147				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	48				
						
						
						
						
						
	.dc.b	150				
	.dc.b	96				
						
						
						
						
						
	.dc.b	148				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	64				
						
						
						
						
						
	.dc.b	144				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	0				
						
						
						
						
						
	.dc.b	149				
	.dc.b	96				
						
						
						
						
						
	.dc.b	150				
	.dc.b	80				
						
						
						
						
						
	.dc.b	147				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	48				
						
						
						
						
						
	.dc.b	148				
	.dc.b	96				
						
						
						
						
						
	.dc.b	144				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	96				
						
						
						
						
						
	.dc.b	150				
	.dc.b	0				
						
						
						
						
						
	.dc.b	159				
	.dc.b	240				
						
						
						
						
						
	.dc.b	158				
	.dc.b	240				
						
						
						
						
						
	.dc.b	159				
	.dc.b	224				
						
						
						
						
						
	.dc.b	157				
	.dc.b	240				
						
						
						
						
						
	.dc.b	159				
	.dc.b	208				
						
						
						
						
						
	.dc.b	156				
	.dc.b	240				
						
						
						
						
						
	.dc.b	159				
	.dc.b	192				
						
						
						
						
						
	.dc.b	157				
	.dc.b	224				
						
						
						
						
						
	.dc.b	158				
	.dc.b	208				
						
						
						
						
						
	.dc.b	155				
	.dc.b	240				
						
						
						
						
						
	.dc.b	156				
	.dc.b	224				
						
						
						
						
						
	.dc.b	158				
	.dc.b	192				
						
						
						
						
						
	.dc.b	154				
	.dc.b	224				
						
						
						
						
						
	.dc.b	144				
	.dc.b	240				
	.align	2				
						
						
_hufftab13:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
	.dc.b	64				
	.dc.b	48				
						
						
						
						
	.dc.b	32				
	.dc.b	64				
						
						
						
						
						
	.dc.b	193				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
	.dc.b	64				
	.dc.b	68				
						
						
						
						
	.dc.b	64				
	.dc.b	84				
						
						
						
						
	.dc.b	64				
	.dc.b	100				
						
						
						
						
	.dc.b	64				
	.dc.b	116				
						
						
						
						
	.dc.b	64				
	.dc.b	132				
						
						
						
						
	.dc.b	64				
	.dc.b	148				
						
						
						
						
	.dc.b	48				
	.dc.b	164				
						
						
						
						
	.dc.b	48				
	.dc.b	172				
						
						
						
						
	.dc.b	48				
	.dc.b	180				
						
						
						
						
	.dc.b	48				
	.dc.b	188				
						
						
						
						
	.dc.b	48				
	.dc.b	196				
						
						
						
						
	.dc.b	48				
	.dc.b	204				
						
						
						
						
	.dc.b	16				
	.dc.b	212				
						
						
						
						
	.dc.b	32				
	.dc.b	214				
						
						
						
						
	.dc.b	48				
	.dc.b	218				
						
						
						
						
	.dc.b	16				
	.dc.b	226				
						
						
						
						
	.dc.b	32				
	.dc.b	228				
						
						
						
						
	.dc.b	32				
	.dc.b	232				
						
						
						
						
	.dc.b	32				
	.dc.b	236				
						
						
						
						
	.dc.b	32				
	.dc.b	240				
						
						
						
						
						
	.dc.b	200				
	.dc.b	16				
						
						
						
						
	.dc.b	16				
	.dc.b	244				
						
						
						
						
	.dc.b	16				
	.dc.b	246				
						
						
						
						
	.dc.b	16				
	.dc.b	248				
						
						
						
						
	.dc.b	32				
	.dc.b	250				
						
						
						
						
	.dc.b	16				
	.dc.b	254				
						
						
						
						
						
	.dc.b	193				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	16				
						
						
						
						
	.dc.b	17				
	.dc.b	0				
						
						
						
						
	.dc.b	17				
	.dc.b	2				
						
						
						
						
	.dc.b	17				
	.dc.b	4				
						
						
						
						
						
	.dc.b	193				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	16				
						
						
						
						
						
	.dc.b	180				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	0				
						
						
						
						
						
	.dc.b	194				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	48				
						
						
						
						
						
	.dc.b	177				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	48				
						
						
						
						
						
	.dc.b	176				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	0				
						
						
						
						
						
	.dc.b	179				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
	.dc.b	65				
	.dc.b	6				
						
						
						
						
	.dc.b	65				
	.dc.b	22				
						
						
						
						
	.dc.b	65				
	.dc.b	38				
						
						
						
						
	.dc.b	49				
	.dc.b	54				
						
						
						
						
	.dc.b	33				
	.dc.b	62				
						
						
						
						
	.dc.b	33				
	.dc.b	66				
						
						
						
						
	.dc.b	49				
	.dc.b	70				
						
						
						
						
	.dc.b	33				
	.dc.b	78				
						
						
						
						
	.dc.b	17				
	.dc.b	82				
						
						
						
						
	.dc.b	33				
	.dc.b	84				
						
						
						
						
	.dc.b	33				
	.dc.b	88				
						
						
						
						
	.dc.b	33				
	.dc.b	92				
						
						
						
						
	.dc.b	33				
	.dc.b	96				
						
						
						
						
	.dc.b	33				
	.dc.b	100				
						
						
						
						
						
	.dc.b	193				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	16				
						
						
						
						
						
	.dc.b	207				
	.dc.b	0				
						
						
						
						
	.dc.b	17				
	.dc.b	104				
						
						
						
						
	.dc.b	17				
	.dc.b	106				
						
						
						
						
	.dc.b	17				
	.dc.b	108				
						
						
						
						
						
	.dc.b	206				
	.dc.b	32				
						
						
						
						
	.dc.b	17				
	.dc.b	110				
						
						
						
						
						
	.dc.b	193				
	.dc.b	224				
						
						
						
						
						
	.dc.b	206				
	.dc.b	16				
						
						
						
						
	.dc.b	17				
	.dc.b	112				
						
						
						
						
	.dc.b	17				
	.dc.b	114				
						
						
						
						
	.dc.b	17				
	.dc.b	116				
						
						
						
						
	.dc.b	17				
	.dc.b	118				
						
						
						
						
	.dc.b	17				
	.dc.b	120				
						
						
						
						
	.dc.b	17				
	.dc.b	122				
						
						
						
						
						
	.dc.b	204				
	.dc.b	96				
						
						
						
						
						
	.dc.b	195				
	.dc.b	208				
						
						
						
						
	.dc.b	17				
	.dc.b	124				
						
						
						
						
						
	.dc.b	194				
	.dc.b	208				
						
						
						
						
						
	.dc.b	205				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	208				
						
						
						
						
						
	.dc.b	203				
	.dc.b	112				
						
						
						
						
	.dc.b	17				
	.dc.b	126				
						
						
						
						
	.dc.b	17				
	.dc.b	128				
						
						
						
						
						
	.dc.b	204				
	.dc.b	48				
						
						
						
						
	.dc.b	17				
	.dc.b	130				
						
						
						
						
						
	.dc.b	196				
	.dc.b	176				
						
						
						
						
						
	.dc.b	189				
	.dc.b	16				
						
						
						
						
						
	.dc.b	189				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	208				
						
						
						
						
						
	.dc.b	205				
	.dc.b	0				
						
						
						
						
						
	.dc.b	200				
	.dc.b	160				
						
						
						
						
						
	.dc.b	202				
	.dc.b	128				
						
						
						
						
						
	.dc.b	196				
	.dc.b	192				
						
						
						
						
						
	.dc.b	204				
	.dc.b	64				
						
						
						
						
						
	.dc.b	198				
	.dc.b	176				
						
						
						
						
						
	.dc.b	203				
	.dc.b	96				
						
						
						
						
						
	.dc.b	179				
	.dc.b	192				
						
						
						
						
						
	.dc.b	179				
	.dc.b	192				
						
						
						
						
						
	.dc.b	178				
	.dc.b	192				
						
						
						
						
						
	.dc.b	178				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	32				
						
						
						
						
						
	.dc.b	188				
	.dc.b	32				
						
						
						
						
						
	.dc.b	181				
	.dc.b	176				
						
						
						
						
						
	.dc.b	181				
	.dc.b	176				
						
						
						
						
						
	.dc.b	203				
	.dc.b	80				
						
						
						
						
						
	.dc.b	200				
	.dc.b	144				
						
						
						
						
						
	.dc.b	177				
	.dc.b	192				
						
						
						
						
						
	.dc.b	177				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	16				
						
						
						
						
						
	.dc.b	188				
	.dc.b	16				
						
						
						
						
						
	.dc.b	201				
	.dc.b	128				
						
						
						
						
						
	.dc.b	192				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	0				
						
						
						
						
						
	.dc.b	188				
	.dc.b	0				
						
						
						
						
						
	.dc.b	203				
	.dc.b	64				
						
						
						
						
						
	.dc.b	198				
	.dc.b	160				
						
						
						
						
						
	.dc.b	202				
	.dc.b	96				
						
						
						
						
						
	.dc.b	199				
	.dc.b	144				
						
						
						
						
						
	.dc.b	179				
	.dc.b	176				
						
						
						
						
						
	.dc.b	179				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	48				
						
						
						
						
						
	.dc.b	187				
	.dc.b	48				
						
						
						
						
						
	.dc.b	200				
	.dc.b	128				
						
						
						
						
						
	.dc.b	197				
	.dc.b	160				
						
						
						
						
						
	.dc.b	178				
	.dc.b	176				
						
						
						
						
						
	.dc.b	178				
	.dc.b	176				
						
						
						
						
						
	.dc.b	202				
	.dc.b	80				
						
						
						
						
						
	.dc.b	198				
	.dc.b	144				
						
						
						
						
						
	.dc.b	186				
	.dc.b	64				
						
						
						
						
						
	.dc.b	186				
	.dc.b	64				
						
						
						
						
						
	.dc.b	199				
	.dc.b	128				
						
						
						
						
						
	.dc.b	200				
	.dc.b	112				
						
						
						
						
						
	.dc.b	185				
	.dc.b	64				
						
						
						
						
						
	.dc.b	185				
	.dc.b	64				
						
						
						
						
						
	.dc.b	199				
	.dc.b	112				
						
						
						
						
						
	.dc.b	199				
	.dc.b	96				
						
						
						
						
						
	.dc.b	171				
	.dc.b	32				
						
						
						
						
						
	.dc.b	171				
	.dc.b	32				
						
						
						
						
						
	.dc.b	171				
	.dc.b	32				
						
						
						
						
						
	.dc.b	171				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	176				
						
						
						
						
						
	.dc.b	161				
	.dc.b	176				
						
						
						
						
						
	.dc.b	171				
	.dc.b	16				
						
						
						
						
						
	.dc.b	171				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	176				
						
						
						
						
						
	.dc.b	187				
	.dc.b	0				
						
						
						
						
						
	.dc.b	185				
	.dc.b	96				
						
						
						
						
						
	.dc.b	180				
	.dc.b	160				
						
						
						
						
						
	.dc.b	179				
	.dc.b	160				
						
						
						
						
						
	.dc.b	186				
	.dc.b	48				
						
						
						
						
						
	.dc.b	181				
	.dc.b	144				
						
						
						
						
						
	.dc.b	185				
	.dc.b	80				
						
						
						
						
						
	.dc.b	162				
	.dc.b	160				
						
						
						
						
						
	.dc.b	162				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	32				
						
						
						
						
						
	.dc.b	170				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	160				
						
						
						
						
						
	.dc.b	161				
	.dc.b	160				
						
						
						
						
						
	.dc.b	170				
	.dc.b	16				
						
						
						
						
						
	.dc.b	170				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	160				
						
						
						
						
						
	.dc.b	182				
	.dc.b	128				
						
						
						
						
						
	.dc.b	170				
	.dc.b	0				
						
						
						
						
						
	.dc.b	170				
	.dc.b	0				
						
						
						
						
						
	.dc.b	184				
	.dc.b	96				
						
						
						
						
						
	.dc.b	180				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	48				
						
						
						
						
						
	.dc.b	169				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	144				
						
						
						
						
						
	.dc.b	181				
	.dc.b	128				
						
						
						
						
						
	.dc.b	184				
	.dc.b	80				
						
						
						
						
						
	.dc.b	182				
	.dc.b	112				
						
						
						
						
						
	.dc.b	162				
	.dc.b	144				
						
						
						
						
						
	.dc.b	162				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	32				
						
						
						
						
						
	.dc.b	169				
	.dc.b	32				
						
						
						
						
						
	.dc.b	181				
	.dc.b	112				
						
						
						
						
						
	.dc.b	183				
	.dc.b	80				
						
						
						
						
						
	.dc.b	163				
	.dc.b	128				
						
						
						
						
						
	.dc.b	163				
	.dc.b	128				
						
						
						
						
						
	.dc.b	168				
	.dc.b	48				
						
						
						
						
						
	.dc.b	168				
	.dc.b	48				
						
						
						
						
						
	.dc.b	182				
	.dc.b	96				
						
						
						
						
						
	.dc.b	180				
	.dc.b	112				
						
						
						
						
						
	.dc.b	183				
	.dc.b	64				
						
						
						
						
						
	.dc.b	181				
	.dc.b	96				
						
						
						
						
						
	.dc.b	182				
	.dc.b	80				
						
						
						
						
						
	.dc.b	183				
	.dc.b	48				
						
						
						
						
						
	.dc.b	145				
	.dc.b	144				
						
						
						
						
						
	.dc.b	153				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	0				
						
						
						
						
						
	.dc.b	164				
	.dc.b	128				
						
						
						
						
						
	.dc.b	168				
	.dc.b	64				
						
						
						
						
						
	.dc.b	167				
	.dc.b	32				
						
						
						
						
						
	.dc.b	167				
	.dc.b	32				
						
						
						
						
						
	.dc.b	180				
	.dc.b	96				
						
						
						
						
						
	.dc.b	182				
	.dc.b	64				
						
						
						
						
						
	.dc.b	146				
	.dc.b	128				
						
						
						
						
						
	.dc.b	146				
	.dc.b	128				
						
						
						
						
						
	.dc.b	146				
	.dc.b	128				
						
						
						
						
						
	.dc.b	146				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	128				
						
						
						
						
						
	.dc.b	163				
	.dc.b	112				
						
						
						
						
						
	.dc.b	162				
	.dc.b	112				
						
						
						
						
						
	.dc.b	145				
	.dc.b	112				
						
						
						
						
						
	.dc.b	145				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	16				
						
						
						
						
						
	.dc.b	151				
	.dc.b	16				
						
						
						
						
						
	.dc.b	165				
	.dc.b	80				
						
						
						
						
						
	.dc.b	160				
	.dc.b	112				
						
						
						
						
						
	.dc.b	167				
	.dc.b	0				
						
						
						
						
						
	.dc.b	163				
	.dc.b	96				
						
						
						
						
						
	.dc.b	166				
	.dc.b	48				
						
						
						
						
						
	.dc.b	164				
	.dc.b	80				
						
						
						
						
						
	.dc.b	165				
	.dc.b	64				
						
						
						
						
						
	.dc.b	162				
	.dc.b	96				
						
						
						
						
						
	.dc.b	166				
	.dc.b	32				
						
						
						
						
						
	.dc.b	163				
	.dc.b	80				
						
						
						
						
						
	.dc.b	144				
	.dc.b	128				
						
						
						
						
						
	.dc.b	152				
	.dc.b	0				
						
						
						
						
						
	.dc.b	145				
	.dc.b	96				
						
						
						
						
						
	.dc.b	150				
	.dc.b	16				
						
						
						
						
						
	.dc.b	144				
	.dc.b	96				
						
						
						
						
						
	.dc.b	150				
	.dc.b	0				
						
						
						
						
						
	.dc.b	165				
	.dc.b	48				
						
						
						
						
						
	.dc.b	164				
	.dc.b	64				
						
						
						
						
						
	.dc.b	146				
	.dc.b	80				
						
						
						
						
						
	.dc.b	146				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	32				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
						
						
						
						
						
	.dc.b	147				
	.dc.b	64				
						
						
						
						
						
	.dc.b	148				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	0				
						
						
						
						
						
	.dc.b	146				
	.dc.b	64				
						
						
						
						
						
	.dc.b	148				
	.dc.b	32				
						
						
						
						
						
	.dc.b	147				
	.dc.b	48				
						
						
						
						
	.dc.b	49				
	.dc.b	132				
						
						
						
						
						
	.dc.b	207				
	.dc.b	240				
						
						
						
						
						
	.dc.b	206				
	.dc.b	240				
						
						
						
						
						
	.dc.b	205				
	.dc.b	240				
						
						
						
						
						
	.dc.b	206				
	.dc.b	224				
						
						
						
						
						
	.dc.b	204				
	.dc.b	240				
						
						
						
						
						
	.dc.b	205				
	.dc.b	224				
						
						
						
						
						
	.dc.b	203				
	.dc.b	240				
						
						
						
						
						
	.dc.b	207				
	.dc.b	176				
						
						
						
						
						
	.dc.b	204				
	.dc.b	224				
						
						
						
						
						
	.dc.b	205				
	.dc.b	192				
						
						
						
						
	.dc.b	17				
	.dc.b	140				
						
						
						
						
						
	.dc.b	190				
	.dc.b	192				
						
						
						
						
						
	.dc.b	190				
	.dc.b	192				
						
						
						
						
						
	.dc.b	189				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	208				
						
						
						
						
						
	.dc.b	207				
	.dc.b	160				
						
						
						
						
						
	.dc.b	204				
	.dc.b	208				
						
						
						
						
						
	.dc.b	187				
	.dc.b	224				
						
						
						
						
						
	.dc.b	187				
	.dc.b	224				
						
						
						
						
						
	.dc.b	190				
	.dc.b	176				
						
						
						
						
						
	.dc.b	190				
	.dc.b	176				
						
						
						
						
						
	.dc.b	185				
	.dc.b	240				
						
						
						
						
						
	.dc.b	185				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	144				
						
						
						
						
						
	.dc.b	191				
	.dc.b	144				
						
						
						
						
						
	.dc.b	190				
	.dc.b	160				
						
						
						
						
						
	.dc.b	190				
	.dc.b	160				
						
						
						
						
						
	.dc.b	187				
	.dc.b	208				
						
						
						
						
						
	.dc.b	187				
	.dc.b	208				
						
						
						
						
						
	.dc.b	189				
	.dc.b	176				
						
						
						
						
						
	.dc.b	189				
	.dc.b	176				
						
						
						
						
						
	.dc.b	184				
	.dc.b	240				
						
						
						
						
						
	.dc.b	184				
	.dc.b	240				
						
						
						
						
						
	.dc.b	191				
	.dc.b	128				
						
						
						
						
						
	.dc.b	191				
	.dc.b	128				
						
						
						
						
						
	.dc.b	188				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	192				
						
						
						
						
						
	.dc.b	202				
	.dc.b	224				
						
						
						
						
						
	.dc.b	201				
	.dc.b	224				
						
						
						
						
						
	.dc.b	184				
	.dc.b	224				
						
						
						
						
						
	.dc.b	184				
	.dc.b	224				
						
						
						
						
						
	.dc.b	199				
	.dc.b	240				
						
						
						
						
						
	.dc.b	199				
	.dc.b	224				
						
						
						
						
						
	.dc.b	175				
	.dc.b	112				
						
						
						
						
						
	.dc.b	175				
	.dc.b	112				
						
						
						
						
						
	.dc.b	175				
	.dc.b	112				
						
						
						
						
						
	.dc.b	175				
	.dc.b	112				
						
						
						
						
						
	.dc.b	173				
	.dc.b	160				
						
						
						
						
						
	.dc.b	173				
	.dc.b	160				
						
						
						
						
						
	.dc.b	186				
	.dc.b	208				
						
						
						
						
						
	.dc.b	187				
	.dc.b	192				
						
						
						
						
						
	.dc.b	188				
	.dc.b	176				
						
						
						
						
						
	.dc.b	191				
	.dc.b	96				
						
						
						
						
						
	.dc.b	166				
	.dc.b	240				
						
						
						
						
						
	.dc.b	166				
	.dc.b	240				
						
						
						
						
						
	.dc.b	174				
	.dc.b	128				
						
						
						
						
						
	.dc.b	165				
	.dc.b	240				
						
						
						
						
						
	.dc.b	169				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	144				
						
						
						
						
						
	.dc.b	175				
	.dc.b	80				
						
						
						
						
						
	.dc.b	174				
	.dc.b	112				
						
						
						
						
						
	.dc.b	170				
	.dc.b	192				
						
						
						
						
						
	.dc.b	171				
	.dc.b	176				
						
						
						
						
						
	.dc.b	164				
	.dc.b	240				
						
						
						
						
						
	.dc.b	164				
	.dc.b	240				
						
						
						
						
						
	.dc.b	175				
	.dc.b	64				
						
						
						
						
						
	.dc.b	175				
	.dc.b	64				
						
						
						
						
						
	.dc.b	188				
	.dc.b	160				
						
						
						
						
						
	.dc.b	190				
	.dc.b	96				
						
						
						
						
						
	.dc.b	175				
	.dc.b	48				
						
						
						
						
						
	.dc.b	175				
	.dc.b	48				
						
						
						
						
						
	.dc.b	147				
	.dc.b	240				
						
						
						
						
						
	.dc.b	147				
	.dc.b	240				
						
						
						
						
						
	.dc.b	168				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	128				
						
						
						
						
						
	.dc.b	146				
	.dc.b	240				
						
						
						
						
						
	.dc.b	159				
	.dc.b	32				
						
						
						
						
						
	.dc.b	166				
	.dc.b	224				
						
						
						
						
						
	.dc.b	169				
	.dc.b	192				
						
						
						
						
						
	.dc.b	144				
	.dc.b	240				
						
						
						
						
						
	.dc.b	144				
	.dc.b	240				
						
						
						
						
						
	.dc.b	172				
	.dc.b	144				
						
						
						
						
						
	.dc.b	165				
	.dc.b	224				
						
						
						
						
						
	.dc.b	154				
	.dc.b	176				
						
						
						
						
						
	.dc.b	154				
	.dc.b	176				
						
						
						
						
						
	.dc.b	167				
	.dc.b	208				
						
						
						
						
						
	.dc.b	173				
	.dc.b	112				
						
						
						
						
						
	.dc.b	148				
	.dc.b	224				
						
						
						
						
						
	.dc.b	148				
	.dc.b	224				
						
						
						
						
						
	.dc.b	172				
	.dc.b	128				
						
						
						
						
						
	.dc.b	173				
	.dc.b	96				
						
						
						
						
						
	.dc.b	147				
	.dc.b	224				
						
						
						
						
						
	.dc.b	147				
	.dc.b	224				
						
						
						
						
						
	.dc.b	155				
	.dc.b	144				
						
						
						
						
						
	.dc.b	155				
	.dc.b	144				
						
						
						
						
						
	.dc.b	169				
	.dc.b	176				
						
						
						
						
						
	.dc.b	170				
	.dc.b	160				
						
						
						
						
						
	.dc.b	155				
	.dc.b	160				
						
						
						
						
						
	.dc.b	158				
	.dc.b	80				
						
						
						
						
						
	.dc.b	158				
	.dc.b	64				
						
						
						
						
						
	.dc.b	152				
	.dc.b	192				
						
						
						
						
						
	.dc.b	150				
	.dc.b	208				
						
						
						
						
						
	.dc.b	158				
	.dc.b	48				
						
						
						
						
						
	.dc.b	146				
	.dc.b	224				
						
						
						
						
						
	.dc.b	144				
	.dc.b	224				
						
						
						
						
						
	.dc.b	158				
	.dc.b	0				
						
						
						
						
						
	.dc.b	149				
	.dc.b	208				
						
						
						
						
						
	.dc.b	157				
	.dc.b	80				
						
						
						
						
						
	.dc.b	151				
	.dc.b	192				
						
						
						
						
						
	.dc.b	156				
	.dc.b	112				
						
						
						
						
						
	.dc.b	148				
	.dc.b	208				
						
						
						
						
						
	.dc.b	152				
	.dc.b	176				
						
						
						
						
						
	.dc.b	155				
	.dc.b	128				
						
						
						
						
						
	.dc.b	157				
	.dc.b	64				
						
						
						
						
						
	.dc.b	153				
	.dc.b	160				
						
						
						
						
						
	.dc.b	154				
	.dc.b	144				
						
						
						
						
						
	.dc.b	150				
	.dc.b	192				
						
						
						
						
						
	.dc.b	157				
	.dc.b	48				
						
						
						
						
						
	.dc.b	151				
	.dc.b	176				
						
						
						
						
						
	.dc.b	149				
	.dc.b	192				
						
						
						
						
						
	.dc.b	156				
	.dc.b	80				
						
						
						
						
						
	.dc.b	153				
	.dc.b	144				
						
						
						
						
						
	.dc.b	151				
	.dc.b	160				
						
						
						
						
						
	.dc.b	154				
	.dc.b	112				
						
						
						
						
						
	.dc.b	153				
	.dc.b	112				
						
						
						
						
						
	.dc.b	191				
	.dc.b	224				
						
						
						
						
						
	.dc.b	191				
	.dc.b	192				
						
						
						
						
						
	.dc.b	175				
	.dc.b	208				
						
						
						
						
						
	.dc.b	175				
	.dc.b	208				
						
						
						
						
						
	.dc.b	158				
	.dc.b	208				
						
						
						
						
						
	.dc.b	158				
	.dc.b	208				
						
						
						
						
						
	.dc.b	158				
	.dc.b	208				
						
						
						
						
						
	.dc.b	158				
	.dc.b	208				
						
						
						
						
						
	.dc.b	154				
	.dc.b	240				
						
						
						
						
						
	.dc.b	158				
	.dc.b	144				
	.align	2				
						
						
_hufftab12:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
	.dc.b	64				
	.dc.b	48				
						
						
						
						
	.dc.b	32				
	.dc.b	64				
						
						
						
						
	.dc.b	48				
	.dc.b	68				
						
						
						
						
	.dc.b	16				
	.dc.b	76				
						
						
						
						
						
	.dc.b	193				
	.dc.b	32				
						
						
						
						
						
	.dc.b	194				
	.dc.b	16				
						
						
						
						
	.dc.b	16				
	.dc.b	78				
						
						
						
						
						
	.dc.b	192				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
	.dc.b	32				
	.dc.b	80				
						
						
						
						
	.dc.b	16				
	.dc.b	84				
						
						
						
						
	.dc.b	16				
	.dc.b	86				
						
						
						
						
	.dc.b	16				
	.dc.b	88				
						
						
						
						
						
	.dc.b	197				
	.dc.b	96				
						
						
						
						
						
	.dc.b	195				
	.dc.b	112				
						
						
						
						
	.dc.b	16				
	.dc.b	90				
						
						
						
						
						
	.dc.b	194				
	.dc.b	112				
						
						
						
						
						
	.dc.b	199				
	.dc.b	32				
						
						
						
						
						
	.dc.b	196				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	64				
						
						
						
						
						
	.dc.b	193				
	.dc.b	112				
						
						
						
						
						
	.dc.b	199				
	.dc.b	16				
						
						
						
						
	.dc.b	16				
	.dc.b	92				
						
						
						
						
						
	.dc.b	195				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	48				
						
						
						
						
						
	.dc.b	196				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	64				
						
						
						
						
	.dc.b	16				
	.dc.b	94				
						
						
						
						
						
	.dc.b	178				
	.dc.b	96				
						
						
						
						
						
	.dc.b	178				
	.dc.b	96				
						
						
						
						
						
	.dc.b	182				
	.dc.b	32				
						
						
						
						
						
	.dc.b	182				
	.dc.b	32				
						
						
						
						
						
	.dc.b	182				
	.dc.b	16				
						
						
						
						
						
	.dc.b	182				
	.dc.b	16				
						
						
						
						
						
	.dc.b	193				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	0				
						
						
						
						
						
	.dc.b	195				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	48				
						
						
						
						
						
	.dc.b	194				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	80				
						
						
						
						
						
	.dc.b	177				
	.dc.b	80				
						
						
						
						
						
	.dc.b	181				
	.dc.b	16				
						
						
						
						
						
	.dc.b	181				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	64				
						
						
						
						
						
	.dc.b	179				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	48				
						
						
						
						
						
	.dc.b	180				
	.dc.b	48				
						
						
						
						
						
	.dc.b	197				
	.dc.b	0				
						
						
						
						
						
	.dc.b	192				
	.dc.b	64				
						
						
						
						
						
	.dc.b	178				
	.dc.b	64				
						
						
						
						
						
	.dc.b	178				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	32				
						
						
						
						
						
	.dc.b	180				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	64				
						
						
						
						
						
	.dc.b	177				
	.dc.b	64				
						
						
						
						
						
	.dc.b	163				
	.dc.b	48				
						
						
						
						
						
	.dc.b	164				
	.dc.b	16				
						
						
						
						
						
	.dc.b	162				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	32				
						
						
						
						
						
	.dc.b	180				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	0				
						
						
						
						
						
	.dc.b	163				
	.dc.b	0				
						
						
						
						
						
	.dc.b	145				
	.dc.b	48				
						
						
						
						
						
	.dc.b	145				
	.dc.b	48				
						
						
						
						
						
	.dc.b	145				
	.dc.b	48				
						
						
						
						
						
	.dc.b	145				
	.dc.b	48				
						
						
						
						
						
	.dc.b	147				
	.dc.b	16				
						
						
						
						
						
	.dc.b	146				
	.dc.b	32				
						
						
						
						
						
	.dc.b	144				
	.dc.b	32				
						
						
						
						
						
	.dc.b	146				
	.dc.b	0				
						
						
						
						
						
	.dc.b	167				
	.dc.b	112				
						
						
						
						
						
	.dc.b	166				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	96				
						
						
						
						
						
	.dc.b	151				
	.dc.b	96				
						
						
						
						
						
	.dc.b	149				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	80				
						
						
						
						
						
	.dc.b	150				
	.dc.b	96				
						
						
						
						
						
	.dc.b	148				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	64				
						
						
						
						
						
	.dc.b	150				
	.dc.b	80				
						
						
						
						
						
	.dc.b	151				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	80				
						
						
						
						
						
	.dc.b	144				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	96				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
	.align	2				
						
						
_hufftab11:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
	.dc.b	64				
	.dc.b	48				
						
						
						
						
	.dc.b	48				
	.dc.b	64				
						
						
						
						
						
	.dc.b	193				
	.dc.b	32				
						
						
						
						
	.dc.b	16				
	.dc.b	72				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
	.dc.b	32				
	.dc.b	74				
						
						
						
						
	.dc.b	48				
	.dc.b	78				
						
						
						
						
	.dc.b	32				
	.dc.b	86				
						
						
						
						
	.dc.b	16				
	.dc.b	90				
						
						
						
						
	.dc.b	32				
	.dc.b	92				
						
						
						
						
						
	.dc.b	194				
	.dc.b	112				
						
						
						
						
						
	.dc.b	199				
	.dc.b	32				
						
						
						
						
	.dc.b	16				
	.dc.b	96				
						
						
						
						
						
	.dc.b	183				
	.dc.b	16				
						
						
						
						
						
	.dc.b	183				
	.dc.b	16				
						
						
						
						
						
	.dc.b	193				
	.dc.b	112				
						
						
						
						
						
	.dc.b	199				
	.dc.b	0				
						
						
						
						
						
	.dc.b	195				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	48				
						
						
						
						
						
	.dc.b	198				
	.dc.b	0				
						
						
						
						
	.dc.b	16				
	.dc.b	98				
						
						
						
						
	.dc.b	16				
	.dc.b	100				
						
						
						
						
						
	.dc.b	193				
	.dc.b	80				
						
						
						
						
						
	.dc.b	182				
	.dc.b	32				
						
						
						
						
						
	.dc.b	182				
	.dc.b	32				
						
						
						
						
						
	.dc.b	194				
	.dc.b	96				
						
						
						
						
						
	.dc.b	192				
	.dc.b	96				
						
						
						
						
						
	.dc.b	177				
	.dc.b	96				
						
						
						
						
						
	.dc.b	177				
	.dc.b	96				
						
						
						
						
						
	.dc.b	182				
	.dc.b	16				
						
						
						
						
						
	.dc.b	182				
	.dc.b	16				
						
						
						
						
						
	.dc.b	197				
	.dc.b	16				
						
						
						
						
						
	.dc.b	195				
	.dc.b	64				
						
						
						
						
						
	.dc.b	197				
	.dc.b	0				
						
						
						
						
	.dc.b	16				
	.dc.b	102				
						
						
						
						
						
	.dc.b	194				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	48				
						
						
						
						
						
	.dc.b	178				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	32				
						
						
						
						
						
	.dc.b	179				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	161				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	163				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	0				
						
						
						
						
						
	.dc.b	162				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	32				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	144				
	.dc.b	32				
						
						
						
						
						
	.dc.b	146				
	.dc.b	0				
						
						
						
						
						
	.dc.b	167				
	.dc.b	112				
						
						
						
						
						
	.dc.b	166				
	.dc.b	112				
						
						
						
						
						
	.dc.b	167				
	.dc.b	96				
						
						
						
						
						
	.dc.b	167				
	.dc.b	80				
						
						
						
						
						
	.dc.b	166				
	.dc.b	96				
						
						
						
						
						
	.dc.b	166				
	.dc.b	96				
						
						
						
						
						
	.dc.b	164				
	.dc.b	112				
						
						
						
						
						
	.dc.b	164				
	.dc.b	112				
						
						
						
						
						
	.dc.b	167				
	.dc.b	64				
						
						
						
						
						
	.dc.b	167				
	.dc.b	64				
						
						
						
						
						
	.dc.b	181				
	.dc.b	112				
						
						
						
						
						
	.dc.b	181				
	.dc.b	80				
						
						
						
						
						
	.dc.b	165				
	.dc.b	96				
						
						
						
						
						
	.dc.b	166				
	.dc.b	80				
						
						
						
						
						
	.dc.b	147				
	.dc.b	112				
						
						
						
						
						
	.dc.b	147				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	48				
						
						
						
						
						
	.dc.b	148				
	.dc.b	96				
						
						
						
						
						
	.dc.b	164				
	.dc.b	80				
						
						
						
						
						
	.dc.b	165				
	.dc.b	64				
						
						
						
						
						
	.dc.b	163				
	.dc.b	80				
						
						
						
						
						
	.dc.b	165				
	.dc.b	48				
						
						
						
						
						
	.dc.b	150				
	.dc.b	64				
						
						
						
						
						
	.dc.b	144				
	.dc.b	112				
						
						
						
						
						
	.dc.b	148				
	.dc.b	64				
						
						
						
						
						
	.dc.b	146				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	32				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
						
						
						
						
						
	.dc.b	148				
	.dc.b	48				
						
						
						
						
						
	.dc.b	147				
	.dc.b	48				
	.align	2				
						
						
_hufftab10:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
	.dc.b	32				
	.dc.b	48				
						
						
						
						
						
	.dc.b	193				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
	.dc.b	48				
	.dc.b	52				
						
						
						
						
	.dc.b	32				
	.dc.b	60				
						
						
						
						
	.dc.b	48				
	.dc.b	64				
						
						
						
						
	.dc.b	16				
	.dc.b	72				
						
						
						
						
	.dc.b	32				
	.dc.b	74				
						
						
						
						
	.dc.b	32				
	.dc.b	78				
						
						
						
						
	.dc.b	32				
	.dc.b	82				
						
						
						
						
						
	.dc.b	193				
	.dc.b	112				
						
						
						
						
						
	.dc.b	199				
	.dc.b	16				
						
						
						
						
	.dc.b	16				
	.dc.b	86				
						
						
						
						
	.dc.b	32				
	.dc.b	88				
						
						
						
						
	.dc.b	32				
	.dc.b	92				
						
						
						
						
						
	.dc.b	193				
	.dc.b	96				
						
						
						
						
						
	.dc.b	198				
	.dc.b	16				
						
						
						
						
						
	.dc.b	198				
	.dc.b	0				
						
						
						
						
	.dc.b	16				
	.dc.b	96				
						
						
						
						
	.dc.b	16				
	.dc.b	98				
						
						
						
						
	.dc.b	16				
	.dc.b	100				
						
						
						
						
						
	.dc.b	193				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	16				
						
						
						
						
						
	.dc.b	196				
	.dc.b	0				
						
						
						
						
						
	.dc.b	194				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	32				
						
						
						
						
						
	.dc.b	192				
	.dc.b	48				
						
						
						
						
						
	.dc.b	177				
	.dc.b	48				
						
						
						
						
						
	.dc.b	177				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	0				
						
						
						
						
						
	.dc.b	179				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	183				
	.dc.b	112				
						
						
						
						
						
	.dc.b	182				
	.dc.b	112				
						
						
						
						
						
	.dc.b	183				
	.dc.b	96				
						
						
						
						
						
	.dc.b	181				
	.dc.b	112				
						
						
						
						
						
	.dc.b	183				
	.dc.b	80				
						
						
						
						
						
	.dc.b	182				
	.dc.b	96				
						
						
						
						
						
	.dc.b	164				
	.dc.b	112				
						
						
						
						
						
	.dc.b	164				
	.dc.b	112				
						
						
						
						
						
	.dc.b	167				
	.dc.b	64				
						
						
						
						
						
	.dc.b	165				
	.dc.b	96				
						
						
						
						
						
	.dc.b	166				
	.dc.b	80				
						
						
						
						
						
	.dc.b	163				
	.dc.b	112				
						
						
						
						
						
	.dc.b	167				
	.dc.b	48				
						
						
						
						
						
	.dc.b	167				
	.dc.b	48				
						
						
						
						
						
	.dc.b	164				
	.dc.b	96				
						
						
						
						
						
	.dc.b	164				
	.dc.b	96				
						
						
						
						
						
	.dc.b	181				
	.dc.b	80				
						
						
						
						
						
	.dc.b	181				
	.dc.b	64				
						
						
						
						
						
	.dc.b	166				
	.dc.b	48				
						
						
						
						
						
	.dc.b	166				
	.dc.b	48				
						
						
						
						
						
	.dc.b	146				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	32				
						
						
						
						
						
	.dc.b	166				
	.dc.b	64				
						
						
						
						
						
	.dc.b	160				
	.dc.b	112				
						
						
						
						
						
	.dc.b	151				
	.dc.b	0				
						
						
						
						
						
	.dc.b	151				
	.dc.b	0				
						
						
						
						
						
	.dc.b	150				
	.dc.b	32				
						
						
						
						
						
	.dc.b	150				
	.dc.b	32				
						
						
						
						
						
	.dc.b	164				
	.dc.b	80				
						
						
						
						
						
	.dc.b	163				
	.dc.b	80				
						
						
						
						
						
	.dc.b	144				
	.dc.b	96				
						
						
						
						
						
	.dc.b	144				
	.dc.b	96				
						
						
						
						
						
	.dc.b	165				
	.dc.b	48				
						
						
						
						
						
	.dc.b	164				
	.dc.b	64				
						
						
						
						
						
	.dc.b	147				
	.dc.b	96				
						
						
						
						
						
	.dc.b	146				
	.dc.b	96				
						
						
						
						
						
	.dc.b	162				
	.dc.b	80				
						
						
						
						
						
	.dc.b	165				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	80				
						
						
						
						
						
	.dc.b	145				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	16				
						
						
						
						
						
	.dc.b	149				
	.dc.b	16				
						
						
						
						
						
	.dc.b	163				
	.dc.b	64				
						
						
						
						
						
	.dc.b	164				
	.dc.b	48				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	0				
						
						
						
						
						
	.dc.b	146				
	.dc.b	64				
						
						
						
						
						
	.dc.b	148				
	.dc.b	32				
						
						
						
						
						
	.dc.b	147				
	.dc.b	48				
						
						
						
						
						
	.dc.b	144				
	.dc.b	64				
	.align	2				
						
						
_hufftab9:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	48				
	.dc.b	32				
						
						
						
						
	.dc.b	32				
	.dc.b	40				
						
						
						
						
	.dc.b	32				
	.dc.b	44				
						
						
						
						
	.dc.b	16				
	.dc.b	48				
						
						
						
						
						
	.dc.b	193				
	.dc.b	32				
						
						
						
						
						
	.dc.b	194				
	.dc.b	16				
						
						
						
						
						
	.dc.b	194				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	0				
						
						
						
						
	.dc.b	16				
	.dc.b	50				
						
						
						
						
						
	.dc.b	195				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	48				
						
						
						
						
	.dc.b	16				
	.dc.b	52				
						
						
						
						
						
	.dc.b	196				
	.dc.b	64				
						
						
						
						
						
	.dc.b	194				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	80				
						
						
						
						
						
	.dc.b	181				
	.dc.b	16				
						
						
						
						
						
	.dc.b	181				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	64				
						
						
						
						
						
	.dc.b	179				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	48				
						
						
						
						
						
	.dc.b	180				
	.dc.b	48				
						
						
						
						
						
	.dc.b	197				
	.dc.b	0				
						
						
						
						
						
	.dc.b	192				
	.dc.b	64				
						
						
						
						
						
	.dc.b	178				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	32				
						
						
						
						
						
	.dc.b	179				
	.dc.b	48				
						
						
						
						
						
	.dc.b	180				
	.dc.b	0				
						
						
						
						
						
	.dc.b	161				
	.dc.b	64				
						
						
						
						
						
	.dc.b	161				
	.dc.b	64				
						
						
						
						
						
	.dc.b	164				
	.dc.b	16				
						
						
						
						
						
	.dc.b	164				
	.dc.b	16				
						
						
						
						
						
	.dc.b	162				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	32				
						
						
						
						
						
	.dc.b	145				
	.dc.b	48				
						
						
						
						
						
	.dc.b	145				
	.dc.b	48				
						
						
						
						
						
	.dc.b	147				
	.dc.b	16				
						
						
						
						
						
	.dc.b	147				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	0				
						
						
						
						
						
	.dc.b	146				
	.dc.b	32				
						
						
						
						
						
	.dc.b	144				
	.dc.b	32				
						
						
						
						
						
	.dc.b	149				
	.dc.b	80				
						
						
						
						
						
	.dc.b	148				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	64				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
	.align	2				
						
						
_hufftab8:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	32				
						
						
						
						
						
	.dc.b	194				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
	.dc.b	48				
	.dc.b	48				
						
						
						
						
	.dc.b	32				
	.dc.b	56				
						
						
						
						
	.dc.b	16				
	.dc.b	60				
						
						
						
						
						
	.dc.b	193				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	16				
						
						
						
						
	.dc.b	16				
	.dc.b	62				
						
						
						
						
	.dc.b	16				
	.dc.b	64				
						
						
						
						
						
	.dc.b	194				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	16				
						
						
						
						
						
	.dc.b	180				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	0				
						
						
						
						
						
	.dc.b	194				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	32				
						
						
						
						
						
	.dc.b	193				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	16				
						
						
						
						
						
	.dc.b	192				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	0				
						
						
						
						
						
	.dc.b	162				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	32				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	181				
	.dc.b	80				
						
						
						
						
						
	.dc.b	181				
	.dc.b	64				
						
						
						
						
						
	.dc.b	164				
	.dc.b	80				
						
						
						
						
						
	.dc.b	164				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	80				
						
						
						
						
						
	.dc.b	164				
	.dc.b	64				
						
						
						
						
						
	.dc.b	146				
	.dc.b	80				
						
						
						
						
						
	.dc.b	146				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	32				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
						
						
						
						
						
	.dc.b	147				
	.dc.b	64				
						
						
						
						
						
	.dc.b	148				
	.dc.b	48				
						
						
						
						
						
	.dc.b	149				
	.dc.b	0				
						
						
						
						
						
	.dc.b	147				
	.dc.b	48				
	.align	2				
						
						
_hufftab7:					
						
						
						
						
	.dc.b	64				
	.dc.b	16				
						
						
						
						
	.dc.b	64				
	.dc.b	32				
						
						
						
						
	.dc.b	32				
	.dc.b	48				
						
						
						
						
						
	.dc.b	193				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
	.dc.b	32				
	.dc.b	52				
						
						
						
						
	.dc.b	16				
	.dc.b	56				
						
						
						
						
	.dc.b	16				
	.dc.b	58				
						
						
						
						
						
	.dc.b	193				
	.dc.b	80				
						
						
						
						
						
	.dc.b	197				
	.dc.b	16				
						
						
						
						
	.dc.b	16				
	.dc.b	60				
						
						
						
						
						
	.dc.b	197				
	.dc.b	0				
						
						
						
						
	.dc.b	16				
	.dc.b	62				
						
						
						
						
						
	.dc.b	194				
	.dc.b	64				
						
						
						
						
						
	.dc.b	196				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	64				
						
						
						
						
						
	.dc.b	177				
	.dc.b	64				
						
						
						
						
						
	.dc.b	180				
	.dc.b	16				
						
						
						
						
						
	.dc.b	180				
	.dc.b	16				
						
						
						
						
						
	.dc.b	180				
	.dc.b	0				
						
						
						
						
						
	.dc.b	180				
	.dc.b	0				
						
						
						
						
						
	.dc.b	192				
	.dc.b	64				
						
						
						
						
						
	.dc.b	194				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	32				
						
						
						
						
						
	.dc.b	192				
	.dc.b	48				
						
						
						
						
						
	.dc.b	177				
	.dc.b	48				
						
						
						
						
						
	.dc.b	177				
	.dc.b	48				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	0				
						
						
						
						
						
	.dc.b	179				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	146				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	165				
	.dc.b	80				
						
						
						
						
						
	.dc.b	164				
	.dc.b	80				
						
						
						
						
						
	.dc.b	165				
	.dc.b	64				
						
						
						
						
						
	.dc.b	165				
	.dc.b	48				
						
						
						
						
						
	.dc.b	147				
	.dc.b	80				
						
						
						
						
						
	.dc.b	148				
	.dc.b	64				
						
						
						
						
						
	.dc.b	146				
	.dc.b	80				
						
						
						
						
						
	.dc.b	149				
	.dc.b	32				
						
						
						
						
						
	.dc.b	144				
	.dc.b	80				
						
						
						
						
						
	.dc.b	147				
	.dc.b	64				
						
						
						
						
						
	.dc.b	148				
	.dc.b	48				
						
						
						
						
						
	.dc.b	147				
	.dc.b	48				
	.align	2				
						
						
_hufftab6:					
						
						
						
						
	.dc.b	48				
	.dc.b	16				
						
						
						
						
	.dc.b	16				
	.dc.b	24				
						
						
						
						
	.dc.b	16				
	.dc.b	26				
						
						
						
						
						
	.dc.b	193				
	.dc.b	32				
						
						
						
						
						
	.dc.b	194				
	.dc.b	16				
						
						
						
						
						
	.dc.b	194				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	0				
						
						
						
						
						
	.dc.b	176				
	.dc.b	0				
						
						
						
						
						
	.dc.b	179				
	.dc.b	48				
						
						
						
						
						
	.dc.b	176				
	.dc.b	48				
						
						
						
						
						
	.dc.b	162				
	.dc.b	48				
						
						
						
						
						
	.dc.b	162				
	.dc.b	48				
						
						
						
						
						
	.dc.b	163				
	.dc.b	32				
						
						
						
						
						
	.dc.b	163				
	.dc.b	32				
						
						
						
						
						
	.dc.b	163				
	.dc.b	0				
						
						
						
						
						
	.dc.b	163				
	.dc.b	0				
						
						
						
						
						
	.dc.b	145				
	.dc.b	48				
						
						
						
						
						
	.dc.b	147				
	.dc.b	16				
						
						
						
						
						
	.dc.b	146				
	.dc.b	32				
						
						
						
						
						
	.dc.b	144				
	.dc.b	32				
	.align	2				
						
						
_hufftab5:					
						
						
						
						
	.dc.b	64				
	.dc.b	8				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
	.dc.b	16				
	.dc.b	24				
						
						
						
						
						
	.dc.b	195				
	.dc.b	32				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	179				
	.dc.b	16				
						
						
						
						
						
	.dc.b	193				
	.dc.b	48				
						
						
						
						
						
	.dc.b	192				
	.dc.b	48				
						
						
						
						
						
	.dc.b	195				
	.dc.b	0				
						
						
						
						
						
	.dc.b	194				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	32				
						
						
						
						
						
	.dc.b	177				
	.dc.b	32				
						
						
						
						
						
	.dc.b	178				
	.dc.b	16				
						
						
						
						
						
	.dc.b	178				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	32				
						
						
						
						
						
	.dc.b	176				
	.dc.b	32				
						
						
						
						
						
	.dc.b	178				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	0				
						
						
						
						
						
	.dc.b	147				
	.dc.b	48				
						
						
						
						
						
	.dc.b	146				
	.dc.b	48				
	.align	2				
						
						
_hufftab3:					
						
						
						
						
	.dc.b	48				
	.dc.b	8				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	16				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
						
	.dc.b	160				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	176				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	16				
						
						
						
						
						
	.dc.b	162				
	.dc.b	16				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
	.align	2				
						
						
_hufftab2:					
						
						
						
						
	.dc.b	48				
	.dc.b	8				
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	177				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	178				
	.dc.b	32				
						
						
						
						
						
	.dc.b	176				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	161				
	.dc.b	32				
						
						
						
						
						
	.dc.b	162				
	.dc.b	16				
						
						
						
						
						
	.dc.b	162				
	.dc.b	16				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
						
						
						
						
						
	.dc.b	162				
	.dc.b	0				
	.align	2				
						
						
_hufftab1:					
						
						
						
						
						
	.dc.b	177				
	.dc.b	16				
						
						
						
						
						
	.dc.b	176				
	.dc.b	16				
						
						
						
						
						
	.dc.b	161				
	.dc.b	0				
						
						
						
						
						
	.dc.b	161				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
						
						
						
						
						
	.dc.b	144				
	.dc.b	0				
	.align	2				
						
						
_hufftab0:					
						
						
						
						
						
	.dc.b	128				
	.dc.b	0				
	.align	2				
						
						
_hufftabB:					
						
						
						
						
						
						
						
	.dc.b	207				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	206				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	205				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	204				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	203				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	202				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	201				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	200				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	199				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	198				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	197				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	196				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	195				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	194				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	193				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	192				
	.ds.b	1				
	.align	2				
						
						
_hufftabA:					
						
						
						
						
	.dc.b	32				
	.dc.b	16				
						
						
						
						
	.dc.b	32				
	.dc.b	20				
						
						
						
						
	.dc.b	16				
	.dc.b	24				
						
						
						
						
	.dc.b	16				
	.dc.b	26				
						
						
						
						
						
						
						
	.dc.b	194				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	193				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	196				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	200				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	144				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	144				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	144				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	144				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	144				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	144				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	144				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	144				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	171				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	175				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	173				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	174				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	167				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	165				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	153				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	153				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	150				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	147				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	154				
	.ds.b	1				
						
						
						
						
						
						
						
	.dc.b	156				
	.ds.b	1				
						
