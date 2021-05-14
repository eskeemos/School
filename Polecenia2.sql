DESCRIBE towary;

ALTER TABLE towary
MODIFY id_towaru varchar(10),
MODIFY nazwa varchar(30),
MODIFY opis varchar(30),
MODIFY id_dostaw varchar(4),
MODIFY nie_kontyn varchar(1);

ALTER TABLE towary
CHANGE cena cena_detaliczna double,
CHANGE nazwa nazwa_towaru varchar(30);

ALTER TABLE towary
ADD COLUMN miejsce_produkcji varchar(100);

ALTER TABLE towary
ALTER column miejsce_produkcji SET DEFAULT "Made In Poland";

ALTER TABLE towary
DROP COLUMN komentarz;

ALTER TABLE towary RENAME TO magazyn;

show TABLES;

SHOW CREATE TABLE towary;

mysql -u root -p

ALTER TABLE students RENAME TO studenci;

ALTER TABLE studenci 
CHANGE Student_id id_studenta varchar(7), 
CHANGE Family_name nazwisko varchar(50), 
CHANGE Name imie varchar(30), 
CHANGE Country kraj varchar(100);

ALTER TABLE studenci ALTER COLUMN kraj SET DEFAULT "Polska";

CREATE DATABASE firma;
CREATE TABLE Dostawcy(
    id_dostawcy int,
    adres varchar(50),
    telefon char(9));
CREATE TABLE Towary(
    id_towaru int,
    id_dostawcy int,
    nazwa varchar(50),
    cena int
);
CREATE TABLE Magazyn(
    id_towaru int,
    liczba_sztuk int);

ALTER TABLE dostawcy
ADD PRIMARY KEY(id_dostawcy);
ALTER TABLE towary
ADD PRIMARY KEY(id_towaru);
ALTER TABLE towary
ADD FOREIGN KEY (id_dostawcy) REFERENCES dostawcy(id_dostawcy);
ALTER TABLE magazyn
ADD FOREIGN KEY (id_towaru) REFERENCES towary(id_towaru);
