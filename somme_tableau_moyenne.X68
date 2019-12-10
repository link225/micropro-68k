*-----------------------------------------------------------
* Title      : somme et moyenne des elements d'un tableau
* Written by : link
* Date       : 10/12/2019
* Description: Je remplis un tableau et je vais la somme des elements du tableau et la moyenne de ces elements
*               NB: il est tout de meme possible de faire cet exercice sans un tableau 
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

    ; Bloque d'instruction pour afficher le titre 
    lea titre,a1 
    move #14,d0 
    trap #15
    
    ; Demande du nombre de note a l'utilisateur ( affichage et demande ) = move #18,d0 
    lea nbre,a1
    move #18,d0
    trap #15

    ; d3 represente notre variable i pour la boucle
    ; initialisation de la variable de somme qui est d4
    move d1,d3
    move #0,d4
    
    ;Branchement sur sur la sous instruction ou label init 
    bsr init
    
    ; Branchement sur la sous instruction ou label remplir
    bsr remplir
    
    ; vous poouvez decommenter pour afficher les entres mais il aura un petit soucis faite attention
    ; bsr afficher
    

   
   bsr fini

* Put program code here

    SIMHALT             ; halt simulator
init

    ; load le label sur l'adresse a2 
    lea tableau,a2
    
    ; Initialisation de 
    move #1,d2
    rts
    
remplir 
    cmp d2,d3
    
    blo fin
    
    add #1,d2
    
    lea entrer,a1
    move #18,d0
    trap #15
    
    add d1,d4
    
    move d1,(a2)+
    
    bra remplir
    
afficher
    cmp d2,d3
    
    blo fini
    
    add #1,d2
    
    move (a2)+,d1
    
    add d1,d4
 
    lea affiche,a1
    move #17,d0
    trap #15
    
    bra afficher
    
    
fin 
    bra init
    
fini
    ;afficher la somme
    move d4,d1
    
    lea somme,a1
    move #17,d0
    trap #15
    
    ;afficher la division 
        
    divu d3,d4
    move d4,d1
    
    ; Voir le chapitre sur la diviion sur la branche master  
    lea division,a1
    move #17,d0
    trap #15
    
    swap d4
    
    mulu #10,d4
    
    divu d3,d4
    
    move d4,d1
    
    lea virgule,a1
    move #17,d0
    trap #15
    
    lea coef,a1
    move #14,d0
    trap #15
    
    rts
    
    SIMHALT
    
* Put variables and constants here

; reserve de 100 mots memoire
tableau ds.w 100

titre dc.b '========== somme et moyenne des elements d un tableau ==========',$a,$d,0

nbre dc.b ' Combien de notes avez vous : ',0

entrer dc.b 'Note please (sur 20) : ',0

somme dc.b $a,$d,'La somme des elements du tableau est : ',0

virgule dc.b ',',0

affiche dc.b '',$a,$d,0
division dc.b $a,$d,'La noyenne est la suivante : ',0
coef dc.b '/20',$a,$d,0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
