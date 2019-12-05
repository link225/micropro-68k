*-----------------------------------------------------------
* Title      : remplissage de tableau et affichage et sommes des elements du tableau
* Written by : link
* Date       : today
* Description: je demande un nombre a l utilissateur et en fonction de ce nombre nous
*
*remplirons un tableau de longueur le nombre demander et afficher les elements
* entrer dans l'ordre entrer
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    lea titre,a1
    move #14,d0
    trap #15
    
    lea demande,a1
    move #18,d0
    trap #15
    
    move d1,d3
    bsr init
    
    
remplir:
    cmp d2,d3
    beq fin
    
    lea nombre,a1
    move #18,d0
    trap #15
    
    add #1,d2
    move d1,(a2)+
    
    bra remplir
    
    
    
affichage:
    cmp d2,d3
    beq end
    
    add #1,d2
    move (a2)+,d1
    
    add d1,d4
    
    move #3,d0
    trap #15
    
    move #14,d0
    lea ligne,a1
    trap #15
    
    bra affichage
    

    
* Put program code here

end    
    move #14,d0
    lea somme,a1
    trap #15
    
    move d4,d1
    move #3,d0
    trap #15
    
    SIMHALT             ; halt simulator

init
    lea table,a2
    move #0,d2
    move #0,d4
    bra remplir

fin 
    lea fini,a1
    move #14,d0
    trap #15
    
    lea table,a2
    move #0,d2
   
    bra affichage

* Put variables and constants here

table ds.w 100

titre dc.b '========== Tableau et affichage ==========',$a,$d,0

demande dc.b 'Combien de nombre voulez vous entrer ? : ',0
nombre dc.b 'Entrer un nombre svp : ',0

somme dc.b 'La somme des elements du tableax est : ',0

ligne dc.b '',$a,$d,0

fini dc.b ' Vous avez fini mantenant voici vos entrer ',$a,$d,0
 

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
