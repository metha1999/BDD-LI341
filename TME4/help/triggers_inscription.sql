CREATE TABLE TD (
       Diplome varchar2(20),
       Matiere varchar2(20),
       NoTD number(1),
       Jour varchar2(8),
       Heure number(4),
       Salle number(7),
       NoEnseignant number(7),

primary key (NoTD, Diplome, Matiere),
unique (Jour, Heure, Salle),
unique (NoEnseignant, Jour, Heure)
);


CREATE TABLE Inscription (
       NoEtudiant number(7) primary key,
       Diplome varchar2(20),
       Matiere varchar2(20),
       NoTD number(1),
       Date_inscription date,

unique (NoTd, Matiere)
);

CREATE TABLE Mat (
       Matiere varchar2(20),
       Enseignant_Responsable number(7)
);


insert into TD values ('Licence','BD',5,'mercredi',0845,2324112,1111111);
insert into Inscription values (2900825,'Licence', 'BD', 5, TO_DATE('22-09-2010','DD-MM-YYYY'));

/* Creation trigger qui assure que les valeurs des diplomes et matieres soient en majuscule*/

Create or replace trigger inscrip_majusc
before update or insert  on Inscription 
for each row
begin
	:new.diplome := upper(:new.diplome);
	:new.matiere := upper(:new.matiere);
end;
/

Create table LocEtud (
       NoEtudiant number(7),
       Jour varchar(20),
       Heure number(4),
       Salle number(7),
Unique (NoEtudiant, Jour, Heure)
);

Create or replace trigger pas_2_td_mm_tps
before insert on inscription
for each row 
--when (select * from LocEtud e when e.noetudiant=:old.noetudiant and e.jour=:old.jour and e.heure=:old.heure)
begin
	declare noetud number(7);
	declare jr varchar(20);
	declare hr number(4);

	insert into LocEtud values (:new.noetudiant,:new.jour,:new.heure, :new.salle);
	
	select noetudiant into noetud  from inscription where noetudiant=:new.noetudiant;
	select jour into jr from inscription where jour=:new.jour;
	select heure into hr from inscription where heure=:new.heure;
end;
/
