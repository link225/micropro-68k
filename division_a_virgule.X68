*-----------------------------------------------------------
* Title      : la division des nombres avec un chiffre apres la virgule
* Written by : li_nk
* Date       : 10/12/2019
* Description: je fais la divion d'un nombre et affiche un nombre
*               apres la virgule.
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program
    
    * Ce bloc nous permet de faire l'affichage du titre jusqu'a trap #15
    move #14,d0    
    lea titre,a1
    trap #15
    
    * Ce bloc de trois ligne permet d'afficher et de demander un nombre a l'utilisateur soit
    * move #14,d0 and move #4,d0 = move #18,d0
    lea nombre,a1
    move #18,d0
    trap #15

    ; notre entrer est stocker dans d2
    move d1,d2
    
    ;division signer 
    divs #2,d2
    
    ;on met dans le contenue de d2 dans d1 pour affichage 
    move d2,d1
    
    ; ce bloque nous permet de faire un affichage de texte et de nombre en meme temps avec move #17,d0
    lea result,a1
    move #17,d0
    trap #15
    
    ; cela nous permet d'inverser le contenue de d2 sous 10002 devient 20001
    swap d2
    
    ; on multiplie le reste de la division par 10
    muls #10,d2
    
    ; on divise notre nombre multiplier plus haut par deux c'est dans le but d'avoir le nombre apres la virgule
    divs #2,d2
    
    ; je transfert d2 dans d1 pour pourvoir faire un affichage 
    move d2,d1
    
    ;affichage virgule et nombre contenue dans d1 = move #17,d0
    lea virgule,a1
    move #17,d0
    trap #15
    
    

    SIMHALT             ; halt simulator

* Put variables and constants here\


result dc.b 'le resultat est : ',0

titre dc.b '========= Nous divisons ici ==========',$a,$d,0

nombre dc.b 'Quel nombre voulez vous diviser par deux : ',0 ; vous etes libre de choisir n'import quel nombre moi c'est deux

virgule dc.b '.',0

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
