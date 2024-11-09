prog1 START 0
    . 5 + x*(4 + x*(3 + x*(2 + x)))
    LDA xTocka
    ADD #2
    MUL xTocka
    ADD #3
    MUL xTocka
    ADD #4
    MUL xTocka
    ADD #5
    STA REZULTAT


    

halt J halt

xTocka WORD 0x2
REZULTAT RESW 1
POMOC RESW 1





    END prog1