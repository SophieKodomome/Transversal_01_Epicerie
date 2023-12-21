CREATE USER epicerie WITH PASSWORD 'epicerie';
ALTER USER Epicerie WITH SUPERUSER; 

CREATE DATABASE epicerie;
\c epicerie;

CREATE TABLE TypeP(
    idType Serial PRIMARY KEY,
    nomType VARCHAR
);
CREATE TABLE Categorie(
    idCategorie Serial PRIMARY KEY,
    nomCategorie VARCHAR
);

CREATE TABLE Produits(
    idProduit Serial PRIMARY KEY,
    nomProduit VARCHAR,
    prix int,
    dateProduit TIMESTAMP,
    typeProduit int,
    categorie int,    
    FOREIGN KEY (typeProduit) References TypeP(idType),
    FOREIGN KEY (categorie) References Categorie(idCategorie)
);

CREATE TABLE Clients(
    idClients Serial PRIMARY KEY,
    nom VARCHAR,
    idProduit int, 
    dateAchat TIMESTAMP,
    FOREIGN KEY (idProduit) References Produits(idProduit)
);

INSERT INTO TypeP (nomType) VALUES ('Liquide');
INSERT INTO TypeP (nomType) VALUES ('Solide');

INSERT INTO Categorie(nomCategorie) VALUES ('Luxe');
INSERT INTO Categorie(nomCategorie) VALUES ('Moyenne');
INSERT INTO Categorie(nomCategorie) VALUES ('Standard');

INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES ('Stylo',700,TIMESTAMP'2023-12-13',2,3);
INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES ('EauVive',2000,TIMESTAMP'2023-12-13',1,3);
INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES ('Mouchoir',600,TIMESTAMP'2023-12-13',2,3);
INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES ('Riz',5000,TIMESTAMP'2023-12-13',2,2);
INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES ('Sedaap',1000,TIMESTAMP'2023-12-13',2,2);
INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES ('Cornichon',20000,TIMESTAMP'2023-12-13',2,1);
INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES ('Jambon',15000,TIMESTAMP'2023-12-13',2,1);

INSERT INTO Clients(nom,idProduit,dateAchat) VALUES ('Peter',2,TIMESTAMP'2023-12-13');
INSERT INTO Clients(nom,idProduit,dateAchat) VALUES ('Kevin',1,TIMESTAMP'2023-12-13');
INSERT INTO Clients(nom,idProduit,dateAchat) VALUES ('Tsiky',8,TIMESTAMP'2023-12-13');


SELECT * FROM Produits;

create or replace view v_produits as
    select distinct(p.nomProduit) as nomProduit,p.prix,p.dateProduit,t.nomType
    from Produits p
    join TypeP t
    on p.typeProduit=t.idType

create or replace view v2_produits as
    select distinct(p.nomProduit) as nomProduit,p.prix,p.categorie,c.nomCategorie,p.dateProduit,t.nomType
    from Produits p
    join TypeP t
    on p.typeProduit=t.idType
    join Categorie c
    on p.categorie=c.idCategorie
