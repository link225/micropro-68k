*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    move #11,d2
    divs #2,d2
    
    move d2,d1
    
    lea result,a1
    move #17,d0
    trap #15
    
    
    swap d2
    
    muls #10,d2
    
    divs #2,d2
    
    move d2,d1
    
    lea reste,a1
    move #17,d0
    trap #15
    

    
    
    

    SIMHALT             ; halt simulator

* Put variables and constants here\


result dc.b 'le resultat est : ',0

reste dc.b ',',0



    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
