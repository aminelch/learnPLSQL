CREATE TABLE Villes(
    ville VARCHAR(20) PRIMARY KEY,
    pays VARCHAR(20)
);
CREATE TABLE Clients(
    numClient NUMBER(8) PRIMARY KEY,
    nomClient VARCHAR(20),
    telClient VARCHAR(20),
    villeClient VARCHAR(20),
    FOREIGN KEY (villeClient) REFERENCES Villes(ville)
);
CREATE TABLE Hotel(
    codeHotel NUMBER(8) PRIMARY KEY,
    nomHotel VARCHAR(20),
    villeHotel VARCHAR(20),
    telHotel VARCHAR(8),
    categHotel VARCHAR(20),
    dateConst date,
    FOREIGN KEY (villeHotel) REFERENCES Villes(ville)

);

CREATE TABLE Reservation(
    numResa NUMBER(8) PRIMARY KEY,
    numClient NUMBER(8),
    codeHotel NUMBER(8),
    dataDebut date,
    dateFin date,
    noChambre NUMBER(8),
    montant NUMBER(8),
    FOREIGN KEY (numClient) REFERENCES Clients(numClient),
    FOREIGN KEY (codeHotel) REFERENCES Hotel(codeHotel)
);

INSERT INTO VILLES VALUES ('Grombalia', 'Nabeul');
INSERT INTO CLIENTS VALUES  (1, 'Skander', '26026021', 'Grombalia');
INSERT INTO HOTEL VALUES (0, 'GrombaliaSpa', 'Grombalia', '99521725', 'SPA' , sysdate);
INSERT INTO RESERVATION VALUES(0, 1, 0, TO_DATE( '31-12-2019 ',  'DD-MM-YYYY' ), TO_DATE( '31-12-2020 ',  'DD-MM-YYYY' ), 10, 200);

CREATE VIEW V_Desc_Res as select codeHotel, nomHotel, villeHotel FROM Hotel where codeHotel = (SELECT (codeHotel) From Reservation where (SELECT Extract(MONTH FROM dataDebut) FROM Reservation) = '12' );

SELECT nomHotel FROM V_Desc_Res WHERE  nomHotel LIKE '%Spa';

SELECT h.nomHotel FROM Hotel h, Reservation r WHERE (h.codeHotel = r.codeHotel) AND (SELECT COUNT(numResa) FROM Reservation) > 100000 AND (SELECT Extract(YEAR FROM dataDebut) FROM Reservation) = '2019';

set SERVEROUT on;
DECLARE 


    /* 
        4
    /*
    sville VARCHAR(20) := '&ville';
    Cursor c1 is SELECT nomHotel, categHotel, telHotel from Hotel where villeHotel LIKE sville; */
    Cursor c2 is SELECT numResa, dataDebut, dateFin, montant from Reservation;
    x NUMBER(8);
    
BEGIN
    /*
    /* 4-
    DBMS_OUTPUT.put_line('Ville ' ||ville );
    DBMS_OUTPUT.put_line('Nom Hotel' || ' ' || ' Catégory '|| ' ' || 'Numero Téléphone');

    FOR i in c1 LOOP 
        DBMS_OUTPUT.put_line(i.nomHotel || ' ' || i.categHotel || ' ' || i.telHotel );
        
    End loop; */
    
    /* 5- */
    For i in c2 LOOP
        if(i.dateFin - i.dataDebut > 14) then
                x := i.montant * 0.1;
                UPDATE Reservation set montant = x where numResa = i.numResa;
            end if;
    end loop;
    

END;

