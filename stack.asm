prog START 0
    JSUB sinit
    LDA #1
    LDB #2
    STA @sp         .damo dve vrednosti na sklad
    JSUB spush      
    STB @sp
    JSUB spush

    JSUB spop       .vzamemo vrednosti sa sklada
    LDA @sp
    JSUB spop
    LDB @sp

    



halt J halt


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


sp      WORD 0          .stackptr prvo prosto mesto v stacku   
stack   RESW 1000       .pocetak steka
 

stackA WORD 0

    END prog