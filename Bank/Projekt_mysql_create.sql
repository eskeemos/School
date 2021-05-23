CREATE TABLE `Klient` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`ID_DaneOsobowe` INT NOT NULL,
	`ID_RachunekKredytowy` INT NOT NULL,
	`ID_RachunekDebetowy` INT NOT NULL,
	`ID_Konto` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `DaneOsobowe` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Imię` varchar(30) NOT NULL,
	`Nazwisko` varchar(30) NOT NULL,
	`Pesel` varchar(11) NOT NULL,
	`E-mail` varchar(50) NOT NULL,
	`NumerTelefonu` varchar(9) NOT NULL,
	`MiejsceZamieszkaniaID` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Lokalizacja` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Województwo` varchar(30) NOT NULL,
	`Miasto` varchar(30) NOT NULL,
	`KodPocztowy` varchar(6) NOT NULL,
	`Miejscowość` varchar(50),
	`Ulica` varchar(50),
	`NumerMieszkania` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Pracownik` (
	`ID` INT NOT NULL,
	`ID_DaneOsobowe` INT NOT NULL,
	`ID_Stanowiska` INT NOT NULL,
	`ID_Konto` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Stanowisko` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`NazwaStanowiska` varchar(30) NOT NULL,
	`PłacaPodstawowa` FLOAT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `RachunekKredytowy` (
	`ID` varchar(16) NOT NULL,
	`Środki` FLOAT(16) NOT NULL,
	`PIN` varchar(4) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `RachunekDebetowy` (
	`ID` varchar(16) NOT NULL,
	`Debet` FLOAT(16) NOT NULL,
	`PIN` varchar(4) NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Lokata` (
	`ID` INT NOT NULL,
	`ID_Klient` INT NOT NULL,
	`Wartość` FLOAT NOT NULL,
	`ID_RodzajLokaty` INT NOT NULL,
	`DataZałożenia` INT NOT NULL,
	`DataZakończenia` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Kredyt` (
	`ID` INT NOT NULL,
	`ID_Klient` INT NOT NULL,
	`Wartość` FLOAT NOT NULL,
	`ID_RodzajKredytu` INT NOT NULL,
	`DataZałożenia` INT NOT NULL,
	`DataZakończenia` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `RodzajLokaty` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Nazwa` varchar(50) NOT NULL AUTO_INCREMENT,
	`Oprocentowanie` FLOAT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `RodzajKredytu` (
	`ID` INT NOT NULL AUTO_INCREMENT,
	`Nazwa` varchar(50) NOT NULL AUTO_INCREMENT,
	`Oprocentowanie` FLOAT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Wypłata` (
	`ID` INT NOT NULL,
	`ID_Pracownik` INT NOT NULL,
	`Miesiąc` INT NOT NULL,
	`ID_Premia` INT NOT NULL,
	`PensjaCałkowita` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Premia` (
	`ID` INT NOT NULL,
	`Nazwa` varchar(30) NOT NULL,
	`Wartość` FLOAT(30) NOT NULL
);

CREATE TABLE `Transakcje` (
	`ID` INT NOT NULL,
	`ID_Klient` INT NOT NULL,
	`ID_Data` INT NOT NULL,
	`Wartość` INT NOT NULL,
	`ID_RodzajuTransakcji` INT NOT NULL,
	`ID_MiejscaTransakcji` INT NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `Data` (
	`ID` INT NOT NULL,
	`Rok` DATE NOT NULL,
	`Miesiąc` DATE NOT NULL,
	`Dzień` DATE NOT NULL,
	`Godzina` DATETIME NOT NULL,
	`Minuta` DATETIME NOT NULL,
	`Sekunda` DATETIME NOT NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE `RodzajTransakcji` (
	`ID` INT NOT NULL,
	`Nazwa` varchar(30) NOT NULL
);

CREATE TABLE `KlientKonto` (
	`ID` INT NOT NULL,
	`Login` varchar(30) NOT NULL,
	`Hasło` varchar(64) NOT NULL
);

CREATE TABLE `PracownikKonto` (
	`ID` INT NOT NULL,
	`Login` varchar(30) NOT NULL,
	`Hasło` varchar(64) NOT NULL
);

ALTER TABLE `Klient` ADD CONSTRAINT `Klient_fk0` FOREIGN KEY (`ID_DaneOsobowe`) REFERENCES `DaneOsobowe`(`ID`);

ALTER TABLE `Klient` ADD CONSTRAINT `Klient_fk1` FOREIGN KEY (`ID_RachunekKredytowy`) REFERENCES `RachunekKredytowy`(`ID`);

ALTER TABLE `Klient` ADD CONSTRAINT `Klient_fk2` FOREIGN KEY (`ID_RachunekDebetowy`) REFERENCES `RachunekDebetowy`(`ID`);

ALTER TABLE `Klient` ADD CONSTRAINT `Klient_fk3` FOREIGN KEY (`ID_Konto`) REFERENCES `KlientKonto`(`ID`);

ALTER TABLE `DaneOsobowe` ADD CONSTRAINT `DaneOsobowe_fk0` FOREIGN KEY (`MiejsceZamieszkaniaID`) REFERENCES `Lokalizacja`(`ID`);

ALTER TABLE `Pracownik` ADD CONSTRAINT `Pracownik_fk0` FOREIGN KEY (`ID_DaneOsobowe`) REFERENCES `DaneOsobowe`(`ID`);

ALTER TABLE `Pracownik` ADD CONSTRAINT `Pracownik_fk1` FOREIGN KEY (`ID_Stanowiska`) REFERENCES `Stanowisko`(`ID`);

ALTER TABLE `Pracownik` ADD CONSTRAINT `Pracownik_fk2` FOREIGN KEY (`ID_Konto`) REFERENCES `PracownikKonto`(`ID`);

ALTER TABLE `Lokata` ADD CONSTRAINT `Lokata_fk0` FOREIGN KEY (`ID_Klient`) REFERENCES `Klient`(`ID`);

ALTER TABLE `Lokata` ADD CONSTRAINT `Lokata_fk1` FOREIGN KEY (`ID_RodzajLokaty`) REFERENCES `RodzajLokaty`(`ID`);

ALTER TABLE `Kredyt` ADD CONSTRAINT `Kredyt_fk0` FOREIGN KEY (`ID_Klient`) REFERENCES `Klient`(`ID`);

ALTER TABLE `Kredyt` ADD CONSTRAINT `Kredyt_fk1` FOREIGN KEY (`ID_RodzajKredytu`) REFERENCES `RodzajKredytu`(`ID`);

ALTER TABLE `Wypłata` ADD CONSTRAINT `Wypłata_fk0` FOREIGN KEY (`ID_Pracownik`) REFERENCES `Pracownik`(`ID`);

ALTER TABLE `Wypłata` ADD CONSTRAINT `Wypłata_fk1` FOREIGN KEY (`ID_Premia`) REFERENCES `Premia`(`ID`);

ALTER TABLE `Transakcje` ADD CONSTRAINT `Transakcje_fk0` FOREIGN KEY (`ID_Klient`) REFERENCES `Klient`(`ID`);

ALTER TABLE `Transakcje` ADD CONSTRAINT `Transakcje_fk1` FOREIGN KEY (`ID_Data`) REFERENCES `Data`(`ID`);

ALTER TABLE `Transakcje` ADD CONSTRAINT `Transakcje_fk2` FOREIGN KEY (`ID_RodzajuTransakcji`) REFERENCES `RodzajTransakcji`(`ID`);

ALTER TABLE `Transakcje` ADD CONSTRAINT `Transakcje_fk3` FOREIGN KEY (`ID_MiejscaTransakcji`) REFERENCES `Lokalizacja`(`ID`);

