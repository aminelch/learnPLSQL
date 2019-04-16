/*** CREATION DE TABLE VILLE **/
/**
create table Villes(
ville varchar(255) primary key ,
pays varchar(255)
);

create table  Hotels (
codeHotel varchar(255) primary key ,
nomHotel varchar(255) , 
telHotel varchar(40) ,
categHotel varchar(40) ,
dateConst DATE ,
constraint fk1 FOREIGN key (villeHotel) REFERENCES Villes(ville)

);  **/ 

/*
INSERT INTO "TD6"."VILLES" (VILLE, PAYS) VALUES ('tunis', 'tunisie');

INSERT INTO "TD6"."VILLES" (VILLE, PAYS) VALUES ('paris', 'france')
*/ 

/*CREATE VIEW V_Des_Res AS SELECT h.codeHotel,h.nomHotel,h.VilleHotel FROM Hotels h,Reservations r WHERE h.codeHotel = r.codeHotel
AND ( r.dateDebut > = '01/12/2016' AND r.dateDebut < = '31/12/2016') ;  */
SELECT
    v_des_res.nomhotel
FROM
    v_des_res
WHERE
    v_des_res.villehotel = (
        SELECT
            ville
        FROM
            villes
        WHERE
            pays LIKE '%france'
    )
    AND nomhotel LIKE '%Spa';
    
    
/*
SELECT
    hotels.nomhotel
FROM
    hotels,
    reservations
WHERE
    hotels.codehotel = reservation.codehotel
    AND HAVING COUNT(*) >1000 AND 

*/





set SERVEROUTPUT on;
declare 
Ville hotels.villehotel%type='&Ville' ; 
cursor or is select nomHotel,categHotel,telHotel FROM hotels where villehotel=ville ;
nomHotel hotels.nomHotel%type;



/************** PARTIE PL / SQL **************/ 
/*** 5 ***/ 
SET SERVEROUTPUT ON;

DECLARE 
    begin UPDATE reservation
SET
    montant = montant - ( montant * 0.1 )
WHERE
    ( datefin - datedebut > 14 )

end; 




/*** AUTRE SOLUTION ***/ 


















