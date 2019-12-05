*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    
    bsr addition
    
    ;move d3,d1
    ;move #3,d0
    ;trap #15
    
    cmp d2,d3 ; On compare ici d2 et d3 
    
    bhi grand
    
    blo petit
    
    beq egale    
    
    SIMHALT             ; halt simulator
    
    
addition    
    lea titre,a1
    move #14,d0
    trap #15
    
    move #14,d0
    lea nbre1,a1
    trap #15
    
    move  #4,d0
    trap #15
    
    move d1,d2
    
    move #14,d0
    lea nbre2,a1
    trap #15
    
    move  #4,d0
    trap #15
    
    move d1,d3
    
    add d2,d1
    
    move #14,d0
    lea resut,a1
    trap #15
    
    move #3,d0
    trap #15
    
    rts
    
grand
    move #14,d0
    lea titregrand,a1
    trap #15
    rts

petit
    move #14,d0
    lea titrepetit,a1
    trap #15
    rts
    
egale
    move #14,d0
    lea titregale,a1
    trap #15
    rts

    

* Put variables and constants here

bjour dc.b 'je suis de retour avec cette histoire de micro pro',$d,$a,0
titre dc.b ' Nous allons faire une petite addition avec un peu de comparaison',$d,$a,0

nbre1 dc.b 'Entrez le nombre 1 : ',$d,$a,0
nbre2 dc.b 'Entrez le nombre 2 : ',$d,$a,0
resut dc.b 'Le resultat est : ',0

titrepetit dc.b $d,$a,'le deuxieme nombre est plus petit ',0
titregrand dc.b $d,$a,'le deuxieme nombre est plus grand ',0
titregale dc.b $d,$a,'les deux nombres sont egaux ',0


    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
