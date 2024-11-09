prog1 START 0

    CLEAR A
    LDX #0
    LDA stLoptic
    MUL ODMIK
    STA MAX_DUZINA


TJA CLEAR A 
    LDA stevec
    COMP stLoptic   .Za postavljanje kordinata x i y
    JEQ LOOP1

    CLEAR A         .Za randomX
    LDA aaa
    MUL randomX
    ADD ccc
    STA pomocMOD
    DIV mx
    MUL mx
    STA pomocMOD1
    LDA pomocMOD
    SUB pomocMOD1
    STA tx, X
    STA randomX

    CLEAR A         .Za randomY
    LDA aaa
    MUL randomY
    ADD ccc
    STA pomocMOD
    DIV my
    MUL my
    STA pomocMOD1
    LDA pomocMOD
    SUB pomocMOD1
    STA ty, X
    STA randomY

    CLEAR A         .Za randomDx
    STX prosloX
    LDX INDEX
    LDA NIZ, X
    LDX prosloX
    STA dx, X
    LDA INDEX
    ADD ODMIK
    COMP VELIKOST_NIZA
    JEQ NUL1
VRNI1    STA INDEX

    CLEAR A         .Za randomDx
    STX prosloX
    LDX INDEX
    LDA NIZ, X
    LDX prosloX
    STA dy, X
    LDA INDEX
    ADD ODMIK
    COMP VELIKOST_NIZA
    JEQ NUL2
VRNI2    STA INDEX


    LDA stevec
    ADD ENA
    STA stevec
    LDA pomocX
    ADD ODMIK
    STA pomocX
    LDX pomocX
    J TJA   


.....................................
     
LOOP1    LDX #0
LOOP    CLEAR A

    
    LDA TRENUTNA_LOKACIJA
    STA STARA_LOKACIJA, X

    

VRNI LDX TRENUTNI_ODMIK
      

    CLEAR A     .Povecanje/Smanjivanje y kordinate
    LDA ty, X 
    ADD dy, X
    STA ty, X

    CLEAR A     .Povecanje/Smanjivanje x kordinate
    LDA tx, X
    ADD dx, X
    STA tx, X


    CLEAR A     .Racunanje memoriske lokacije za ispis
    LDA ty, X
    MUL VELIKOST_VRSTICE
    ADD ZACETEK
    ADD tx, X
    STA TRENUTNA_LOKACIJA

    CLEAR A     .Provera donje granice y ose (donja horizontala)
    LDA ty, X
    COMP my 
    JGT OHG 

    CLEAR A     .Provera gornje granice y ose (gornja horizontala)
    LDA ty, X
    COMP min 
    JLT OHD

PROVERA    CLEAR A     .Provera desne granice x ose (desna vertikala)
    LDA tx, X
    COMP mx
    JGT OVD

    CLEAR A     .Provera leve granice x ose (leva vertikala)
    LDA tx, X
    COMP min
    JLT OVL

ISPIS    LDT BLANK
    CLEAR A             .Vpis BLANKA
    LDA STARA_LOKACIJA, X
    STA POMOC
    +STT @POMOC
    
    LDT DOT
    +STT @TRENUTNA_LOKACIJA
    

    CLEAR A    .Povecava ODMIK za 0x3 da pristupi kordinatama sledece loptice
    LDA TRENUTNI_ODMIK
    ADD ODMIK
    STA TRENUTNI_ODMIK

    CLEAR A
    LDA TRENUTNI_ODMIK
    COMP MAX_DUZINA
    JEQ NULIRAJ

    J LOOP

........................
OHG  CLEAR A
    LDA dy, X
    SUB #1
    SUB #1
    STA dy, X
    J PROVERA
........................
........................
OHD  CLEAR A
    LDA dy, X
    ADD #1
    ADD #1
    STA dy, X
    J PROVERA
........................
........................
OVD  CLEAR A
    LDA dx, X
    SUB #1
    SUB #1
    STA dx, X
    J ISPIS
........................
........................
OVL  CLEAR A
    LDA dx, X
    ADD #1
    ADD #1
    STA dx, X
    J ISPIS
........................
NULIRAJ CLEAR A
    LDA #0
    STA TRENUTNI_ODMIK
    J LOOP

NUL1 CLEAR A
    LDA #0
    STA INDEX
    J VRNI1

NUL2 CLEAR A
    LDA #0
    STA INDEX
    J VRNI2


halt J halt

stLoptic WORD 0xA         .stevilo loptic
stLoptic1 EQU 0xA
MAX_DUZINA WORD 0x0          .maksimalna duzina niza 
ODMIK   WORD 0x3             .ODMIK
TRENUTNI_ODMIK WORD 0x0
x   WORD 0x0              .x - kordinate
x1  WORD 0x1              .0x4F - MAX levo
y   WORD 0x0              .y - kordinate
y1  WORD 0x1           .0x18 - MAX dole
DOT BYTE X'00D7'          .Znak za žogo
BLANK BYTE X'0000'        .BLANK
ZACETEK WORD 0x0B7FF        .0x0B8EE
VELIKOST_VRSTICE WORD 0x50         .VELIKOST_VRSTICE
TRENUTNA_LOKACIJA WORD 0x0B7FE     .TRENUTNA_LOKACIJA
STARA_LOKACIJA RESW stLoptic1

dx RESW stLoptic1           .Vektor pomeraja x osa

dy RESW stLoptic1           .Vektor pomeraja y osa


tx RESW stLoptic1           .Trenutne x kordinate

ty RESW stLoptic1           .Trenutne y kordinate

    

mx WORD 0x4E          .0x4F - MAX levo
my WORD 0x17          .0x18 - MAX dole
min WORD 0x1          .min - MIN levo i MIN dole
POMOC WORD 0          .pomoc za indeksno naslavljanje

VREDNOST1 EQU 0x1
VREDNOST2 EQU 0x0
VREDNOST3 EQU 0xFFFFFF
NIZ WORD 0x1
    WORD 0xFFFFFF
    WORD 0xFFFFFF
    WORD 0x1
    WORD 0xFFFFFF
    WORD 0xFFFFFF
    WORD 0x1
    WORD 0x1
    WORD 0xFFFFFF
    WORD 0x0
VELIKOST_NIZA WORD 0x1E
INDEX WORD 0x0

randomX WORD 0x1        .randomX
randomY WORD 0x1        .randomY
aaa WORD 0x7            .Constanta za LCG (Linear Congruential Generator)
ccc WORD 0xD            .Constanta za LCG (Linear Congruential Generator)
stevec WORD 0x0

pomocMOD WORD 0x0
pomocMOD1 WORD 0x0
pomocX WORD 0x0
prosloX WORD 0x0
ENA WORD 0x1

    END     prog1



    .Strahinja Đorđević 30.10.2024