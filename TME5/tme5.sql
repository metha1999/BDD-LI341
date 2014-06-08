-- #########
-- # TME 5 #
-- #########

-- ********************
-- Destruction des vues
-- ********************

drop view Policier; 
drop view Lecteur_Policier;
drop view Depassement;
drop view Statistiques;

-- *****************
-- Creation des vues
-- *****************

--les romans policiers
Create or Replace  View Policier as 
       Select l.cote, l.titre, l.auteur from Livre l 
       where l.categorie='Policier';

--les lecteurs de romans policier
Create or replace View Lecteur_Policier as
       Select p.NoLecteur, le.nom, le.adresse, p.cote, p.DATEEMPRUNT, p.DATELIMITE 
       from Pret p, Livre l , Lecteur le
       Where l.cote=p.cote and l.categorie='Policier' and p.nolecteur = le.nolecteur;

--les livres qui n'ont pas ete rendu a temps
Create or replace View Depassement as
       Select p.NoLecteur, p.cote, p.datelimite from Pret p
       Where p.datelimite<sysdate and p.rendu='non';

--une relation donnant pour chaque lecteur le nombre de ses emprunts en cours
Create or replace View Statistiques as
       Select p.NoLecteur, Count(p.Cote) NbLivre from Pret p
       Where p.rendu='non'
       Group by p.NoLecteur;

-- ***********************
-- Interrogations des vues
-- ***********************

--a) Noms des lecteurs ayant emprunte des romans policiers a la date du 6 janvier 2004
Select nom from Lecteur_Policier 
Where DATEEMPRUNT = '06/01/04';

--b) Noms des lecteurs ayant emprunte plus de deux romans (inclus) policiers de "Maxime Chattam" le meme jour
Select distinct l.nom from Lecteur_Policier l , Policier v
Where v.auteur='Maxime Chattam' and l.cote=v.cote
Group by l.nom, l.dateemprunt
Having count(*)>2;

--c) La liste des lecteurs de policiers qui ont lu tous les romans policier lus par "Gaspard Dupont"
--   Nom des Lecteur ou il n existe pas de de roman policier lu par Gaspard Dupont qu ils n ont pas lu
--   pour lequel (roman policier) il n existe pas de nuplets lecteur_policier pour les lecteurs
Select distinct l1.nom from Lecteur_Policier l1
Where not exists (Select * from Lecteur_Policier l2 
                  where l2.nom='Gaspard Dupont'
	          and not exists (Select * from Lecteur_Policier l3
	       	                  where l3.cote=l2.cote
				  and l1.nolecteur = l3.nolecteur));

--d) La liste des lecteurs de romans policiers qui n'ont jamais lu des romans ecrits par 'Moore Viviane'
Select distinct l1.nolecteur from Lecteur_Policier l1, Policier v
Where not exists (Select * from Lecteur_Policier l2 
      	  	  where l1.nolecteur = l2.nolecteur
		    and v.cote = l2.cote
		    and v.auteur='Moore Viviane');

--e) La liste des lecteurs qui ont lu tous les romans policiers de 'Anne Perry'
select distinct l1.nom from Lecteur_Policier l1
where not exists (select * 
      	  	  from Policier p
                  where p.auteur='Anne Perry'
		  and not exists (select * 
		                  from Lecteur_Policier l2
		      	  	  where l2.cote = p.cote
				  and l1.nolecteur = l2.nolecteur));

select distinct l1.nom from Lecteur_Policier l1
where not exists (select * 
                  from Lecteur_Policier l2
                  where l1.nolecteur = l2.nolecteur
		  and not exists (select * 
		                  from Policier p
		      	  	  where p.auteur='Anne Perry' 
				    and p.cote = l2.cote));

--f) La liste des noms des lecteurs de romans policiers qui ont plus de deux livres en retard, la date limite ainsi
--   que les noms de ces livres
select l.nom, l.datelimite, p.titre
from Lecteur_Policier l, Policier p
where p.cote = l.cote
  and count(select *
      	  	from Lecteur_Policier l1
		where l1.cote = l.cote
		  and l1.datelimite > '29/10/2013');
