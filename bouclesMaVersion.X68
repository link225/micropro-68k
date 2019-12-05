*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    lea titre,a1
    move #14,d0
    trap #15
    move #0,d2
    
boucle  
    cmp #10,d2
    beq fin
    
    add #1,d2
    
    
    move d2,d1
    move #3,d0
    trap #15
    
    lea texte,a1
    move #14,d0
    trap #15
    
    
    bra boucle
    
    
    
    

* Put program code here

fin    SIMHALT             ; halt simulator

* Put variables and constants here
titre dc.b '===== Je suis en train de faire une boucle =====',$a,$d,0
texte dc.b ' <-- je suis en boucle ',$a,$d,0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
