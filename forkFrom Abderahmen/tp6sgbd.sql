CREATE TABLE Fournisseur(
    numFour number(10) PRIMARY KEY,
    nomFour varchar(20),
    adresseFour varchar(20)
);
CREATE TABLE c(
    numProd number(10) PRIMARY KEY,
    desProd varchar(10),
    PUprod number(10),
    qtestk number(10),
    qtemin number(10),
    qtemax number(10),
    couleur varchar(20),
    typeprod varchar(20)
);
create table Approvisment(
    numProd number(10),
    numFour number(10),
    prixunit number(10)
);
ALTER TABLE Approvisment ADD CONSTRAINT fKey1 FOREIGN KEY (numProd) references Produit(numProd);
ALTER TABLE Approvisment ADD CONSTRAINT fKey2 FOREIGN KEY (numFour) references Fournisseur(numFour);
ALTER TABLE Approvisment ADD constraint pKey2 PRIMARY KEY (numFour, numProd);


set SERVEROUTPUT ON ;
/*A - B */
/*
DECLARE 
    CURSOR c_puProd is select numProd, PUprod, typeprod, couleur from Produit;
    
BEGIN
    for i in c_puProd loop 

    if(i.PUprod < 500) then 
        update Produit set typeprod = 'C' where numProd = i.numProd;

    else if (i.PUprod >= 500 and i.PUprod < 100) then
        update Produit set typeprod = 'B' where numProd = i.numProd;
    else if( i.PUprod > 1000) then
        update Produit set typeprod = 'A' where numProd = i.numProd;
    else if(i.couleur = 'rouge') then
        Update produit set qtestk = (qtestk * 0.1) where couleur = i.couleur;
        DBMS_OUTPUT.PUT_LINE('Color changed');
    end if;
    end if;
    end if;
    end if;
    DBMS_OUTPUT.put_line(i.typeprod);
end loop;

end;
*/
/*C*/

CREATE TABLE COMMANDE(
    numProd number(10), 
    datecde date,
    numFour number(10),
    qtecde number(10),
    constraint pkey PRIMARY KEY (numProd,datecde),
    constraint fkey11 FOREIGN KEY (numFour) references Fournisseur(numFour),
    constraint fkey21 FOREIGN KEY (numProd) references Produit(numProd)
);

set serveroutput on
declare
cursor c_prod is select numprod,qtestk,qtemin,qtemax from Produit;
nf number(6);
qtec number(6);
begin 
    select numfour into nf from Approvisment where prixunit=(select min(prixunit) from Approvisment);
    for i in c_prod loop
    qtec :=  i.qtemax - i.qtemin;
    if (i.qtestk < i.qtemin) 
    then 
      insert into Commande (numprod,datecde, numfour, qtecde) values (i.numprod,sysdate, nf, qtec );
    end if;
    end loop;

end;
    
