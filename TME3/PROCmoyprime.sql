--Affiche la moyenne des primes pour un tournoi et une annee donnee.
CREATE or REPLACE PROCEDURE PROCmoyprime
( P_lieutournoi GAIN.lieutournoi%TYPE, P_annee GAIN.annee%TYPE )
IS 
V_moyenne GAIN.prime%TYPE;
FIN exception;
BEGIN
--On fait une requete pour selectionner la moyenne des primes sur un tournoi
select AVG(prime)
into V_moyenne
from GAIN
where lieutournoi=P_lieutournoi and annee=P_annee;
--test si la moyenne est nul et lance l'exception fin si tel et le cas
if V_moyenne is null then raise FIN;
 end if;
--affiche lieu_tournoi annee: moyenne
dbms_output.put_line(P_lieutournoi||' '||to_char(P_annee)||': '
                                       ||to_char(V_moyenne));	       
EXCEPTION
--affiche un message d'erreur si le tournoi n'existe pas
when FIN then dbms_output.put_line('Tournoi non repertorie');		       
END;
/
