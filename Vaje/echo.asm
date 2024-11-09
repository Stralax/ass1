prog1 START 0

    LDA #STRING
    JSUB STR
    JSUB nl
    JSUB nl

    LDCH CHAR
    JSUB CHR
    JSUB nl


    LDA #1545
    JSUB NUM
    JSUB nl

    LDA #145
    JSUB NUM
    JSUB nl

    LDA #15
    JSUB NUM
    JSUB nl

    LDCH CHAR
    JSUB CHR
    JSUB nl



halt J halt


nl  STA pomocA      .nl funkcija
    LDA #10
    WD #1
    LDA pomocA
    RSUB

CHR WD #1               .char funkcija
    RSUB

STR STA pomoc           .string funkcija
    STA pomocA
TEX .LDA pomoc
    LDCH @pomoc
    COMP #0x30
    JEQ IS
    WD #1
    LDA pomoc
    ADD ENKA
    STA pomoc
    CLEAR A
    J TEX
IS  LDA pomocA
    RSUB
    

NUM                 .ISPiS desetiskeg stevila podaneg v registru A
    STA stevilo1
    STA pomocA1
    LDA #0
    STA length
    LDA #1
    STA treDelitev
    LDA stevilo1
    STL pomocL
    JSUB LEN
zaD LDA length
    COMP #1         .Dolocitev delilaca koliko je velik npr. 1000
    JEQ NAD
    LDA treDelitev
    MUL #10
    STA treDelitev
    LDA length
    SUB #1
    STA length
    J zaD
NAD                .Nadeljevanje uzimanje cifara in priprema za ispis
    LDA stevilo1
    DIV treDelitev
    STA quot
    ADD #48
    WD #1           .stevilo1 = ostatku deljenja sa treDelitev
    LDA quot
    MUL treDelitev
    STA pomoc1
    LDA stevilo1
    SUB pomoc1
    STA stevilo1
    LDA treDelitev
    DIV #10
    STA treDelitev
    COMP #0
    JEQ KRAJ
    J NAD
KRAJ LDL pomocL
    LDA pomocA1
    RSUB


LEN STA stevilo     .f-ja za dolzino stevila podanega v A registru vrne njegovo dolzino v length 
    LDA #0
    STA length
LOOP    LDA stevilo 
    DIV #10
    STA stevilo
    LDA length
    ADD #1
    STA length
    LDA stevilo
    COMP #0
    JEQ VRN
    J LOOP
VRN LDA stevilo 
    RSUB 


STRING BYTE C'Hi my friend0'
CHAR   BYTE C'M'
pomocA RESW 1 
pomocA1 RESW 1 
pomocX RESW 1
pomocT RESW 1
pomocL RESW 1
NICLA BYTE 0x30
pomoc   RESW 1
ENKA WORD 0x1
length WORD 0x0
stevilo RESW 1
stevilo1 RESW 1
treDelitev WORD 0x1
cifra RESW 1
quot RESW 1
pomoc1 RESW 1


    END prog1