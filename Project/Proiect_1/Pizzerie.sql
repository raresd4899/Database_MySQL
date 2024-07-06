CREATE DATABASE Pizzerie;
USE Pizzerie;

CREATE TABLE Client (
id INT NOT NULL AUTO_INCREMENT,
nume VARCHAR(30) NOT NULL,
adresa TEXT NOT NULL,
numar_telefon INT NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE Comanda (
id_comanda INT NOT NULL AUTO_INCREMENT,
tip_produs TEXT NOT NULL,
numar_bucati TINYINT NOT NULL,
modalitate_plata CHAR (10) NOT NULL,
PRIMARY KEY (id_comanda),
FOREIGN KEY (id_comanda) REFERENCES Client (id)
);

CREATE TABLE Dispecerat (
ID_c INT NOT NULL,
ID_COM INT NOT NULL,
FOREIGN KEY (ID_c) REFERENCES Client (id),
FOREIGN KEY (ID_ COM) REFERENCES Comanda (id_comanda)
);

CREATE TABLE Factura (
ID_produs INT NOT NULL,
ID_client INT NOT NULL,
FOREIGN KEY (ID_produs) REFERENCES Produse (cod),
FOREIGN KEY (ID_client) REFERENCES Comanda (id_comanda)
);


CREATE TABLE Produse (
cod INT NOT NULL AUTO_INCREMENT,
denumire TEXT NOT NULL,
incrediente TEXT NOT NULL,
PRET DECIMAL (3, 2) NOT NULL,
dimensiune TINYTEXT NOT NULL,
PRIMARY KEY (cod)
);
 

