SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

BEGIN TRANSACTION;

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`fundacje`
-- -----------------------------------------------------

DROP TABLE IF EXISTS fundacje;

CREATE TABLE fundacje (
  [pk] INT NOT NULL IDENTITY,
  [email] VARCHAR(255) NOT NULL,
  [gmina] VARCHAR(30) NOT NULL,
  [kod_pocztowy] CHAR(6) NOT NULL,
  [miejscowość] VARCHAR(35) NOT NULL,
  [nazwa] VARCHAR(255) NOT NULL,
  [nip] VARCHAR(13) NOT NULL,
  [numer_mieszkania] VARCHAR(6) NOT NULL,
  [numer_telefonu] VARCHAR(11) NOT NULL,
  [powiat] VARCHAR(30) NOT NULL,
  [regon] VARCHAR(14) NOT NULL,
  [ulica] VARCHAR(80) NOT NULL,
  [województwo] VARCHAR(20) NOT NULL,
  UNIQUE ([email] ASC),
  UNIQUE ([nazwa] ASC),
  UNIQUE ([nip] ASC),
  UNIQUE ([regon] ASC),
  PRIMARY KEY ([pk])
);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`start_upy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS start_upy;

CREATE TABLE start_upy (
  [pk] INT NOT NULL IDENTITY,
  [nazwa] VARCHAR(255) NOT NULL,
  [email] VARCHAR(255) NOT NULL,
  [gmina] VARCHAR(30) NOT NULL,
  [kod_pocztowy] CHAR(6) NOT NULL,
  [miejscowość] VARCHAR(35) NOT NULL,
  [nip] VARCHAR(13) NULL DEFAULT NULL,
  [numer_mieszkania] VARCHAR(6) NOT NULL,
  [numer_telefonu] VARCHAR(11) NOT NULL,
  [powiat] VARCHAR(30) NOT NULL,
  [regon] VARCHAR(14) NOT NULL,
  [ulica] VARCHAR(80) NOT NULL,
  [województwo] VARCHAR(20) NOT NULL,
  UNIQUE ([nazwa] ASC),
  UNIQUE ([email] ASC),
  UNIQUE ([nip] ASC),
  UNIQUE ([regon] ASC),
  PRIMARY KEY ([pk])
);
COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`datki`
-- -----------------------------------------------------
DROP TABLE IF EXISTS datki;

CREATE TABLE datki (
  [pk] INT NOT NULL IDENTITY,
  [fk_fundacja] INT NULL DEFAULT NULL,
  [fk_start_up] INT NULL DEFAULT NULL,
  [forma] SMALLINT NOT NULL,
  [kwota] DECIMAL(19,2) NULL DEFAULT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE datki ADD CONSTRAINT FK_datki_fundacja FOREIGN KEY (fk_fundacja) REFERENCES fundacje (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE datki ADD CONSTRAINT FK_datki_start_up FOREIGN KEY (fk_start_up) REFERENCES start_upy (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX datki_fundacje ON datki (fk_fundacja ASC);
CREATE INDEX datki_start_upy ON datki (fk_start_up ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`towary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS towary;

CREATE TABLE towary (
  [pk] INT NOT NULL IDENTITY,
  [nazwa] VARCHAR(255) NOT NULL,
  [kod_producenta] VARCHAR(20) NOT NULL,
  [opis] VARCHAR(1000) NOT NULL,
  [dostępność] SMALLINT NOT NULL,
  [cena_jedn_netto] DECIMAL(19,2) NOT NULL,
  [cena_jedn_brutto] DECIMAL(19,2) NOT NULL,
  [stawka_vat] DECIMAL(3,2) NOT NULL,
  [status] BIT NOT NULL DEFAULT 1,
  PRIMARY KEY ([pk])
);
COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`towary_datki`
-- -----------------------------------------------------
DROP TABLE IF EXISTS towary_datki;

CREATE TABLE towary_datki (
  [pk] INT NOT NULL IDENTITY,
  [fk_datki] INT NOT NULL,
  [fk_towary] INT NOT NULL,
  [ilość] INT NOT NULL,
  PRIMARY KEY ([pk]),
  );

ALTER TABLE towary_datki ADD CONSTRAINT FK_towary_datki_datek FOREIGN KEY (fk_datki) REFERENCES datki (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE towary_datki ADD CONSTRAINT FK_towary_datki_towar FOREIGN KEY (fk_towary) REFERENCES towary (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX towary_datki_datki ON towary_datki (fk_datki ASC);
CREATE INDEX towary_datki_towary ON towary_datki (fk_towary ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`płatności`
-- -----------------------------------------------------
DROP TABLE IF EXISTS płatności;

CREATE TABLE płatności (
  [pk] INT NOT NULL IDENTITY,
  [rodzaj_płatności] VARCHAR(255) NOT NULL,
  UNIQUE ([rodzaj_płatności] ASC),
  PRIMARY KEY ([pk])
);


-- -----------------------------------------------------
-- Table `STMVendorer_db`.`dane_przedsiębiorstw`
-- -----------------------------------------------------
DROP TABLE IF EXISTS dane_przedsiębiorstw;

CREATE TABLE dane_przedsiębiorstw (
  [pk] INT NOT NULL IDENTITY,
  [województwo] VARCHAR(20) NOT NULL,
  [powiat] VARCHAR(30) NOT NULL,
  [gmina] VARCHAR(30) NOT NULL,
  [kod_pocztowy] CHAR(6) NOT NULL,
  [miejscowość] VARCHAR(35) NOT NULL,
  [ulica] VARCHAR(80) NOT NULL,
  [numer_mieszkania] VARCHAR(6) NOT NULL,
  [nazwa_przedsiębiorstwa] VARCHAR(255) NOT NULL,
  [nip] VARCHAR(13) NOT NULL,
  [regon] VARCHAR(14) NOT NULL,
  [numer_telefonu] VARCHAR(11) NOT NULL,
  [email] VARCHAR(255) NOT NULL,
  UNIQUE ([nazwa_przedsiębiorstwa] ASC),
  UNIQUE ([nip] ASC),
  UNIQUE ([regon] ASC),
  UNIQUE ([email] ASC),
  PRIMARY KEY ([pk])
);


-- -----------------------------------------------------
-- Table `STMVendorer_db`.`punkty_sprzedaży`
-- -----------------------------------------------------
DROP TABLE IF EXISTS punkty_sprzedaży;

CREATE TABLE punkty_sprzedaży (
  [pk] INT NOT NULL IDENTITY,
  [fk_dane_przedsiębiorstw] INT NOT NULL,
  [województwo] VARCHAR(20) NOT NULL,
  [powiat] VARCHAR(30) NOT NULL,
  [gmina] VARCHAR(30) NOT NULL,
  [kod_pocztowy] CHAR(6) NOT NULL,
  [miejscowość] VARCHAR(35) NOT NULL,
  [ulica] VARCHAR(80) NOT NULL,
  [numer_mieszkania] VARCHAR(6) NOT NULL,
  [numer_telefonu] VARCHAR(11) NOT NULL,
  [email] VARCHAR(255) NOT NULL,
  [status] BIT NOT NULL DEFAULT 1,
  PRIMARY KEY ([pk])
  );

ALTER TABLE punkty_sprzedaży ADD CONSTRAINT FK_punkty_sprzedaży_dane_przedsiębiorstw FOREIGN KEY (fk_dane_przedsiębiorstw) REFERENCES dane_przedsiębiorstw (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX dane_przedsiębiorstw_punkty_sprzedaży ON punkty_sprzedaży (fk_dane_przedsiębiorstw ASC);
COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`sprzedaże`
-- -----------------------------------------------------
DROP TABLE IF EXISTS sprzedaże;

CREATE TABLE sprzedaże (
  [pk] INT NOT NULL IDENTITY,
  [fk_płatności] INT NOT NULL,
  [fk_punkt_sprzedaży] INT NOT NULL,
  [data_zlecenia_sprzedaży] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
  [data_zaksięgowania_płatności] DATETIME2(0) NULL DEFAULT NULL,
  [cena_sum_netto] DECIMAL(19,2) NOT NULL,
  [cena_sum_brutto] DECIMAL(19,2) NOT NULL,
  [rabat] DECIMAL(3,2) NOT NULL,
  PRIMARY KEY ([pk])
  );

ALTER TABLE sprzedaże ADD CONSTRAINT FK_sprzedaże_płatności FOREIGN KEY (fk_płatności) REFERENCES płatności (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE sprzedaże ADD CONSTRAINT FK_sprzedaże_punkty_sprzedaży FOREIGN KEY (fk_punkt_sprzedaży) REFERENCES punkty_sprzedaży (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX sprzedaże_płatności ON sprzedaże (fk_płatności ASC);
CREATE INDEX sprzedaże_punkty_sprzedaży ON sprzedaże (fk_punkt_sprzedaży ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`towary_sprzedaże`
-- -----------------------------------------------------
DROP TABLE IF EXISTS towary_sprzedaże;

CREATE TABLE towary_sprzedaże (
  [pk] INT NOT NULL IDENTITY,
  [fk_towary] INT NOT NULL,
  [fk_sprzedaże] INT NOT NULL,
  [ilość] INT NOT NULL,
  PRIMARY KEY ([pk])
  );

ALTER TABLE towary_sprzedaże ADD CONSTRAINT FK_towary_sprzedaże_towary FOREIGN KEY (fk_towary) REFERENCES towary (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE towary_sprzedaże ADD CONSTRAINT FK_towary_sprzedaże_sprzedaży FOREIGN KEY (fk_sprzedaże) REFERENCES sprzedaże (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX towary_sprzedaże_towary ON towary_sprzedaże (fk_towary ASC);
CREATE INDEX towary_sprzedaże_sprzedaże ON towary_sprzedaże (fk_sprzedaże ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`hurtownie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS hurtownie;

CREATE TABLE hurtownie (
  [pk] INT NOT NULL IDENTITY,
  [kod_hurtowni] CHAR(6) NOT NULL,
  [gmina] VARCHAR(30) NOT NULL,
  [kod_pocztowy] CHAR(6) NOT NULL,
  [miejscowość] VARCHAR(35) NOT NULL,
  [numer_mieszkania] VARCHAR(6) NOT NULL,
  [powiat] VARCHAR(30) NOT NULL,
  [ulica] VARCHAR(80) NOT NULL,
  [województwo] VARCHAR(20) NOT NULL,
  [status] BIT NOT NULL DEFAULT 1,
  UNIQUE ([kod_hurtowni] ASC),
  PRIMARY KEY ([pk])
);
COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`stany_magazynowe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS stany_magazynowe;

CREATE TABLE stany_magazynowe (
  [pk] INT NOT NULL IDENTITY,
  [fk_hurtownie] INT NOT NULL,
  [fk_towary] INT NOT NULL,
  [ilość] INT NOT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE stany_magazynowe ADD CONSTRAINT FK_stany_magazynowe_hurtownie FOREIGN KEY (fk_hurtownie) REFERENCES hurtownie (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE stany_magazynowe ADD CONSTRAINT FK_stany_magazynowe_towary FOREIGN KEY (fk_towary) REFERENCES towary (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX stany_magazynowe_hurtownie ON stany_magazynowe (fk_hurtownie ASC);
CREATE INDEX stany_magazynowe_towary ON stany_magazynowe (fk_towary ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`dostawcy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS dostawcy;

CREATE TABLE dostawcy (
  [pk] INT NOT NULL IDENTITY,
  [nazwa] VARCHAR(255) NOT NULL,
  [login] VARCHAR(50) NOT NULL,
  [hashowane_haslo] VARCHAR(64) NOT NULL,
  [gmina] VARCHAR(30) NOT NULL,
  [kod_pocztowy] CHAR(6) NOT NULL,
  [miejscowość] VARCHAR(35) NOT NULL,
  [nip] VARCHAR(13) NOT NULL,
  [numer_mieszkania] VARCHAR(6) NOT NULL,
  [ulica] VARCHAR(80) NOT NULL,
  [województwo] VARCHAR(20) NOT NULL,
  [powiat] VARCHAR(30) NOT NULL,
  UNIQUE ([nip] ASC),
  PRIMARY KEY ([pk])
);


-- -----------------------------------------------------
-- Table `STMVendorer_db`.`stanowiska`
-- -----------------------------------------------------
DROP TABLE IF EXISTS stanowiska;

CREATE TABLE stanowiska (
  [pk] INT NOT NULL IDENTITY,
  [nazwa] VARCHAR(30) NOT NULL,
  UNIQUE ([nazwa] ASC),
  PRIMARY KEY ([pk])
);


-- -----------------------------------------------------
-- Table `STMVendorer_db`.`umowy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS umowy;

CREATE TABLE umowy (
  [pk] INT NOT NULL IDENTITY,
  [rodzaj] VARCHAR(20) NOT NULL,
  PRIMARY KEY ([pk])
);
COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`pracownicy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS pracownicy;

CREATE TABLE pracownicy (
  [pk] INT NOT NULL IDENTITY,
  [fk_stanowiska] INT NULL DEFAULT NULL,
  [fk_umowy] INT NOT NULL,
  [fk_hurtownie] INT NOT NULL,
  [imię] VARCHAR(50) NOT NULL,
  [nazwisko] VARCHAR(50) NOT NULL,
  [miejscowość] VARCHAR(35) NOT NULL,
  [ulica] VARCHAR(80) NOT NULL,
  [pesel] CHAR(11) NOT NULL,
  [numer_mieszkania] VARCHAR(6) NOT NULL,
  [kod_pocztowy] CHAR(6) NOT NULL,
  [nip] VARCHAR(14) NULL DEFAULT NULL,
  [numer_telefonu] VARCHAR(11) NOT NULL,
  [drugie_imię] VARCHAR(50) NOT NULL,
  [nazwa_użytkownika] VARCHAR(50) NOT NULL,
  [hashowane_hasło] VARCHAR(64) NOT NULL,
  [zatrudnienie] SMALLINT NULL DEFAULT NULL,
  UNIQUE ([fk_umowy] ASC),
  UNIQUE ([pesel] ASC),
  UNIQUE ([numer_telefonu] ASC),
  PRIMARY KEY ([pk])
);

ALTER TABLE pracownicy ADD CONSTRAINT FK_pracownicy_stanowiska FOREIGN KEY (fk_stanowiska) REFERENCES stanowiska (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pracownicy ADD CONSTRAINT FK_pracownicy_umowy FOREIGN KEY (fk_umowy) REFERENCES umowy (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE pracownicy ADD CONSTRAINT FK_pracownicy_hurtownie FOREIGN KEY (fk_hurtownie) REFERENCES hurtownie (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX pracownicy_stanowiska ON pracownicy (fk_stanowiska ASC);
CREATE INDEX pracownicy_umowy ON pracownicy (fk_umowy ASC);
CREATE INDEX pracownicy_hurtownie ON pracownicy (fk_hurtownie ASC);

COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`zamówienia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS zamówienia;

CREATE TABLE zamówienia (
  [pk] INT NOT NULL IDENTITY,
  [fk_hurtownie] INT NOT NULL,
  [fk_dostawcy] INT NOT NULL,
  [fk_pracownicy] INT NOT NULL,
  [data_zlecenia] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
  [data_odbioru] DATETIME2(0) NULL DEFAULT NULL,
  [cena_sum_netto] DECIMAL(19,2) NOT NULL,
  [cena_sum_brutto] DECIMAL(19,2) NOT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE zamówienia ADD CONSTRAINT FK_zamówienia_hurtownie FOREIGN KEY (fk_hurtownie) REFERENCES hurtownie (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE zamówienia ADD CONSTRAINT FK_zamówienia_dostawcy FOREIGN KEY (fk_dostawcy) REFERENCES dostawcy (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE zamówienia ADD CONSTRAINT FK_zamówienia_pracownicy FOREIGN KEY (fk_pracownicy) REFERENCES pracownicy (pk) ON DELETE NO ACTION ON UPDATE NO ACTION;
CREATE INDEX zamówienia_hurtownie ON zamówienia (fk_hurtownie ASC);
CREATE INDEX zamówienia_dostawcy ON zamówienia (fk_dostawcy ASC);
CREATE INDEX zamówienia_pracownicy ON zamówienia (fk_pracownicy ASC);

COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`zamówienia_towary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS zamówienia_towary;

CREATE TABLE zamówienia_towary (
  [pk] INT NOT NULL IDENTITY,
  [fk_zamówienia] INT NOT NULL,
  [fk_towary] INT NOT NULL,
  [cena_jedn_netto] DECIMAL(19,2) NOT NULL,
  [cena_jedn_brutto] DECIMAL(19,2) NOT NULL,
  [ilość] INT NOT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE zamówienia_towary ADD CONSTRAINT FK_zamówienia_towary_zamówienia FOREIGN KEY (fk_zamówienia) REFERENCES zamówienia (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE zamówienia_towary ADD CONSTRAINT FK_zamówienia_towary_towary FOREIGN KEY (fk_towary) REFERENCES towary (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX zamówienia_towary_zamówienia ON zamówienia_towary (fk_zamówienia ASC);
CREATE INDEX zamówienia_towary_towary ON zamówienia_towary (fk_towary ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`uprawnienia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS uprawnienia;

CREATE TABLE uprawnienia (
  [pk] INT NOT NULL IDENTITY,
  [rodzaj] VARCHAR(100) NOT NULL,
  UNIQUE ([rodzaj] ASC),
  PRIMARY KEY ([pk])
);


-- -----------------------------------------------------
-- Table `STMVendorer_db`.`stanowiska_uprawnienia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS stanowiska_uprawnienia;

CREATE TABLE stanowiska_uprawnienia (
  [pk] INT NOT NULL IDENTITY,
  [fk_stanowiska] INT NOT NULL,
  [fk_uprawnienia] INT NOT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE stanowiska_uprawnienia ADD CONSTRAINT FK_stanowiska_uprawnienia_stanowiska FOREIGN KEY (fk_stanowiska) REFERENCES stanowiska (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE stanowiska_uprawnienia ADD CONSTRAINT FK_stanowiska_uprawnienia_uprawnienia FOREIGN KEY (fk_uprawnienia) REFERENCES uprawnienia (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX stanowiska_uprawnienia_stanowiska ON stanowiska_uprawnienia (fk_stanowiska ASC);
CREATE INDEX stanowiska_uprawnienia_uprawnienia ON stanowiska_uprawnienia (fk_uprawnienia ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`przesunięcia_magazynowe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS przesunięcia_magazynowe;

CREATE TABLE przesunięcia_magazynowe (
  [pk] INT NOT NULL IDENTITY,
  [fk_hurtownia_źródłowa] INT NOT NULL,
  [fk_hurtownia_docelowa] INT NOT NULL,
  [fk_pracownik] INT NOT NULL,
  [data_zlecenia] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
  [data_realizacji] DATETIME2(0) NULL DEFAULT NULL,
  [data_odbioru_końcowego] DATETIME2(0) NULL DEFAULT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE przesunięcia_magazynowe ADD CONSTRAINT FK_przesunięcia_magazynowe_hurtownia_źródłowa FOREIGN KEY (fk_hurtownia_źródłowa) REFERENCES hurtownie (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE przesunięcia_magazynowe ADD CONSTRAINT FK_przesunięcia_magazynowe_hurtownia_docelowa FOREIGN KEY (fk_hurtownia_docelowa) REFERENCES hurtownie (pk) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE przesunięcia_magazynowe ADD CONSTRAINT FK_przesunięcia_magazynowe_pracownik FOREIGN KEY (fk_pracownik) REFERENCES pracownicy (pk) ON DELETE NO ACTION ON UPDATE NO ACTION;
CREATE INDEX przesunięcia_magazynowe_hurtownia_źródłowa ON przesunięcia_magazynowe (fk_hurtownia_źródłowa ASC);
CREATE INDEX przesunięcia_magazynowe_hurtownia_docelowa ON przesunięcia_magazynowe (fk_hurtownia_docelowa ASC);
CREATE INDEX przesunięcia_magazynowe_pracownik ON przesunięcia_magazynowe (fk_pracownik ASC);

COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`towary_przesunięcia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS towary_przesunięcia;

CREATE TABLE towary_przesunięcia (
  [pk] INT NOT NULL IDENTITY,
  [fk_przesunięcia_magazynowe] INT NOT NULL,
  [fk_towary] INT NOT NULL,
  [ilość] INT NOT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE towary_przesunięcia ADD CONSTRAINT FK_towary_przesunięcia_przesunięcia_magazynowe FOREIGN KEY (fk_przesunięcia_magazynowe) REFERENCES przesunięcia_magazynowe (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE towary_przesunięcia ADD CONSTRAINT FK_towary_przesunięcia_towary FOREIGN KEY (fk_towary) REFERENCES towary (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX towary_przesunięcia_przesunięcia_magazynowe ON towary_przesunięcia (fk_przesunięcia_magazynowe ASC);
CREATE INDEX towary_przesunięcia_towary ON towary_przesunięcia (fk_towary ASC);


-- -----------------------------------------------------
-- Table `STMVendorer_db`.`faktury`
-- -----------------------------------------------------
DROP TABLE IF EXISTS faktury;

CREATE TABLE faktury (
  [pk] INT NOT NULL IDENTITY,
  [fk_pracownik] INT NOT NULL,
  [fk_sprzedaż] INT NOT NULL,
  [imię_nabywcy] VARCHAR(255) NULL DEFAULT NULL,
  [nazwisko_nabywcy] VARCHAR(255) NULL DEFAULT NULL,
  [numer_telefonu_nabywcy] VARCHAR(11) NULL DEFAULT NULL,
  [email_nabywcy] VARCHAR(255) NULL DEFAULT NULL,
  [stawka_vat] DECIMAL(3,2) NOT NULL,
  [data_wystawienia] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
  [fk_dane_przedsiębiorstw] INT NOT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE faktury ADD CONSTRAINT FK_faktury_pracownik FOREIGN KEY (fk_pracownik) REFERENCES pracownicy (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE faktury ADD CONSTRAINT FK_faktury_sprzedaż FOREIGN KEY (fk_sprzedaż) REFERENCES sprzedaże (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE faktury ADD CONSTRAINT FK_faktury_dane_przedsiębiorstw FOREIGN KEY (fk_dane_przedsiębiorstw) REFERENCES dane_przedsiębiorstw (pk) ON DELETE NO ACTION ON UPDATE NO ACTION;
CREATE INDEX faktury_pracownik ON faktury (fk_pracownik ASC);
CREATE INDEX faktury_sprzedaż ON faktury (fk_sprzedaż ASC);
CREATE INDEX faktury_dane_przedsiębiorstw ON faktury (fk_dane_przedsiębiorstw ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`listy_przewozowe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS listy_przewozowe;

CREATE TABLE listy_przewozowe (
  [pk] INT NOT NULL IDENTITY,
  [fk_sprzedaż] INT NULL DEFAULT NULL,
  [fk_dostawca] INT NOT NULL,
  [fk_przesunięcie_magazynowe] INT NULL DEFAULT NULL,
  [data_wystawienia] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
  [data_przyjęcia_do_przewozu] DATETIME2(0) NULL DEFAULT NULL,
  [sposób_pakowania] VARCHAR(255) NOT NULL,
  [waga] DECIMAL(10,3) NOT NULL,
  [rodzaj_towaru] VARCHAR(255) NOT NULL,
  [koszt_wysyłki_netto] DECIMAL(19,2) NOT NULL,
  [koszt_wysyłki_brutto] DECIMAL(19,2) NOT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE listy_przewozowe ADD CONSTRAINT FK_listy_przewozowe_sprzedaż FOREIGN KEY (fk_sprzedaż) REFERENCES sprzedaże (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE listy_przewozowe ADD CONSTRAINT FK_listy_przewozowe_dostawca FOREIGN KEY (fk_dostawca) REFERENCES dostawcy (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE listy_przewozowe ADD CONSTRAINT FK_listy_przewozowe_przesunięcie_magazynowe FOREIGN KEY (fk_przesunięcie_magazynowe) REFERENCES przesunięcia_magazynowe (pk) ON DELETE CASCADE ON UPDATE CASCADE;
CREATE INDEX listy_przewozowe_sprzedaż ON listy_przewozowe (fk_sprzedaż ASC);
CREATE INDEX listy_przewozowe_dostawca ON listy_przewozowe (fk_dostawca ASC);
CREATE INDEX listy_przewozowe_przesunięcie_magazynowe ON listy_przewozowe (fk_przesunięcie_magazynowe ASC);

-- -----------------------------------------------------
-- Table `STMVendorer_db`.`kategorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS kategorie;

CREATE TABLE kategorie (
  [pk] INT NOT NULL IDENTITY,
  [kategoria] VARCHAR(50) NOT NULL,
  [fk_podkategorii] INT NULL DEFAULT NULL,
  UNIQUE ([kategoria] ASC),
  PRIMARY KEY ([pk]),
  CONSTRAINT [kategorie_kategorie]
    FOREIGN KEY ([fk_podkategorii])
    REFERENCES kategorie ([pk])
);
COMMIT;

BEGIN TRANSACTION;
-- -----------------------------------------------------
-- Table `STMVendorer_db`.`towary_kategorie`
-- -----------------------------------------------------
DROP TABLE IF EXISTS towary_kategorie;

CREATE TABLE towary_kategorie (
  [pk] INT NOT NULL IDENTITY,
  [fk_towary] INT NOT NULL,
  [fk_kategorie_towaru] INT NOT NULL,
  PRIMARY KEY ([pk])
);

ALTER TABLE towary_kategorie ADD CONSTRAINT FK_towary_kategorie_towary FOREIGN KEY (fk_towary) REFERENCES towary (pk) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE towary_kategorie ADD CONSTRAINT FK_towary_kategorie_kategorie_towaru FOREIGN KEY (fk_kategorie_towaru) REFERENCES towary_kategorie (pk) ON DELETE NO ACTION ON UPDATE NO ACTION;
CREATE INDEX towary_kategorie_towary ON towary_kategorie (fk_towary ASC);
CREATE INDEX towary_kategorie_kategorie_towaru ON towary_kategorie (fk_kategorie_towaru ASC);

COMMIT;

BEGIN TRANSACTION; 

INSERT INTO dostawcy (miejscowość,ulica,numer_mieszkania,kod_pocztowy,gmina,powiat,województwo,nazwa,nip,login,hashowane_haslo) VALUES
('Ciuślice','ul. Bukowa',14,'61-351','Stromiec','bydgoski','kujawsko-pomorskie','MAB','752-28-21-395','afwefewa','2A07ACD279420112446BF3D551303E22'),
('Siedlce','ul. Portowa',91,'43-100','M. st. Warszawa','m. Gdynia','łódzkie','HAQ','162-67-85-563','aesfga','97F9434D5A092460387115CB2FAF9146'),
('Głęboczek','ul. Dąbrowskiego',95,'41-506','M. Łódź','m. st. Warszawa','podlaskie','XIX','814-48-38-744','dgfdswe','B2CB8B3726A67D10522B3CBC33497014'),
('Wewierz','ul. Anny',8,'48-321','Jasieniec','leszczyński','wielkopolskie','SEX','868-56-23-618','a1a9a10aaaaaaaaaaa','F5938E8E687C0E3438F0AC3BCEF00916'),
('Kamienna','ul. Środkowa',182,'48-300','Niemodlin','koniński','mazowieckie','SEN','118-97-84-665','hgfherwfa','F6D27E5E8823BD11A6339AF21D306153'),
('Kartuzy','ul. Piotrkowska',132,'07-300','Kock','krotoszyński','Śląskie','XIV','241-54-94-935','hgfretsd','0FBDAB11FEE9C2DAB833E53200FA3FE6'),
('Bronisze','ul. Drzymały Wojciecha',36,'05-084','Kadzidło','milicki','wielkopolskie','BUW','507-32-19-758','fwef2g','B813DD9A8C64F32021451D13D26C5D74'),
('Kamień Mały','ul. Jodłowa',213,'62-834','M. st. Warszawa','m. Łódź','Śląskie','MAN','372-15-87-511','a-a','F182BD08D04759F8793B5100017D52B3'),
('Budy Łańcuckie','ul. Parkowa',255,'43-316','M. Kraków','makowski','mazowieckie','DIH','139-72-76-896','a.a','9B22A42E63C8564FD7E30FD5A2CC89C2'),
('Kębłowo','ul. Owczarska',271,'62-304','M. Jaworzno','m. Wrocław','łódzkie','TIQ','545-78-16-635','a1a2a3a4a5a6a7a8a9a10aaaaaaaaaaa','E8D544292304B53663BE7356E64CC494');

INSERT INTO stanowiska (nazwa) VALUES
('administrator'),
('magazynier'),
('menadżer'),
('dyrektor'),
('przedstawiciel handlowy'),
('kierowca'),
('sprzątacz'),
('stróż'),
('sekretarz'),
('księgowy'),
('konserwator budynku');

INSERT INTO uprawnienia (rodzaj) VALUES
('edycja danych w bazie'),
('wystawianie faktur'),
('dostęp do hurtowni'),
('zarządzanie przesunięciami magazynowymi'),
('składanie zamówień'),
('zarządzanie kadrą'),
('dyspozycja środkami firmy'),
('zarządzanie księgowością i dokumentami'),
('przewóż towaru'),
('ładunek/rozładunek towaru'),
('wystawianie listów przewozowych'),
('dostęp do archiwów'),
('nawiązywanie kontraktów/umów'),
('głos w zarządzie firmy'),
('dostęp do systemu informatycznego'),
('dostęp do danych wrażliwych w bazie');

INSERT INTO umowy (rodzaj) VALUES
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('b2b'),
('b2b'),
('b2b'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('b2b'),
('b2b'),
('b2b'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('b2b'),
('b2b'),
('b2b'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('b2b'),
('b2b'),
('b2b'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('b2b'),
('b2b'),
('b2b'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa zlecenia'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa o pracę'),
('umowa zlecenia'),
('umowa zlecenia'),
('b2b'),
('b2b'),
('b2b'),
('umowa o pracę');

INSERT INTO hurtownie (kod_hurtowni,miejscowość,ulica,numer_mieszkania,kod_pocztowy,gmina,powiat,województwo) VALUES
('G4KAD2','Dąbrówka','ul. Jana z Kolna',176,'62-400','M. Rzeszów','piaseczyński','podlaskie'),
('8YH8DE','Panistruga','ul. Heliotropów',257,'86-300','Psary','m. st. Warszawa','śląskie'),
('G69ELE','Warszawa','ul. Deotymy',275,'09-401','M. Lublin','m. Jelenia Góra','lubelskie'),
('M5K5KU','Bielsko-Biała','ul. Seledynowa',276,'05-800','Nysa','m. Poznań','podlaskie'),
('TO1U6A','Mirkowice','ul. Leśna',89,'31-564','M. st. Warszawa','biłgorajski','świętokrzyskie'),
('XUV2Z5','Ruda Śląska','ul. Ogrodowa',220,'39-200','Kobiele Wielkie','m. Gdańsk','zachodniopomorskie');


INSERT INTO towary (nazwa,kod_producenta,opis,dostępność,cena_jedn_netto,cena_jedn_brutto,stawka_vat,status) VALUES
('STM32 microkontroler F401RD','STM32F401RD','High-performance access line,  ARM Cortex-M4 core with DSP and FPU,  384 Kbytes Flash,  84 MHz CPU,  ART Accelerator',1,50,61.5,0.23,1),
('STM32 microkontroler F4071G','STM32F4071G','High-performance foundation line,  ARM Cortex-M4 core with DSP and FPU,  1 Mbyte Flash,  168 MHz CPU,  ART Accelerator,  Ethernet,  FSMC',1,60,73.8,0.23,1),
('STM32 microkontroler F412VG','STM32F412VG','STM32 Dynamic Efficiency MCU with BAM,  High-performance and DSP with FPU,  ARM Cortex-M4 MCU with 1 Mbyte Flash,  100 MHz CPU,  Art Accelerator,  DFSDM',1,70,86.1,0.23,1),
('STM32 microkontroler F412ZE','STM32F412ZE','STM32 Dynamic Efficiency MCU with BAM,  High-performance and DSP with FPU,  ARM Cortex-M4 MCU with 512 Kbytes Flash,  100 MHz CPU,  Art Accelerator,  DFSDM',1,80,98.4,0.23,1),
('STM32 microkontroler F412ZG','STM32F412ZG','STM32 Dynamic Efficiency MCU with BAM,  High-performance and DSP with FPU,  ARM Cortex-M4 MCU with 1 Mbyte Flash,  100 MHz CPU,  Art Accelerator,  DFSDM',1,90,110.7,0.23,1),
('sterownik silnika bezszczotkowego L6229','L6229','DMOS driver for three-phase brushless DC motor',1,55,67.65,0.23,1),
('sterownik silnika bezszczotkowego L6234','L6234','Three phase motor driver',1,65,79.95,0.23,1),
('sterownik silnika bezszczotkowego L6235','L6235','DMOS driver for 3-phase brushless DC motor',1,75,92.25,0.23,1);

COMMIT;

BEGIN TRANSACTION;

INSERT INTO pracownicy (fk_umowy,fk_stanowiska,fk_hurtownie,imię,nazwisko,miejscowość,ulica,pesel,numer_mieszkania,kod_pocztowy,nip,numer_telefonu,drugie_imię,nazwa_użytkownika,hashowane_hasło,zatrudnienie)
 VALUES
(1,8,1,'Tomił','Malczka','Bielsko-Biała','ul. Rowerowa',92061816678,141,'85-796',NULL,'902-533-382','Domamir','nyko3aj7lus4qakop','AF18D800CBF20FA9357EA41964E953E9',1),
(6,7,1,'Sylwiusz','Wiksycz','Jelenia Góra','ul. Azalii',04251617215,253,'09-230',NULL,'240-945-842','Bazyliusz','g05erihysadygig5lekutuxapodyjadizugegar','C857C8627F3D7A4E41276717D22167E2',1),
(17,5,1,'Urlyk','Aner','Gdańsk','ul. Nowoosiedlowa',89060708336,27,'58-533','177-61-27-442','204-759-687','Dobromierz','9ovylar3cagukydiz2joperepyvysawoq','E9B86B287CCDC2EAF0237B0B137CF929',1),
(16,5,1,'Dobiemiest','Jerzowski','Lipie','ul. Warszawska',19301506384,127,'09-450','333-92-78-960','772-535-847','Jordan','f5bet1notodiwyxovibenuki9isonyz','D565B8CABCDF1A55B4277F2DE53BFD48',1),
(4,10,1,'Władysław','Wratacz','Gadów','ul. Mazowiecka',89022415087,149,'16-001',NULL,'749-324-834','Bertrand','qecokiqeve2ube3yfig3','33F08D9899B00C5595BAC2D201FAE51D',1),
(7,6,1,'Lech','Awtomonow','Sośninka','ul. Fiołków',03211710047,50,'89-240',NULL,'483-101-388','Rudolf','n5waqicaqi85zy','C2BFE9A9DBBC52D4CD5206B3922F2F22',1),
(5,2,1,'Marian','Lokota','Warszawa','ul. Doktora Judyma',92120405133,164,'44-282',NULL,'766-228-167','Toligniew','tyrosejyguk1zawuruvukorysodib9vagacaxypog2fynagyh','728F0C6ACA5DB13BBD56823564AC778E',1),
(11,9,1,'Borzymir','Połgrabski','Kozienice','ul. Pogodna',97041111813,26,'14-520',NULL,'858-129-070','Jaropełk','0y8ysefa5u','066BFB8E13DC6E803B9CA73067300373',1),
(19,3,1,'Zdzibor','Szymaczak','Warszawa','ul. Galla Anonima',20303001593,265,'38-200','749-776-35-58','306-401-514','Modest','zubojidoca7ivibyjys0midabygyho2ala','F47D411EF691FAFE048992AF8E1087DF',1),
(12,4,1,'Sylweriusz','Ferberger','Tarnowskie Góry','ul. Heweliusza Jana',88092102622,86,'98-355',NULL,'824-669-839','Iwo','miwanahocanu0exyj3b8kowatohumo','4B0DB652697C64E76D219909E99A4324',1),
(13,2,1,'Korneliusz','Ciamarczak','Warszawa','ul. Borkowskich Józefa i Stanisława',96072423197,57,'65-140',NULL,'855-722-136','Częstogniew','0efoqoloh2ku3irob','9B367B3CC7A9FF15B26552308033B520',1),
(15,7,1,'Seweryn','Kłaszkowska','Ostrołęka','ul. Złotej Rybki',97081108750,123,'98-300',NULL,'746-123-808','Miłowit','1imoz8juku4ydojygilaj','7C3959468CB969E7E368EBC0AC7BCCF5',1),
(14,8,1,'Morzysław','Bonzel','Leszno Górne','ul. Strumieńska',05252509442,139,'07-405',NULL,'672-667-898','Cieszygor','loraryhafodojo7ebydosofy2orybuvolep1p','9A32B8136F7F25ABFFA1A4E49AEB2DF0',1),
(3,6,1,'Cyprian','Honczo','Kałużna','ul. Dębowa',81082305773,266,'63-400',NULL,'540-114-231','Nadmir','2y049ag87yx36u2el42esen266','591A61BB9224DFA06F9DB4B74B7DBF8A',1),
(18,3,1,'Jarogniew','Chyba','Krzynka','ul. Skowrońskiego Władysława',93111319640,289,'16-130','522-23-38-7210','366-718-373','Krzesisław','coguzehunul8x3jixapow2h','3867E150543C859DF616FF14593578DB',1),
(8,6,1,'Cecyl','Kożemiaczenko','Suwałki','ul. Szkolna',95122709403,129,'11-520',NULL,'930-559-477','Sieciech','gyzikevujify4ajys79y','99D1BB16AF3E671F1D1028C3D35147D0',1),
(9,6,1,'Borysław','Mastylarz','Radom','ul. Monte Cassino',80030405114,188,'21-523',NULL,'196-468-774','Floryn','jehixubuwedigihagyji4em2hikerasir2','DDF8B95DA93B42DE93F5E7FB358DA16D',1),
(2,11,1,'Eustachiusz','Rejmantowska','Nowy Karolew','ul. Kisielewskiego Stefana',13231802600,190,'40-759',NULL,'865-529-947','Waldemar','47maw718058u7as61537k6p1b377c7k5','166E66843D0D7B3081C7BAA35D672F85',1),
(10,2,1,'Siemisław','Szery','Mistrzewice','ul. Miodowa',82080307866,132,'04-230',NULL,'625-592-252','Długosz','vuj1resevocituzozy9yfavyfyjuqewa2onoje','33335C99AEDAE824E4B87C1206CFC9F5',1),
(20,6,1,'Feliks','Korosiak','Rzeszów','ul. Poprzeczna',10281015727,268,'60-192',NULL,'476-926-919','Godfryd','g3mulege21','311D3699462DFEBC98F5366CB74602F4',1),
(21,8,2,'Damazy','Boryski','Brzóza Królewska','ul. Herberta Zbigniewa',92082416565,13,'68-343',NULL,'816-854-435','Ubysław','mywiluny59pyweg9mukiw','5DA888523071016EC924C0FCEB0581E4',1),
(26,7,2,'Benicjusz','Melkner','Sępólno Krajeńskie','ul. Chałubińskiego Tytusa',73051103381,116,'96-124',NULL,'834-096-458','Długosz','kiluty067it','0AA95DB6FCBC3315838BE91B30BCB90D',1),
(37,5,2,'Jan Gwalbert','Ciesielkiewicz','Wierzchowiny','ul. Osiedlowa',86052606661,212,'33-170','505-486-91-94','853-762-646','Eulogiusz','xicer7fukyq4k9simyvafalyvubytomyx','4112A7B292340A947631607D741AA734',1),
(36,5,2,'Władymir','Hildobrandt','Olsztyn','ul. Polna',87122707932,297,'07-410','543-545-65-66','717-198-352','Kandyd','jegizyty9oheruka7iqexidadujaryr8xydemitulif','5F068365E0F4921A49A9A2D395C7878A',1),
(24,10,2,'Wodzisław','Perrony','Wałbrzych','ul. Nowofolwarczna',98110623033,6,'26-120',NULL,'416-413-422','Adalbert','hifim872qykufemyf','420D05FF97B351916E1AAAEF5DD158E5',1),
(27,6,2,'Ramon','Jaromoń','Bodzanów','ul. Żylewicza Józefa',99050213719,180,'62-660',NULL,'904-939-640','Gerard','sadyteme20xucefaterab7qanerofemaxe','A82ABE9C2789E0E49D85B13F91865D5F',1),
(25,2,2,'Achacy','Jachimeczko','Bielsko-Biała','ul. Staszica Stanisława',85020314922,263,'27-415',NULL,'707-986-669','Pękosław','q9fehidysuzave5yjiviga0yjuxuxu','96B8D7861E9C5821483FAEACAF4E2AD5',1),
(31,9,2,'Czcisław','Pinda','Bogdanów','ul. Leśna',92021001960,211,'44-207',NULL,'690-621-235','Klement','f3tegyp56y','9578B9792611B8EEDFDF14FE970989F8',1),
(39,3,2,'Boleczest','Pojewska','Joanin','ul. Pogodna',78012907596,168,'50-156','886-925-41-31','478-929-063','Gaudencjusz','va6upakesukegybuduwihyharynadativun4tav3','B75C5D2BB6855E1CF2B8BFFDC9939EAC',1),
(32,4,2,'Wespazjan','Wakowicz','Bronisławów','ul. Chodkiewicza Jana Karola',75021009541,194,'87-335',NULL,'772-739-880','Goliat','tacovojobyh3tanatefydobiwy11w','C74D64A6BCC70B3EC0EA4016841AB7BE',1),
(33,2,2,'Maciej','Brodawa','Wyrzyki','ul. Prusa Bolesława',82122319002,73,'20-706',NULL,'509-048-937','Malwin','ror2myx6fafekuk2zamyp','8987F54E5FF1128B4166F8F9AAD64A20',1),
(35,7,2,'Godzimierz','Hopnik','Ostrów Mazowiecka','ul. Częstochowska',89122221948,287,'51-250',NULL,'456-157-378','Martynin','tewozepur5qol3ro5oqynizawylyg','D4798D33BCF541A0D6E48804AAD73D72',1),
(34,8,2,'świętomir','Branc','Jawor','ul. Kępowa',88060317579,281,'19-504',NULL,'450-621-661','Daniel','2aby9uq9wi','8B4B1EF8E75DB26BEF5202CDACE3178E',1),
(23,6,2,'Sierosław','Badych','Piekary śląskie','ul. Rzeźniana',80012518687,275,'02-226',NULL,'351-312-759','Herbert','jyqa06mi9axamiwyvydodyk','1CB88EA63626FBB07B94F0AE4B71E20D',1),
(38,3,2,'Nadbor','Machan','Radostowo','ul. Miedza',83070715427,154,'78-331','119-61-86-592','402-487-301','Lew','m5m8nijoqi1','59AC389B0DD93D6BD77462853E621DBD',1),
(28,6,2,'Chociemir','Roszczyński','Rożubowice','ul. Laudańska',86071409014,273,'41-608',NULL,'440-957-515','Gościsław','g8523u74x0565y946u7042k5b84i0i','5857E5EBDA1580C99081312395979350',1),
(29,6,2,'Taras','Konserska','Rzeszów','Pl. Pokoju',71121109932,203,'42-421',NULL,'886-588-866','Jarogniew','coxaga122esuqosocugokucobotuzufivororam','D935B23F28DD486FA4F2CB87AADEBDEA',1),
(22,11,2,'Ewaryst','Kunadt','Olsztyn','ul. Volty Aleksandra',91062611886,97,'26-803',NULL,'752-580-511','Marek','fon1si1api3','999B380C1FCFC70C64F7D4AD0A10115E',1),
(30,2,2,'Axel','Palasik','Gaæ','ul. Pasażerska',76121209736,139,'43-190',NULL,'693-686-330','Jacenty','8ykedytywepisaxazatesy0e7ody','FDD9ACB8CA000CF2EEF3BDBA5EBE7FD8',1),
(40,6,2,'Ruprecht','Kasongo','Wara','ul. Padlewskiego Zygmunta (Generała Zygmunta Padlewskiego)',89031815933,44,'74-110',NULL,'865-483-777','Epifan','b4cimaz1domohizokaqar4','A122EEF6DFF7694CB21EDDBB2B970E58',1),
(41,8,3,'Radomysł','Kanorska','Michałowo','ul. Fabryczna',92071218228,4,'00-268',NULL,'211-750-141','Sewer','juw5z0zu9omojacanyle','D42B751118F4176D4FD0A52B2615E2BC',1),
(46,7,3,'Emeryk','Ołata','Bierwiecka Wola','ul. Orzeszkowej Elizy',99050120910,161,'07-106',NULL,'668-538-440','Domasław','c7gy7efoc8j','15DBB1DF1C56203C6F2771C11277BEDF',1),
(57,5,3,'Biernat','Horbst','Czeladź','ul. Dębowa',71071409409,216,'88-200','558-841-82-92','160-254-816','Wespazjan','mygydufizor3tol61imasatixyfifuvutyc','AB6A390DD0902FDDC0DC883CAA73F0EB',1),
(56,5,3,'Aron','Kiember','Łódź','ul. Fredry Aleksandra',88091017716,24,'08-304','746-569-32-14','513-041-002','Sebald','pygylado7eh2ribifilifocevamovuj5vavobazire','2DD8AB1F2E53C2511C27FE6C7428824B',1),
(44,10,3,'Mamert','Bulak','Kobylnica','ul. Bławatkowa',87110722552,70,'44-100',NULL,'220-393-707','Kalasanty','zabisopabujolijonicamefikixo5ylan4ked2b','63EF7C86514B5500BD57BBED98AD5CAA',1),
(47,6,3,'Strzeżywoj','Chwołka','Rąpice','ul. Polska',93103003319,204,'93-479',NULL,'348-679-661','Chociesław','bura6yw6qek7pet','E879976510399D6C81C756F9A1181485',1),
(45,2,3,'Żyrosław','Kodran','Kraków','ul. Papiernicza',81040502574,14,'26-920',NULL,'268-310-495','Jordan','qynafubododaty8egoquxysyjoxu7ulyxape9yzoze','8BAA44B43C32C941FE83B5B8FEBC7475',1),
(51,9,3,'Charyzjusz','Bieluszewski','Łódź','ul. Na Skarpie',88030805460,253,'07-401',NULL,'888-987-286','Dobiegniew','monyp6j9necodihagolof3','79C6357B3A9F0F452FD86F6072CE0210',1),
(59,3,3,'Irwin','Stąborowski','Warszawa','ul. Łódzka',89111823171,56,'86-320','601-52-91-834','935-115-642','Włościbor','vefakov64unud3pu','139619CCB50E74A951493FEB06C7D280',1),
(52,4,3,'Irydion','Mesiarz','Poznań','ul. Biegusa',81072208266,224,'41-902',NULL,'242-677-965','Władymir','pek80uraf2tedehymolalaryfyw','2880EF20188A7E24B5A09FD3D76E0187',1),
(53,2,3,'Arystarch','Bolkesz','Bydgoszcz','ul. Chłodna',82020121415,295,'41-902',NULL,'230-800-442','Rufin','9yz04aj41a81ny','C607B513821C78BBC05979E0A65B2593',1),
(55,7,3,'Benicjusz','Piśkorz','Bogatynia','ul. Skargi Piotra (Księdza Piotra Skargi)',88041908811,255,'93-493',NULL,'811-356-494','Matron','wocalyqixuxy1eqehi8il2hakeqir','285B5869407573DAA18DAA82CB11A98B',1),
(54,8,3,'Niezamysł','Zahorbeński','Wrocław','ul. Samulowskiego Andrzeja',83100701402,112,'41-219',NULL,'228-614-250','Ruben','bu8ukivo3i5ixyl','DDE3951395A5235B586F21E1E7993067',1),
(43,6,3,'Cieszymysł','Otyszecki','Mireń','ul. Garncarska',80051120306,18,'62-220',NULL,'206-409-479','Florentyn','holabo9aqiw0nus3hifariwesavufa','D55972D17ED177334FC5D751D81986D6',1),
(58,3,3,'Jan Gwalbert','Paradziej','Grabin','ul. Asnyka Adama',79112321020,277,'56-210','859-31-49-985','122-054-977','Dionizy','sifosotixerawozacytutyxizyza8asijesa1ixa2ih','0A1994FDB593C0813B595C2C61CA8FBB',1),
(48,6,3,'Oktawiusz','Drezel','Olkusz','ul. Malskiej Florentyny',75090412574,201,'26-330',NULL,'270-714-911','Bolebor','zytopako4ibofuloj9mawyromu8yhiruxypobejezawahy','F35B8603A955A10F1B76876738301853',1),
(49,6,3,'Abraham','Ajdocka','Tarnowskie Góry','ul. Sucharskiego Henryka (Majora Henryka Sucharskiego)',72122614023,125,'07-214',NULL,'432-869-951','Ignacy','xeciva8ijitarasepugifepuvecup8c5','30FC9CCBD989B43007B9B1F8AF492E05',1),
(42,11,3,'Ronald','Tąpała','Tychy','ul. Piwna',91061105999,156,'80-299',NULL,'318-653-228','Andrzej','ty2ozohabohon1hybyrinerofyb8tykyqic','7FEFF98C5066283E6281F26C3B97AB9C',1),
(50,2,3,'Ziemisław','Rejmenowska','Pniewy','ul. Żółkiewskiego Stanisława',96080412677,1,'87-810',NULL,'401-498-601','Hugo','wepizu9yp0cu0','D50F57121AD95E439091AAFB47A36DCB',1),
(60,6,3,'Gabor','Makaro','Mchowo','ul. Piaskowa',84121112600,280,'99-311',NULL,'459-914-462','Festus','dyxykokez3perysyfad20yw','C149A6F1DAB10E902E856C79AFF6B23A',1),
(61,8,4,'Niemir','Potasiewicz','Bielsko-Biała','ul. Jaskółcza',77021210321,259,'43-600',NULL,'908-259-929','Karol','socarol3viby8ikanysiviluwyzuqoxihugikasony0us','657BE786C900386237450771FB818A9D',1),
(66,7,4,'Leonard','Zammerfeld','Niemiecka Wieś','ul. Obrońców Helu',92050922667,160,'42-100',NULL,'522-916-743','Burchard','caxapifup5vazige7ihonitynotibubyruqyj9xury','D5E4DAA216EF01A47F584CB68535CB8F',1),
(77,5,4,'Goliat','Potażek','Katowice','ul. Krzywa',71121503354,130,'27-350','386-194-61-710','811-807-738','Ziemowit','keq1mi4ym7luhocyx','8A42A7B8C0D5701F900E8AAC6A651DCE',1),
(76,5,4,'Filip','Żebrakowski','Ruda śląska','ul. Kościuszki Tadeusza',85011517231,112,'86-010','881-851-24-51','569-698-802','Julian','mevamigeb3nukaretalodetototur8gagosuz9','6D530C185831285944682646C6D955E1',1),
(64,10,4,'Chrystian','Malejonek','Gnatowo','ul. Mylna',80062617343,163,'05-802',NULL,'310-156-663','Innocenty','hylezoca6urekarewezaq69ej','2E075BFAF68483FC0166824BC4549DEE',1),
(67,6,4,'Odyseusz','Mirułowski','Rudziska','ul. Junaków',86032214242,236,'36-245',NULL,'600-771-675','Eberhard','tijekus6b1ryle2isow','33980C5CC4AEBF4476DE86A049A80E5F',1),
(65,2,4,'Bertrand','Łędzich','Rzeszów','ul. Orzeszkowej Elizy',71061416064,30,'38-441',NULL,'447-498-740','Alf','toxuwakohubikucy1ofefepib1mipy9y','7A883FDA71F4B2968D478B7998B880D5',1),
(71,9,4,'Wierzchosław','Badziński','Wierzyki','ul. Czołowa',82072513620,82,'81-865',NULL,'942-043-449','Bogurad','vydalusybonimavefagevifuvidem4mexen1gyz9qona','BB116297EDB75C0ADFD5D26CBBDFE103',1),
(79,3,4,'Kasper','Okrzaś','Głogów','ul. Zbąszyńska',71070415362,1,'81-449','765-55-29-280','688-693-317','Cezary','3arypixu12','809BCF063412D43EE4625353CAD8B2E6',1),
(72,4,4,'Symeon','Dziemierowicz','Opole','ul. Niecała',84110210513,98,'95-011',NULL,'114-274-017','Auksencjusz','zid0hyp9fafovyq3bicydu','EB12C9114FAC1F2FA5CF9BC73E61B2D2',1),
(73,2,4,'Oktawiusz','Wytt','Rzeszów','ul. Szklarniana',79062508645,165,'39-400',NULL,'870-804-412','Kewin','losufyb9dalybeqahyvepokyz2purojimipezovovetebic0z','0E1CA402536DADCD2A8F743DCF8C9109',1),
(75,7,4,'Marcin','Meszyński','Koszalin','ul. Bielskiego Marcina',87091423808,264,'88-100',NULL,'745-665-757','Bonifacy','nujutuh2nyvolagimufa3itur9sy','6CFA390611C99ECDCBCDDE997D73A4D2',1),
(74,8,4,'Witomir','Puzerowski','Wola Gruszowska','ul. Snycerska',79101308816,213,'26-400',NULL,'955-782-022','Mamert','wafese2okev8wyq7','E2AD8E565F5095D5EC6A2FF4C6DD6573',1),
(63,6,4,'Będzimir','Bałgan','Szczytniki','ul. Obrońców Helu',74082022678,164,'38-300',NULL,'710-161-189','Pafnucy','demysoniwebunuzo17kecofijesuzozup9gocolus','D85EA4B394D80F807054A9FE88FFAE80',1),
(78,3,4,'Cyrus','Zyglicki','Czaplinek','ul. Lipinka',77042225580,222,'60-480','702-68-53-420','592-607-641','Ewelin','fitypeg5jeg6dygyq0bi','F8AE6FC6DF223434064460830E440E16',1),
(68,6,4,'Unisław','Muchl','Wieliczka','ul. Tatarkiewicza Władysława',78011304073,166,'64-700',NULL,'634-424-288','Bartłomiej','h1juvor8jivyja3arubo','7A8CE962167C4AC9831DC2D9ADBC08CF',1),
(69,6,4,'Harasym','Żeniewicz','Gęby','ul. Goździków',79020803410,16,'11-041',NULL,'318-655-210','Adam','pewaxavutuzejypywa7ute6e0ijahyhicatygi','DBF90C98D96533DBF526DE7E39474800',1),
(62,11,4,'Prokop','Pienta','Stary Widok','Pl. Teatralny',93070921009,27,'71-499',NULL,'406-781-103','Godzisz','hakudemej8syvybacaw7vyhyv3gavut','A1F69129FAB9399F64653C5712C03A12',1),
(70,2,4,'Otniel','Żeweluk','Chochół','ul. Smosarskiej Jadwigi',72081104470,43,'26-200',NULL,'879-310-412','Czesemir','pyvi175ewiten','A02EFD6FB7F56510A0BE4162799D7EBC',1),
(80,6,4,'Paweł','Dymediuk','Rybnik','ul. Gen. Bora-Komorowskiego Tadeusza',78061410142,219,'06-400',NULL,'351-622-094','Żytomir','vasuguc5puhyhoci9agivoco2enamedilyhadifatonabe','78F005A7F4574522E6EC8BD325D8CE2E',1),
(81,8,5,'Bazyli','Libus','Warszawa','ul. Źródlana',95010523964,100,'66-615',NULL,'193-979-814','Dzierżykraj','f9r6sebom8','820AA8B5568CB5BBACA27CA7D6219B51',1),
(86,7,5,'Budzimir','Spiołek','świerże','ul. Jesienna',97043007169,231,'05-320',NULL,'563-123-613','Galezy','foz3racowoderydanygelyqobucikomevi9eqot7jymos','78D1F626D3F47E100DE10A763D2138AE',1),
(97,5,5,'Natan','Wells','Opole','ul. Plebiscytowa',83022613353,23,'00-654','421-277-67-30','947-464-204','Zdobysław','mi8ujozenoxehifiqyviciqadisi2agemebyjyzulin1','DB31ADDC156A73A9D12D5A8548EDE7C1',1),
(96,5,5,'Mieczysław','Szawiała','Jasło','ul. Reymonta Władysława',82052324239,296,'06-121','231-617-48-31','237-260-339','Prochor','zipujuj6fofycame48xyfofynebitefahamuhego','DAE2043013B0945D9EC2162FCA342261',1),
(84,10,5,'Strzeżywoj','Maszner','Grodzisk Mazowiecki','ul. Bonifraterska',94080808964,79,'39-230',NULL,'613-588-935','Zygfryd','617u44si913u75t70333622o3ah35uveg576967686m070','ECA1D8A3DD63B648270088E660FCD065',1),
(87,6,5,'Siemirad','Gieroni','Bielsko-Biała','ul. Pielęgniarek',88111102093,288,'01-678',NULL,'348-477-643','Tymoteusz','g0siwotekamubenixuno5ic1docag','AB36BF74278BC6C5F09E7A4A1117AD94',1),
(85,2,5,'Niemir','Sierzań','Warszawa','ul. Rudnickiego Mikołaja',75032221215,103,'78-100',NULL,'997-613-689','Bertram','5ibyc3l2rivu','BC4AAA7CB67382018E432374CE9D098B',1),
(91,9,5,'Czechasz','Petkow','Wilkowa Wieś','ul. Jastrzębowskiego Wojciecha Bogumiła',85040310449,224,'13-324',NULL,'257-943-269','Jan Kanty','5exukocaxerupiza30zoxahodulyxytoro','AC66C9CBE5922A99D52F5A06960A8DEE',1),
(99,3,5,'Machabeusz','Placuk','Zielona Góra','ul. Żytnia',85071816633,201,'85-677','964-14-21-361','999-258-815','Hermes','0oxij5qu7i','BFCF1CD22B19E56C7CB4B786F520C86C',1),
(92,4,5,'Wisław','Marenicz','Ostrołęka','ul. Wesoła',73051812115,40,'37-630',NULL,'148-586-716','Adolf','37263040g08581496141785045vu72823542101','52F6067D881F719A28431E3128E6F1AF',1),
(93,2,5,'Natan','Tobołowska','Lublin','Pl. 1905 Roku',81100902984,175,'20-400',NULL,'877-706-282','Cyprian','gece9u8ewi7epaqafo','D105A6E7DD249E3747A11CED33EA0BBA',1),
(95,7,5,'świeciech','Wałkuski','Krypno Wielkie','ul. Staszica Stanisława',81031500280,130,'25-653','499-65-32-413','817-386-742','Jacław','qij4roxuq2tewolopowakeqesuvyt3hohyjugir','A2A2156AD5D037EC32BF131FC20C4E71',1),
(94,8,5,'Berno','Niemow','Górne Maliki','ul. świętego Sebastiana',74041722896,134,'78-100',NULL,'810-214-843','Narcyz','wuxalobedywipydiqurajeqaz8vylidob4noryqac8nibo','4C7D3829DD4C6E666DB56DEDA2959C61',1),
(83,6,5,'Amon','Dawidow','Wrocław','ul. Zamkowa',79012916229,133,'10-687',NULL,'541-546-514','Emil','jax33ovobuxuxyrukemawo4ylamitewyh','48335352BDCD2E818B0E194226455C73',1),
(98,3,5,'Waleriusz','Hohlfeld','Wrocław','ul. Szafrana Tadeusza',79011003023,276,'80-175','438-31-32-264','390-296-604','Prudencjusz','puhapefa4anisebakejaxo3ivaq6foz','10E4EF2A9C0D8ADBDBC017077F859187',1),
(88,6,5,'Uniedrog','Predynkiewicz','Giedajty','ul. Madera',94122809830,29,'57-150',NULL,'425-077-658','Częstogniew','4on6towymi5abafu','DB5D7281D9F2D80A438F17C893F41CD1',1),
(89,6,5,'Czechasz','Schurma','Katowice','ul. Wileńska',88071206110,272,'09-110',NULL,'892-744-259','Egon','65330735598366375699p','24AD8F30820FFC6338F707B1D98A9F5B',1),
(82,11,5,'Uniemysł','Szamowski','Chojęcin','ul. Rychla Jana',79050309629,165,'19-104',NULL,'582-780-266','Amedeusz','tizujerohuginylyj8me04vogyj','D6C176CA6BC8DF6CF2886B5E20008A55',1),
(90,2,5,'Paweł','Zuzak','Biały Grunt','ul. Długa',96071206610,221,'14-200',NULL,'562-599-740','Marcjal','fa08huroqizuvybi6ojo','886CA4AA9E2A4298B63FAF61A85B86EA',1),
(100,6,5,'Agatonik','Grabus','Gdańsk','ul. Brzoskwiniowa',95122123685,252,'80-003',NULL,'690-757-864','Salwator','repoxedy8adetar2w0zevy','D4F9D4C56982EB7D2107125A68152A16',1),
(101,8,6,'Demetriusz','Rakaszewska','Koszarsko','ul. Moniuszki Stanisława',78081013682,33,'08-110',NULL,'109-501-577','Cecylian','limomyzen2copojekek8fonaf5no','B41A7099EE4CEB1BA8352BB517527CD8',1),
(106,7,6,'Tomasz','Perelson','Warszawa','ul. Leszków',86101514282,30,'98-240',NULL,'639-062-387','Tyburcjusz','ramikyhyke2ugano6eqihur6nefyt','4F12D26928C5A7CDF706DF02CB54E7C0',1),
(117,5,6,'Renat','Medau','Skupowo','ul. Szczepowa',83033114151,230,'43-430','921-154-83-20','451-115-321','Wielisław','majobuhyluda3oxodysohijon63enohe','731B8DE96F0DEF6D7744D043A31D92C2',1),
(116,5,6,'Beatus','Sopoński','Rawka','ul. Częstochowska',82090801712,177,'62-010','743-41-56-995','213-121-024','Tristan','fyg4zikosigorupyzuwuzulifo14qepybuqadotodasoryg','4A8C6A19AD17487A7C19C9DCE951DB99',1),
(104,10,6,'Tezeusz','Wojkszun','Ignacewo','ul. Jaśminowa',87051005734,249,'07-410',NULL,'718-905-239','Borzysław','sikidumi3uxibit4laguvoqokaj1dew','EA69AE988B3A6844BC456447A5321D40',1),
(107,6,6,'światozar','Konakow','Jelenia Góra','ul. Ternicka',79021118494,156,'37-400',NULL,'591-986-331','Julian','fa4anirutex5ce1','37AD0307E0E4F51F5765D32E0B11093E',1),
(105,2,6,'Beniamin','Bartsik','Opole','ul. Kasztelańska',93021811119,229,'25-633',NULL,'703-012-369','Arnold','3168900866144305224200531620738593','B14160CB6CD5C9AC5307560D2BA8FEB0',1),
(111,9,6,'Enoch','Werbowa','Rybnik','ul. Wałowa',81062104851,289,'60-348',NULL,'719-219-181','Uniedrog','s8pajuqujiz8vapy9yfytin','E6165E67E410A2CC40FCDEEA2DFD1546',1),
(119,3,6,'Bruno','świrgiel','Poznań','ul. Pielęgniarek',92042504723,51,'09-402','324-181-85-31','301-604-350','Edmund','wujynejugamyfojucasehu2e1orex1no','E5E8671B241C910760C18E6E795654BB',1),
(112,4,6,'Gotard','Daude','Gołas','ul. Głowackiego Wojciecha Bartosza',84022624552,20,'23-320',NULL,'342-055-556','Anicet','vevomig5dyvejyka9ajavulyxiz7vekade','7C94B56544629552C92FD69ED429BD94',1),
(113,2,6,'Saul','Bajków','Bielsko-Biała','ul. Prądzyńskiego Ignacego',85020706325,130,'91-849',NULL,'524-938-451','Czcisław','z7jezinok5gize6i','4F9B0F737475737DA91CE4F7DB398562',1),
(115,7,6,'Gall','Harabuz','Skoroszów','ul. Wólczańska',93101024400,105,'61-748',NULL,'799-731-984','Dzierżykraj','gybumipaqapyfuj9vebowiwyfu8er9lo','219B0852F34204F8AFA2A002095EA95F',1),
(114,8,6,'Wolimir','Buczewski','Legnica','ul. Rybacka',90042803293,21,'16-304',NULL,'279-479-176','Stanimir','9yw0zir8vegucigu','8AED1B7FCC6489F3E67D170F0DB58875',1),
(103,6,6,'Agatonik','Rurdsztuk','Szczucice','ul. Zeusa',90021321468,88,'36-121',NULL,'292-340-236','Lubosław','zupeqyfos5fupavoduviv5saraxeky4ehoqydaf','F09421FB85B9CCBDBD343EC0ABFF1FFA',1),
(118,3,6,'Hipolit','Nevermann','Leszczowate','ul. Wojska Polskiego',94112819962,136,'42-530','388-17-73-797','351-116-276','Przybygniew','h657piji782e1','C61C3834FA3C066FBE39919A24AC32B1',1),
(108,6,6,'Mauryn','Kapust','Tchórz','ul. Kablowa',83081910716,131,'05-306',NULL,'150-688-674','Antoni','8ekat0juxediqytih5','249D6910521C9CA6F3EAA428FAF97D10',1),
(109,6,6,'Dobromił','Orużak','Kraków','ul. Brzezińska',94101303401,59,'16-424',NULL,'618-139-562','Ezechiel','0164p30o15b2h23i465y23d9r4n415','E8CF19D35D58B5491D45471EDA1D49ED',1),
(102,11,6,'Dersław','Inszo','Sianowo Leśne','ul. Tartaczna',86060624187,108,'29-105',NULL,'350-396-890','Salezy','kela9ijyzuzy5o7ifob','745D8003A61D21D161351B56398115B8',1),
(110,2,6,'Herakles','Towalewski','Warszawa','ul. Działkowa',77021225367,210,'31-958',NULL,'456-602-498','Leopold','boligagaluzoqisex5pojytol9goh2qiwimyk','87D0C57A32D34242383115049C64CE62',1),
(120,6,6,'Lubomir','Olewnik','Gdynia','ul. Nadrzeczna',75080215053,229,'62-541',NULL,'255-791-075','Przedbor','ly1ilu55vumi','B60751F0CB2AF2DFBAFA0B30091843BD',1);

COMMIT;

BEGIN TRANSACTION;

INSERT INTO przesunięcia_magazynowe (fk_hurtownia_źródłowa,fk_hurtownia_docelowa,fk_pracownik,data_zlecenia,data_realizacji,data_odbioru_końcowego) VALUES
(5,6,95,'2019-06-20 13:17:34','2019-06-29 09:12:15','2019-07-04 13:52:58'),
(4,3,70,'2018-07-30 14:28:09','2018-08-08 23:13:03','2018-08-13 18:49:59'),
(4,2,69,'2020-02-06 12:53:02','2020-02-12 07:30:41','2020-02-17 05:25:21'),
(2,1,30,'2018-12-05 09:47:29','2018-12-07 04:56:20','2018-12-12 23:41:40'),
(3,5,49,'2019-12-02 08:11:07','2020-12-09 15:20:58','2019-12-14 11:03:36');

INSERT INTO zamówienia (fk_hurtownie,fk_dostawcy,fk_pracownicy,data_zlecenia,data_odbioru,cena_sum_netto,cena_sum_brutto) VALUES
(6,2,109,'2019-08-15 13:17:34','2019-08-18 09:12:15',62250.0,76567.5),
(3,5,50,'2018-09-16 14:28:09','2018-09-20 23:13:03',79220.0,97440.6),
(2,6,35,'2020-01-17 12:53:02','2020-01-21 07:30:41',165597.5,203684.93),
(1,7,10,'2018-10-30 09:47:29','2018-11-05 04:56:20',110485.0,135896.55),
(5,10,89,'2019-11-28 08:11:07','2020-01-02 15:20:58',75712.5,93126.38);

INSERT INTO start_upy (miejscowość,ulica,numer_mieszkania,kod_pocztowy,nip,numer_telefonu,email,regon,nazwa,województwo,powiat,gmina) VALUES
('Leszkowice','ul. Szkolna',183,'80-603','308-52-94-380','603-485-192','sozax@tizovehaxetaqyc5lapihafuvizipirajiwotaxybe-ylalozufyh-t.pl',22201615927019,'CodeStarter','zachodniopomorskie','Świdnicki','Zbrosławice'),
('Warszawa','ul. Jara',241,'78-220','255-87-48-282','351-927-298','retyhawesa@safinile7odeleryjive2y0uh38am83ejifygadonywiwuhadifofuk3bo.pl',64636236356608,'FotoWorkers','śląskie','m. Koszalin','M. Radom'),
('Piaski','ul. Wiejska',41,'73-220','108-69-73-780','856-791-613','n4lyzilyvosa0ycaxywesanypiqov@nekaxige0u2ymu3ilenuqoso6oz2z.pl',50653607598885,'MachineMastering','warmiñsko-mazurskie','m. Płock','Dębno'),
('Dąbrowa Górnicza','ul. Różana',300,'42-226','332-715-93-33','468-311-887','0iqigipu7i5yxybasicokysevow6@wyve8ocyjeri9yweg3coco0.pl',808496584,'STMStarter','łódzkie','m. Szczecin','M. st. Warszawa'),
('Wrocław','ul. Witosa Wincentego',292,'78-630','258-236-38-64','387-242-181','4.p2kosoxicyj-jof6c8qinolivun@xul7.pl',031987030,'MicroChip','śląskie','starogardzki','M. Kraków');

INSERT INTO fundacje (miejscowość,ulica,numer_mieszkania,kod_pocztowy,nip,numer_telefonu,email,regon,nazwa,województwo,powiat,gmina) VALUES
('Maciejów','ul. Pana Tadeusza',177,'09-500','834-52-23-431','570-220-638','wyrokufubewis0kyposuha@pymosiwu4ymynuzipojamyl-pi3omixagiposegijyxexize6awewiten.pl',114160595,'Fundacja Batorego','małopolskie','sejneński','Słupia (Konecka)'),
('Warszawa','ul. Wańkowicza Melchiora',208,'85-790','314-814-85-31','780-078-026','hon1gow@guwo1ajukoxum2he2ody3imituj66ibymyqako.pl',10388198139241,'Fundacja im. Jana Kochanowskiego','mazowieckie','łaski','Gryfice'),
('Stradlice','ul. Brzechowska',105,'20-355','818-82-97-171','763-885-700','detufocu@z3byp3xazula0up7xugyfuqugeqaqun0c7lahyse6okid650hebugoj.pl',866389251,'Fundacja ST','zachodniopomorskie','nowomiejski','Biała'),
('Galowice','ul. Świerkowa',72,'46-022','962-79-41-667','110-982-714','fyze@gyrejoq.pl',84006729340530,'Fundacja im. Jana Pawła II','małopolskie','mikołowski','Zblewo'),
('Warszawa','ul. Tuwima Juliana',23,'05-170','461-43-42-643','853-057-384','sovido7iwykecuwixeb36u8apu0i@seqahoti.pl',01443767731041,'Fundacja im. Marii Skłodowskiej-Curie','wielkopolskie','włoszczowski','Kamieniec Ząbkowicki');

INSERT INTO dane_przedsiębiorstw (miejscowość,ulica,numer_mieszkania,kod_pocztowy,nip,numer_telefonu,email,regon,nazwa_przedsiębiorstwa,województwo,powiat,gmina) VALUES
('Gołębiów','ul. Majkowskiego Aleksandra (Doktora Aleksandra Majkowskiego)',174,'42-360','608-895-98-84','507-244-204','nuderunokifatavuzu1otynaxugomiqo@t0fe5idip.pl',656636362,'Medcom','opolskie','lipnowski','Siewierz'),
('Rutkowice','ul. Świętego Brata Alberta',233,'86-307','121-65-91-210','621-651-020','nyjezele9uha1yhowyvimajyfaxuzegi@qodozomek4jozaq2q3sywofiz9k0rude.pl',294835373,'Metalwork Inc','mazowieckie','lubiński','Cewice'),
('Przewłoka','ul. Marmurowa',82,'13-220','557-43-73-171','907-034-109','my@6u6uwyvesywykitomocekitihikefovybijibozesyjorabuxavy.pl',784066207,'FastCode','wielkopolskie','m. Tychy','M. Lublin'),
('Nieborzyn','ul. Kacza',286,'98-290','628-479-51-95','737-011-412','zoc71@xevyfutif0kucyf.pl',247169207,'Metal and Steel Inc','kujawsko-pomorskie','m. Szczecin','Strachówka'),
('Mochle','ul. Konarskiego Stanisława',193,'05-077','835-91-29-415','273-059-001','bo.ytarepyqela7ezap5sizyve7oluk@cife1e.pl',50309116842741,'LubMat','mazowieckie','m. st. Warszawa','M. Bydgoszcz'),
('Opinogóra Górna','ul. Moniuszki Stanisława',39,'41-800','117-353-66-63','108-707-554','kavovu3yp0duhidimasov6@wyruhyra3ibovetujysykoge4osihuz6quq5.pl',562628407,'WarMarkt','dolnośląskie','koniński','M. Rzeszów'),
('Brodowa Góra','ul. Rokitniańska',120,'81-919','915-14-47-620','634-732-618','hamutazacudiwud05a4ylodig@lasepawiny7utyf2xezorihuto8omo2ifijiqetos2.pl',76478303452374,'Dynamo','mazowieckie','polkowicki','M. Łódź'),
('Bydgoszcz','ul. Miarki Karola',26,'72-221','195-132-28-38','718-047-247','sak7hajycobobegapocizyzu@botyjosekekywozonekun3hu7uc1qowifu8ive9a56gavuzeruzopyvonup.pl',188225130,'FastAssembler','łódzkie','m. Lublin','Mykanów'),
('Józefów','ul. Z. Kościńskiego',95,'58-562','624-17-19-339','798-707-024','nak2joga@qohevoriqopasyhyvyzunemu6ehudu08q5jycewixuky.pl',185161818,'ExtraCodeWorkers','kujawsko-pomorskie','Średzki','Chorzele'),
('Władysławowo','ul. Staffa Leopolda',168,'05-085','781-882-18-84','683-455-810','8ybohe2ejeryrofy@mapopu3emirejon.pl',359093795,'PHPService','wielkopolskie','dębicki','Radomin');

COMMIT; 

BEGIN TRANSACTION;

INSERT INTO punkty_sprzedaży (fk_dane_przedsiębiorstw,miejscowość,ulica,numer_mieszkania,kod_pocztowy,numer_telefonu,email,województwo,powiat,gmina,status) VALUES
(1,'Gołębiów','ul. Majkowskiego Aleksandra (Doktora Aleksandra Majkowskiego)',174,'42-360','453-981-686','nuderunokifatavuzu1otynaxugomiqo@t0fe5idip.pl','opolskie','lipnowski','Siewierz',1),
(2,'Rutkowice','ul. Świętego Brata Alberta',233,'86-307','267-429-560','nyjezele9uha1yhowyvimajyfaxuzegi@qodozomek4jozaq2q3sywofiz9k0rude.pl','mazowieckie','lubiński','Cewice',1),
(3,'Przewłoka','ul. Marmurowa',82,'13-220','146-966-693','my@6u6uwyvesywykitomocekitihikefovybijibozesyjorabuxavy.pl','wielkopolskie','m. Tychy','M. Lublin',1),
(4,'Nieborzyn','ul. Kacza',286,'98-290','991-458-343','zoc71@xevyfutif0kucyf.pl','kujawsko-pomorskie','m. Szczecin','Strachówka',1),
(5,'Mochle','ul. Konarskiego Stanisława',193,'05-077','402-446-009','bo.ytarepyqela7ezap5sizyve7oluk@cife1e.pl','mazowieckie','m. st. Warszawa','M. Bydgoszcz',1),
(6,'Opinogóra Górna','ul. Moniuszki Stanisława',39,'41-800','181-858-296','kavovu3yp0duhidimasov6@wyruhyra3ibovetujysykoge4osihuz6quq5.pl','dolnoŚląskie','koniński','M. Rzeszów',1),
(7,'Brodowa Góra','ul. Rokitniańska',120,'81-919','650-086-406','hamutazacudiwud05a4ylodig@lasepawiny7utyf2xezorihuto8omo2ifijiqetos2.pl','mazowieckie','polkowicki','M. Łódź',1),
(8,'Bydgoszcz','ul. Miarki Karola',26,'72-221','651-222-914','sak7hajycobobegapocizyzu@botyjosekekywozonekun3hu7uc1qowifu8ive9a56gavuzeruzopyvonup.pl','łódzkie','m. Lublin','Mykanów',1),
(9,'Józefów','ul. Z. Kościńskiego',95,'58-562','345-765-395','nak2joga@qohevoriqopasyhyvyzunemu6ehudu08q5jycewixuky.pl','kujawsko-pomorskie','Średzki','Chorzele',1),
(10,'Władysławowo','ul. Staffa Leopolda',168,'05-085','950-182-967','8ybohe2ejeryrofy@mapopu3emirejon.pl','wielkopolskie','dębicki','Radomin',1),
(1,'Modryń-Kolonia','ul. Zaciszna',35,'85-001','937-032-461','serovyfelirumicufynuxu@3az5liraz.pl','warmińsko-mazurskie','tomaszowski','M. st. Warszawa',1),
(1,'Olsztyn','ul. Rabatki',280,'74-120','489-884-619','1i5azyhujiji01wotudesa@4a.pl','dolnośląskie','m. Katowice','Brańsk',1),
(2,'Goruszów','ul. Kaliska',247,'03-578','474-281-909','seno2oluhip5gucimec9sohuvys@6onylikaxe0ori5e-afupiqetyluwilabu-erez39ocetypimykihito.pl','wielkopolskie','czêstochowski','Przerośl',1),
(2,'Poznań','ul. Toruńska',96,'86-105','751-025-492','1osazad.jusisymomasi3ahize@6ejepuhizepe8e4ujuvodu-emad6kekymi.pl','śląskie','sochaczewski','M. Bielsko-Biała',1),
(4,'Wałbrzych','ul. Staszica Stanisława',183,'02-203','962-261-707','ficixa2osegolodacu@1ozimaposydyhun2jynapuw0lukumysuxy8irypeh8c1zojaquz.pl','mazowieckie','pleszewski','Wilamowice',1),
(5,'Jaworzno','ul. Poziomkowa',240,'61-441','921-249-078','bypebesetywis5de@nelogosiqafanugufuly41we.pl','mazowieckie','pabianicki','Bobolice',1),
(5,'Rybnik','ul. Partyzantów',227,'04-608','989-814-684','fogifebod@4efusyv2.pl','mazowieckie','m. Włocławek','Kłaj',1),
(7,'Wylan','ul. Galileusza',6,'70-767','318-304-946','qyny.ovonop@4udyp.pl','śląskie','wodzisławski','świecie',1),
(9,'Jasieniec Solecki','ul. Zaciszna',156,'02-760','474-808-310','relerudugojozod9rav@jyd7k75ytesedyzy3umyjalupyryso.pl','warmińsko-mazurskie','m. Grudziądz','M. Bielsko-Biała',1),
(8,'Kozielsko','ul. Nasypowa',3,'45-527','195-933-932','ne1imocuz5toky@ci5yl0s1k4bukejisi9i0acyzany.pl','mazowieckie','zawierciański','M. Kraków',1);

INSERT INTO kategorie (kategoria,fk_podkategorii) VALUES
('mikrokontroler',NULL),
('mikroprocesor',NULL),
('sterownik silnika bezszczotkowego',NULL),
('wzmaczniacz dźwięku',NULL),
('kwarce',NULL);

INSERT INTO płatności (rodzaj_płatności) VALUES
('gotowka'),
('przelew paypal'),
('przelewy24.pl'),
('tradycyjny przelew bankowy'),
('blik');

COMMIT;

BEGIN TRANSACTION;

INSERT INTO sprzedaże (fk_płatności,fk_punkt_sprzedaży,data_zlecenia_sprzedaży,data_zaksięgowania_płatności,cena_sum_netto,cena_sum_brutto,rabat) VALUES
(1,1,'2020.02.02 10:00:00','2020.02.03 10:00:00',667500.0,821025.0,0.2),
(4,5,'2020.02.16 10:05:11','2020.02.17 10:05:11',494200.0,607866.0,0.0),
(4,10,'2020.02.17 10:11:30','2020.02.18 10:11:30',571400.0,702822.0,0.1),
(4,15,'2020.02.21 10:15:35','2020.02.22 10:15:35',691050.0,849991.5,0.2),
(1,13,'2020.03.02 10:00:59','2020.03.03 10:00:59',805300.0,990519.0,0.3);

COMMIT;

BEGIN TRANSACTION;

INSERT INTO datki (fk_fundacja,fk_start_up,forma,kwota) VALUES
(1,NULL,1,20000),
(NULL,1,0,20000),
(2,NULL,1,10000),
(NULL,2,0,15000),
(3,NULL,1,20000);

INSERT INTO faktury (fk_pracownik,fk_sprzedaż,fk_dane_przedsiębiorstw,imię_nabywcy,nazwisko_nabywcy,numer_telefonu_nabywcy,email_nabywcy,stawka_vat,data_wystawienia) VALUES
(3,1,1,'Artur','Królikowski','390-166-456','nuderunokifatavuzu1otynaxugomiqo@t0fe5idip.pl',0.23,'2020.02.02 10:00:00'),
(4,2,2,'Karol','Nowak','958-734-211','nyjezele9uha1yhowyvimajyfaxuzegi@qodozomek4jozaq2q3sywofiz9k0rude.pl',0.23,'2020.02.16 10:05:11'),
(23,3,3,'Mateusz','Podlaski','362-439-241','my@6u6uwyvesywykitomocekitihikefovybijibozesyjorabuxavy.pl',0.23,'2020.02.17 10:11:30'),
(24,4,4,'Alicja','Zielińska','168-814-657','zoc71@xevyfutif0kucyf.pl',0.23,'2020.02.21 10:15:35'),
(29,5,5,'Joanna','Marczak','163-204-456','bo.ytarepyqela7ezap5sizyve7oluk@cife1e.pl',0.23,'2020.03.02 10:00:59');

INSERT INTO stanowiska_uprawnienia (fk_stanowiska,fk_uprawnienia) VALUES
(1,1),
(1,3),
(1,7),
(1,12),
(1,14),
(1,15),
(1,16),
(2,1),
(2,2),
(2,3),
(2,10),
(2,11),
(2,15),
(3,1),
(3,2),
(3,3),
(3,4),
(3,5),
(3,6),
(3,7),
(3,8),
(3,11),
(3,12),
(3,14),
(3,15),
(3,16),
(4,1),
(4,2),
(4,3),
(4,4),
(4,5),
(4,6),
(4,7),
(4,8),
(4,11),
(4,12),
(4,13),
(4,14),
(4,15),
(4,16),
(5,3),
(5,7),
(5,9),
(5,13),
(5,15),
(6,3),
(6,9),
(7,3),
(8,3),
(9,1),
(9,2),
(9,3),
(9,8),
(9,11),
(9,12),
(9,15),
(9,16),
(10,1),
(10,3),
(10,7),
(10,8),
(10,12),
(10,15),
(10,16);

INSERT INTO listy_przewozowe (fk_sprzedaż,fk_dostawca,fk_przesunięcie_magazynowe,data_wystawienia,data_przyjęcia_do_przewozu,sposób_pakowania,waga,rodzaj_towaru,koszt_wysyłki_netto,koszt_wysyłki_brutto) VALUES
(1,1,NULL,'2020.02.02 10:00:00','2020.02.02 12:08:00','folia',100,'podzespoły elektroniczne',100,123),
(2,2,NULL,'2020.02.16 10:05:11','2020.02.16 12:05:11','folia',100,'podzespoły elektroniczne',100,123),
(3,3,NULL,'2020.02.17 10:11:30','2020.02.17 12:11:30','folia',100,'podzespoły elektroniczne',100,123),
(4,4,NULL,'2020.02.21 10:15:35','2020.02.21 12:15:35','folia',100,'podzespoły elektroniczne',100,123),
(5,5,NULL,'2020.03.02 10:00:59','2020.03.02 12:09:59','folia',100,'podzespoły elektroniczne',100,123),
(NULL,6,1,'2019-06-29 09:12:15','2019-06-29 12:16:02','folia',178,'podzespoły elektroniczne',100,123),
(NULL,7,2,'2018-08-08 23:13:03','2018-08-09 12:17:15','folia',196,'podzespoły elektroniczne',100,123),
(NULL,8,3,'2020-02-12 07:30:41','2020-02-12 12:11:32','folia',303,'podzespoły elektroniczne',100,123),
(NULL,1,4,'2018-12-07 04:56:20','2018-12-07 12:14:17','folia',402,'podzespoły elektroniczne',100,123),
(NULL,2,5,'2020-12-09 15:20:58','2020-12-10 12:13:19','folia',290,'podzespoły elektroniczne',100,123);

INSERT INTO stany_magazynowe (fk_hurtownie,fk_towary,ilość) VALUES
(1,2,2500),
(1,3,3500),
(1,5,6000),
(1,7,2250),
(1,8,2100),
(2,1,6050),
(2,4,8000),
(2,3,8100),
(3,5,2600),
(3,6,2000),
(3,7,4500),
(3,8,5000),
(3,4,5500),
(4,1,2500),
(4,4,4500),
(5,7,4000),
(5,3,8500),
(5,2,9000),
(6,5,1500),
(6,8,1000);

INSERT INTO towary_datki (fk_datki,fk_towary,ilość) VALUES
(1,1,100),
(2,1,200),
(3,1,150),
(4,2,100),
(5,2,100);

INSERT INTO towary_kategorie (fk_towary,fk_kategorie_towaru) VALUES
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,3),
(7,3),
(8,3);

INSERT INTO towary_przesunięcia (fk_towary,fk_przesunięcia_magazynowe,ilość) VALUES
(1,1,1650),
(2,1,1670),
(3,1,1110),
(4,1,1200),
(5,1,1380),
(6,2,1415),
(1,2,1395),
(2,2,1660),
(3,2,1710),
(4,2,1720),
(5,3,1890),
(8,3,1920),
(7,3,1975),
(1,3,2000),
(2,3,1050),
(3,4,1075),
(4,4,1440),
(8,4,1410),
(6,4,1480),
(7,4,1520),
(1,5,1490),
(3,5,1720),
(4,5,1670),
(5,5,1320),
(6,5,1030);

INSERT INTO towary_sprzedaże (fk_towary,fk_sprzedaże,ilość) VALUES
(1,1,1000),
(2,1,2000),
(3,1,1250),
(4,1,1750),
(5,1,3000),
(6,2,1540),
(1,2,1250),
(2,2,1950),
(3,2,1000),
(4,2,2000),
(5,3,1400),
(8,3,1850),
(7,3,2000),
(1,3,1325),
(2,3,1840),
(3,4,1950),
(4,4,1660),
(8,4,2140),
(6,4,2150),
(7,4,2200),
(1,5,2220),
(3,5,2250),
(4,5,2210),
(5,5,2600),
(6,5,2700);

INSERT INTO zamówienia_towary (fk_zamówienia,fk_towary,cena_jedn_netto,cena_jedn_brutto,ilość) VALUES
(1,1,25.0,30.75,100),
(1,3,35.0,43.05,200),
(1,5,45.0,55.35,300),
(1,7,32.0,39.98,400),
(1,8,37.0,46.13,700),
(2,2,30.0,36.9,200),
(2,3,35.0,43.05,600),
(2,4,40.0,49.2,666),
(2,5,45.0,55.35,500),
(2,6,27.5,33.83,112),
(3,7,32.5,39.98,997),
(3,8,37.5,46.13,998),
(3,2,30.0,36.9,999),
(3,3,35,43.05,992),
(3,4,40,49.2,777),
(4,5,45,55.35,121),
(4,6,27.5,33.83,994),
(4,2,30,36.9,114),
(4,3,35,43.05,991),
(4,4,40,49.2,990),
(5,1,25,30.75,500),
(5,2,30,36.9,450),
(5,8,37.5,46.13,475),
(5,7,32.5,39.98,484),
(5,3,35,43.05,462);

COMMIT;