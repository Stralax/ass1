prog1 START 0


    JSUB sinit
    LDA slovo
    JSUB ISP
    
    JSUB BL

    LDA slovo1
    JSUB ISP

    JSUB BL

    LDA slovo
    JSUB ISP

    JSUB BL





halt J halt


ISP STA char
ISP1    LDA char
    STA @treIspis


    LDA treIspis
    ADD ODMIK
    STA treIspis

    COMP konec
    JLT ISP1
    JEQ ISP1
    LDS screen
    STS treIspis
    RSUB


BL STA pomocA
    LDA BLANK
    +STL @sp
    JSUB spush
    .STL pomocL
    JSUB ISP        .Mislim da ne dela ker rabimo sklad za izvajanje ove kode
    STA pomocA
    JSUB spop
    +LDL @sp
    .LDL pomocL
    RSUB


sinit   STA stackA       .nastavi vrednost sp na zacetek stacka
    LDA #stack
    STA sp
    LDA stackA
    RSUB

spush   STA stackA       .poveca vrednost sp za eno besedo
    LDA sp
    ADD #3
    STA sp
    LDA stackA
    RSUB

spop    STA stackA        .zmanjsa vrednost sp za eno besedo
    LDA sp
    SUB #3
    STA sp
    LDA stackA
    RSUB


stackA WORD 0
sp      WORD 0          .stackptr prvo prosto mesto v stacku   
stack   RESW 1000       .pocetak steka


screen WORD 0x0B7FF
scrcols WORD 0x4E
scrrows WORD 0x17
scrlen WORD 0x9C8
slovo WORD C'X'
slovo1 WORD C'W'

char  BYTE C'L'
BLANK BYTE C'000'        
pomocA RESW 1
ODMIK WORD 0x1
treIspis  WORD 0x0B7FF
konec WORD 0x0BFCF

pomocL RESW 1

    END prog1