CREATE TABLE Film(
    numF number(10) primary key,
    genre varchar(20),
    annee varchar(20),
    duree varchar(20),
    budget number(10),
    realisateur varchar(20),
    salaire_realisateur number(20)
);

CREATE TABLE Distrubution(
    numF number(10),
    numA number(10),
    role varchar (20),
    salaire number(20)
);

CREATE TABLE Personne(
    numP number(20) Primary key,
    nom varchar(20),
    prenom varchar(20),
    datenais date
);

CREATE TABLE Acteur(
    numA number(10) primary key,
    speialite varchar(10),
    taille varchar(10), 
    poids varchar(10)
);


ALTER TABLE Film ADD CONSTRAINT realisateur_Fkey FOREIGN KEY(realisateur) references Personne (numP);
ALTER TABLE Distrubution ADD CONSTRAINT numFilm_Fkey FOREIGN KEY (numF) references Film (numF);
ALTER TABLE Distrubution ADD CONSTRAINT numA_Fkey FOREIGN KEY (numA) references Acteur(numA);
ALTER TABLE Acteur ADD CONSTRAINT numA_keey FOREIGN KEY (numA) references Personne(numP);

SELECT * FROM FILM;
SELECT * FROM FILM WHERE (duree > 180);
    
SELECT DISTINCT genre FROM FILM;

SELECT Count(*) FROM Film group by (genre);
SELECT MAX(duree) from film;
SELECT numF,annee from Film where duree = (SELECT MAX(duree) from film);

SELECT nom FROM Personne where (numP not in (select realisateur from Film)) and  (nump not in( select numA from acteur)) ;



 
