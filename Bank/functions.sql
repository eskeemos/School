#1. podwyżka premi stanowiska
CREATE PROCEDURE WykonajPodwyżkePłacyPodstawowej(IN kwota float) UPDATE stanowisko SET PłacaPodstawowa = PłacaPodstawowa + kwota;

#2 transakcja przelewu
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `WykonajPrzelew`(IN `NumerKontaWykonawcy` TEXT, IN `NumerKontaOdbiorcy` TEXT, IN `Kwota` FLOAT, OUT `WynikTransakcji` INT)
BEGIN
    DECLARE rols BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR
    SQLEXCEPTION SET rols = 1;
IF(SELECT COUNT(*) FROM rachunek_kredytowy WHERE ID LIKE NumerKontaWykonawcy AND Środki >= Kwota)
=1  THEN 
    SET WynikTransakcji = 1;
    SET rols = 0;
    ELSE
    SET WynikTransakcji = 0;
    SET rols = 1;
END IF;
START TRANSACTION;
INSERT INTO `data` VALUES(NULL,(SELECT YEAR(CURRENT_TIME)),(SELECT MONTHNAME(CURRENT_TIME)),(SELECT DAY(CURRENT_TIME)),(SELECT CURRENT_TIME));
INSERT INTO transakcje VALUES(NULL,Kwota,((SELECT klient.ID FROM klient INNER JOIN rachunek_kredytowy ON rachunek_kredytowy.Klient_ID = klient.ID WHERE rachunek_kredytowy.ID LIKE NumerKontaWykonawcy)),(SELECT ID FROM `data` ORDER BY ID DESC LIMIT 1),1,1);
UPDATE rachunek_kredytowy SET Środki = Środki - Kwota  WHERE ID LIKE NumerKontaWykonawcy;
UPDATE rachunek_kredytowy SET Środki = Środki + Kwota  WHERE ID LIKE NumerKontaOdbiorcy;
IF rols THEN ROLLBACK;
    ELSE COMMIT;
END IF;
END$$
DELIMITER ;

#3  Trigger dla zmainy wysokości płacy w stanowisku
DELIMITER //
CREATE TRIGGER ZmianaWysokościPłacyPodstawowej AFTER UPDATE ON stanowisko
FOR EACH ROW
BEGIN
    UPDATE wypłata SET PensjaPodstawowa = (NEW.PłacaPodstawowa) WHERE ID = (SELECT W.ID FROM wypłata W INNER JOIN pracownik P ON W.Pracownik_ID = P.ID INNER JOIN stanowisko S ON P.ID = S.ID WHERE S.ID = OLD.ID);
END //
DELIMITER ;

#4 - Trigger dla zmiany wysokości premii
DELIMITER //
CREATE TRIGGER ZmianaWysokościPremii AFTER UPDATE ON premia
FOR EACH ROW
BEGIN
    DECLARE ID_Klienta INT;SET ID_Klienta = (SELECT W.ID FROM wypłata W LEFT JOIN premia_has_wypłata PHS ON W.ID = PHS.Wypłata_ID LEFT JOIN premia P ON PHS.Premia_ID = P.ID WHERE P.ID = OLD.ID);
    UPDATE wypłata SET OsiągnietaPremia   = (SELECT COALESCE(SUM(Wartość),0) FROM wypłata W LEFT JOIN premia_has_wypłata PHS ON W.ID = PHS.Wypłata_ID LEFT JOIN premia P ON PHS.Premia_ID = P.ID WHERE 1 = PHS.Wypłata_ID) WHERE ID = ID_Klienta;
END //
DELIMITER ;

#5 -Trigger dla usniętych premii
DELIMITER //
CREATE TRIGGER UsunięciePremii AFTER DELETE ON premia_has_wypłata
FOR EACH ROW
BEGIN
    DECLARE ID_Klienta INT;
    SET ID_Klienta=(SELECT W.ID FROM wypłata W LEFT JOIN premia_has_wypłata PHS ON W.ID = PHS.Wypłata_ID LEFT JOIN premia P ON PHS.Premia_ID = P.ID WHERE OLD.Wypłata_ID = W.ID);
    UPDATE wypłata SET OsiągnietaPremia = (SELECT COALESCE(SUM(Wartość),0) FROM wypłata W LEFT JOIN premia_has_wypłata PHS ON W.ID = PHS.Wypłata_ID LEFT JOIN premia P ON PHS.Premia_ID = P.ID WHERE 1 = PHS.Wypłata_ID) WHERE ID = ID_Klienta;
END //
DELIMITER ;

#6 - Trigger dla nowych premii
DELIMITER //
CREATE TRIGGER DodaniePremii AFTER INSERT ON premia_has_wypłata
FOR EACH ROW
BEGIN
    DECLARE ID_Klienta INT;
    SET ID_Klienta=(SELECT W.ID FROM wypłata W LEFT JOIN premia_has_wypłata PHS ON W.ID = PHS.Wypłata_ID LEFT JOIN premia P ON PHS.Premia_ID = P.ID WHERE W.ID = NEW.Wypłata_ID LIMIT 1);
    UPDATE wypłata SET OsiągnietaPremia = (SELECT COALESCE(SUM(Wartość),0) FROM wypłata W LEFT JOIN premia_has_wypłata PHS ON W.ID = PHS.Wypłata_ID LEFT JOIN premia P ON PHS.Premia_ID = P.ID WHERE 1 = PHS.Wypłata_ID) WHERE ID = ID_Klienta;
END //
DELIMITER ;

#7 - Restart : Nowy miesiąc w firmie
CREATE PROCEDURE NowyMiesiąc() DELETE FROM premia_has_wypłata;

#8 - Zdobądź lokaty zaciągniete z danego miesiąca
DELIMITER //
CREATE PROCEDURE PokażLokatyZMiesiąca(IN Miesiac VARCHAR(20))
BEGIN
    DECLARE miesiac VARCHAR(20);
    SET miesiac = mies;
    SELECT aktywne_lokaty.*, data.Miesiąc FROM aktywne_lokaty INNER JOIN lokata ON aktywne_lokaty.ID = lokata.ID INNER JOIN data ON data.ID = lokata.DataZałożenia_ID WHERE data.Miesiąc = miesiac;
END//

#9 - Zdobądź kredyty zaciągniete z danego miesiąca
DELIMITER //
CREATE PROCEDURE PokażKredytyZMiesiąca(IN Miesiąc VARCHAR(20))
BEGIN
    DECLARE miesiac VARCHAR(20);
    SET miesiac = mies;
    SELECT aktywne_kredyty.*, data.Miesiąc FROM aktywne_kredyty INNER JOIN kredyt ON aktywne_kredyty.ID = kredyt.ID INNER JOIN data ON data.ID = kredyt.DataZałożenia_ID WHERE data.Miesiąc = miesiac;
END//

#10 - Zdobądź zdolnośc kredytową klienta
DELIMITER //
CREATE OR REPLACE PROCEDURE PokażZdolnośćKredytowąKlienta(IN ID_Klienta int)
BEGIN
    SELECT *, (Inne + Nieruchomości) as Całość, ((Inne + Nieruchomości) * .49) AS MaksymalnyKredyt FROM majątek WHERE ID = ID_Klienta;
END //