CREATE TABLE datki (
  pk          SERIAL NOT NULL, 
  fk_fundacja int4, 
  fk_start_up int4, 
  forma       bool NOT NULL, 
  kwota       numeric(19, 2));
CREATE TABLE start_upy (
  pk               SERIAL NOT NULL, 
  nazwa            varchar(255) NOT NULL UNIQUE, 
  email            varchar(255) NOT NULL UNIQUE, 
  gmina            varchar(30) NOT NULL, 
  kod_pocztowy     varchar(30) NOT NULL, 
  miejscowosc      varchar(35) NOT NULL, 
  nip              varchar(13) UNIQUE, 
  numer_mieszkania varchar(6) NOT NULL, 
  numer_telefonu   varchar(11) NOT NULL, 
  powiat           char(4) NOT NULL, 
  regon            varchar(14) NOT NULL UNIQUE, 
  ulica            varchar(80) NOT NULL, 
  wojewodztwo      varchar(20) NOT NULL);
CREATE TABLE fundacje (
  pk               SERIAL NOT NULL, 
  email            varchar(255) NOT NULL UNIQUE, 
  gmina            varchar(30) NOT NULL, 
  kod_pocztowy     char(6) NOT NULL, 
  miejscowosc      varchar(35) NOT NULL, 
  nazwa            varchar(255) NOT NULL UNIQUE, 
  nip              varchar(13) NOT NULL UNIQUE, 
  numer_mieszkania varchar(6) NOT NULL, 
  numer_telefonu   varchar(11) NOT NULL, 
  powiat           varchar(30) NOT NULL, 
  regon            varchar(14) NOT NULL UNIQUE, 
  ulica            varchar(80) NOT NULL, 
  wojewodztwo      varchar(20) NOT NULL);
CREATE TABLE towary (
  pk               SERIAL NOT NULL, 
  nazwa            varchar(255) NOT NULL, 
  kod_producenta   varchar(20) NOT NULL, 
  opis             varchar(1000) NOT NULL, 
  dostepnosc       bool NOT NULL, 
  cena_jedn_netto  numeric(19, 2) NOT NULL, 
  cena_jedn_brutto numeric(19, 2) NOT NULL, 
  stawka_vat       numeric(3, 2) NOT NULL, 
  status           bool NOT NULL);
CREATE TABLE towary_datki (
  pk        SERIAL NOT NULL, 
  fk_datki  int4 NOT NULL, 
  fk_towary int4 NOT NULL, 
  ilosc     int4 NOT NULL);
CREATE TABLE sprzedaze (
  pk                           SERIAL NOT NULL, 
  fk_platnosci                 int4 NOT NULL, 
  fk_punkt_sprzedazy           int4 NOT NULL, 
  data_zlecenia_sprzedazy      timestamp NOT NULL, 
  data_zaksiegowania_platnosci timestamp, 
  cena_sum_netto               numeric(19, 2) NOT NULL, 
  cena_sum_brutto              numeric(19, 2) NOT NULL, 
  rabat                        numeric(2, 2) NOT NULL);
CREATE TABLE towary_sprzedaze (
  pk           SERIAL NOT NULL, 
  fk_towary    int4 NOT NULL, 
  fk_sprzedaze int4 NOT NULL, 
  ilosc        int4 NOT NULL);
CREATE TABLE platnosci (
  pk               SERIAL NOT NULL, 
  rodzaj_platnosci varchar(255) NOT NULL UNIQUE);
CREATE TABLE punkty_sprzedazy (
  pk                      SERIAL NOT NULL, 
  fk_dane_przedsiebiorstw int4 NOT NULL, 
  wojewodztwo             varchar(20) NOT NULL, 
  powiat                  varchar(30) NOT NULL, 
  gmina                   varchar(30) NOT NULL, 
  kod_pocztowy            char(6) NOT NULL, 
  miejscowosc             varchar(35) NOT NULL, 
  ulica                   varchar(80) NOT NULL, 
  numer_mieszkania        varchar(6) NOT NULL, 
  numer_telefonu          varchar(11) NOT NULL, 
  email                   varchar(255) NOT NULL, 
  status                  bool NOT NULL);
CREATE TABLE dane_przedsiebiorstw (
  pk                     SERIAL NOT NULL, 
  wojewodztwo            varchar(20) NOT NULL, 
  powiat                 char(4) NOT NULL, 
  gmina                  varchar(30) NOT NULL, 
  kod_pocztowy           varchar(30) NOT NULL, 
  miejscowosc            varchar(35) NOT NULL, 
  ulica                  varchar(80) NOT NULL, 
  numer_mieszkania       varchar(6) NOT NULL, 
  nazwa_przedsiebiorstwa varchar(255) NOT NULL UNIQUE, 
  nip                    varchar(13) NOT NULL UNIQUE, 
  regon                  varchar(14) NOT NULL UNIQUE, 
  numer_telefonu         varchar(11) NOT NULL, 
  email                  varchar(255) NOT NULL UNIQUE);
CREATE TABLE hurtownie (
  pk               SERIAL NOT NULL, 
  kod_hurtowni     char(6) NOT NULL UNIQUE, 
  gmina            varchar(30) NOT NULL, 
  kod_pocztowy     char(6) NOT NULL, 
  miejscowosc      varchar(35) NOT NULL, 
  numer_mieszkania varchar(6) NOT NULL, 
  powiat           varchar(30) NOT NULL, 
  ulica            varchar(80) NOT NULL, 
  wojewodztwo      varchar(20) NOT NULL, 
  status           int2 NOT NULL);
CREATE TABLE stany_magazynowe (
  pk           SERIAL NOT NULL, 
  fk_hurtownie int4 NOT NULL, 
  fk_towary    int4 NOT NULL, 
  ilosc        int4 NOT NULL);
CREATE TABLE zamowienia (
  pk              SERIAL NOT NULL, 
  fk_hurtownie    int4 NOT NULL, 
  fk_dostawcy     int4 NOT NULL, 
  fk_pracownicy   int4 NOT NULL, 
  data_zlecenia   timestamp NOT NULL, 
  data_odbioru    timestamp, 
  cena_sum_netto  numeric(19, 2) NOT NULL, 
  cena_sum_brutto numeric(19, 2) NOT NULL);
CREATE TABLE zamowienia_towary (
  pk               SERIAL NOT NULL, 
  fk_zamowienia    int4 NOT NULL, 
  cena_jedn_netto  numeric(19, 2) NOT NULL, 
  cena_jedn_brutto numeric(19, 2) NOT NULL, 
  ilosc            int4 NOT NULL, 
  tk_towary        int4 NOT NULL);
CREATE TABLE dostawcy (
  pk               SERIAL NOT NULL, 
  nazwa            varchar(255) NOT NULL, 
  login            varchar(50) NOT NULL, 
  hashowane_haslo  varchar(64) NOT NULL, 
  gmina            varchar(30) NOT NULL, 
  kod_pocztowy     char(6) NOT NULL, 
  miejscowosc      varchar(35) NOT NULL, 
  nip              varchar(13) NOT NULL UNIQUE, 
  numer_mieszkania varchar(6) NOT NULL, 
  ulica            varchar(80) NOT NULL, 
  wojewodztwo      varchar(20) NOT NULL, 
  powiat           varchar(30) NOT NULL);
CREATE TABLE pracownicy (
  pk                SERIAL NOT NULL, 
  fk_stanowiska     int4, 
  fk_umowy          int4 NOT NULL UNIQUE, 
  fk_hurtownie      int4 NOT NULL, 
  imie              varchar(50) NOT NULL, 
  nazwisko          varchar(50) NOT NULL, 
  miejscowosc       varchar(35) NOT NULL, 
  ulica             varchar(80) NOT NULL, 
  pesel             char(11) NOT NULL UNIQUE, 
  numer_mieszkania  varchar(6) NOT NULL, 
  kod_pocztowy      char(6) NOT NULL, 
  nip               varchar(13) UNIQUE, 
  numer_telefonu    varchar(11) NOT NULL UNIQUE, 
  drugie_imie       varchar(50) NOT NULL, 
  nazwa_uzytkownika varchar(50) NOT NULL, 
  hashowane_hasło   varchar(64) NOT NULL, 
  zatrudnienie      bool);
CREATE TABLE stanowiska (
  pk    SERIAL NOT NULL, 
  nazwa varchar(30) NOT NULL UNIQUE);
CREATE TABLE stanowiska_uprawnienia (
  pk             SERIAL NOT NULL, 
  fk_stanowiska  int4 NOT NULL, 
  fk_uprawnienia int4 NOT NULL);
CREATE TABLE uprawnienia (
  pk     SERIAL NOT NULL, 
  rodzaj varchar(100) NOT NULL UNIQUE);
CREATE TABLE umowy (
  pk     SERIAL NOT NULL, 
  rodzaj varchar(20) NOT NULL);
CREATE TABLE przesuniecia_magazynowe (
  pk                     SERIAL NOT NULL, 
  fk_hurtownia_zrodłowa  int4 NOT NULL, 
  fk_hurtownia_docelowa  int4 NOT NULL, 
  fk_pracownik           int4 NOT NULL, 
  data_zlecenia          timestamp NOT NULL, 
  data_realizacji        timestamp, 
  data_odbioru_koncowego timestamp);
CREATE TABLE towary_przesuniecia (
  pk                         SERIAL NOT NULL, 
  fk_przesuniecia_magazynowe int4 NOT NULL, 
  fk_towary                  int4 NOT NULL, 
  ilosc                      int4 NOT NULL);
CREATE TABLE faktury (
  pk                      SERIAL NOT NULL, 
  fk_pracownik            int4 NOT NULL, 
  fk_sprzedaz             int4 NOT NULL, 
  imie_nabywcy            varchar(255), 
  nazwisko_nabywcy        varchar(255), 
  numer_telefonu_nabywcy  varchar(11), 
  email_nabywcy           varchar(255), 
  stawka_vat              numeric(3, 2) NOT NULL, 
  data_wystawienia        timestamp NOT NULL, 
  fk_dane_przedsiebiorstw int4 NOT NULL);
CREATE TABLE listy_przewozowe (
  pk                         SERIAL NOT NULL, 
  fk_sprzedaz                int4, 
  fk_dostawca                int4 NOT NULL, 
  fk_przesuniecie_magazynowe int4, 
  data_wystawienia           timestamp NOT NULL, 
  data_przyjecia_do_przewozu timestamp, 
  sposob_pakowania           varchar(255) NOT NULL, 
  waga                       numeric(10, 3) NOT NULL, 
  rodzaj_towaru              varchar(255) NOT NULL, 
  koszt_wysylki_netto        numeric(19, 2) NOT NULL, 
  koszt_wysylki_brutto       numeric(19, 2) NOT NULL);
CREATE TABLE kategorie (
  pk              SERIAL NOT NULL, 
  kategoria       varchar(50) NOT NULL UNIQUE, 
  fk_podkategorii int4 UNIQUE);
CREATE TABLE towary_kategorie (
  pk                  SERIAL NOT NULL, 
  fk_towary           int4 NOT NULL, 
  fk_kategorie_towaru int4 NOT NULL);
