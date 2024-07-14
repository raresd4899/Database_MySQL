CREATE DATABASE IF NOT EXISTS bd_curs3;
USE bd_curs3;

CREATE TABLE IF NOT EXISTS film(
id TINYINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
titlu VARCHAR (50) NOT NULL DEFAULT 'N/A',
regizor VARCHAR (50) NOT NULL DEFAULT 'N/A',
protagonist VARCHAR (50) NOT NULL DEFAULT 'N/A',
data_aparitie DATE NOT NULL DEFAULT '2018-01-01',
oscar ENUM('DA', 'NU' ) NOT NULL DEFAULT 'NU',
durata TINYINT UNSIGNED NOT NULL DEFAULT 120,
categorie ENUM('Drama', 'Dragoste', 'Actiune', 'Thriler', 'SF' , 'Horror', 'Comedie', 'Aventura'),
rating DECIMAL ( 4,2) NOT NULL DEFAULT 0,
tara_origine VARCHAR(30) NOT NULL DEFAULT 'USA'
);

INSERT INTO film
(titlu, protagonist, regizor, data_aparitie, rating, oscar, durata, categorie, tara_origine) values
( 'Red Sparrow', 'Jennifer Lawrence','Francis Lawrence' , '20180302', '6.8', 'Nu', '140', 'Drama','USA'),
( 'Wander Woman', 'Gal Gadot', 'Patty Jenkins', '20170602','7.5','Nu','141', 'Actiune','USA'),
('The Godfather', 'Al Pacino', 'Francais Ford  Coppola', '19720324', '9.2', 'Da', '175', 'Drama','USA'),
( 'Gravity' , 'Sandra Bullock', 'Alfonso Cuaron', '20131004', '7.8', 'Da', '91', 'SF','USA'),
( 'The notebook' , 'Gena Rowlands' , 'Nick Cassavetes', '20040625', '7.9', 'Nu', '123', 'Dragoste','USA');

-- cate fimle au/n-au oscar
SELECT oscar, COUNT(*)
FROM film
GROUP BY oscar;

-- Rating min, max, mediu pentru fiecare categorie
SELECT 
categorie,
MIN (rating) minim,
MAX (rating) maxim,
AVG (rating) mediu
FROM film 
GROUP BY categorie;

-- cate filme au aparut in fiecare an
SELECT YEAR (data_aparitiei) an, count(*) nr_filme
FROM film
WHERE YEAR(data_aparitie) > 2000
GROUP BY an;

-- rating mediu per categorie, dar numai pentru categoriilecu un rating mediu >= 8
SELECT categorie, AVG (rating) rating_mediu
FROM film
GROUP BY categorie
HAVING rating_mediu >= 8;

-- rating mediu pt categoriile drama, actiune, horror, dar numai rez cu rating mediu >=7.5
SELECT categorie, AVG (rating) rating_mediu
From film
WHERE categorie IN ( 'Drama', 'Actriune', 'Horror')
GROUP BY categorie
HAVING rating_mediu >= 7.5;  
 
 -- rating mediu pentru categoriile de sus cu rezultate peste 6.5 (toate)
 SELECT categorie, AVG (rating) rating_mediu
From film
WHERE categorie IN ( 'Drama', 'Actriune', 'Horror')
GROUP BY categorie
HAVING rating_mediu >= 6.5;  

-- categoriile cu cel putin 2 filme, aparute dupa 2008
SELECT categorie, COUNT(*) nr_filme
FROM film
WHERE YEAR (data_aparitie) > 2008
GROUP BY categorie
HAVING nr_filme >=2;

