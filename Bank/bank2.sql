-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 26 Maj 2021, 11:03
-- Wersja serwera: 10.4.18-MariaDB
-- Wersja PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `bank`
--

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `adres_klientow`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `adres_klientow` (
`ID` int(11)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Województwo` varchar(50)
,`Miasto` varchar(50)
,`KodPocztowy` char(6)
,`Ulica` varchar(50)
,`NumerMieszkania` varchar(5)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `adres_pracownikow`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `adres_pracownikow` (
`ID` int(11)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Województwo` varchar(50)
,`Miasto` varchar(50)
,`KodPocztowy` char(6)
,`Ulica` varchar(50)
,`NumerMieszkania` varchar(5)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `aktywne_kredyty`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `aktywne_kredyty` (
`ID` int(11)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Nazwa` varchar(50)
,`Wartość` decimal(7,2)
,`Oprocentowanie` float
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `aktywne_lokaty`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `aktywne_lokaty` (
`ID` int(11)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Nazwa` varchar(50)
,`Oprocentowanie` float
,`Depozyt` decimal(7,2)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `aktywne_rachunki_debetowe`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `aktywne_rachunki_debetowe` (
`NrRachunku` char(19)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Debet` decimal(7,2)
,`Pesel` char(11)
,`Email` varchar(50)
,`NumerTelefonu` char(9)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `aktywne_rachunki_kredytowe`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `aktywne_rachunki_kredytowe` (
`NrRachunku` char(19)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Środki` decimal(7,2)
,`Pesel` char(11)
,`Email` varchar(50)
,`NumerTelefonu` char(9)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `dane_klientow`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `dane_klientow` (
`ID` int(11)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Pesel` char(11)
,`Email` varchar(50)
,`NumerTelefonu` char(9)
,`RachunekDebetowy` char(19)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dane_osobowe`
--

CREATE TABLE `dane_osobowe` (
  `ID` int(11) NOT NULL,
  `Imię` varchar(50) NOT NULL,
  `Nazwisko` varchar(50) NOT NULL,
  `Pesel` char(11) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `NumerTelefonu` char(9) NOT NULL,
  `Lokalizacja_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `dane_osobowe`
--

INSERT INTO `dane_osobowe` (`ID`, `Imię`, `Nazwisko`, `Pesel`, `Email`, `NumerTelefonu`, `Lokalizacja_ID`) VALUES
(1, 'Klaudia', 'Narcys', '83762222363', 'Cludi@wp.pl', '532456982', 1),
(2, 'Mariusz', 'Benek', '43278811263', 'Mario@wp.pl', '786347129', 2),
(3, 'Sławomir', 'Bak', '83901000251', 'Slavio@wp.pl', '264183937', 2),
(4, 'Marek', 'Irczyk', '02749274012', 'Marczyk@wp.pl', '264826485', 3),
(5, 'Sylwia', 'Parczyk', '43789273125', 'Sylwus@wp.pl', '739200127', 4),
(6, 'Łukasz', 'Pinas', '76456789330', 'luki@wp.pl', '789253678', 7),
(7, 'Jakub', 'Kolik', '15682345665', 'jacob@wp.pl', '623567182', 9),
(8, 'Bartek', 'Samyk', '20987125216', 'Bartek@wp.pl', '648201232', 8),
(9, 'Paweł', 'Bereś', '98456702871', 'Pab@wp.pl', '765372819', 10),
(10, 'Roksana', 'Bąk', '47628456125', 'Rooka@wp.pl', '643567123', 6);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `dane_pracownikow`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `dane_pracownikow` (
`id` int(11)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Pesel` char(11)
,`Email` varchar(50)
,`NumerTelefonu` char(9)
,`Stanowisko` varchar(50)
,`Placa` decimal(7,2)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `data`
--

CREATE TABLE `data` (
  `ID` int(11) NOT NULL,
  `Rok` year(4) NOT NULL,
  `Miesiąc` varchar(50) NOT NULL,
  `Dzień` int(11) NOT NULL,
  `Czas` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `data`
--

INSERT INTO `data` (`ID`, `Rok`, `Miesiąc`, `Dzień`, `Czas`) VALUES
(1, 2020, 'Wrzesień', 14, '15:17:21'),
(2, 2020, 'Kwiecień', 14, '15:17:21'),
(3, 2021, 'Styczeń', 24, '15:17:21'),
(4, 2020, 'Maj', 7, '15:17:21'),
(5, 2020, 'Sierpień', 2, '15:17:21'),
(6, 2019, 'Kwiecień', 4, '15:17:21'),
(7, 2020, 'Maj', 28, '15:17:21'),
(8, 2019, 'Styczeń', 3, '15:17:21'),
(9, 2020, 'Lipiec', 5, '15:17:21'),
(10, 2019, 'Maj', 7, '15:17:21'),
(11, 2020, 'Wrzesień', 27, '15:17:21'),
(12, 2019, 'Grudzień', 24, '15:17:21'),
(13, 2021, 'Maj', 20, '15:17:21'),
(14, 2019, 'Lipiec', 18, '15:17:21'),
(15, 2020, 'Sierpień', 5, '15:17:21'),
(16, 2019, 'Kwiecień', 21, '15:17:21'),
(17, 2020, 'Grudzień', 1, '15:17:21'),
(18, 2019, 'Styczeń', 1, '15:17:21'),
(19, 2020, 'Maj', 7, '15:17:21'),
(20, 2019, 'Sierpień', 21, '15:17:21'),
(21, 2020, 'Wrzesień', 25, '15:17:21'),
(22, 2019, 'Maj', 11, '15:17:21'),
(23, 2021, 'Styczeń', 10, '15:17:21'),
(24, 2019, 'Lipiec', 1, '15:17:21'),
(25, 2020, 'Kwiecień', 5, '15:17:21');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klient`
--

CREATE TABLE `klient` (
  `ID` int(11) NOT NULL,
  `DaneOsobowe_ID` int(11) NOT NULL,
  `KontoKlient_ID` int(11) NOT NULL,
  `Majątek_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `klient`
--

INSERT INTO `klient` (`ID`, `DaneOsobowe_ID`, `KontoKlient_ID`, `Majątek_ID`) VALUES
(1, 6, 1, 1),
(2, 7, 2, 2),
(3, 8, 3, 3),
(4, 9, 4, 4),
(5, 10, 5, 5);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `klient_caly_majatek`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `klient_caly_majatek` (
`ID` int(11)
,`Imię` varchar(50)
,`Nazwisko` varchar(50)
,`Majątek` double(19,2)
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konto_klient`
--

CREATE TABLE `konto_klient` (
  `ID` int(11) NOT NULL,
  `Login` varchar(50) DEFAULT NULL,
  `Hasło` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `konto_klient`
--

INSERT INTO `konto_klient` (`ID`, `Login`, `Hasło`) VALUES
(1, 'Pawełek', '2204ffb4235b9576c487cfaa0a7daaabbda4360a7baf02cbecd3371e7cf0b74b'),
(2, 'Karol', '0eee01d99af67f4370e763b7b397df36ef416f35b814fd46308eb4ee2b1678a9'),
(3, 'Mati', '331c50c61cd77d846abcf95c4f42ef0cf2d5b126dc2255fe2ec6af4056e1acfe'),
(4, 'Ewa', '703cf6949075ab8023970488c98f935d1a3214363f47378d3d7aa942b4998eed'),
(5, 'Kasia', '08ae0525d4c7c41fb2ea15c59e29ab77c7e0af3fd358fea8a302411360ab1b1c');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `konto_pracownik`
--

CREATE TABLE `konto_pracownik` (
  `ID` int(11) NOT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Hasło` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `konto_pracownik`
--

INSERT INTO `konto_pracownik` (`ID`, `Login`, `Hasło`) VALUES
(1, 'Caroline', '1958b3cd3e8eb0faf64829638171305dd5a0a00f483f952e9862ad103c5afce1'),
(2, 'Martini', 'ccdcf6891cd491a138d85d6536603b411821cd49ff8c26219c0d6f85e147376f'),
(3, 'Justina', 'a94bc58b2ed815e79d148250ac1faf2b868972e4341569bdac1a794d8af82402'),
(4, 'Micheal', '87c1c1c1d56dde28f17b4b51537a20747751b4afa8fc5feb14d58bcfed6ae0c0'),
(5, 'Ala', '9f451682f1adea83a88a20ecf4e01e81b95d5aad656c01f54faeb1400e5758e0');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kredyt`
--

CREATE TABLE `kredyt` (
  `ID` int(11) NOT NULL,
  `Wartość` decimal(7,2) NOT NULL,
  `Klient_ID` int(11) NOT NULL,
  `DataZałożenia_ID` int(11) NOT NULL,
  `DataZakończenia_ID` int(11) NOT NULL,
  `RodzajKredytu_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `kredyt`
--

INSERT INTO `kredyt` (`ID`, `Wartość`, `Klient_ID`, `DataZałożenia_ID`, `DataZakończenia_ID`, `RodzajKredytu_ID`) VALUES
(4, '1000.00', 4, 22, 13, 3),
(1, '2000.00', 1, 16, 17, 2),
(2, '5000.00', 2, 18, 19, 3),
(3, '8000.00', 3, 20, 21, 4),
(5, '10000.00', 4, 24, 25, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lokalizacja`
--

CREATE TABLE `lokalizacja` (
  `ID` int(11) NOT NULL,
  `Województwo` varchar(50) NOT NULL,
  `Miasto` varchar(50) NOT NULL,
  `KodPocztowy` char(6) NOT NULL,
  `Miejscowość` varchar(50) DEFAULT NULL,
  `Ulica` varchar(50) DEFAULT NULL,
  `NumerMieszkania` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `lokalizacja`
--

INSERT INTO `lokalizacja` (`ID`, `Województwo`, `Miasto`, `KodPocztowy`, `Miejscowość`, `Ulica`, `NumerMieszkania`) VALUES
(1, 'Małopolskie', 'Kraków', '04-218', '', '3 Maja Al.', '17'),
(2, 'Pomorskie', 'Gdańsk', '80-007', '', 'Stężycka', '27'),
(3, 'Małopolskie', 'Nowy Sącz', '33-300', '', 'Jagielońska', '5'),
(4, 'Śląskie', 'Katowice', '40-014', '', 'Tysięciolecia', '125'),
(5, 'Śląskie', 'Częstochowa', '42-217', '', 'Wiatrakowa', '10'),
(6, 'Lubuskie', 'Zielona Góra', '30-600', '', 'Polna', ''),
(7, 'Podkarpackie', 'Rzeszów', '33-634', '', 'Łakowa', ''),
(8, 'Mazowieckie', 'Ostrołęka', '73-687', '', 'Krótka', ''),
(9, 'Łodźkie', 'Łódz', '40-619', '', 'Kolejowa', ''),
(10, 'Pomorskie', 'Gdańsk', '05-090', '', 'Akacjowa', ''),
(11, 'Podkarpackie', 'Rzeszów', '11-440', '', 'Sosnowa', '68'),
(12, 'Mazowieckie', 'Pruszków', '65-100', '', 'Kościelna', '45'),
(13, 'Lubuskie', 'Gorzów Wlkp.', '20-680', '', 'Lipowa', '80'),
(14, 'Mazowieckie', 'Warszawa', '60-090', '', 'Ogrodowa', '18'),
(15, 'Łodźkie', 'Łódz', '32-650', '', 'Słoneczna', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lokata`
--

CREATE TABLE `lokata` (
  `ID` int(11) NOT NULL,
  `Klient_ID` int(11) NOT NULL,
  `Depozyt` decimal(7,2) DEFAULT NULL,
  `DataZałożenia_ID` int(11) NOT NULL,
  `DataZakończenia_ID` int(11) NOT NULL,
  `RodzajLokaty_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `lokata`
--

INSERT INTO `lokata` (`ID`, `Klient_ID`, `Depozyt`, `DataZałożenia_ID`, `DataZakończenia_ID`, `RodzajLokaty_ID`) VALUES
(3, 1, '1500.00', 10, 11, 2),
(1, 1, '2000.00', 6, 7, 2),
(5, 3, '5000.00', 14, 15, 4),
(4, 4, '9000.00', 12, 13, 4),
(2, 2, '20000.00', 8, 9, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `majątek`
--

CREATE TABLE `majątek` (
  `ID` int(11) NOT NULL,
  `Nieruchomości` decimal(10,2) DEFAULT NULL,
  `Pensja` float(10,2) DEFAULT NULL,
  `Inne` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `majątek`
--

INSERT INTO `majątek` (`ID`, `Nieruchomości`, `Pensja`, `Inne`) VALUES
(4, '0.00', 2500.00, 10000.00),
(5, '20000.00', 8500.00, 200000.00),
(2, '250000.00', 4200.00, 20000.00),
(1, '500000.00', 5500.00, 120000.00),
(3, '1200000.00', 10500.00, 900000.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownik`
--

CREATE TABLE `pracownik` (
  `ID` int(11) NOT NULL,
  `DaneOsobowe_ID` int(11) NOT NULL,
  `Stanowisko_ID` int(11) NOT NULL,
  `KontoPracownik_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `pracownik`
--

INSERT INTO `pracownik` (`ID`, `DaneOsobowe_ID`, `Stanowisko_ID`, `KontoPracownik_ID`) VALUES
(1, 1, 2, 1),
(2, 2, 1, 2),
(3, 3, 3, 3),
(4, 4, 3, 4),
(5, 5, 5, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `premia`
--

CREATE TABLE `premia` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(50) NOT NULL,
  `Wartość` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `premia`
--

INSERT INTO `premia` (`ID`, `Nazwa`, `Wartość`) VALUES
(1, 'Premia stażowa', '300.00'),
(2, 'Premia regulaminowa', '500.00'),
(3, 'Premia uznaniowa', '600.00'),
(4, 'Premia frekwencyjna', '200.00'),
(5, 'Premia zadaniowa', '900.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `premia_has_wypłata`
--

CREATE TABLE `premia_has_wypłata` (
  `Premia_ID` int(11) NOT NULL,
  `Wypłata_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `premia_has_wypłata`
--

INSERT INTO `premia_has_wypłata` (`Premia_ID`, `Wypłata_ID`) VALUES
(1, 2),
(1, 3),
(2, 2),
(4, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rachunek_debetowy`
--

CREATE TABLE `rachunek_debetowy` (
  `ID` char(19) NOT NULL,
  `Klient_ID` int(11) NOT NULL,
  `PIN` char(4) NOT NULL,
  `Debet` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `rachunek_debetowy`
--

INSERT INTO `rachunek_debetowy` (`ID`, `Klient_ID`, `PIN`, `Debet`) VALUES
('0000-0000-0001', 1, '1234', '200.00'),
('0000-0000-0002', 2, '4301', '300.00'),
('0000-0000-0003', 3, '5609', '0.00'),
('0000-0000-0004', 4, '3333', '30.00'),
('0000-0000-0005', 5, '8905', '1000.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rachunek_kredytowy`
--

CREATE TABLE `rachunek_kredytowy` (
  `ID` char(19) NOT NULL,
  `Klient_ID` int(11) NOT NULL,
  `PIN` char(4) DEFAULT NULL,
  `Środki` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `rachunek_kredytowy`
--

INSERT INTO `rachunek_kredytowy` (`ID`, `Klient_ID`, `PIN`, `Środki`) VALUES
('0000-0000-0001', 1, '6890', '12000.00'),
('0000-0000-0002', 2, '4040', '3000.00'),
('0000-0000-0003', 4, '1221', '5000.00'),
('0000-0000-0004', 4, '9124', '9000.00'),
('0000-0000-0005', 3, '9762', '12000.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_kredytu`
--

CREATE TABLE `rodzaj_kredytu` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(50) DEFAULT NULL,
  `Oprocentowanie` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `rodzaj_kredytu`
--

INSERT INTO `rodzaj_kredytu` (`ID`, `Nazwa`, `Oprocentowanie`) VALUES
(1, 'Kredyt konsumpcyjny', 2.2),
(2, 'Kredyt hipoteczny', 12.2),
(3, 'Kredyt inwestycyjny', 3.5),
(4, 'Kredyt konsolidacyjny', 3.7),
(5, 'Kredyt krótkoterminowy', 10.2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_lokaty`
--

CREATE TABLE `rodzaj_lokaty` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(50) NOT NULL,
  `Oprocentowanie` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `rodzaj_lokaty`
--

INSERT INTO `rodzaj_lokaty` (`ID`, `Nazwa`, `Oprocentowanie`) VALUES
(1, 'Lokata mobilna', 2.2),
(2, 'Lokata rentierksa', 1.8),
(3, 'Lokata automatyczna', 3.2),
(4, 'Lokata dynamiczna', 4.5),
(5, 'Lokata strukturyzowana', 6.9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzaj_transakcji`
--

CREATE TABLE `rodzaj_transakcji` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `rodzaj_transakcji`
--

INSERT INTO `rodzaj_transakcji` (`ID`, `Nazwa`) VALUES
(1, 'Przelew natychmiastowy'),
(2, 'Wybór pieniędzy'),
(3, 'Przelew SORBNET'),
(4, 'Opłata kontowa'),
(5, 'Przelew ekspresowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stanowisko`
--

CREATE TABLE `stanowisko` (
  `ID` int(11) NOT NULL,
  `Nazwa` varchar(50) NOT NULL,
  `PłacaPodstawowa` decimal(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `stanowisko`
--

INSERT INTO `stanowisko` (`ID`, `Nazwa`, `PłacaPodstawowa`) VALUES
(1, 'Analityk systemowy IT', '5800.00'),
(2, 'Doradca klienta', '3500.00'),
(3, 'Kasjer bankowy', '4200.00'),
(4, 'Agent kredytowy', '5300.00'),
(5, 'Doradca inwestycyjny.', '6000.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transakcje`
--

CREATE TABLE `transakcje` (
  `ID` int(11) NOT NULL,
  `Wartość` decimal(7,2) NOT NULL,
  `Klient_ID` int(11) NOT NULL,
  `Data_ID` int(11) NOT NULL,
  `RodzajTransakcji_ID` int(11) NOT NULL,
  `Lokalizacja_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `transakcje`
--

INSERT INTO `transakcje` (`ID`, `Wartość`, `Klient_ID`, `Data_ID`, `RodzajTransakcji_ID`, `Lokalizacja_ID`) VALUES
(4, '50.00', 4, 19, 3, 9),
(3, '100.00', 3, 18, 5, 8),
(1, '200.00', 1, 16, 1, 6),
(2, '1200.00', 2, 17, 2, 7),
(5, '2000.00', 5, 20, 4, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wypłata`
--

CREATE TABLE `wypłata` (
  `ID` int(11) NOT NULL,
  `Miesiąc` varchar(50) NOT NULL,
  `PensjaCałkowita` decimal(7,2) NOT NULL,
  `Pracownik_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `wypłata`
--

INSERT INTO `wypłata` (`ID`, `Miesiąc`, `PensjaCałkowita`, `Pracownik_ID`) VALUES
(1, 'Maj', '0.00', 1),
(2, 'Maj', '0.00', 2),
(3, 'Maj', '0.00', 3),
(4, 'Maj', '0.00', 4),
(5, 'Maj', '0.00', 5);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `zrealizowane_transakcje`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `zrealizowane_transakcje` (
`ID` int(11)
,`Klient_ID` int(11)
,`Wartość` decimal(7,2)
,`Nazwa` varchar(45)
,`Data_transakcji` varchar(78)
);

-- --------------------------------------------------------

--
-- Struktura widoku `adres_klientow`
--
DROP TABLE IF EXISTS `adres_klientow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adres_klientow`  AS SELECT `kl`.`ID` AS `ID`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `lok`.`Województwo` AS `Województwo`, `lok`.`Miasto` AS `Miasto`, `lok`.`KodPocztowy` AS `KodPocztowy`, `lok`.`Ulica` AS `Ulica`, `lok`.`NumerMieszkania` AS `NumerMieszkania` FROM ((`dane_osobowe` `dos` join `lokalizacja` `lok` on(`dos`.`Lokalizacja_ID` = `lok`.`ID`)) join `klient` `kl` on(`dos`.`ID` = `kl`.`DaneOsobowe_ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `adres_pracownikow`
--
DROP TABLE IF EXISTS `adres_pracownikow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `adres_pracownikow`  AS SELECT `dos`.`ID` AS `ID`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `lok`.`Województwo` AS `Województwo`, `lok`.`Miasto` AS `Miasto`, `lok`.`KodPocztowy` AS `KodPocztowy`, `lok`.`Ulica` AS `Ulica`, `lok`.`NumerMieszkania` AS `NumerMieszkania` FROM ((`dane_osobowe` `dos` join `lokalizacja` `lok` on(`dos`.`Lokalizacja_ID` = `lok`.`ID`)) join `pracownik` `p` on(`dos`.`ID` = `p`.`DaneOsobowe_ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `aktywne_kredyty`
--
DROP TABLE IF EXISTS `aktywne_kredyty`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `aktywne_kredyty`  AS SELECT `kr`.`ID` AS `ID`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `rok`.`Nazwa` AS `Nazwa`, `kr`.`Wartość` AS `Wartość`, `rok`.`Oprocentowanie` AS `Oprocentowanie` FROM ((`kredyt` `kr` join `dane_osobowe` `dos` on(`kr`.`Klient_ID` = `dos`.`ID`)) join `rodzaj_kredytu` `rok` on(`kr`.`RodzajKredytu_ID` = `rok`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `aktywne_lokaty`
--
DROP TABLE IF EXISTS `aktywne_lokaty`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `aktywne_lokaty`  AS SELECT `lok`.`ID` AS `ID`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `rol`.`Nazwa` AS `Nazwa`, `rol`.`Oprocentowanie` AS `Oprocentowanie`, `lok`.`Depozyt` AS `Depozyt` FROM ((`lokata` `lok` join `dane_osobowe` `dos` on(`lok`.`ID` = `dos`.`ID`)) join `rodzaj_lokaty` `rol` on(`rol`.`ID` = `lok`.`RodzajLokaty_ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `aktywne_rachunki_debetowe`
--
DROP TABLE IF EXISTS `aktywne_rachunki_debetowe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `aktywne_rachunki_debetowe`  AS SELECT `rad`.`ID` AS `NrRachunku`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `rad`.`Debet` AS `Debet`, `dak`.`Pesel` AS `Pesel`, `dak`.`Email` AS `Email`, `dak`.`NumerTelefonu` AS `NumerTelefonu` FROM ((`rachunek_debetowy` `rad` join `dane_osobowe` `dos` on(`rad`.`Klient_ID` = `dos`.`ID`)) join `dane_klientow` `dak` on(`dos`.`ID` = `dak`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `aktywne_rachunki_kredytowe`
--
DROP TABLE IF EXISTS `aktywne_rachunki_kredytowe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `aktywne_rachunki_kredytowe`  AS SELECT `rak`.`ID` AS `NrRachunku`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `rak`.`Środki` AS `Środki`, `dak`.`Pesel` AS `Pesel`, `dak`.`Email` AS `Email`, `dak`.`NumerTelefonu` AS `NumerTelefonu` FROM ((`rachunek_kredytowy` `rak` join `dane_osobowe` `dos` on(`rak`.`Klient_ID` = `dos`.`ID`)) join `dane_klientow` `dak` on(`dos`.`ID` = `dak`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `dane_klientow`
--
DROP TABLE IF EXISTS `dane_klientow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dane_klientow`  AS SELECT `kl`.`ID` AS `ID`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `dos`.`Pesel` AS `Pesel`, `dos`.`Email` AS `Email`, `dos`.`NumerTelefonu` AS `NumerTelefonu`, `rd`.`ID` AS `RachunekDebetowy` FROM ((`klient` `kl` join `dane_osobowe` `dos` on(`kl`.`DaneOsobowe_ID` = `dos`.`ID`)) join `rachunek_debetowy` `rd` on(`rd`.`Klient_ID` = `kl`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `dane_pracownikow`
--
DROP TABLE IF EXISTS `dane_pracownikow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `dane_pracownikow`  AS SELECT `p`.`ID` AS `id`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `dos`.`Pesel` AS `Pesel`, `dos`.`Email` AS `Email`, `dos`.`NumerTelefonu` AS `NumerTelefonu`, `st`.`Nazwa` AS `Stanowisko`, `st`.`PłacaPodstawowa` AS `Placa` FROM ((`pracownik` `p` join `dane_osobowe` `dos` on(`p`.`DaneOsobowe_ID` = `dos`.`ID`)) join `stanowisko` `st` on(`p`.`Stanowisko_ID` = `st`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `klient_caly_majatek`
--
DROP TABLE IF EXISTS `klient_caly_majatek`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `klient_caly_majatek`  AS SELECT `kl`.`ID` AS `ID`, `dos`.`Imię` AS `Imię`, `dos`.`Nazwisko` AS `Nazwisko`, `m`.`Nieruchomości`+ `m`.`Inne` AS `Majątek` FROM ((`klient` `kl` join `dane_osobowe` `dos` on(`kl`.`DaneOsobowe_ID` = `dos`.`ID`)) join `majątek` `m` on(`m`.`ID` = `kl`.`Majątek_ID`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `zrealizowane_transakcje`
--
DROP TABLE IF EXISTS `zrealizowane_transakcje`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `zrealizowane_transakcje`  AS SELECT `tr`.`ID` AS `ID`, `tr`.`Klient_ID` AS `Klient_ID`, `tr`.`Wartość` AS `Wartość`, `rt`.`Nazwa` AS `Nazwa`, concat(`dt`.`Rok`,' ',`dt`.`Miesiąc`,' ',`dt`.`Dzień`,' ',`dt`.`Czas`) AS `Data_transakcji` FROM ((`transakcje` `tr` join `rodzaj_transakcji` `rt` on(`tr`.`RodzajTransakcji_ID` = `rt`.`ID`)) join `data` `dt` on(`tr`.`Data_ID` = `dt`.`ID`)) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dane_osobowe`
--
ALTER TABLE `dane_osobowe`
  ADD PRIMARY KEY (`ID`,`Lokalizacja_ID`),
  ADD KEY `fk_DaneOsobowe_Lokalizacja1_idx` (`Lokalizacja_ID`);

--
-- Indeksy dla tabeli `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD PRIMARY KEY (`ID`,`DaneOsobowe_ID`,`KontoKlient_ID`,`Majątek_ID`),
  ADD KEY `fk_Klient_DaneOsobowe_idx` (`DaneOsobowe_ID`),
  ADD KEY `fk_Klient_KontoKlient1_idx` (`KontoKlient_ID`),
  ADD KEY `fk_Klient_Majątek1_idx` (`Majątek_ID`);

--
-- Indeksy dla tabeli `konto_klient`
--
ALTER TABLE `konto_klient`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `konto_pracownik`
--
ALTER TABLE `konto_pracownik`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `kredyt`
--
ALTER TABLE `kredyt`
  ADD PRIMARY KEY (`ID`,`Klient_ID`,`DataZałożenia_ID`,`DataZakończenia_ID`,`RodzajKredytu_ID`),
  ADD KEY `fk_Kredyt_Klient1_idx` (`Klient_ID`),
  ADD KEY `fk_Kredyt_Data1_idx` (`DataZałożenia_ID`),
  ADD KEY `fk_Kredyt_Data2_idx` (`DataZakończenia_ID`),
  ADD KEY `fk_Kredyt_Rodzaj Kredytu1_idx` (`RodzajKredytu_ID`),
  ADD KEY `kredyt_money` (`Wartość`);

--
-- Indeksy dla tabeli `lokalizacja`
--
ALTER TABLE `lokalizacja`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `lokata`
--
ALTER TABLE `lokata`
  ADD PRIMARY KEY (`ID`,`Klient_ID`,`DataZałożenia_ID`,`DataZakończenia_ID`,`RodzajLokaty_ID`),
  ADD KEY `fk_Lokata_Klient1_idx` (`Klient_ID`),
  ADD KEY `fk_Lokata_Data1_idx` (`DataZałożenia_ID`),
  ADD KEY `fk_Lokata_Data2_idx` (`DataZakończenia_ID`),
  ADD KEY `fk_Lokata_RodzajLokaty1_idx` (`RodzajLokaty_ID`),
  ADD KEY `lokata_money` (`Depozyt`);

--
-- Indeksy dla tabeli `majątek`
--
ALTER TABLE `majątek`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `majątek_money` (`Nieruchomości`,`Pensja`,`Inne`);

--
-- Indeksy dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD PRIMARY KEY (`ID`,`DaneOsobowe_ID`,`Stanowisko_ID`,`KontoPracownik_ID`),
  ADD KEY `fk_Pracownik_DaneOsobowe1_idx` (`DaneOsobowe_ID`),
  ADD KEY `fk_Pracownik_Stanowisko1_idx` (`Stanowisko_ID`),
  ADD KEY `fk_Pracownik_KontoPracownik1_idx` (`KontoPracownik_ID`);

--
-- Indeksy dla tabeli `premia`
--
ALTER TABLE `premia`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `premia_money` (`Wartość`);

--
-- Indeksy dla tabeli `premia_has_wypłata`
--
ALTER TABLE `premia_has_wypłata`
  ADD PRIMARY KEY (`Premia_ID`,`Wypłata_ID`),
  ADD KEY `fk_Premia_has_Wypłata_Wypłata1_idx` (`Wypłata_ID`),
  ADD KEY `fk_Premia_has_Wypłata_Premia1_idx` (`Premia_ID`);

--
-- Indeksy dla tabeli `rachunek_debetowy`
--
ALTER TABLE `rachunek_debetowy`
  ADD PRIMARY KEY (`ID`,`Klient_ID`),
  ADD KEY `fk_RachunekDebetowy_Klient1_idx` (`Klient_ID`),
  ADD KEY `rachunek_debetowy_money` (`Debet`);

--
-- Indeksy dla tabeli `rachunek_kredytowy`
--
ALTER TABLE `rachunek_kredytowy`
  ADD PRIMARY KEY (`ID`,`Klient_ID`),
  ADD KEY `fk_RachunkeKredytowy_Klient1_idx` (`Klient_ID`),
  ADD KEY `rachunek_kredytowy_money` (`Środki`);

--
-- Indeksy dla tabeli `rodzaj_kredytu`
--
ALTER TABLE `rodzaj_kredytu`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `rodzaj_lokaty`
--
ALTER TABLE `rodzaj_lokaty`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `rodzaj_transakcji`
--
ALTER TABLE `rodzaj_transakcji`
  ADD PRIMARY KEY (`ID`);

--
-- Indeksy dla tabeli `stanowisko`
--
ALTER TABLE `stanowisko`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `stanowisko_money` (`PłacaPodstawowa`);

--
-- Indeksy dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  ADD PRIMARY KEY (`ID`,`Klient_ID`,`Data_ID`,`RodzajTransakcji_ID`,`Lokalizacja_ID`),
  ADD KEY `fk_Transakcje_Klient1_idx` (`Klient_ID`),
  ADD KEY `fk_Transakcje_Data1_idx` (`Data_ID`),
  ADD KEY `fk_Transakcje_RodzajTransakcji1_idx` (`RodzajTransakcji_ID`),
  ADD KEY `fk_Transakcje_Lokalizacja1_idx` (`Lokalizacja_ID`),
  ADD KEY `transakcje_money` (`Wartość`);

--
-- Indeksy dla tabeli `wypłata`
--
ALTER TABLE `wypłata`
  ADD PRIMARY KEY (`ID`,`Pracownik_ID`),
  ADD KEY `fk_Wypłata_Pracownik1_idx` (`Pracownik_ID`),
  ADD KEY `wypłata_money` (`PensjaCałkowita`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `dane_osobowe`
--
ALTER TABLE `dane_osobowe`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT dla tabeli `data`
--
ALTER TABLE `data`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT dla tabeli `klient`
--
ALTER TABLE `klient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `konto_klient`
--
ALTER TABLE `konto_klient`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `konto_pracownik`
--
ALTER TABLE `konto_pracownik`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `kredyt`
--
ALTER TABLE `kredyt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `lokalizacja`
--
ALTER TABLE `lokalizacja`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT dla tabeli `lokata`
--
ALTER TABLE `lokata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `majątek`
--
ALTER TABLE `majątek`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `premia`
--
ALTER TABLE `premia`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_kredytu`
--
ALTER TABLE `rodzaj_kredytu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_lokaty`
--
ALTER TABLE `rodzaj_lokaty`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `rodzaj_transakcji`
--
ALTER TABLE `rodzaj_transakcji`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `stanowisko`
--
ALTER TABLE `stanowisko`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT dla tabeli `wypłata`
--
ALTER TABLE `wypłata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `dane_osobowe`
--
ALTER TABLE `dane_osobowe`
  ADD CONSTRAINT `fk_DaneOsobowe_Lokalizacja1` FOREIGN KEY (`Lokalizacja_ID`) REFERENCES `lokalizacja` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `klient`
--
ALTER TABLE `klient`
  ADD CONSTRAINT `fk_Klient_DaneOsobowe` FOREIGN KEY (`DaneOsobowe_ID`) REFERENCES `dane_osobowe` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Klient_KontoKlient1` FOREIGN KEY (`KontoKlient_ID`) REFERENCES `konto_klient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Klient_Majątek1` FOREIGN KEY (`Majątek_ID`) REFERENCES `majątek` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `kredyt`
--
ALTER TABLE `kredyt`
  ADD CONSTRAINT `1fk_Lokata_Data1` FOREIGN KEY (`DataZałożenia_ID`) REFERENCES `data` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `1fk_Lokata_Data2` FOREIGN KEY (`DataZakończenia_ID`) REFERENCES `data` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `1fk_Lokata_Klient1` FOREIGN KEY (`Klient_ID`) REFERENCES `klient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `lokata`
--
ALTER TABLE `lokata`
  ADD CONSTRAINT `fk_Lokata_Data1` FOREIGN KEY (`DataZałożenia_ID`) REFERENCES `data` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Lokata_Data2` FOREIGN KEY (`DataZakończenia_ID`) REFERENCES `data` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Lokata_Klient1` FOREIGN KEY (`Klient_ID`) REFERENCES `klient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Lokata_RodzajLokaty1` FOREIGN KEY (`RodzajLokaty_ID`) REFERENCES `rodzaj_lokaty` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `pracownik`
--
ALTER TABLE `pracownik`
  ADD CONSTRAINT `fk_Pracownik_DaneOsobowe1` FOREIGN KEY (`DaneOsobowe_ID`) REFERENCES `dane_osobowe` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pracownik_KontoPracownik1` FOREIGN KEY (`KontoPracownik_ID`) REFERENCES `konto_pracownik` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pracownik_Stanowisko1` FOREIGN KEY (`Stanowisko_ID`) REFERENCES `stanowisko` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `premia_has_wypłata`
--
ALTER TABLE `premia_has_wypłata`
  ADD CONSTRAINT `fk_Premia_has_Wypłata_Premia1` FOREIGN KEY (`Premia_ID`) REFERENCES `premia` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Premia_has_Wypłata_Wypłata1` FOREIGN KEY (`Wypłata_ID`) REFERENCES `wypłata` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `rachunek_debetowy`
--
ALTER TABLE `rachunek_debetowy`
  ADD CONSTRAINT `fk_RachunekDebetowy_Klient1` FOREIGN KEY (`Klient_ID`) REFERENCES `klient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `rachunek_kredytowy`
--
ALTER TABLE `rachunek_kredytowy`
  ADD CONSTRAINT `fk_RachunkeKredytowy_Klient1` FOREIGN KEY (`Klient_ID`) REFERENCES `klient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  ADD CONSTRAINT `fk_Transakcje_Data1` FOREIGN KEY (`Data_ID`) REFERENCES `data` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Transakcje_Klient1` FOREIGN KEY (`Klient_ID`) REFERENCES `klient` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Transakcje_Lokalizacja1` FOREIGN KEY (`Lokalizacja_ID`) REFERENCES `lokalizacja` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Transakcje_RodzajTransakcji1` FOREIGN KEY (`RodzajTransakcji_ID`) REFERENCES `rodzaj_transakcji` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `wypłata`
--
ALTER TABLE `wypłata`
  ADD CONSTRAINT `fk_Wypłata_Pracownik1` FOREIGN KEY (`Pracownik_ID`) REFERENCES `pracownik` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
