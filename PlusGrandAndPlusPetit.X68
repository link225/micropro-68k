*-----------------------------------------------------------
* Title      : plus grand and plus petit 
* Written by : link 
* Date       : 12.12.2019
* Description: Le but est de retrouver le plus grand element que nous avons entrer lors du remplissage du tableau.
*               
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

*------------ Comment le faire --------
* -> il faut un tableau deja remplis ou que vous devez remplir 
*
* ----------- fonctionnement ----------
* peut importe les variable que vous utilisez le principe est le suivant
* ===== apres avoir rempli le tableau il faut revenir au debut du tableau en pour stocker le premier element du tableau dans
*       un registre de donnee (dn), mias tout d,abord il faut dupliquer le tableau en le mettant en plus dans un autre registre de
*       d'adresse (soit move a2,a3 ). Apres cela il vous faut des label pour la comparaison et la permutation. on considere que le premier 
*       element est le plus grand et on permutte si c'est faut sinon on ne fait rien.



************* NB: Le code n'est pas optimal a vous de te perfectionner comme bon vous semble ****************************


    ;bloc d'instruction pour le titre 
    lea titre,a1
    move #14,d0
    trap #15
    
    ; bloc pour la longueur de tableau
    lea taille,a1
    move #18,d0
    trap #15
    
    ; longueur dans d2
    move d1,d2
    
    ;branchement a init pour initialiser toutes nos variables
    bsr init
    
    ;branchement a remplir pour remplir le tableau
    bsr remplir
    
    ; boucle de comparaison sinon au'il n'affiche rien du tout
    bsr afficher
    

* Put program code here

    SIMHALT             ; halt simulator
    ; bloc d'initialisation
init 
    lea tableau,a2
    move a2,a3
    move #1,d3
    move (a2),d4
    rts
    
    ; Bloc pour le remplissage des elements du tableau    
remplir 
    cmp d3,d2
    blo init
    
    lea enter,a1
    move #18,d0
    trap #15

    move d1,(a3)+
    add #1,d3
    
    bra remplir
    
    
    ;boucle de comparaison 
afficher

    move (a3)+,d5
    
    cmp d3,d2
    
    
    blo fin
    add #1,d3
    
    bhi comparer
    
    bra afficher
    
    
    ;condition de comparaison 
comparer
    
    cmp d4,d5
    
    bhi grand
    
    bra afficher
    
    
    ;permutation des valeurs
grand 
    move d5,d4
    bra afficher
    
    ;affichage finale
fin
    move d4,d1
    lea grande,a1
    move #17,d0
    trap #15
    
    SIMHALT
* Put variables and constants here
tableau ds.w 100

titre dc.b '========== Plus grand and Plus petit ==========',$a,$d,0

enter dc.b 'Note : ',0
taille dc.b 'Nombre de note :',0

note dc.b $a,$d,'La note est :',0

grande dc.b $a,$d,'La plus grande note est : ',0
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
