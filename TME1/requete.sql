/* #TME1 : 2900825*/

/*Suppression des tables*/
drop table Mat;
drop table Inscription;
drop table TD;

/*Creation Table Mat*/
create table Mat (
matiere number(3) not null,
responsable number(3));

/*Creation Table TD*/
create table TD (
diplome char(2) not null,
matiere number(3) not null,
noTD number(1) not null,
jour char(3) not null,
heure char(5) not null,
salle char(7) not null,
noEns number(3) not null,

primary key(noTD, diplome, matiere),
unique(jour, heure, salle),
unique(noEns, heure, jour));

/*Creation Table Inscription*/
create table Inscription (
noEtu number(7) not null,
diplome char(2) not null,
matiere number(3) not null,
noTD number(1) not null,
date_insc varchar2(8) not null,

foreign key (noTD,matiere,diplome) references TD(noTD,matiere,diplome),
unique(noTD, matiere, noEtu, diplome));

/***********************/
/*Insertion des donnees*/
/***********************/

/*Mat*/
insert into Mat values (310, NULL);
insert into Mat values (311, NULL);
insert into Mat values (312, NULL);
insert into Mat values (314, NULL);
insert into Mat values (323, NULL);
insert into Mat values (330, NULL);
insert into Mat values (341, NULL);
insert into Mat values (356, NULL);

/*TD*/
insert into TD values ('LI', 341, 3, 'mar', '16h00', '2324107', '001');
insert into TD values ('LI', 341, 1, 'ven', '08h45', '2324103', '001');
insert into TD values ('LI', 311, 4, 'mer', '14h00', '2324102', '002');
insert into TD values ('LI', 314, 6, 'ven', '10h45', '2324102', '003');
insert into TD values ('LI', 323, 1, 'jeu', '14h00', '2324107', '004');
insert into TD values ('LI', 330, 1, 'lun', '14h00', '2324103', '004');
insert into TD values ('LI', 356, 1, 'mar', '14h00', '2324103', '005');
insert into TD values ('LI', 356, 3, 'mer', '14h00', '2324103', '001');

/*Inscription*/
insert into Inscription values (2900825, 'LI', 341, 3, '20132014');
insert into Inscription values (2900825, 'LI', 311, 4, '20132014');
insert into Inscription values (2900825, 'LI', 314, 6, '20132014');
insert into Inscription values (2900825, 'LI', 323, 1, '20132014');
insert into Inscription values (2900825, 'LI', 330, 1, '20132014');
insert into Inscription values (5280092, 'LI', 341, 3, '20132014');
insert into Inscription values (1234567, 'LI', 356, 1, '20132014');

/*Affichage des tables*/
@liste;
select * from Mat;
select * from TD;
select * from Inscription;

/**********/
/*Requetes*/
/**********/

/*Donne les matieres enseignees par l UFR*/
select distinct matiere
from Mat order by matiere;

/*Donne les identifiants des enseignants qui enseignent le mardi*/
select noEns,jour
from TD
where jour = 'mar';

/*Donne le nombre de personnes inscrite en 341*/
select noEtu,matiere
from Inscription
where matiere = 341;

/*Donne les etudiants en Licence qui ont TD avec l enseignant 1*/
select distinct i.noEtu, t.noEns
from Inscription i,TD t
where i.diplome = 'LI' and t.noEns = 1;
