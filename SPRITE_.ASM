
X	EQU	BLACK
g	EQU	DGRAY
G	EQU	GRAY
W	EQU	WHITE
Y	EQU	BYELLOW
y	EQU	YELLOW
u	EQU	BLUE

SPRITE_
	DEFW	149	;SIZE
	DEFW	11	;CX
	DEFW	13	;CY
	DEFB	X,X,X,X,X,X,X,X,G,G,G
	DEFB	X,W,W,W,W,W,W,X,X,G,G
	DEFB	X,W,W,W,W,W,W,X,W,X,G
	DEFB	X,W,W,W,W,W,W,X,X,X,X
	DEFB	X,W,W,W,W,W,W,W,W,W,X
	DEFB	X,W,W,W,W,W,W,W,W,W,X
	DEFB	X,W,W,W,W,W,W,W,W,W,X
	DEFB	X,W,W,W,W,W,W,W,W,W,X
	DEFB	X,W,W,W,W,W,W,W,W,W,X
	DEFB	X,W,W,W,W,W,W,W,W,W,X
	DEFB	X,W,W,W,W,W,W,W,W,W,X
	DEFB	X,W,W,W,W,W,W,W,W,W,X
	DEFB	X,X,X,X,X,X,X,X,X,X,X

;SPRITE	2
	DEFW	202	;SIZE
	DEFW	14	;CX
	DEFW	14	;CY
	DEFB	g,g,g,g,g,g,g,g,g,g,g,g,g,X
	DEFB	g,W,W,W,W,W,W,W,W,W,W,W,W,X
	DEFB	g,W,W,W,W,W,W,W,W,W,W,W,W,X
	DEFB	g,W,W,W,W,W,W,W,W,W,W,W,W,X
	DEFB	g,g,g,g,g,g,g,g,g,g,g,g,g,X
	DEFB	g,g,g,g,g,g,X,X,g,g,g,g,g,X
	DEFB	g,g,g,g,g,X,g,g,W,g,g,g,g,X
	DEFB	g,g,g,g,g,X,g,g,W,g,g,g,g,X
	DEFB	g,g,g,g,g,g,W,W,g,g,g,g,g,X
	DEFB	g,g,g,g,g,g,g,g,g,g,g,g,g,X
	DEFB	g,g,g,g,g,g,X,W,g,g,g,g,g,X
	DEFB	g,g,g,g,g,g,X,W,g,g,g,g,g,X
	DEFB	g,g,g,g,g,g,g,g,g,g,g,g,g,X
	DEFB	X,X,X,X,X,X,X,X,X,X,X,X,X,X

;SPRITE	3
	DEFW	201	;SIZE
	DEFW	15	;CX
	DEFW	13	;CY
	DEFB	G,G,G,G,G,G,G,G,G,X,X,X,G,G,G
	DEFB	G,G,G,G,G,G,G,G,X,G,G,G,X,G,X
	DEFB	G,G,G,G,G,G,G,G,G,G,G,G,G,X,X
	DEFB	G,X,X,X,G,G,G,G,G,G,G,G,X,X,X
	DEFB	X,Y,W,Y,X,X,X,X,X,X,X,G,G,G,G
	DEFB	X,W,Y,W,Y,W,Y,W,Y,W,X,G,G,G,G
	DEFB	X,Y,W,Y,W,Y,W,Y,W,Y,X,G,G,G,G
	DEFB	X,W,Y,W,Y,X,X,X,X,X,X,X,X,X,X
	DEFB	X,Y,W,Y,X,y,y,y,y,y,y,y,y,y,X
	DEFB	X,W,Y,X,y,y,y,y,y,y,y,y,y,X,G
	DEFB	X,Y,X,y,y,y,y,y,y,y,y,y,X,G,G
	DEFB	X,X,y,y,y,y,y,y,y,y,y,X,G,G,G
	DEFB	G,X,X,X,X,X,X,X,X,X,X,G,G,G,G

;SPRITE	4
;	DEFW	132	;SIZE
;	DEFW	9	;CX
;	DEFW	14	;CY
;	DEFB	G,G,X,G,G,G,X,G,G
;	DEFB	G,G,X,G,G,G,X,G,G
;	DEFB	G,G,X,G,G,G,X,G,G
;	DEFB	G,G,X,X,G,X,X,G,G
;	DEFB	G,G,G,X,G,X,G,G,G
;	DEFB	G,G,G,X,X,X,G,G,G
;	DEFB	G,G,G,G,X,G,G,G,G
;	DEFB	G,G,G,u,X,u,G,G,G
;	DEFB	G,G,G,u,G,u,u,u,G
;	DEFB	G,u,u,u,G,u,G,G,u
;	DEFB	u,G,G,u,G,u,G,G,u
;	DEFB	u,G,G,u,G,u,G,G,u
;	DEFB	u,G,G,u,G,G,u,u,G
;	DEFB	G,u,u,G,G,G,G,G,G

	DEFW	156	;SIZE
	DEFW	10	;CX
	DEFW	15	;CY
	DEFB	G,G,g,G,G,G,g,G,G,G
	DEFB	G,G,g,W,G,G,g,W,G,G
	DEFB	G,G,g,W,G,G,g,W,G,G
	DEFB	G,G,g,g,G,g,g,W,G,G
	DEFB	G,G,G,g,W,g,W,W,G,G
	DEFB	G,G,G,g,g,g,W,G,G,G
	DEFB	G,G,G,G,g,W,W,G,G,G
	DEFB	G,G,G,g,g,g,G,G,G,G
	DEFB	G,G,G,g,W,g,g,g,G,G
	DEFB	G,g,g,g,W,g,W,W,g,G
	DEFB	g,G,W,g,W,g,W,G,g,W
	DEFB	g,W,G,g,W,g,W,G,g,W
	DEFB	g,W,G,g,W,G,g,g,G,W
	DEFB	G,g,g,G,W,G,G,W,W,G
	DEFB	G,G,W,W,G,G,G,G,G,G

;SPRITE	5
;	DEFW	201	;SIZE
;	DEFW	15	;CX
;	DEFW	13	;CY
;	DEFB	X,X,X,X,X,X,G,G,G,G,G,G,G,G,G
;	DEFB	X,W,W,W,W,X,X,G,G,G,G,G,G,G,G
;	DEFB	X,W,W,W,W,X,W,X,G,G,G,G,G,G,G
;	DEFB	X,W,X,X,W,X,u,u,u,u,u,u,G,G,G
;	DEFB	X,W,W,W,W,W,u,W,W,W,W,u,u,G,G
;	DEFB	X,W,X,X,X,X,u,W,W,W,W,u,W,u,G
;	DEFB	X,W,W,W,W,W,u,W,u,u,W,u,u,u,u
;	DEFB	X,W,X,X,X,X,u,W,W,W,W,W,W,W,u
;	DEFB	X,W,W,W,W,W,u,W,u,u,u,u,u,W,u
;	DEFB	X,X,X,X,X,X,u,W,W,W,W,W,W,W,u
;	DEFB	G,G,G,G,G,G,u,W,u,u,u,u,u,W,u
;	DEFB	G,G,G,G,G,G,u,W,W,W,W,W,W,W,u
;	DEFB	G,G,G,G,G,G,u,u,u,u,u,u,u,u,u

	DEFW	230	;SIZE
	DEFW	16	;CX
	DEFW	14	;CY
	DEFB	g,g,g,g,g,g,G,G,G,G,G,G,G,G,G,G
	DEFB	g,W,W,W,W,g,g,G,G,G,G,G,G,G,G,G
	DEFB	g,W,G,G,G,g,W,g,G,G,G,G,G,G,G,G
	DEFB	g,W,g,g,G,g,g,g,g,g,g,g,G,G,G,G
	DEFB	g,W,G,W,W,G,g,W,W,W,W,g,g,G,G,G
	DEFB	g,W,g,g,g,g,g,W,G,G,G,g,W,g,G,G
	DEFB	g,W,G,W,W,W,g,W,g,g,G,g,g,g,g,G
	DEFB	g,W,g,g,g,g,g,W,G,W,W,G,W,W,g,W
	DEFB	g,W,G,W,W,W,g,W,g,g,g,g,g,G,g,W
	DEFB	g,g,g,g,g,g,g,W,G,W,W,W,W,W,g,W
	DEFB	G,W,W,W,W,W,g,W,g,g,g,g,g,G,g,W
	DEFB	G,G,G,G,G,G,g,W,G,W,W,W,W,W,g,W
	DEFB	G,G,G,G,G,G,g,g,g,g,g,g,g,g,g,W
	DEFB	G,G,G,G,G,G,G,W,W,W,W,W,W,W,W,W

;SPRITE	6
	DEFW	214	;SIZE
	DEFW	16	;CX
	DEFW	13	;CY
	DEFB	G,X,X,X,X,X,Y,Y,X,X,X,X,X,G,G,G
	DEFB	X,y,g,y,X,Y,X,X,Y,X,g,y,g,X,G,G
	DEFB	X,g,y,X,G,G,G,G,G,G,X,g,y,X,G,G
	DEFB	X,y,g,X,X,X,X,X,X,X,X,y,g,X,G,G
	DEFB	X,g,y,g,y,g,y,g,y,g,y,g,y,X,G,G
	DEFB	X,y,g,y,g,y,u,u,u,u,u,u,u,X,G,G
	DEFB	X,g,y,g,y,g,u,W,W,W,W,W,u,u,G,G
	DEFB	X,y,g,y,g,y,u,W,W,W,W,W,u,W,u,G
	DEFB	X,g,y,g,y,g,u,W,u,u,u,W,u,u,u,u
	DEFB	X,y,g,y,g,y,u,W,W,W,W,W,W,W,W,u
	DEFB	X,g,y,g,y,g,u,W,u,u,u,u,u,u,W,u
	DEFB	G,X,X,X,X,X,u,W,W,W,W,W,W,W,W,u
	DEFB	G,G,G,G,G,G,u,u,u,u,u,u,u,u,u,u

;SPRITE	7
	DEFW	126	;SIZE
	DEFW	12	;CX
	DEFW	10	;CY
	DEFB	G,G,G,G,X,X,X,X,G,G,G,G
	DEFB	G,G,X,X,G,G,G,G,X,X,G,G
	DEFB	G,X,G,G,G,G,G,G,G,G,X,G
	DEFB	X,G,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,G,X
	DEFB	G,X,G,G,G,G,G,G,G,G,X,G
	DEFB	G,G,X,X,G,G,G,G,X,X,G,G
	DEFB	G,G,G,G,X,X,X,X,G,G,G,G

;SPRITE	8
	DEFW	105	;SIZE
	DEFW	11	;CX
	DEFW	9	;CY
	DEFB	X,X,X,X,X,X,X,X,X,X,X
	DEFB	X,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G,X
	DEFB	X,X,X,X,X,X,X,X,X,X,X

;SPRITE	9
	DEFW	86	;SIZE
	DEFW	10	;CX
	DEFW	8	;CY
	DEFB	X,X,G,X,X,G,X,X,G,X
	DEFB	G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G
	DEFB	G,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,X
	DEFB	X,G,G,G,G,G,G,G,G,G
	DEFB	G,G,G,G,G,G,G,G,G,X
	DEFB	X,X,G,X,X,G,X,X,G,X

;SPRITE	10
	DEFW	97	;SIZE
	DEFW	7	;CX
	DEFW	13	;CY
	DEFB	G,G,G,G,G,X,G
	DEFB	G,G,G,G,X,Y,X
	DEFB	G,G,G,X,X,X,X
	DEFB	G,G,G,X,Y,X,G
	DEFB	G,G,X,Y,Y,X,G
	DEFB	G,G,X,Y,X,G,G
	DEFB	G,X,Y,Y,X,G,G
	DEFB	G,X,Y,X,G,G,G
	DEFB	X,X,Y,X,G,G,G
	DEFB	X,X,X,G,G,G,G
	DEFB	X,X,X,G,G,G,G
	DEFB	X,X,G,G,G,G,G
	DEFB	X,G,G,G,G,G,G

;SPRITE	11
	DEFW	96	;SIZE
	DEFW	10	;CX
	DEFW	9	;CY
	DEFB	X,X,G,G,G,G,G,G,G,G
	DEFB	G,X,X,G,G,G,G,G,G,G
	DEFB	G,G,X,X,G,G,G,G,G,G
	DEFB	G,G,G,X,X,G,G,G,G,G
	DEFB	G,G,G,G,X,X,G,G,G,G
	DEFB	G,G,G,G,G,X,X,G,G,G
	DEFB	G,G,G,G,G,G,X,X,G,G
	DEFB	G,G,G,G,G,G,G,X,X,G
	DEFB	G,G,G,G,G,G,G,G,X,X


;SPRITE	12
	DEFW	188	;SIZE
	DEFW	13	;CX
	DEFW	14	;CY
	DEFB	G,G,G,G,X,X,X,G,G,G,G,G,G
	DEFB	G,G,X,X,G,G,G,X,X,G,G,G,G
	DEFB	G,X,g,W,W,W,G,G,g,X,G,G,G
	DEFB	G,X,W,W,G,G,G,G,G,X,G,G,G
	DEFB	X,G,W,G,G,G,G,G,G,G,X,G,G
	DEFB	X,G,W,G,G,G,G,G,G,G,X,G,G
	DEFB	X,G,G,G,G,G,G,G,G,G,X,G,G
	DEFB	G,X,G,G,G,G,G,G,W,X,G,G,G
	DEFB	G,X,g,G,G,G,G,W,g,X,g,G,G
	DEFB	G,G,X,X,G,G,W,g,u,u,u,G,G
	DEFB	G,G,G,G,X,X,X,u,G,u,u,u,G
	DEFB	G,G,G,G,G,G,G,G,u,G,u,u,u
	DEFB	G,G,G,G,G,G,G,G,G,u,G,u,u
	DEFB	G,G,G,G,G,G,G,G,G,G,u,u,G

;SPRITE	13
	DEFW	48	;SIZE
	DEFW	7	;CX
	DEFW	6	;CY
	DEFB	X,X,G,G,G,X,X
	DEFB	G,X,X,G,X,X,G
	DEFB	G,G,X,X,X,G,G
	DEFB	G,G,X,X,X,G,G
	DEFB	G,X,X,G,X,X,G
	DEFB	X,X,G,G,G,X,X




