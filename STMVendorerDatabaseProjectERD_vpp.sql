CREATE TABLE datki (
  pk          int(10) NOT NULL AUTO_INCREMENT, 
  fk_fundacja int(10), 
  fk_start_up int(10), 
  forma       tinyint(1) NOT NULL, 
  kwota       decimal(19, 2), 
  PRIMARY KEY (pk));
CREATE TABLE start_upy (
  pk               int(10) NOT NULL AUTO_INCREMENT, 
  nazwa            varchar(255) NOT NULL UNIQUE, 
  email            varchar(255) NOT NULL UNIQUE, 
  gmina            char(6) NOT NULL, 
  kod_pocztowy     char(6) NOT NULL, 
  miejscowość      varchar(35) NOT NULL, 
  nip              char(10) UNIQUE, 
  numer_mieszkania varchar(6) NOT NULL, 
  numer_telefonu   varchar(11) NOT NULL, 
  powiat           char(4) NOT NULL, 
  regon            varchar(14) NOT NULL UNIQUE, 
  ulica            varchar(80) NOT NULL, 
  województwo      char(2) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE fundacje (
  pk               int(10) NOT NULL AUTO_INCREMENT, 
  email            varchar(255) NOT NULL UNIQUE, 
  gmina            char(6) NOT NULL, 
  kod_pocztowy     char(6) NOT NULL, 
  miejscowość      varchar(35) NOT NULL, 
  nazwa            varchar(255) NOT NULL UNIQUE, 
  nip              char(10) NOT NULL UNIQUE, 
  numer_mieszkania varchar(6) NOT NULL, 
  numer_telefonu   varchar(11) NOT NULL, 
  powiat           char(4) NOT NULL, 
  regon            varchar(14) NOT NULL UNIQUE, 
  ulica            varchar(80) NOT NULL, 
  województwo      char(2) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE towary (
  pk               int(10) NOT NULL AUTO_INCREMENT, 
  nazwa            varchar(255) NOT NULL, 
  kod_producenta   varchar(10) NOT NULL, 
  opis             varchar(1000) NOT NULL, 
  dostępność       tinyint(1) NOT NULL, 
  cena_jedn_netto  decimal(19, 2) NOT NULL, 
  cena_jedn_brutto decimal(19, 2) NOT NULL, 
  stawka_vat       decimal(1, 2) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE towary_datki (
  pk        int(11) NOT NULL AUTO_INCREMENT, 
  fk_datki  int(10) NOT NULL, 
  fk_towary int(10) NOT NULL, 
  ilość     int(11) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE sprzedaże (
  pk                           int(11) NOT NULL AUTO_INCREMENT, 
  fk_płatności                 int(11) NOT NULL, 
  fk_punkt_sprzedaży           int(10) NOT NULL, 
  data_zlecenia_sprzedaży      timestamp NOT NULL, 
  data_zaksięgowania_płatności timestamp NULL, 
  cena_sum_netto               decimal(19, 2) NOT NULL, 
  cena_sum_brutto              decimal(19, 2) NOT NULL, 
  rabat                        decimal(1, 2) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE towary_sprzedaże (
  pk           int(11) NOT NULL AUTO_INCREMENT, 
  fk_towary    int(10) NOT NULL, 
  fk_sprzedaże int(11) NOT NULL, 
  ilość        int(11) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE płatności (
  pk               int(11) NOT NULL AUTO_INCREMENT, 
  rodzaj_płatności varchar(255) NOT NULL UNIQUE, 
  PRIMARY KEY (pk));
CREATE TABLE punkty_sprzedaży (
  pk                      int(10) NOT NULL AUTO_INCREMENT, 
  fk_dane_przedsiębiorstw int(10) NOT NULL, 
  województwo             char(2) NOT NULL, 
  powiat                  char(4) NOT NULL, 
  gmina                   char(6) NOT NULL, 
  kod_pocztowy            char(6) NOT NULL, 
  miejscowość             varchar(35) NOT NULL, 
  ulica                   varchar(80) NOT NULL, 
  numer_mieszkania        varchar(6) NOT NULL, 
  numer_telefonu          varchar(11) NOT NULL, 
  email                   varchar(255) NOT NULL, 
  status                  tinyint(1) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE dane_przedsiębiorstw (
  pk                     int(10) NOT NULL AUTO_INCREMENT, 
  województwo            char(2) NOT NULL, 
  powiat                 char(4) NOT NULL, 
  gmina                  char(6) NOT NULL, 
  kod_pocztowy           char(6) NOT NULL, 
  miejscowość            varchar(35) NOT NULL, 
  ulica                  varchar(80) NOT NULL, 
  numer_mieszkania       varchar(6) NOT NULL, 
  nazwa_przedsiębiorstwa varchar(255) NOT NULL UNIQUE, 
  nip                    char(10) NOT NULL UNIQUE, 
  regon                  varchar(14) NOT NULL UNIQUE, 
  numer_telefonu         varchar(11) NOT NULL, 
  email                  varchar(255) NOT NULL UNIQUE, 
  PRIMARY KEY (pk));
CREATE TABLE hurtownie (
  pk               int(10) NOT NULL AUTO_INCREMENT, 
  kod_hurtowni     char(6) NOT NULL UNIQUE, 
  gmina            char(6) NOT NULL, 
  kod_pocztowy     char(6) NOT NULL, 
  miejscowość      varchar(35) NOT NULL, 
  numer_mieszkania varchar(6) NOT NULL, 
  powiat           char(4) NOT NULL, 
  ulica            varchar(80) NOT NULL, 
  województwo      char(2) NOT NULL, 
  status           tinyint(1) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE stany_magazynowe (
  pk           int(11) NOT NULL AUTO_INCREMENT, 
  fk_hurtownie int(10) NOT NULL, 
  fk_towary    int(10) NOT NULL, 
  ilość        int(11) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE zamówienia (
  pk              int(10) NOT NULL AUTO_INCREMENT, 
  fk_hurtownie    int(10) NOT NULL, 
  fk_dostawcy     int(10) NOT NULL, 
  fk_pracownicy   int(11) NOT NULL, 
  data_zlecenia   timestamp NOT NULL, 
  data_odbioru    timestamp NOT NULL, 
  cena_sum_netto  decimal(19, 2) NOT NULL, 
  cena_sum_brutto decimal(19, 2) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE zamówienia_towary (
  pk               int(10) NOT NULL AUTO_INCREMENT, 
  fk_zamówienia    int(10) NOT NULL, 
  fk_towary        int(11) NOT NULL, 
  cena_jedn_netto  decimal(19, 2) NOT NULL, 
  cena_jedn_brutto decimal(19, 2) NOT NULL, 
  ilość            int(11) NOT NULL, 
  towarypk         int(10) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE dostawcy (
  pk               int(10) NOT NULL AUTO_INCREMENT, 
  nazwa            varchar(255) NOT NULL, 
  login            varchar(50) NOT NULL, 
  hashowane_haslo  varchar(64) NOT NULL, 
  gmina            char(6) NOT NULL, 
  kod_pocztowy     char(6) NOT NULL, 
  miejscowość      varchar(35) NOT NULL, 
  nip              char(10) NOT NULL UNIQUE, 
  numer_mieszkania varchar(6) NOT NULL, 
  ulica            varchar(80) NOT NULL, 
  województwo      char(2) NOT NULL, 
  powiat           char(4) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE pracownicy (
  pk                int(11) NOT NULL AUTO_INCREMENT, 
  fk_stanowiska     int(11), 
  fk_umowy          int(11) NOT NULL UNIQUE, 
  fk_hurtownie      int(10) NOT NULL, 
  imię              varchar(50) NOT NULL, 
  nazwisko          varchar(50) NOT NULL, 
  miejscowość       varchar(35) NOT NULL, 
  ulica             varchar(80) NOT NULL, 
  pesel             char(11) NOT NULL UNIQUE, 
  numer_mieszkania  varchar(6) NOT NULL, 
  kod_pocztowy      char(6) NOT NULL, 
  nip               char(10) UNIQUE, 
  numer_telefonu    varchar(11) NOT NULL UNIQUE, 
  drugie_imię       varchar(50) NOT NULL, 
  nazwa_użytkownika varchar(50) NOT NULL, 
  hashowane_hasło   varchar(64) NOT NULL, 
  zatrudnienie      tinyint(1), 
  PRIMARY KEY (pk));
CREATE TABLE stanowiska (
  pk    int(11) NOT NULL AUTO_INCREMENT, 
  nazwa varchar(20) NOT NULL UNIQUE, 
  PRIMARY KEY (pk));
CREATE TABLE stanowiska_uprawnienia (
  pk             int(11) NOT NULL AUTO_INCREMENT, 
  fk_stanowiska  int(11) NOT NULL, 
  fk_uprawnienia int(11) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE uprawnienia (
  pk     int(11) NOT NULL AUTO_INCREMENT, 
  rodzaj varchar(100) NOT NULL UNIQUE, 
  PRIMARY KEY (pk));
CREATE TABLE umowy (
  pk     int(11) NOT NULL AUTO_INCREMENT, 
  rodzaj varchar(20) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE przesunięcia_magazynowe (
  pk                     int(11) NOT NULL AUTO_INCREMENT, 
  fk_hurtownia_źródłowa  int(10) NOT NULL, 
  fk_hurtownia_docelowa  int(10) NOT NULL, 
  fk_pracownik           int(11) NOT NULL, 
  data_zlecenia          timestamp NOT NULL, 
  data_realizacji        timestamp NULL, 
  data_odbioru_końcowego timestamp NULL, 
  PRIMARY KEY (pk));
CREATE TABLE towary_przesunięcia (
  pk                         int(11) NOT NULL AUTO_INCREMENT, 
  fk_przesunięcia_magazynowe int(11) NOT NULL, 
  fk_towary                  int(10) NOT NULL, 
  ilość                      int(11) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE faktury (
  pk                      int(11) NOT NULL AUTO_INCREMENT, 
  fk_pracownik            int(11) NOT NULL, 
  fk_sprzedaż             int(11) NOT NULL, 
  imię_nabywcy            varchar(255), 
  nazwisko_nabywcy        varchar(255), 
  numer_telefonu_nabywcy  varchar(11), 
  email_nabywcy           varchar(255), 
  stawka_vat              char(2) NOT NULL, 
  data_wystawienia        timestamp NOT NULL, 
  fk_dane_przedsiębiorstw int(10) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE listy_przewozowe (
  pk                         int(11) NOT NULL AUTO_INCREMENT, 
  fk_sprzedaż                int(11), 
  fk_dostawca                int(10) NOT NULL, 
  fk_przesunięcie_magazynowe int(11), 
  data_wystawienia           timestamp NOT NULL, 
  data_przyjęcia_do_przewozu timestamp NULL, 
  sposób_pakowania           varchar(255) NOT NULL, 
  waga                       decimal(10, 3) NOT NULL, 
  rodzaj_towaru              varchar(255) NOT NULL, 
  koszt_wysyłki_netto        decimal(19, 2) NOT NULL, 
  koszt_wysyłki_brutto       decimal(19, 2) NOT NULL, 
  PRIMARY KEY (pk));
CREATE TABLE kategorie (
  pk             int(11) NOT NULL AUTO_INCREMENT, 
  kategoria      varchar(30) NOT NULL UNIQUE, 
  id_pokategorii int(11) UNIQUE, 
  PRIMARY KEY (pk));
CREATE TABLE towary_kategorie (
  pk                  int(11) NOT NULL AUTO_INCREMENT, 
  id_towary           int(10) NOT NULL, 
  id_kategorie_towaru int(11) NOT NULL, 
  PRIMARY KEY (pk));
ALTER TABLE datki ADD CONSTRAINT fundacje_datki FOREIGN KEY (fk_fundacja) REFERENCES fundacje (pk);
ALTER TABLE datki ADD CONSTRAINT start_upy_datki FOREIGN KEY (fk_start_up) REFERENCES start_upy (pk);
ALTER TABLE towary_datki ADD CONSTRAINT FKtowary_dat174827 FOREIGN KEY (fk_datki) REFERENCES datki (pk);
ALTER TABLE towary_datki ADD CONSTRAINT towary_datki FOREIGN KEY (fk_towary) REFERENCES towary (pk);
ALTER TABLE towary_sprzedaże ADD CONSTRAINT towary_towary_sprzedaże FOREIGN KEY (fk_towary) REFERENCES towary (pk);
ALTER TABLE towary_sprzedaże ADD CONSTRAINT FKtowary_spr256522 FOREIGN KEY (fk_sprzedaże) REFERENCES sprzedaże (pk);
ALTER TABLE sprzedaże ADD CONSTRAINT płatności_sprzedaże FOREIGN KEY (fk_płatności) REFERENCES płatności (pk);
ALTER TABLE sprzedaże ADD CONSTRAINT punkty_sprzedaży_sprzedaże FOREIGN KEY (fk_punkt_sprzedaży) REFERENCES punkty_sprzedaży (pk);
ALTER TABLE punkty_sprzedaży ADD CONSTRAINT dane_przedsiębiorstw_punkty_sprzedaży FOREIGN KEY (fk_dane_przedsiębiorstw) REFERENCES dane_przedsiębiorstw (pk);
ALTER TABLE stany_magazynowe ADD CONSTRAINT hurtownie_towary_stany_magazynowe FOREIGN KEY (fk_hurtownie) REFERENCES hurtownie (pk);
ALTER TABLE stany_magazynowe ADD CONSTRAINT towary_stany_magazynowe FOREIGN KEY (fk_towary) REFERENCES towary (pk);
ALTER TABLE zamówienia ADD CONSTRAINT hurtownie_zamówienia FOREIGN KEY (fk_hurtownie) REFERENCES hurtownie (pk);
ALTER TABLE zamówienia_towary ADD CONSTRAINT zamówienia_towary_sprzedaże FOREIGN KEY (fk_zamówienia) REFERENCES zamówienia (pk);
ALTER TABLE zamówienia ADD CONSTRAINT dostawcy_zamówienia FOREIGN KEY (fk_dostawcy) REFERENCES dostawcy (pk);
ALTER TABLE pracownicy ADD CONSTRAINT stanowiska_pracownicy FOREIGN KEY (fk_stanowiska) REFERENCES stanowiska (pk);
ALTER TABLE stanowiska_uprawnienia ADD CONSTRAINT stanowiska_stanowiska_uprawnienia FOREIGN KEY (fk_stanowiska) REFERENCES stanowiska (pk);
ALTER TABLE stanowiska_uprawnienia ADD CONSTRAINT uprawnienia_stanowiska_uprawnienia FOREIGN KEY (fk_uprawnienia) REFERENCES uprawnienia (pk);
ALTER TABLE pracownicy ADD CONSTRAINT pracownicy_umowy FOREIGN KEY (fk_umowy) REFERENCES umowy (pk);
ALTER TABLE pracownicy ADD CONSTRAINT hurtownie_pracownicy FOREIGN KEY (fk_hurtownie) REFERENCES hurtownie (pk);
ALTER TABLE zamówienia ADD CONSTRAINT pracownicy_zamówienia FOREIGN KEY (fk_pracownicy) REFERENCES pracownicy (pk);
ALTER TABLE przesunięcia_magazynowe ADD CONSTRAINT hurtownie_przesunięcie_magazynowe_d FOREIGN KEY (fk_hurtownia_źródłowa) REFERENCES hurtownie (pk);
ALTER TABLE przesunięcia_magazynowe ADD CONSTRAINT hurtownie_przesunięcie_magazynowe_ź FOREIGN KEY (fk_hurtownia_docelowa) REFERENCES hurtownie (pk);
ALTER TABLE przesunięcia_magazynowe ADD CONSTRAINT prawcownicy_przesunięcia_magazynowe FOREIGN KEY (fk_pracownik) REFERENCES pracownicy (pk);
ALTER TABLE towary_przesunięcia ADD CONSTRAINT przesunięcia_magazynowe_towary_przesunięcia FOREIGN KEY (fk_przesunięcia_magazynowe) REFERENCES przesunięcia_magazynowe (pk);
ALTER TABLE towary_przesunięcia ADD CONSTRAINT towary_towary_przesunięcia FOREIGN KEY (fk_towary) REFERENCES towary (pk);
ALTER TABLE faktury ADD CONSTRAINT pracownicy_faktury FOREIGN KEY (fk_pracownik) REFERENCES pracownicy (pk);
ALTER TABLE faktury ADD CONSTRAINT sprzedaże_faktury FOREIGN KEY (fk_sprzedaż) REFERENCES sprzedaże (pk);
ALTER TABLE listy_przewozowe ADD CONSTRAINT sprzedaże_listy_przewozowe FOREIGN KEY (fk_sprzedaż) REFERENCES sprzedaże (pk);
ALTER TABLE listy_przewozowe ADD CONSTRAINT dostawcy_faktury FOREIGN KEY (fk_dostawca) REFERENCES dostawcy (pk);
ALTER TABLE listy_przewozowe ADD CONSTRAINT przesunięcia_magazynowe_listy_przewozowe FOREIGN KEY (fk_przesunięcie_magazynowe) REFERENCES przesunięcia_magazynowe (pk);
ALTER TABLE kategorie ADD CONSTRAINT kategorie_kategorie FOREIGN KEY (id_pokategorii) REFERENCES kategorie (pk);
ALTER TABLE towary_kategorie ADD CONSTRAINT towary_towary_kategorie FOREIGN KEY (id_towary) REFERENCES towary (pk);
ALTER TABLE towary_kategorie ADD CONSTRAINT kategorie_towary_kategorie FOREIGN KEY (id_kategorie_towaru) REFERENCES kategorie (pk);
ALTER TABLE zamówienia_towary ADD CONSTRAINT zamówienia_towary_towary FOREIGN KEY (towarypk) REFERENCES towary (pk);
ALTER TABLE faktury ADD CONSTRAINT dane_przedsiębiorstw FOREIGN KEY (fk_dane_przedsiębiorstw) REFERENCES dane_przedsiębiorstw (pk);
