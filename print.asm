prog1 START 0

    LDX #0
    LDT #1

TEX LDCH TEXT, X
    COMP NICLA
    JEQ ISPIS
IS  TD #NAPRAVA     .AA naprava
    JEQ IS
    WD #NAPRAVA
    ADDR T, X

    J TEX
    

ISPIS   LDA NL
    WD #NAPRAVA



halt J halt


TEXT BYTE C'SIC/XE0'
NL   WORD 0xA
NAPRAVA EQU  0xAA
NICLA WORD 0x30




    END prog1