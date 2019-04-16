//-------------1
CREATE TABLE VOITURE(
    CODV VARCHAR(2) PRIMARY KEY,
    DESIGNATION VARCHAR(50),
    MARQUE VARCHAR(20),
    PUISSANCE NUMBER(2),
    PRIXBAS NUMBER(9,3)
);
CREATE TABLE CLIENT(    
    NOC NUMBER(6) PRIMARY KEY,
    NOM VARCHAR(50),
    PRENOM VARCHAR(50)
);
CREATE TABLE Vente(
    NOV VARCHAR(29) primary key CHECK (NOV LIKE 'V%'),
    NOC NUMBER(6),
    CODV varchar(2),
    COULEUR VARCHAR(10) default 'Blanc',
    PRIXBAS NUMBER(7,3) default 0,
    CONSTRAINT FKEY FOREIGN KEY (NOC) REFERENCES CLIENT (NOC),
    CONSTRAINT FK FOREIGN KEY (CODV) REFERENCES VOITURE (CODV)
);

INSERT INTO CLIENT VALUES (0, 'MOHAMMED', 'ALI');
INSERT INTO CLIENT VALUES (1, 'SABER', 'KAJ');

INSERT INTO VOITURE VALUES ('0', '4*4', 'rangerover', 5, 150);
INSERT INTO VOITURE VALUES ('1', 'Cid', 'clio', 4, 1500);
INSERT INTO VOITURE VALUES ('2', '4*4', 'vw', 1, 100);

INSERT INTO VENTE VALUES ('0', '0', '0', 'Bleu', 100);
INSERT INTO VENTE VALUES ('1', '1', '1', 'Rouge', 200);
INSERT INTO VENTE VALUES ('2', '0', '2', 'Bleu', 200);






SELECT NOV FROM vente VENTE, voiture VOITURE WHERE (vente.COULEUR like 'Bleu' AND (vente.CODV = voiture.CODV AND voiture.marque like 'VW'));
SELECT client.NOM, client.PRENOM FROM client CLIENT, voiture VOITURE WHERE (select CODV from vente where client.noc = vente.noc) = voiture.codv  and voiture.puissance = (select max(puissance) from voiture);
select client.NOC from client CLIENT, vente VENTE WHERE vente.CODV = (SELECT CODV FROM VENTE WHERE NOC = 1);
SELECT MARQUE FROM VOITURE GROUP BY MARQUE HAVING AVG(PRIXBAS) < 20000;
select MARQUE FROM VOITURE WHERE (SELECT AVG(PRIXBAS) from voiture) < 20000;

create view v_n as select count(codv) as a from voiture group by marque;

CREATE VIEW V_NBR_MARQUE_VOITURE AS SELECT MARQUE as m ,count(ven.codv) as nb from VOITURE vo, VENTE ven where vo.codv = ven.codv group by (marque);
select * from V_NBR_MARQUE_VOITURE;
select m from V_NBR_MARQUE_VOITURE where nb = (select max(nb) from V_NBR_MARQUE_VOITURE);



set SERVEROUTPUT ON ;
declare 
n client .nom%type;
m voiture .marque%type;
nom client .nom%type;
prenom client .prenom%type;
CURSOR myCursor is select nom, prenom from client where NOC > 150 and NOC < 300; 
begin
    select nom, marque into n,m from voiture v , client c , vente vt where v.codv = vt.codv and vt.noc = c.noc and vt.nov = '1';
        dbms_output.put_line('Le client ' || N || ' a achete voiture de marque ' || m );
        
    open myCursor;
    loop 
        fetch myCursor into nom,prenom;
        dbms_output.put_line(nom || ' ' || prenom);
    exit when myCursor%notfound;
    end loop;
    close myCursor;
end;

