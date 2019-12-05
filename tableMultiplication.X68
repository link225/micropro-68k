*-----------------------------------------------------------
* Title      : tableau de multiplication 
* Written by : link
* Date       : 2/12/2019
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
    
    move d1,d2
    move #0,d3
    
tableau:
    
    cmp #9,d3 ; condition de la boucle
    bhi fin  ; condition de sortie 
    
    add #1,d3 ; incrementation
    
    move d2,d1 ; On cherche a afficher notre nombre a multiplier
    move #3,d0  ; On donne les instructions pour l'affichage du nombre en question
    trap #15
    
    lea fois,a1 ; on affiche le signe de la multiplication
    move #14,d0 ; instruction pour l'affichage
    trap #15
    
    move d3,d1 ; On cherche a afficher les nombres qui doient multiplier le nombre entre
    move #3,d0 ; Instruction pour afficher
    trap #15
    
    ;Nous allons faire la multiplication deh maintenant
    move d3,d1
    muls d2,d1
    ; Noter bien que pour la multiplication il faut le registre de donne d1
    ; pour ma part j'ai essaye muls d2,d3 sant resultat donc a preuve du contraire
    ; utiliser celui ci
    
    
    lea egale,a1 ; Nous affichons ici le signe egale
    move #14,d0  ; Instruction pour l'affichage
    trap #15
    
    move #3,d0  ; on affiche le contenue de D1 car pour l'affichage d'un nombre 
    trap #15    ; il faut toujours passe par D1
    
    
    move #14,d0 ;Instruction( les trois lignes ) pour retour a la ligne a chaque fois
    lea ligne,a1 ;
    trap #15     ;
    
    bra tableau  ; Ceci est un branchement inconditionnel car oui il en existe d'autre qui sont conditionnel
                 ; pour pourvoir avoir une boucle
fin  ;sous function pour mettre fin au programme
    move #9,d0  
    trap #15
   

    SIMHALT             ; halt simulator

* Put variables and constants here

;declaration de variable que j'ai utiliser poour les affichages
titre dc.b '========= Nous sommes au niveaau de la table de multiplication ==========',$a,$d,0
demande dc.b ' Vous voulez quelle table ? : ',0

affiche dc.b ' Voici le resultat ',$a,$d,0

fois dc.b ' x ',0
egale dc.b ' = ',0
ligne dc.b '',$a,$d,0

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
