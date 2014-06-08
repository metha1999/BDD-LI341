/* ----------------------------------------------------------------------
   Fichier tennis.sql: Création de la base tennis
   --------------------------------------------------------------------- */

drop table Joueur;
drop table Rencontre;
drop table Gain;

create table JOUEUR
( NuJOUEUR     number(8),
  NOM          varchar(12),
  PRENOM       varchar(14),
  AnNaiss      number(8),
  NATIONALITE  varchar(12));

create table RENCONTRE
( NuGAGNANT    number(8),
  NuPERDANT    number(8),
  LIEUTOURNOI  varchar(15),
  ANNEE        number(8));

create table GAIN
( NuJOUEUR     number(8),
  LIEUTOURNOI  varchar(15),
  ANNEE        number(8),
  PRIME        float(8),
  NOMSPONSOR   varchar(10));


create public synonym Joueur for Joueur;
create public synonym Rencontre for Rencontre;
create public synonym Gain for Gain;


insert into JOUEUR
 values (1, 'MARTINEZ', 'Conchita', 1972, 'Espagne');
insert into JOUEUR
 values (2, 'NAVRATILOVA', 'Martina', 1957, 'Etats-Unis');
insert into JOUEUR
 values (3, 'GRAF', 'Steffi', 1969, 'Allemagne');
insert into JOUEUR
 values (4, 'HALARD', 'Julie', 1970, 'France');
insert into JOUEUR
 values (5, 'PIERCE', 'Mary', 1975, 'France');
insert into JOUEUR
 values (6, 'EDBERG', 'Stephan', 1966, 'Suede');
insert into JOUEUR
 values (7, 'LARSSON', 'Magnus', 1970, 'Suede');
insert into JOUEUR
 values (8, 'LECONTE', 'Henri', 1963, 'France');
insert into JOUEUR
 values (9, 'FORGET', 'Guy', 1965, 'France');
insert into JOUEUR
 values (10, 'FLEURIAN', 'Jean-Philippe', 1965, 'France');
insert into JOUEUR
 values (11, 'WILANDER', 'Mats', 1964, 'Suede');
insert into JOUEUR
 values (12, 'CONNORS', 'Jimmy', 1952, 'Etats-Unis');
insert into JOUEUR
 values (13, 'McENROE', 'John', 1959, 'Etats-Unis');
insert into JOUEUR
 values (14, 'SAMPRAS', 'Pete', 1972, 'Etats-Unis');

insert into RENCONTRE
 values (13, 9, 'Roland Garros', 1990);
insert into RENCONTRE
 values (11, 12, 'Roland Garros', 1990);
insert into RENCONTRE
 values (13, 11, 'Roland Garros', 1990);
insert into RENCONTRE
 values (2, 3, 'Roland Garros', 1990);
insert into RENCONTRE
 values (13, 12, 'Roland Garros', 1992);
insert into RENCONTRE
 values (6, 14, 'Roland Garros', 1992);
insert into RENCONTRE
 values (11, 9, 'Roland Garros', 1992);
insert into RENCONTRE
 values (8, 7, 'Roland Garros', 1992);
insert into RENCONTRE
 values (13, 8, 'Roland Garros', 1992);
insert into RENCONTRE
 values (6, 11, 'Roland Garros', 1992);
insert into RENCONTRE
 values (13, 6, 'Roland Garros', 1992);
insert into RENCONTRE
 values (2, 3, 'Roland Garros', 1992);
insert into RENCONTRE
 values (14, 10, 'Roland Garros', 1994);
insert into RENCONTRE
 values (8, 9, 'Roland Garros', 1994);
insert into RENCONTRE
 values (14, 8, 'Roland Garros', 1994);
insert into RENCONTRE
 values (2, 4, 'Roland Garros', 1994);
insert into RENCONTRE
 values (1, 3, 'Roland Garros', 1994);
insert into RENCONTRE
 values (2, 1, 'Roland Garros', 1994);
insert into RENCONTRE
 values (11, 8, 'Wimbledon', 1989);
insert into RENCONTRE
 values (12, 13, 'Wimbledon', 1989);
insert into RENCONTRE
 values (11, 12, 'Wimbledon', 1989);
insert into RENCONTRE
 values (3, 2, 'Wimbledon', 1989);
insert into RENCONTRE
 values (14, 13, 'Wimbledon', 1992);
insert into RENCONTRE
 values (6, 9, 'Wimbledon', 1992);
insert into RENCONTRE
 values (6, 14, 'Wimbledon', 1992);
insert into RENCONTRE
 values (3, 5, 'Wimbledon', 1992);
insert into RENCONTRE
 values (2, 4, 'Wimbledon', 1992);
insert into RENCONTRE
 values (3, 2, 'Wimbledon', 1992);
insert into RENCONTRE
 values (14, 10, 'Wimbledon', 1993);
insert into RENCONTRE
 values (7, 9, 'Wimbledon', 1993);
insert into RENCONTRE
 values (14, 7, 'Wimbledon', 1993);
insert into RENCONTRE
 values (1, 5, 'Wimbledon', 1993);
insert into RENCONTRE
 values (2, 4, 'Wimbledon', 1993);
insert into RENCONTRE
 values (1, 2, 'Wimbledon', 1993);
insert into RENCONTRE
 values (12, 9, 'Flushing Meadow', 1989);
insert into RENCONTRE
 values (2, 3, 'Flushing Meadow', 1989);
insert into RENCONTRE
 values (12, 7, 'Flushing Meadow', 1991);

insert into GAIN
 values (14, 'Roland Garros', 1992, 0.2e6, 'Peugeot');
insert into GAIN
 values (14, 'Roland Garros', 1994, 1.8e6, 'Reebok');
insert into GAIN
 values (14, 'Wimbledon', 1992, 0.7e6, 'Peugeot');
insert into GAIN
 values (14, 'Wimbledon', 1993, 1.4e6, 'Peugeot');
insert into GAIN
 values (13, 'Roland Garros', 1990, 1.1e6, 'Kennex');
insert into GAIN
 values (13, 'Roland Garros', 1992, 1.5e6, 'Kennex');
insert into GAIN
 values (13, 'Wimbledon', 1989, 0.35e6, 'Donnay');
insert into GAIN
 values (13, 'Wimbledon', 1992, 0.4e6, 'Kennex');
insert into GAIN
 values (12, 'Roland Garros', 1990, 0.4e6, 'Dunlop');
insert into GAIN
 values (12, 'Roland Garros', 1992, 0.2e6, 'Dunlop');
insert into GAIN
 values (12, 'Wimbledon', 1989, 0.6e6, 'Dunlop');
insert into GAIN
 values (12, 'Flushing Meadow', 1989, 1.6e6, 'Dunlop');
insert into GAIN
 values (12, 'Flushing Meadow', 1991, 1.8e6, 'Lacoste');
insert into GAIN
 values (11, 'Roland Garros', 1990, 0.7e6, 'Kennex');
insert into GAIN
 values (11, 'Roland Garros', 1992, 0.5e6, 'Kennex');
insert into GAIN
 values (11, 'Wimbledon', 1989, 1.0e6, 'Dunlop');
insert into GAIN
 values (10, 'Roland Garros', 1994, 0.6e6, 'Peugeot');
insert into GAIN
 values (10, 'Wimbledon', 1993, 0.5e6, 'Peugeot');
insert into GAIN
 values (8, 'Roland Garros', 1992, 0.5e6, 'Lacoste');
insert into GAIN
 values (8, 'Roland Garros', 1994, 1.0e6, 'Reebok');
insert into GAIN
 values (8, 'Wimbledon', 1989, 0.35e6, 'Peugeot');
insert into GAIN
 values (7, 'Roland Garros', 1992, 0.2e6, 'Donnay');
insert into GAIN
 values (7, 'Wimbledon', 1993, 0.8e6, 'Reebok');
insert into GAIN
 values (7, 'Flushing Meadow', 1991, 1.0e6, 'Donnay');
insert into GAIN
 values (6, 'Roland Garros', 1992, 0.9e6, 'Dunlop');
insert into GAIN
 values (6, 'Wimbledon', 1992, 1.2e6, 'Dunlop');
insert into GAIN
 values (5, 'Wimbledon', 1992, 0.3e6, 'Dunlop');
insert into GAIN
 values (5, 'Wimbledon', 1993, 0.35e6, 'Reebok');
insert into GAIN
 values (4, 'Roland Garros', 1994, 0.4e6, 'Lacoste');
insert into GAIN
 values (4, 'Wimbledon', 1992, 0.3e6, 'Lacoste');
insert into GAIN
 values (4, 'Wimbledon', 1993, 0.35e6, 'Lacoste');
insert into GAIN
 values (9, 'Roland Garros', 1990, 0.4e6, 'Peugeot');
insert into GAIN
 values (9, 'Roland Garros', 1992, 0.2e6, 'Peugeot');
insert into GAIN
 values (9, 'Roland Garros', 1994, 0.6e6, 'Reebok');
insert into GAIN
 values (9, 'Wimbledon', 1992, 0.4e6, 'Peugeot');
insert into GAIN
 values (9, 'Wimbledon', 1993, 0.5e6, 'Reebok');
insert into GAIN
 values (9, 'Flushing Meadow', 1989, 0.9e6, 'Lacoste');
insert into GAIN
 values (3, 'Roland Garros', 1990, 0.5e6, 'Donnay');
insert into GAIN
 values (3, 'Roland Garros', 1992, 0.55e6, 'Donnay');
insert into GAIN
 values (3, 'Roland Garros', 1994, 0.4e6, 'Reebok');
insert into GAIN
 values (3, 'Wimbledon', 1989, 0.75e6, 'Donnay');
insert into GAIN
 values (3, 'Wimbledon', 1992, 0.85e6, 'Donnay');
insert into GAIN
 values (3, 'Flushing Meadow', 1989, 0.7e6, 'Donnay');
insert into GAIN
 values (2, 'Roland Garros', 1990, 0.8e6, 'Vittel');
insert into GAIN
 values (2, 'Roland Garros', 1992, 0.9e6, 'Vittel');
insert into GAIN
 values (2, 'Roland Garros', 1994, 1.2e6, 'Donnay');
insert into GAIN
 values (2, 'Wimbledon', 1989, 0.4e6, 'Vittel');
insert into GAIN
 values (2, 'Wimbledon', 1992, 0.5e6, 'Vittel');
insert into GAIN
 values (2, 'Wimbledon', 1993, 0.6e6, 'Donnay');
insert into GAIN
 values (2, 'Flushing Meadow', 1989, 1.0e6, 'Vittel');
insert into GAIN
 values (1, 'Wimbledon', 1993, 0.9e6, 'Nike');
insert into GAIN
 values (1, 'Roland Garros', 1994, 0.8e6, 'Nike');

commit;

@liste;
select * from joueur;
select * from rencontre;
select * from gain;

/**********/
/*REQUETES*/
/**********/

-- #######
-- # TD3 #
-- #######
/*Numero et tournoi (lieu et annee) des joueurs sponsorises par Peugeot entre 1990 et 1994*/
select nujoueur, lieutournoi, annee
from gain
where nomsponsor = 'Peugeot' and annee between 1990 and 1994;

/*Nom et annee de naissance des joueurs ayant participe a Roland Garros en 1994*/
select j.nom, j.anNaiss
from Joueur j, Gain g
where g.nuJoueur = j.nuJoueur and g.annee = 1994 and g.lieuTournoi = 'Roland Garros';

/*Nom et nationalite des joueurs ayant a la fois participe au tournoi de Roland Garros et 
  a celui de Wimbledon en 1992*/
select j.nom, j.nationalite
from Joueur j, Gain g1, Gain g2
where g1.nuJoueur = j.nuJoueur and g1.annee = 1992 and g1.lieuTournoi = 'Roland Garros'
  and g2.nuJoueur = j.nuJoueur and g2.annee = 1992 and g2.lieuTournoi = 'Wimbledon';

/*Nom et nationalite des joueurs ayant ete sponsorises par Peugeot et ayant gagne Roland Garros
  au moins un match (avec un sponsor quelconque)*/
select j.nom, j.nationalite
from Joueur j, Gain g, Rencontre r
where g.nomsponsor = 'Peugeot' and g.nuJoueur = j.nuJoueur and r.lieuTournoi = 'Roland Garros'
  and r.nuGagnant = j.nuJoueur;

-- #######
-- # TD4 #
-- #######
/*Nom des joueurs ayant toutes leurs primes a Roland Garros superieur a 1 000 000*/
select j.nom
from joueur j, gain g
where g.lieuTournoi = 'Roland Garros' and g.nuJoueur = j.nuJoueur and g.prime > 1000000;

/*Numeros des joueurs qui on toujours gagne a Roland Garros*/
select distinct j.nuJoueur
from joueur j, Gain g
where g.nuJoueur = j.nuJoueur and g.lieuTournoi = 'Roland Garros' 
      and not exists (select *
                      from Rencontre r
                      where r.lieuTournoi = 'Roland Garros' 
		        and j.nuJoueur = r.nuPerdant);

/*Liste des vainqueurs de tournoi : nom avec lieu et annee du tournoi*/
select j.nom, g.annee, g.lieuTournoi
from Joueur j, Gain g
where g.nuJoueur = j.nuJoueur
      and not exists (select *
      	      	      from Rencontre r
		      where j.nuJoueur = r.nuPerdant 
		        and r.lieuTournoi = g.lieuTournoi) order by g.annee;

/*Nom des joueurs ayant participe a tous les tournois disputes en 1994*/
select distinct j.nom
from joueur j, gain g
where g.nuJoueur = j.nuJoueur 
  and g.annee = 1994 
  and not exists (select *
    	   	  from Rencontre r
		  where r.annee = g.annee 
                    and r.lieuTournoi = g.lieuTournoi 
		    and r.nuGagnant = j.nuJoueur 
		    and r.nuPerdant = j.nuJoueur);

/*Nombre de joueurs ayant partipe au tournoi de Wimbledon en 1993*/
select count(j.nujoueur)
from joueur j, gain g
where g.annee = 1993 
  and g.lieutournoi = 'Wimbledon'
  and g.nujoueur = j.nujoueur; 

/*Numeros des joueurs ayant eu au moins deux sponsors*/
-- Premiere Version
select distinct j.nuJoueur
from joueur j, gain g1, gain g2
where j.nujoueur = g1.nujoueur 
  and j.nujoueur = g2.nujoueur 
  and not g1.nomsponsor = g2.nomsponsor;

--Deuxieme Version
select distinct j.nujoueur
from joueur j, gain g
where 1 <(select count(distinct s.nomsponsor)
      	  from gain s
	  where j.nujoueur = s.nujoueur);

/*Numeros des joueurs ayant eu exactement deux sponsors*/
--Premiere Version
select distinct j.nuJoueur
from joueur j, gain g1, gain g2
where j.nuJoueur = g1.nuJoueur 
  and j.nuJoueur = g2.nuJoueur 
  and g1.nomsponsor <> g2.nomsponsor 
  and not exists (select *
		  from Gain g3
	          where g3.nuJoueur = J.nuJoueur 
		    and g3.nomsponsor <> g1.nomsponsor 
		    and g3.nomsponsor <> g2.nomsponsor) order by j.nujoueur; 

--Deuxieme Version
select distinct j.nujoueur
from joueur j, gain g
where 2=(select count(distinct s.nomsponsor)
      	  from gain s
	  where j.nujoueur = s.nujoueur)order by j.nujoueur;

-- ########
-- # TME2 #
-- ########
/*Moyenne des primes gagnee par annee*/
select avg(prime),annee from gain group by annee order by avg(annee);

/*Valeur la plus forte prime en 1992 et nom des joueurs*/
Select g.prime, j.nom, g.annee
From Gain g, joueur j
where g.nujoueur = j.nujoueur and g.annee = 1992 and g.prime >= any (Select max(prime) from Gain Where annee = 1992);

/*Somme gagnee en 1992 par chaque joueur, pour l'ensemble des tournois auxquels il a participe 
 (presentation par orde de gain decroissant)*/
select sum(g.prime), j.nom
from gain g, joueur j
where g.annee = 1992 and j.nujoueur = g.nujoueur
group by j.nom order by sum(g.prime) desc;

/*Noms et prenoms des vainqueurs du simple homme et du simple dame du tournoi de Roland Garros en 1992*/
Select unique j.nom, j.prenom, r.lieutournoi,r.annee
from joueur j, rencontre r
where j.nujoueur = r.nugagnant and r.annee = 1992 and r.lieuTournoi = 'Roland Garros' and not Exists (select * from joueur j2, rencontre where j2.nujoueur = nuperdant and annee = 1992 and lieutournoi = 'Roland Garros' and j2.nujoueur = j.nujoueur);

/*Nom des joueurs ayant participe a tous les tournois de Rolland Garros*/
Select unique j.nom, j.prenom, g.lieutournoi
From Joueur j, gain g
where j.nujoueur = g.nujoueur and g.lieutournoi = 'Roland Garros' and not exists(Select *  from joueur j2 , gain where g.lieutournoi <> 'Roland Garros' and j2.nujoueur = j.nujoueur);

/*Pour chaque joueur, les adversaires qu ils ont toujours battus*/
select j.nom, j.prenom, p.nom, p.prenom
from joueur j, joueur p
where not exists(select *
      	    	 from rencontre r
		 where p.nujoueur = r.nugagnant and j.nujoueur = r.nuperdant )
      and exists(select *
      	    	 from rencontre r2
		 where j.nujoueur = r2.nugagnant and p.nujoueur = r2.nuperdant );

/*Noms des sponsors representes a tous les tournois*/
--Rendu normal -> Donnay, Dunlop, Lacoste, Vittel

--Premiere version
select distinct f.nomsponsor
from Gain f
where exists (select distinct g.lieutournoi
       	      from Gain g
	      where g.lieutournoi = 'Roland Garros' and g.nomsponsor = f.nomsponsor)
  and exists (select distinct h.lieutournoi
     	      from Gain h
	      where h.lieutournoi = 'Wimbledon' and h.nomsponsor = f.nomsponsor) 
  and exists (select distinct j.lieutournoi
     	      from Gain j
	      where j.lieutournoi = 'Flushing Meadow' and j.nomsponsor = f.nomsponsor) order by nomsponsor;

--Deuxieme version
select distinct sponsor.nomsponsor
from Gain sponsor
where not exists (select tournoi.lieutournoi
      	          from Gain tournoi
	          where not exists (select present.nomsponsor
	      	    	       	    from Gain present
				    where present.nomsponsor = sponsor.nomsponsor and present.lieutournoi = tournoi.lieutournoi));	     

/*Noms des pays qui ont eu un vainqueur de tournoi chaque annee*/
select distinct j.nationalite,r.annee
from joueur j, rencontre r
where j.nujoueur = r.nugagnant 
  and NOT EXISTS(select *
	         from rencontre r2
		 where r2.nuperdant = j.nujoueur 
                   and r2.annee = r.annee 
                   and r.lieutournoi = r2.lieutournoi) order by r.annee;
