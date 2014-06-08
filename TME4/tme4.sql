/*TME1*/

/*Création des deux tables*/

drop table INSCRIPTION;
drop table TD;
drop table Mat;

CREATE TABLE INSCRIPTION
(      NoEtudiant int,
       Diplome varchar2(20),
       Matiere varchar2(20),
       NoTD int,
       Date_Inscription date
);
       
CREATE TABLE TD
(      Diplome varchar2(20),
       Matiere varchar2(20),
       NoTD int,
       Jour varchar2(20),
       Heure number(4),
       Salle number(7),
       NoEnseignant number(7),

       PRIMARY KEY (NoTD,Diplome,Matiere)
);

create table Mat
(      Matiere varchar2(20),
       enseignant_responsable number(7)
);


/*Ajout des contraintes*/
alter table TD add constraint unicite_td unique(Jour, Heure, Salle);
alter table TD add constraint unicite_td1 unique(Jour, Heure,NoEnseignant);
alter table INSCRIPTION add constraint unicite_inscription unique(NoEtudiant, Matiere, Diplome);

/*Insertion de nuples*/

Insert Into TD (Diplome, Matiere,NoTD, jour) values ('licence', 'BD', 1,' mardi');
Insert Into TD (Diplome, Matiere,NoTD, jour) values ('licence', 'ALGO', 2,' mercredi');
Insert Into TD (Diplome, Matiere,NoTd, jour, heure, salle,noEnseignant) values ('licence', 'ALGO', 3,' mercredi', 1400, 2324103,1111111);
Insert Into TD (Diplome, Matiere,NoTd, jour, heure, salle,noEnseignant) values ('licence', 'BD', 4,' mercredi', 1400,2324104,2222222);

Insert Into INSCRIPTION values (1, 'licence', 'BD', 1, null);
Insert Into INSCRIPTION values (2,'licence', 'BD', 1, null);
Insert Into INSCRIPTION values (2,'licence', 'algo', 3, null);

Insert Into Mat  values ('BD', 1);
insert Into Mat  values ('Algo',null);

/*Violation des contraintes*/
Insert Into INSCRIPTION  values (2,'licence', 'BD', 2, null); /*INSERT REFUSED  */
Insert Into INSCRIPTION  values (2,'LICENCE', 'bd', 2, null); /*INSERT REFUSED  */
Insert Into INSCRIPTION  values (2,'licence', 'bd', 2, null); /*INSERT REFUSED  */
Insert Into INSCRIPTION  values (2,'LICENCE', 'BD', 2, null); /*INSERT REFUSED  */

update INSCRIPTION set NoEtudiant=2;                          /*UPDATE REFUSED  */

Insert Into INSCRIPTION  values (2,'licence', 'BD', 4, null); /*INSERT REFUSED  */

Update TD set salle=2324104 where NoTD=3 and Matiere='ALGO';    /*UPDATE REFUSED  */
Update TD set salle=2324103 where NoTD=4 and Matiere='BD';      /*UPDATE REFUSED  */

/*Requêtes*/

select * from TD;
select * from MAT;
select * from INSCRIPTION;

select m.Matiere 
from Mat m ;

select t.NoEnseignant
from TD t
where t.jour =' mercredi';

select i.NoEtudiant
from INSCRIPTION i
where i.Matiere = 'BD';

select i.NoEtudiant
from TD td, INSCRIPTION i
where td.NoEnseignant = 1 and i.Diplome = 'LICENCE';

/*QUESTIONS*/

/*Question 1*/
/*
create or replace trigger en_majuscules
before 
insert or update of Diplome, Matiere
on Inscription
for each row
begin 
     EXECUTE IMMEDIATE ' select upper(i.Diplome,i.Matiere)
      from Inscription i';
end;
/
show error;
*/

create or replace trigger en_majuscules
before insert or update of Diplome, Matiere on Inscription
for each row
begin 
      :new.Diplome := upper(:new.Diplome);
      :new.Matiere := upper(:new.Matiere);
end;
/
show error;

/*Question 4*/ 

drop table tab;

create table tab
(
	NoEtudiant int,
	Jour char varying(20),
        Heure char varying(20),
        Salle char varying(20)
);

alter table tab add constraint unicite_tab unique(NoEtudiant,Jour, Heure);

create or replace trigger incompatible
before insert on Inscription
for each row
declare 
S number;
J varchar2;
H number;
begin 
      select salle into S from TD;
      select jour into J from TD;
      select heure into H from TD;
      Insert Into tab values (:NEW.NoEtudiant,J,H,S);
end;
/
show error;
