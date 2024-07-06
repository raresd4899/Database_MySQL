CREATE DATABASE bd_curs2;
USE bd_curs2;

-- produs: id(PK), nume, descriere, pret, disponibil, id_categorie (FK)
CREATE TABLE produs (
	id  INT NOT NULL AUTO_INCREMENT,
	nume VARCHAR(50) NOT NULL,
	descriere TEXT,
	pret DECIMAL (7, 2) NOT NULL, -- 99999.99
	disponibil BOOLEAN NOT NULL,
	PRIMARY KEY (id)
);

-- catregorie: id, denumire
CREATE TABLE categorie (
	id TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	denumire VARCHAR(50) NOT NULL
);

ALTER TABLE produs
ADD COLUMN id_categorie TINYINT NOT NULL
AFTER descriere;

ALTER TABLE produs
ADD CONSTRAINT produs_fk1
FOREIGN KEY (id_categorie) REFERENCES categorie (id);


-- Client: id (pk), nume, adresa, data_nastere
CREATE TABLE client (
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nume VARCHAR(50) NOT NULL,
    adresa TEXT,
    data_nastere DATE NOT NULL
    );
    
    
    -- comanda: id (pk), data, tip_ plata, id_client
    CREATE TABLE comanda(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    tip_plata ENUM ( 'cash', 'card', 'transfer'),
    id_client INT NOT NULL,
    FOREIGN KEY (id_client) REFERENCES client (id)
    );
    
    -- factura; id produs fk, id_ comanda (fk)
    CREATE TABLE factura(
    id_produs INT NOT NULL,
    id_comanda INT NOT NULL,
    FOREIGN KEY (id_produs) REFERENCES produs (id),
    FOREIGN KEY (id_comanda) REFERENCES comanda (id)
    );

ALTER TABLE factura
ADD PRIMARY KEY factura_pk(id_produs ASC, id_comanda ASC);


 