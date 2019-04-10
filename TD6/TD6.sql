/*TD 06*/
/*creation des tables */
create table departement (
coddept varchar(6) primary key ,
nomdept varchar(20) ,
localite varchar(20)
);
create table  employer (
codemp varchar(6) primary key ,
nomemp varchar(20) , 
adremp varchar(40) ,
salaire_emp number(6,2) ,
coddept varchar(6) ,
constraint fk1 FOREIGN key (coddept) REFERENCES departement(coddept) 
);
/*exercice 3*/
declare 
cursor top10 is select codemp from employer order by salaire_emp asc ;
code varchar(6) ; 
begin
open top10 ;

loop 
fetch top10 INTO  code  ;
update  employer SET salaire_emp=salaire_emp*1.05 where codemp=code  ;
exit WHEN top10%rowcount=10 ;

end loop;
close top10;
end;
/*exercice 1*/
create table fournisseur (
numfour number(4) primary key  , 
nomfour varchar(20) , 
adressefour varchar(40)
);
create table produit (
numprod number(6) primary key ,
desprod varchar(40),
PUprod number(8,2) ,
qtest number(8,2),
qtermin number(8,2),
qtemax number(8,2),
couleur VARCHAR (20),
typeprod varchar(20) 
);
create table approvisionnement(
numprod number(6),
numfour number(4),
prixunit number(8,2) ,
primary key (numprod,numfour) ,
constraint fk2 foreign key (numprod) REFERENCES produit(numprod) , 
constraint fk3 foreign key (numfour) REFERENCES fournisseur(numfour) 
);
/*a*/
set SERVEROUTPUT ON ;
DECLARE 
cursor c is select puprod from produit where puprod<500 ;
cursor b is select puprod from produit where puprod>500 and puprod<1000 ;
cursor a is select puprod from produit where puprod>1000 ;
aux number ;
aux1 number ;
aux2 number ;
begin
open c ;

loop 
fetch c INTO aux ;
DBMS_OUTPUT.put_line(c);
end loop;
close c;
open c ;

loop 
fetch b INTO aux1 ;
DBMS_OUTPUT.put_line(b);
end loop;
close b;
loop 
fetch a INTO aux2 ;
DBMS_OUTPUT.put_line(a);
end loop;
close a;
/*b*/
