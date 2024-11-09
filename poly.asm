prog1 START 0
    CLEAR A         .x⁴+2x³+3x²+4x+5 v točki x=2
    LDA xTocka
    MUL xTocka
    MUL xTocka
    MUL xTocka      .x^4
    STA POMOC
    
    CLEAR A         
    LDA xTocka
    MUL xTocka
    MUL xTocka
    MUL #2
    ADD POMOC
    STA POMOC
    
    CLEAR A         .3x²+4x+5 v točki x=2
    LDA xTocka
    MUL xTocka
    MUL #3
    ADD POMOC
    STA POMOC

    CLEAR A         .4x+5
    LDA xTocka
    MUL #4
    ADD POMOC
    ADD #5
    STA REZULTAT







halt J halt

xTocka WORD 0x2
REZULTAT RESW 1
POMOC RESW 1





    END prog1