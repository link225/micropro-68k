*-----------------------------------------------------------
* Title      : boucle dans boucle
* Written by : link
* Date       : 11/12/19
* Description: juste une boucle dans une autre boucle
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    move #14,d0
    lea titre,a1
    trap #15
    
    move #1,d2 ; d2 est ici le i de l'iteration de notre 1ere boucle
    move #1,d4 ; d4 est ici le j de l'iteration de notre 2eme boucle
    
    bsr boucle1 ; branchement sur la premiere boucle
    
    

    

* Put program code here

    SIMHALT             ; halt simulator

boucle1
    cmp #4,d2 ; on compare d2 a 4
    
    bhi fin  ; si d2 est grand que 4 on arrete la boucle
    
    lea boucle,a1 ; sinon on affiche un message avec ce bloc 
    move #14,d0
    trap #15
    
    move #1,d4 ; on initialise la variable j a chaque passage car deja a 4 dans la deuxieme boucle 
    
    add #1,d2 ; incrementation 
    blo boucle2 ; brachement sur la boucle2
    
boucle2
    lea note,a1 ; on affiche notre message avec ce bloc 
    move #14,d0
    trap #15
    
    cmp #4,d4 ; comparaison de 4 et d4
    
    
    bhi boucle1 ; si D4 > 4 on va a boucle 
    add #1,d4
    
    bra boucle2 ; sinon on fait un branchement sur boucle2
    
fin 
    SIMHALT

     
* Put variables and constants here
titre dc.b '========== boucle IN boucle ==========',$a,$d,0

note dc.b 'voici les notes ',$a,$d,0

boucle dc.b ' 1  boucle ',$a,$d,0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
