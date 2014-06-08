-- @PROCjouspon
CREATE or REPLACE PROCEDURE PROCjouspon
(P_Sponsor Gain.nomsponsor%TYPE )
IS

V_Nom joueur.nom%type;
V_Tournoi Rencontre.lieuTournoi%type;
V_annee Rencontre.annee%type;

cursor C_Tournoi is
select Distinct r.lieutournoi, r.annee
from Joueur j, Rencontre r
where j.nom = V_Nom and r.nugagnant = j.nujoueur
and not exists(select *
	       from Rencontre r2
	       where r2.nuperdant = j.nujoueur
	         and r2.lieutournoi = r.lieutournoi
	         and r2.annee = r.annee);

cursor C_NomJoueur is
select distinct j.nom
from JOUEUR j, GAIN g
where g.nomsponsor= P_Sponsor and g.NuJoueur=j.NuJoueur order by j.nom;

BEGIN
dbms_output.put_line('-----------------------------');
dbms_output.put_line('Nom du sponsor : ' || P_Sponsor);
open C_NomJoueur;

loop
fetch C_NomJoueur into V_Nom;
exit when C_NomJoueur%NOTFOUND;
if C_NomJoueur%ROWCOUNT=1
 then dbms_output.put_line('Joueur sponsorise par ' || P_Sponsor || ':');
end if;
dbms_output.put_line(V_Nom);
open C_Tournoi;
loop
fetch C_Tournoi into V_Tournoi, V_Annee;
exit when C_Tournoi%NOTFOUND;
dbms_output.put_line('.....................Vainqueur de ' || V_Tournoi || ' ' || V_Annee);
end loop;
close C_Tournoi;
end loop;

if C_NomJoueur%ROWCOUNT=0
 then dbms_output.put_line
                  (P_sponsor || ' n a sponsorise personne');
end if;
close C_NomJoueur;
END;
/
