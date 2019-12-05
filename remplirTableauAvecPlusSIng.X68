*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    move #14,d0
    lea titre,a1
    trap #15
    
    move #18,d0
    lea demande,a1
    trap #15
    
    move d1,d3
    
    bsr init
    
remplir:

    cmp d2,d3
    beq fin
    
    add #1,d2
    
    move #18,d0
    lea nombre,a1
    trap #15
    
    move d1,(a2)+
    
    bra remplir
    

    SIMHALT             ; halt simulator
    
init 
    lea table,a2
    
    move #0,d2
    
    rts

singulier
    move #14,d0
    lea entrer,a1
    trap #15
    SIMHALT
    
pluriel
    move #14,d0
    lea entrers,a1
    trap #15
    SIMHALT


fin
    lea fini,a1
    move #14,d0
    trap #15
    
    move d3,d1
    move #3,d0
    trap #15
    
    cmp #1,d3
    beq singulier
    bhi pluriel
    
    SIMHALT

* Put variables and constants here

table ds.w 100

titre dc.b '===== Je suis en train de remplir un tableau =====',$a,$d,0

nombre dc.b ' Entrez un nombre : ',0

fini 
    dc.b ' Vous avez atteind la limite. Merci !!!',$a,$d
    dc.b ' Vous avez entre ',0
entrer dc.b '  nombre',$a,$d,0
entrers dc.b '  nombres',$a,$d,0

demande dc.b ' Combien de nombre svp ? ',0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
