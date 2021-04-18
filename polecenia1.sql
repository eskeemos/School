CREATE DATABASE bank;

CREATE TABLE konta(numer_konta varchar(26), stan_konta float, data_modyfikacji timestamp);

INSERT INTO konta VALUES('11122233344455566677788899',750.50,'2021-04-18 15:32:12'),('22233344455566677788899900',1223.20,'2021-04-18 15:33:52');

CREATE FUNCTION przelew(varchar(26),varchar(26), float)
RETURNS void AS
$$
    UPDATE konta set stan_konta = stan_konta - $3 WHERE numer_konta = $1;
    UPDATE konta set stan_konta = stan_konta + $3 WHERE numer_konta = $2
$$
LANGUAGE 'sql';

SELECT * FROM przelew('11122233344455566677788899','22233344455566677788899900',50);

SELECT * FROM konta;

CREATE DATABASE bank;

CREATE TABLE konta(numer_konta varchar(26), stan_konta float, data_modyfikacji timestamp);

CREATE OR REPLACE FUNCTION dateModify() 
RETURNS TRIGGER AS $$ BEGIN
NEW.data_modyfikacji = now();
    RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER dateMod
BEFORE UPDATE OR INSERT
ON konta
FOR EACH ROW
EXECUTE PROCEDURE dateModify();

INSERT INTO konta VALUES('11122233344455566677788899',1250.55,now()),('22233344455566677788899900',2678.25,now());

UPDATE konta SET stan_konta = 5050.90 WHERE numer_konta = '11122233344455566677788899';

SELECT * FROM konta;

DELIMITER // CREATE TRIGGER zad4 BEFORE INSERT ON personel FOR EACH ROW BEGIN SET NEW.data_zatr = now(); END // DELIMITER ;

INSERT INTO personel(nazwisko, imie) VALUES ("Luca", "Bonito");

DELIMITER // CREATE TRIGGER zad5 BEFORE UPDATE ON personel FOR EACH ROW BEGIN SET NEW.pensja = NEW.pensja * ((100 + NEW.staz) / 100); END // DELIMITER ;

UPDATE personel SET staz = staz + 1;

SELECT * FROM personel;

BEGIN TRANSACTION;
	UPDATE Personel SET pensja = pensja * 1.1;
ROLLBACK TRANSACTION;

BEGIN TRANSACTION;
	UPDATE Personel SET pensja = pensja * 1.1;
COMMIT TRANSACTION;



