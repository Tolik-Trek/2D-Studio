
WORK_	LD	A,(CRTOOL)
	SUB	#0A
	JP	Z,WINDS
	DEC	A
	JP	Z,ZOOMX
	DEC	A
	JP	Z,WORKA
	DEC	A
	JP	Z,LINES
	DEC	A
	JP	Z,SQUAR
	DEC	A
	JP	Z,ELIPS
	DEC	A
	JP	Z,FILLS
	XOR	A
	RET 

ZOOMX	CALL	READCRD
	RET	NZ
	LD	A,(ZOOMMOD)
	OR	A
	JP	NZ,UNZOOM	;ZOOMX4
	LD	BC,(SHIFTX)
	ADD	HL,BC
	LD	BC,33/2
	AND	A
	SBC	HL,BC
	JR	NC,ZOOMX2
	LD	HL,0
ZOOMX2	LD	(SHIFTX),HL
	EX	DE,HL
	LD	BC,(SHIFTY)
	ADD	HL,BC
	LD	BC,23/2
	AND	A
	SBC	HL,BC
	JR	NC,ZOOMX3
	LD	HL,0
ZOOMX3	LD	(SHIFTY),HL
	EX	DE,HL
	JP	ZOOM

ZOOMX4	LD	HL,(SHIFTX)
	LD	BC,33*8
	ADD	HL,BC
	EX	DE,HL
	LD	HL,(X_SIZE)
	SBC	HL,DE
	JR	NC,ZOOMX5
	LD	HL,(X_SIZE)
	LD	BC,33*8
	AND	A
	SBC	HL,BC
	JR	NC,ZOOMX6
	LD	HL,0
ZOOMX6	LD	(SHIFTX),HL
ZOOMX5	LD	HL,(SHIFTY)
	LD	BC,23*8
	ADD	HL,BC
	EX	DE,HL
	LD	HL,(Y_SIZE)
	SBC	HL,DE
	JR	NC,ZOOMX7
	LD	HL,(Y_SIZE)
	LD	BC,23*8
	AND	A
	SBC	HL,BC
	JR	NC,ZOOMX8
	LD	HL,0
ZOOMX8	LD	(SHIFTY),HL
ZOOMX7	JP	UNZOOM

READCRD	LD	C,3
	CALL	INTMOUS
	CP	1
	LD	A,1
	RET	NZ
	PUSH	HL
	PUSH	DE
	CALL	LOBJECT
	LD	DE,#0401
	AND	A
	SBC	HL,DE
	POP	DE
	POP	HL
	LD	A,0
	RET	NZ
	LD	BC,(X_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	LD	BC,(Y_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	XOR	A
	RET 

PIXEL	LD	A,#00
	OR	A
	JP	NZ,PIXEL2
PIXEL1	PUSH	DE
	PUSH	BC
	CALL	PUTPNT2
	POP	BC
	POP	DE
	RET 

PIXEL2	DEC	A
	JP	NZ,PIXEL3
	PUSH	DE
	PUSH	BC
	CALL	PUTPIX
	POP	BC
	POP	DE
	RET 

PIXEL3	PUSH	DE
	PUSH	BC
	CALL	GETPIX
	CALL	PUTPNT3
	POP	BC
	POP	DE
	RET 

REAL_XY	LD	BC,(SHIFTX)
	ADD	HL,BC
	LD	BC,(SHIFTY)
	EX	DE,HL
	ADD	HL,BC
	EX	DE,HL
	RET 

HARD_XY	LD	BC,(X_)
	ADD	HL,BC
	EX	DE,HL
	LD	BC,(Y_)
	ADD	HL,BC
	EX	DE,HL
	RET 

WRT_PIX	PUSH	HL
	PUSH	DE
	CALL	PIXOPEN
	LD	IX,AREAPIX
	LD	BC,(X_SIZE)
WRTPIX1	LD	A,D
	OR	E
	JR	Z,WRTPIX2
	DEC	DE
	ADD	IX,BC
	CALL	C,PIXNEXT
	JR	WRTPIX1
WRTPIX2	EX	DE,HL
	ADD	IX,DE
	CALL	C,PIXNEXT
	LD	A,(COLOR)
	LD	(IX),A
	CALL	RETBANK
	POP	DE
	POP	HL
	RET 

RD_PIX	PUSH	HL
	PUSH	DE
	CALL	PIXOPEN
	LD	IX,AREAPIX
	LD	BC,(X_SIZE)
RDRPIX1	LD	A,D
	OR	E
	JR	Z,RDRPIX2
	DEC	DE
	ADD	IX,BC
	CALL	C,PIXNEXT
	JR	RDRPIX1
RDRPIX2	EX	DE,HL
	ADD	IX,DE
	CALL	C,PIXNEXT
	LD	D,(IX)
	CALL	RETBANK
	LD	A,D
	POP	DE
	POP	HL
	RET 

WINDS	LD	C,3
	CALL	INTMOUS
	LD	BC,(X_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	LD	BC,(Y_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	XOR	A
	LD	(PREVX),HL
	LD	(PREV2X),HL
	LD	(PREVY),DE
	LD	(PREV2Y),DE
	LD	(STARX),HL
	LD	(STARY),DE
	LD	HL,(STARX)
	LD	DE,(PREV2X)
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREV2Y)
	EXX 
	CALL	WINDSEL
WINDS2	CALL	READCRD
	JP	NZ,WINDSS
	LD	A,(ZOOMMOD)
	PUSH	HL
	LD	BC,(PREVX)
	AND	A
	SBC	HL,BC
	JP	NZ,WIND2
	LD	HL,(PREVY)
	AND	A
	SBC	HL,DE
	JP	NZ,WIND2
	POP	HL
	JP	WINDS2
WIND2	POP	HL
	LD	(PREVX),HL
	LD	(PREVY),DE
	CALL	OUTWIND
	JP	WINDS2

WINDSS	OR	A
	RET	Z
	LD	HL,(STARX)
	LD	DE,(PREVX)
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREVY)
	EXX 
	CALL	WINDSEL
	XOR	A
	RET 


OUTWIND
	LD	HL,(STARX)
	LD	DE,(PREV2X)
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREV2Y)
	EXX 
	CALL	WINDSEL
	LD	HL,(STARX)
	LD	DE,(PREVX)
	LD	(PREV2X),DE
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREVY)
	LD	(PREV2Y),DE
	EXX 
	CALL	WINDSEL
	RET 

; HL - X1   HL'- Y1
; DE - X2   DE'- Y2

WINDSEL	AND	A
	LD	B,H
	LD	C,L
	SBC	HL,DE
	JR	NC,WS1
	LD	H,B
	LD	L,C
	EX	DE,HL
	AND	A
	SBC	HL,DE
WS1	RET	Z
	LD	(SQRLEN),HL
	LD	(SQR_X1),DE
	EXX 
	AND	A
	LD	B,H
	LD	C,L
	SBC	HL,DE
	JR	NC,WS2
	LD	H,B
	LD	L,C
	EX	DE,HL
	AND	A
	SBC	HL,DE
WS2	RET	Z
	LD	(SQRHGT),HL
	LD	(SQR_Y1),DE
	LD	BC,(SQRHGT)
	EXX 
	LD	HL,(SQR_X1)
	LD	DE,(SQR_Y1)
	CALL	HARD_XY
	LD	BC,(SQRLEN)
	JP	XFRAME

FILLS	CALL	READCRD
	RET	NZ
	LD	A,(ZOOMMOD)
	OR	A
	JP	Z,FUZZS
	SRL	H
	RR	L
	SRL	H
	RR	L
	SRL	H
	RR	L
	SRL	D
	RR	E
	SRL	D
	RR	E
	SRL	D
	RR	E
FUZZS	CALL	GETPIX
	LD	(XOLOR),A
	LD	C,A
	LD	A,(COLOR)
	CP	C
	RET	Z
	CALL	REAL_XY
	CALL	FILL
	CALL	REFRWIN
;	LD	HL,(SHIFTX)
;	LD	DE,(SHIFTY)
;	LD	BC,33
;	CALL	DATAPIX
	XOR	A
	RET 

FILL	LD	(BUFFER),DE
	LD	(BUFFER+2),HL
	LD	(TEMP_Y),DE
	LD	(TEMP_X),HL
	LD	BC,ENDBF	;END
	PUSH	BC
	INC	BC
	INC	BC
	INC	BC
	INC	BC
	LD	(CONMAX),BC
	POP	BC
	LD	(CONMIN),BC
MAIN_FF	LD	HL,(CONMIN)
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	DEC	HL	;X-1
	CALL	PLOT
	LD	HL,(CONMIN)
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	INC	DE	;Y+1
	CALL	PLOT
	LD	HL,(CONMIN)
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	INC	HL	;X+1
	CALL	PLOT
	LD	HL,(CONMIN)
	LD	E,(HL)
	INC	HL
	LD	D,(HL)
	INC	HL
	LD	A,(HL)
	INC	HL
	LD	H,(HL)
	LD	L,A
	DEC	DE	;Y-1
	CALL	PLOT
	LD	HL,(CONMIN)
	INC	HL
	INC	HL
	INC	HL
	INC	HL
	PUSH	HL
	LD	BC,LIMIT	;LIMIT!!!
	AND	A
	SBC	HL,BC
	JR	NZ,PASS
	POP	HL
	LD	HL,BUFFER
	PUSH	HL
PASS	POP	HL
	LD	(CONMIN),HL
	LD	BC,(CONMAX)
	AND	A
	SBC	HL,BC
	RET	Z
	JP	MAIN_FF

PLOT	LD	(TEMP_Y),DE
	LD	(TEMP_X),HL
	LD	B,H
	LD	C,L
	LD	HL,(X_SIZE)
	DEC	HL
	AND	A
	SBC	HL,BC
	RET	C
	LD	HL,(Y_SIZE)
	DEC	HL
	AND	A
	SBC	HL,DE
	RET	C
	LD	H,B
	LD	L,C
	CALL	RD_PIX
	LD	C,A
	LD	A,(XOLOR)
	CP	C
	RET	NZ
	CALL	WRT_PIX
	LD	HL,(CONMAX)
	LD	DE,(TEMP_Y)
	LD	BC,(TEMP_X)
	LD	(HL),E
	INC	HL
	LD	(HL),D
	INC	HL
	LD	(HL),C
	INC	HL
	LD	(HL),B
	INC	HL
	PUSH	HL
	LD	BC,LIMIT
	AND	A
	SBC	HL,BC
	JR	NZ,PASS_1
	POP	HL
	LD	HL,ENDBF	;END
	PUSH	HL
PASS_1	POP	HL
	LD	(CONMAX),HL
	RET 

XOLOR	DB	0
CONMIN	DW	0
CONMAX	DW	0
TEMP_Y	DW	0
TEMP_X	DW	0
ENDBF
BUFFER	DW	0,0
	DS	1600	;/4!!!	2000
LIMIT

SQRLEN	DW	0
SQR_X1	DW	0
SQRHGT	DW	0
SQR_Y1	DW	0


SQUAR	LD	C,3
	CALL	INTMOUS
	LD	BC,(X_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	LD	BC,(Y_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	XOR	A
	LD	(PREVX),HL
	LD	(PREVY),DE
	LD	(STARX),HL
	LD	(STARY),DE
SQUAR2	CALL	READCRD
	JP	NZ,SQUARR
	LD	A,(ZOOMMOD)
	PUSH	HL
	LD	BC,(PREVX)
	AND	A
	SBC	HL,BC
	JP	NZ,SQUR2
	LD	HL,(PREVY)
	AND	A
	SBC	HL,DE
	JP	NZ,SQUR2
	POP	HL
	JP	SQUAR2
SQUR2	POP	HL
	LD	(PREVX),HL
	LD	(PREVY),DE
	CALL	OUTSQUR
	JP	SQUAR2

SQUARR	OR	A
	RET	Z
	LD	HL,(STARX)
	LD	DE,(PREVX)
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREVY)
	EXX 
	CALL	SQUAR_3
	XOR	A
	RET 

OUTSQUR
	LD	HL,(STARX)
	LD	DE,(PREV2X)
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREV2Y)
	EXX 
	CALL	SQUAR_1
	LD	HL,(STARX)
	LD	DE,(PREVX)
	LD	(PREV2X),DE
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREVY)
	LD	(PREV2Y),DE
	EXX 
	CALL	SQUAR_2
	RET 

SQUAR_1	LD	A,2
	LD	(PIXEL+1),A
	JP	SQUARD

SQUAR_2	LD	A,0
	LD	(PIXEL+1),A
	JP	SQUARD

SQUAR_3	LD	A,1
	LD	(PIXEL+1),A
	JP	SQUARD

; HL - X1   HL'- Y1
; DE - X2   DE'- Y2

SQUARD	AND	A
	LD	B,H
	LD	C,L
	SBC	HL,DE
	JR	NC,SQ1
	LD	H,B
	LD	L,C
	EX	DE,HL
	AND	A
	SBC	HL,DE
SQ1	RET	Z
	LD	(SQRLEN),HL
	LD	(SQR_X1),DE
	EXX 
	AND	A
	LD	B,H
	LD	C,L
	SBC	HL,DE
	JR	NC,SQ2
	LD	H,B
	LD	L,C
	EX	DE,HL
	AND	A
	SBC	HL,DE
SQ2	RET	Z
	LD	(SQRHGT),HL
	LD	(SQR_Y1),DE
	EXX 
	LD	HL,(SQR_X1)
	LD	DE,(SQR_Y1)
	LD	BC,(SQRLEN)
SQQ1	PUSH	HL
	CALL	PIXEL
	POP	HL
	INC	HL
	DEC	BC
	LD	A,B
	OR	C
	JP	NZ,SQQ1
	LD	BC,(SQRHGT)
SQQ2	PUSH	HL
	CALL	PIXEL
	POP	HL
	INC	DE
	DEC	BC
	LD	A,B
	OR	C
	JP	NZ,SQQ2
	LD	BC,(SQRLEN)
SQQ3	PUSH	HL
	CALL	PIXEL
	POP	HL
	DEC	HL
	DEC	BC
	LD	A,B
	OR	C
	JP	NZ,SQQ3
	LD	BC,(SQRHGT)
SQQ4	PUSH	HL
	CALL	PIXEL
	POP	HL
	DEC	DE
	DEC	BC
	LD	A,B
	OR	C
	JP	NZ,SQQ4
	RET 


LINES	LD	C,3
	CALL	INTMOUS
	LD	BC,(X_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	LD	BC,(Y_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	XOR	A
	LD	(PREVX),HL
	LD	(PREVY),DE
	LD	(STARX),HL
	LD	(STARY),DE
LINES2	CALL	READCRD
	JP	NZ,ELINR
	LD	A,(ZOOMMOD)
	PUSH	HL
	LD	BC,(PREVX)
	AND	A
	SBC	HL,BC
	JP	NZ,PLIN2
	LD	HL,(PREVY)
	AND	A
	SBC	HL,DE
	JP	NZ,PLIN2
	POP	HL
	JP	LINES2
PLIN2	POP	HL
	LD	(PREVX),HL
	LD	(PREVY),DE
	CALL	OUTXLIN
	JP	LINES2

ELINR	OR	A
	RET	Z
	LD	HL,(STARX)
	LD	DE,(STARY)
	LD	H,E
;	EXX
	LD	DE,(PREVX)
	LD	BC,(PREVY)
	LD	D,C
	CALL	LINEW
	XOR	A
	RET 

OUTXLIN
	LD	HL,(STARX)
	LD	DE,(STARY)
	LD	H,E
;	EXX
	LD	DE,(PREV2X)
	LD	BC,(PREV2Y)
	LD	D,C
	CALL	LINER
	LD	HL,(STARX)
	LD	DE,(STARY)
	LD	H,E
;	EXX
	LD	DE,(PREVX)
	LD	BC,(PREVY)
	LD	(PREV2X),DE
	LD	(PREV2Y),BC
	LD	D,C
	CALL	LINE
;	EXX
	RET 


LINEW	PUSH	HL
	PUSH	DE
	PUSH	BC
	LD	A,1
	LD	(DOT+1),A
	JP	LINN

LINER	PUSH	HL
	PUSH	DE
	PUSH	BC
	LD	A,2
	LD	(DOT+1),A
	JP	LINN

LINE   PUSH    HL   ; line from	p1(l,h)	to p2(e,d)
       PUSH    DE
       PUSH    BC
	XOR	A
	LD	(DOT+1),A
LINN   PUSH IX
       LD   B,#15
       LD   C,#1D
       LD   A,E
       SUB  L
       JR   NC,M1LIN
       NEG 
       EX   DE,HL
M1LIN  LD   L,A
       LD   A,D
       SUB  H
       JR   NC,M2LIN
       NEG 
       DEC  B
M2LIN  LD   H,A
       CP   L
       JR   C,M3LIN
       LD   A,B
       LD   B,C
       LD   C,A
       LD   A,H
       LD   H,L
       LD   L,A
M3LIN  LD   A,B
       LD   (DEPENC),A
       LD   A,C
       LD   (INDEPC),A
       PUSH DE
       LD   C,L
       LD   E,L
       LD   L,H
       CALL DIVB
       LD   A,E
       LD   (SIMLIN+1),A
       LD   L,C
       LD   A,L
       LD   (LDLIN+1),A
       LD   A,D
       LD   (DECLIN+1),A
       OR   A
       LD   B,E
       RR   B
       INC  B
       OR   A
       RR   C
       POP  DE
       INC  L
       JR   L4LIN
SIMLIN LD   B,#FF
L4LIN  PUSH HL
       CALL DOT
       POP  HL
INDEPC DEC  D
       DEC  L
       JR   Z,RETLIN
       LD   A,C
DECLIN SUB  #02
       LD   C,A
       JR   C,LDLIN
       DJNZ L4LIN
DEPENC DEC  E
       JR   SIMLIN
LDLIN  ADD  A,#FF
       LD   C,A
       JR   L4LIN
RETLIN POP  IX
       POP     BC
       POP     DE
       POP     HL
       RET 

DOT	LD	A,#00
	OR	A
	JP	NZ,DOT2
DOT1	PUSH	DE
	PUSH	BC
	LD	L,E
	LD	H,0
	LD	E,D
	LD	D,0
	CALL	PUTPNT2
	POP	BC
	POP	DE
	RET 

DOT2	DEC	A
	JP	NZ,DOT3
	PUSH	DE
	PUSH	BC
	LD	L,E
	LD	H,0
	LD	E,D
	LD	D,0
	CALL	PUTPIX
	POP	BC
	POP	DE
	RET 

DOT3	PUSH	DE
	PUSH	BC
	LD	L,E
	LD	H,0
	LD	E,D
	LD	D,0
	CALL	GETPIX
	CALL	PUTPNT3
	POP	BC
	POP	DE
	RET 


DIVB   LD   D,0	;E/L--E	(MOD in	D)
DIVB2  PUSH HL ;DE/L--E
       PUSH BC
       LD   B,8
       EX   DE,HL
       LD   D,E
       LD   E,0
DIV1B  OR   A
       RR   D
       RR   E
       SBC  HL,DE
       JR   NC,MDIVB
       ADD  HL,DE
MDIVB  RLA 
       DJNZ DIV1B
       CPL 
       LD   D,L
       LD   E,A
       POP  BC
       POP  HL
       RET 

ELIPS	LD	C,3
	CALL	INTMOUS
	LD	BC,(X_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	LD	BC,(Y_)
	AND	A
	SBC	HL,BC
	EX	DE,HL
	XOR	A
	LD	(PREVX),HL
	LD	(PREVY),DE
	LD	(STARX),HL
	LD	(STARY),DE
ELIPS2	CALL	READCRD
	JP	NZ,ELIPR
	LD	A,(ZOOMMOD)
	PUSH	HL
	LD	BC,(PREVX)
	AND	A
	SBC	HL,BC
	JP	NZ,PELP2
	LD	HL,(PREVY)
	AND	A
	SBC	HL,DE
	JP	NZ,PELP2
	POP	HL
	JP	ELIPS2
PELP2	POP	HL
	LD	(PREVX),HL
	LD	(PREVY),DE
	CALL	OUTELIP
	JP	ELIPS2

ELIPR	OR	A
	RET	Z
	LD	HL,(STARX)
	LD	DE,(PREVX)
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREVY)
	EXX 
	CALL	ELLIPS3
	XOR	A
	RET 

OUTELIP
	LD	HL,(STARX)
	LD	DE,(PREV2X)
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREV2Y)
	EXX 
	CALL	ELLIPS1
	LD	HL,(STARX)
	LD	DE,(PREVX)
	LD	(PREV2X),DE
	EXX 
	LD	HL,(STARY)
	LD	DE,(PREVY)
	LD	(PREV2Y),DE
	EXX 
	CALL	ELLIPS2
	RET 

ELLIPS1	LD	A,2
	LD	(PIXEL+1),A
	JP	ELLIPSE

ELLIPS2	LD	A,0
	LD	(PIXEL+1),A
	JP	ELLIPSE

ELLIPS3	LD	A,1
	LD	(PIXEL+1),A
	JP	ELLIPSE

; HL - X1   HL'- Y1
; DE - X2   DE'- Y2


ELLIPSE	AND	A
	LD	B,H
	LD	C,L
	SBC	HL,DE
	JR	NC,EL1
	LD	H,B
	LD	L,C
	EX	DE,HL
	AND	A
	SBC	HL,DE
EL1	SRL	H
	RR	L
	LD	A,H
	OR	L
	RET	Z
	INC	HL
	LD	(minor),HL
	ADD	HL,DE
	LD	(Xo),HL
	EXX 
	AND	A
	LD	B,H
	LD	C,L
	SBC	HL,DE
	JR	NC,EL2
	LD	H,B
	LD	L,C
	EX	DE,HL
	AND	A
	SBC	HL,DE
EL2	SRL	H
	RR	L
	LD	A,H
	OR	L
	RET	Z
	INC	HL
	LD	(major),HL
	ADD	HL,DE
	LD	(Yo),HL
	EXX 
	JP	START

;+-------------------------------------------------------+
;| MACHINE CODE	ELLIPSE	DRAWING	ROUTINES (TURBO	VERSION!)|
;+-------------------------------------------------------+

;(Xo),(Yo) = centre of ellipse
;(major),(minor) = the axes of the ellipse


;MULTIPLICATION	ROUTINE	:
;
;Multiplies BC by HL-DE
;giving	32 bit result in HL-IX

mul32
	LD	IX,0
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	ADD	IX,IX
	ADC	HL,HL
	RL	E
	RL	D
	JP	NC,$+9
	ADD	IX,BC
	JP	NC,$+4
	INC	HL
	RET 

;WORKSPACE :
;
;Ellipse axes:

minor	DW	95
major	DW	95

;Ellipse centre:

Xo	DW	127
Yo	DW	96

;Current plot point:

Xi	DS	2
Yi	DS	2

;Work variables:

a2	DS	4
a2s	DS	4
b2	DS	4
b2s	DS	4

DELTAi	DS	4


START	LD	HL,#0000
	LD	(Xi),HL
	LD	HL,(major)
	LD	(Yi),HL

;Initialise work variables:
	LD	B,H		; a2=a*a
	LD	C,L
	LD	DE,#0000
	CALL	mul32
	LD	(a2),IX
	LD	(a2+2),HL

	LD	(a2s),IX	; a2s=a2
	LD	(a2s+2),HL

	LD	HL,(minor)
	LD	B,H		; b2=b*b
	LD	C,L
	LD	DE,#0000
	CALL	mul32
	LD	(b2),IX
	LD	(b2s),HL

	LD	HL,(Yi)		; b2s=b2*(2*Yi+1)
	ADD	HL,HL
	INC	HL
	LD	B,H
	LD	C,L
	LD	HL,(b2)
	LD	DE,(b2+2)
	CALL	mul32
	LD	(b2s),IX
	LD	(b2s+2),HL

	LD	HL,#0001	;DELTAi=2*(1-b)
	LD	DE,(minor)
	OR	A
	SBC	HL,DE
	ADD	HL,HL
	LD	(DELTAi),HL

;Sign extend to	32 bit (requires b>0)
	LD	HL,#FFFF
	LD	(DELTAi+2),HL

;Main calculation loop:
MLOOOP
	LD	HL,(Yi)		;While Yi>0
	BIT	7,H
	RET	NZ
	LD	DE,(Xi)

;HL already has	(Yi)
;
;Plot four points of the ellipse (by symmetry)
;
;We actually plot (Xi,Yi),(-Xi,Yi),(-Xi,-Yi),(Xi,-Yi)

	PUSH	DE
	PUSH	DE
	PUSH	HL
	CALL	SPOINT	      ;	(Xi,Yi)
	POP	HL
	POP	DE
	PUSH	HL
	LD	A,D		;Negate	Xi
	CPL 
	LD	D,A
	LD	A,E
	CPL 
	LD	E,A
	INC	DE
	PUSH	DE
	CALL	SPOINT	      ;	(-Xi,Yi)
	POP	DE
	POP	HL
	LD	A,H		;Negate	Yi
	CPL 
	LD	H,A
	LD	A,L
	CPL 
	LD	L,A
	INC	HL
	PUSH	HL
	CALL	SPOINT	      ;	(-Xi,-Yi)
	POP	HL
	POP	DE
	CALL	SPOINT	      ;	(Xi,-Yi)

	LD	DE,(DELTAi)	; if DELTAi>0
	LD	HL,(DELTAi+2)
	CALL	TSDEHL
	JP	Z,godiag
	JP	NC,gohoriz

	LD	HL,(DELTAi)	;DELTAi=DELTAi+DELTAi+a2s
	ADD	HL,HL
	EX	DE,HL
	LD	HL,(DELTAi+2)
	ADC	HL,HL
	EX	DE,HL
	LD	BC,(a2s)
	OR	A
	SBC	HL,BC
	EX	DE,HL
	LD	BC,(a2s+2)
	SBC	HL,BC
	CALL	TSDEHL	      ;if DELTAi<=0
	JP	Z,godiag
	JP	NC,godiag
	CALL	VERTIC
	JP	MLOOOP

gohoriz
	LD	HL,(DELTAi)	;DELTAi=DELTAi+DELTAi+b2s
	ADD	HL,HL
	EX	DE,HL
	LD	HL,(DELTAi+2)
	ADC	HL,HL
	EX	DE,HL
	LD	BC,(b2s)
	ADD	HL,BC
	EX	DE,HL
	LD	BC,(b2s+2)
	ADC	HL,BC
	CALL	TSDEHL	      ;if DELTAi<=0
	JP	Z,horiz
	JP	NC,horiz

godiag

;Make a	diagonal step (go up ten along)
	CALL	VERTIC

;Make a	horizontal step
horiz
	LD	HL,(Xi)
	INC	HL
	LD	(Xi),HL

;a2s=a2s+a2+a2
	LD	HL,(a2s)
	LD	DE,(a2)
	ADD	HL,DE
	LD	(ceil1+1),HL
	LD	HL,(a2s+2)
	LD	DE,(a2+2)
	ADC	HL,DE
	PUSH	HL
ceil1	LD	HL,0
	LD	DE,(a2)
	ADD	HL,DE
	LD	(a2s),HL
	POP	HL
	LD	DE,(a2+2)
	ADC	HL,DE
	LD	(a2s+2),HL

;DELTAi=DELTAi+a2s
	PUSH	HL
	LD	HL,(DELTAi)
	LD	DE,(a2s)
	ADD	HL,DE
	LD	(DELTAi),HL
	LD	HL,(DELTAi+2)
	POP	DE
	ADC	HL,DE
	LD	(DELTAi+2),HL
	JP	MLOOOP

VERTIC

;Make a	vertical step
	LD	HL,(Yi)
	DEC	HL
	LD	(Yi),HL

;b2s=b2s-b2-b2
	LD	HL,(b2s)
	LD	DE,(b2)
	OR	A
	SBC	HL,DE
	LD	(ceil2+1),HL
	LD	HL,(b2s+2)
	LD	DE,(b2+2)
	SBC	HL,DE
	PUSH	HL
ceil2	LD	HL,0
	LD	DE,(b2)
	OR	A
	SBC	HL,DE
	LD	(b2s),HL
	POP	HL
	LD	DE,(b2+2)
	SBC	HL,DE
	LD	(b2s+2),HL

;DELTAi=DELTAi-b2s
	PUSH	HL
	LD	HL,(DELTAi)
	LD	DE,(b2s)
	OR	A
	SBC	HL,DE
	LD	(DELTAi),HL
	LD	HL,(DELTAi+2)
	POP	DE
	SBC	HL,DE
	LD	(DELTAi+2),HL
	RET 

;Test the 32-bit number	in HL-DE for its sign
TSDEHL
	OR	A
	BIT	7,H
;NC,NZ means les than zero
	RET	NZ
	LD	A,D
	OR	E
	SCF 
;C,NZ means greater than zero
	RET	NZ
	LD	A,H
	OR	L
	SCF 
	RET 

;Plot routine:

SPOINT	LD	BC,(Yo)
	ADD	HL,BC
	EX	DE,HL
	LD	BC,(Xo)
	ADD	HL,BC
	CALL	PIXEL
	RET 


