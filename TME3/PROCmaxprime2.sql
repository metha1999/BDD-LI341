--affiche la plus grosse prime par joueur sur une periode donnee
CREATE or REPLACE PROCEDURE PROCmaxprime2
( P_Sponsor Gain.NomSponsor%type )
IS
--on defini la variable pour le nom du joueur
V_Nom Joueur.nom%type;
--on defini une variable Maxprime
V_MaxPrime Gain.Prime%type;
V_Annee1 GAIN.annee%TYPE;
V_Annee2 GAIN.annee%TYPE;
V_Sponsor GAIN.Nomsponsor%type;


--on defini un curseur pour parcourir toutes les lignes
cursor C_MaxPrime is
--on fait une requete SQL pour selectionner la plus grosse prime et le nom du joeur 
select nom, max(prime)
from GAIN, JOUEUR
where annee between (Select Min(annee)
from Gain
where NomSponsor=P_Sponsor) and (Select Max(annee)
from Gain
where NomSponsor=P_Sponsor)
  and gain.NuJoueur=joueur.NuJoueur
group by nom;

FIN exception;
        
BEGIN	

Select avg(prime)
into V_Sponsor
From Gain
where NomSponsor=P_Sponsor;

if V_Sponsor is null then raise FIN;
 end if;

Select Min(annee)
into V_Annee1
from Gain
where NomSponsor=P_Sponsor;

Select Max(annee)
into V_Annee2
from Gain
where NomSponsor=P_Sponsor;


dbms_output.put_line('annee de depart : '||V_Annee1);
dbms_output.put_line('annee de fin : '||V_Annee2);

--on accede au debut des resultats avec le curseur	     
open C_MaxPrime; 
--on debute la boucle
loop
fetch C_MaxPrime into V_Nom, V_MaxPrime;
exit when C_MaxPrime%NOTFOUND;
if C_Maxprime%ROWCOUNT=1
 then dbms_output.put_line('Plus forte prime gagnee par:');
end if;
dbms_output.put_line(rpad(V_Nom,14,'.')||
                     lpad(to_char(V_MaxPrime),8,'.')||' F');
--fin de la boucle
end loop;
if C_MaxPrime%ROWCOUNT=0
 then dbms_output.put_line
                  ('Aucun tournoi n''est repertorie entre ces dates');
end if;
close C_MaxPrime; 

EXCEPTION
--affiche un message d'erreur si le tournoi n'existe pas
when FIN then dbms_output.put_line('Auncun sponsor trouve');

   
END;
/
