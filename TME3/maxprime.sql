SET SERVEROUTPUT ON
SET VERIFY OFF
ACCEPT A_Annee1 NUMBER PROMPT 'Annee de depart: '
ACCEPT A_Annee2 NUMBER PROMPT 'Derniere annee: '
execute PROCmaxprime(&A_Annee1, &A_Annee2);
