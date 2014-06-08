--Affiche la moyenne des primes pour un tournoi et une annee donnee.
CREATE or REPLACE PROCEDURE PROCmoyprime2
( P_lieutournoi GAIN.lieutournoi%TYPE, P_annee GAIN.annee%TYPE )
IS 
V_moyenne GAIN.prime%TYPE;
FIN exception;
BEGIN
select AVG(prime)
into V_moyenne
from GAIN
where lieutournoi=P_lieutournoi and annee=P_annee;
if V_moyenne is null then dbms_output.put_line('Tournoi non repertorie') ;
else dbms_output.put_line(P_lieutournoi||' '||to_char(P_annee)||': '
                                       ||to_char(V_moyenne));			 end if;	       
END;				       						      
/
