# STMVendorerDatabaseProject

## Opis organizacji pracy w firmie:

<i>
Głównym celem przedsiębiorstwa jest dystrybucja i magazynowanie sprzętu w Polsce od światowego producenta STMicroelectronics układów scalonych. Producent oferuje bogaty asortyment, który jest ściągany w dużych zamówieniach zza granicy i jest odbierany w głównej hurtowni w Polsce. Każde przyjęcie towaru musi być wraz z listem przewozowym, fakturą. Każda dostawa musi być odebrana przez uprawnionego do tego pracownika, pracownicy autoryzują swoje zadania przy użyciu karty elektronicznej, która jest wydawana przez dział informatyczny firmy. Każda z tych kart stanowi elektroniczną autoryzację pracownika i nadaje mu odpowiednie uprawnienia w zależności od jego stanowiska. Każdy pracownik ma podpisaną umowę ze spółką, która jest archiwizowana. Firma może zatrudniać różnych pracowników na różnych rodzajach umowy. Dla każdego pracownika jest przewidziana indywidualna stawka wynagrodzenia. 

Firma prowadzi jedynie sprzedaż hurtową do poddystrybutorów, których dane są archiwizowane. Sprzedaż jest udokumentowana w postaci faktury sprzedaży. Ilość produktów ulokowanych/odsprzedanych do pomniejszych punktów sprzedaży jest monitorowana. Każda sprzedaż zawiera również informację o formie płatności. Dla poszczególnej sprzedaży przewidziany jest możliwy rabat.

Zamawiany sprzęt to głównie układy scalone różnego przeznaczenia oraz elementy pasywne, są one księgowane według różnych kategorii. Towar ten jest ulokowany albo w magazynach, albo w punktach sprzedaży, bądź jest to towar, który został dopiero zamówiony i jest oczekiwany na dostarczenie. Towar może być dostarczany przez róźnych przewoźników.Firma w Polsce może mieć wiele hurtownii, oraz pomiędzy hurtowniami może być przemieszczany asortyment. Dokument przesunięcia magazynowego jest automatycznie generowany przy każdej transakcji między hurtowniami.

Firma może przekazywać datki na fundacje, której dane są również księgowane, oraz może sponsorować Start-up'y w formie sprzętu bądź pieniężnie.</i>

## 1. Wyłonienie tabel

### Podstawowe tabele:
* punkty sprzedaży/dystrybucji
* dostawcy
* hurtownia asortymentu
* płatności
* sprzedaże
* towary
* przesunięcia magazynowe
* rodzaje towarów
* umowy
* rodzaje umowy(enum)
* zamówienia
* listy przewozowe
* faktury
* fundacje
* start up'y
* stanowiska
* uprawnienia
* datki
* dane przedsiębiorstw

### Użytkowicy:
* pracownicy

### Tabele pośredniczące (powstałe w wyniku rozbicia relacji typu m:n na relacje 1:n):
* stan magazynowy
* towary_Sprzedaż
* towary_Rodzaje
* towary_Datki
* towary_Zamówienie
* przesunięcie_Towary
* uprawnienia_Stanowiska

## 2. Opisy tabel

<table>
    <tr>
        <th>Nazwa tabeli</th>
        <th>Typ</th>
        <th>Opis</th>
    </tr>
    <tr>
        <td>Kategorie towarów</td>
        <td>Podzbiór</td>
        <td>Informacje o możliwych dostępnych kategoriach towaru</td>
    </tr>    
    <tr>
        <td>Punkty sprzedaży/dystrybucji</td>
        <td>Dane</td>
        <td>Informacje o fizycznej lokalizacji konkretnego punktu sprzedaży/poddystrybutora.</td>
    </tr>
    <tr>
        <td>Dostawcy</td>
        <td>Dane</td>
        <td>Są to podstawowe dane firmy przewozowej oraz dane doradcy biznesowego od danego dostawcy</td>
    </tr>
    <tr>
        <td>Hurtownie</td>
        <td>Dane</td>
        <td>Wszystkie dane, które dotyczą lokalizacji danej hurtowani, dane kontaktowe oraz oznaczenia i kody identyfikujące jednoznacznie hurtownie oraz data rozpoczęcia operowania.</td>
    </tr>
    <tr>
        <td>Płatności</td>
        <td>Podzbiór</td>
        <td>Informacje o nazwie rodzaju płatności i dodatkowe dane niezbędne do realizacji daną metodą płatności</td>
    </tr>
    <tr>
        <td>Sprzedaże</td>
        <td>Dane</td>
        <td>Są to wszystkie informacje dotyczące poszczególnej sprzedaży hurtowej, czyli jaki towar, w jakiej ilości, z jakiej hurtowni, w jakiej cenie do jakiego punktu sprzedaży</td>
    </tr>
    <tr>
        <td>Towary</td>
        <td>Dane</td>
        <td>Wszystkie dane identyfikujące towar dostępny w dowolnej hurtowni np.: nazwa, opis, do jakiej kategorii należy, cena jednostkowa, powiązane pliki z dokumentacją</td>
    </tr>
    <tr>
        <td>Przesunięcia magazynowe</td>
        <td>Dane</td>
        <td>Są to informacje niezbędne do określenia skąd, dokąd jaki towar, w jakiej ilości, został nadany i był odebrany przez dane hurtownie</td>
    </tr>
    <tr>
        <td>Zamówienia</td>
        <td>Dane</td>
        <td>Informacja o konkretnych zamówieniach, uzupełniających stan magazynowy hurtowni</td>
    </tr>
    <tr>
        <td>Listy przewozowe</td>
        <td>Dane</td>
        <td>Ściągnięte wszystkie dane istotne do wygenerowania listu przewozowego</td>
    </tr>
    <tr>
        <td>Faktury</td>
        <td>Dane</td>
        <td>Ściągnięte wszystkie dane istotne do wygenerowania faktury</td>
    </tr>
    <tr>
        <td>Fundacje</td>
        <td>Dane</td>
        <td>Informacje fundacji, adres siedziby, dane kontaktowe, NIP, REGON KRS, STATUS OPP</td>
    </tr>
    <tr>
        <td>Start up'y</td>
        <td>Dane</td>
        <td>Informacje o organizacjach, które są sponsorowane przez firmę</td>
    </tr>
    <tr>
        <td>Stanowiska</td>
        <td>Pozbiór</td>
        <td>Informacje o wszelkich możliwych stanowiskach pracy w firmie</td>
    </tr>
    <tr>
        <td>Uprawnienia</td>
        <td>Podzbiór</td>
        <td>Spis uprawnień uznawanych przez firmę i jej regulamin, uprawnienia są ściśle związane z rodzajem stanowiska</td>
    </tr>
    <tr>
        <td>Datki</td>
        <td>Dane</td>
        <td>Informacja o tym w jakiej formie są przeznaczone datki na rzecz fundacji, bądź start up'u</td>
    </tr>
    <tr>
        <td>Dane przedsiębiorstw</td>
        <td>Dane</td>
        <td>Informacje o firmach kupujących towar z hurtowni</td>
    </tr>
    <tr>
        <td>Pracownicy</td>
        <td>Dane</td>
        <td>Informacje o pracowniku, wszelkie dane osobowe</td>
    </tr>
    <tr>
        <td>Umowy</td>
        <td>Dane</td>
        <td>Tabela przechowujące kopie każdej umowy nawiązanych miedzy firmą a pracownikami</td>
    </tr>
    <tr>
        <td>Hurtownie_Towary</td>
        <td>Łącząca</td>
        <td>Informacja o aktualnym stanie magazynowym danych(ilości) towarów oraz ich miejscu magazynowania</td>
    </tr>
    <tr>
        <td>Towary_Sprzedaż</td>
        <td>Łącząca</td>
        <td>Wskazanie jakie towary w jakiej ilości były powiązne z daną sprzedażą przy jakiej cenie jednostkowej</td>
    </tr>
    <tr>
        <td>Towary_Kategorie</td>
        <td>Łącząca</td>
        <td>Wskazanie jaki towar z hurtowni, z jaką kategorią jest powiązany</td>
    </tr>
    <tr>
        <td>Towary_Zamówienie</td>
        <td>Łącząca</td>
        <td>Informacja jakie towary, w jakiej ilości i przy jakiej cenie jednostkowej zakupu od producenta zostały zamówione</td>
    </tr>
    <tr>
        <td>Przesunięcie_Towary</td>
        <td>Łącząca</td>
        <td>Określenie jakie towary w jakiej ilości zostały zlecone do przetransportowania </td>
    </tr>
    <tr>
        <td>Uprawnienia_Stanowiska</td>
        <td>Łącząca</td>
        <td>Wskazanie powiązań, jakie uprawnienią są związane z danym stanowiskiem</td>
    </tr>
</table>

<table>
    <tr>
        <th>Nazwa typu enumerycznego</th>
        <th>Opis</th>
    </tr> 
    <tr>
        <td>Rodzaje umowy</td>
        <td>Możliwe formy umowy jakie może nawiązać firma</td>
    </tr>
</table>

## 4. Wyłonienie pól poszczególnych tabel

<table>
    <tr>
        <th>nazwa pola</th>
        <th>typ pola</th>
        <th>czy pole jest wymagane</th>
        <th>czy jest unikatowa</th>
        <th>opis</th>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">kategorie</th>
    </tr>
    <tr>
        <td>id_kategorii</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator kategorii towaru</td>
    </tr>
    <tr>
        <td>kategoria</td>
        <td>znakowe(30 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg określający kategorię towaru</td>
    </tr>
    <tr>
        <td>id_podkategorii</td>
        <td>całkowite</td>
        <td>nie</td>
        <td>tak</td>
        <td>ciąg określający podkategorię towaru</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">punkty_sprzedaży</th>
    </tr>
    <tr>
        <td>id_punktu_sprzedaży</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator punktu sprzedaży</td>
    </tr>
    <tr>
        <td>id_przedsiębiorcy</td>
        <td>całkowity</td>
        <td>nie</td>
        <td>nie</td>
        <td>identyfikator przedsiębiorcy</td>
    </tr>
    <tr>
        <td>ulica</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę ulicy</td>
    </tr>
    <tr>
        <td>numer_mieszkania</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer mieszkania</td>
    </tr>
    <tr>
        <td>województwo</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, o długości 20</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(4)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, o długości 30</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, o długości 30</td>
    </tr>
    <tr>
        <td>numer_telefonu</td>
        <td>znakowe(16)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer telefonu</td>
    </tr>
    <tr>
        <td>kod_pocztowy</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg 6 znaków określający kod pocztowy miejscowości</td>
    </tr>
    <tr>
        <td>miejscowość</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający miejscowość</td>
    </tr>
    <tr>
        <td>email</td>
        <td>znakowe(255 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający email</td>
    </tr>
    <tr>
        <td>status</td>
        <td>bool'owski</td>
        <td>tak</td>
        <td>nie</td>
        <td>zmienna określająca czy punkt sprzedaży dalej istnieje, tak czy nie</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">dostawcy</th>
    </tr>
    <tr>
        <td>id_dostawcy</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator dostawcy</td>
    </tr>
    <tr>
        <td>nazwa</td>
        <td>znakowe(255 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę dostawcy</td>
    </tr>
    <tr>
        <td>ulica</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę ulicy</td>
    </tr>
    <tr>
        <td>numer_mieszkania</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer mieszkania</td>
    </tr>
    <tr>
        <td>województwo</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, o długości 20</td>
    </tr>
    <tr>
        <td>kod_pocztowy</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg 6 znaków określający kod pocztowy</td>
    </tr>
    <tr>
        <td>miejscowość</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający miejscowość</td>
    </tr>
    <tr>
        <td>nip</td>
        <td>całkowity(13)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg cyfr określający numer identyfikacyjny podatnika o długości 10</td>
    </tr>
    <tr>
        <td>miejscowość</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający miejscowość</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, o długości 30</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, o długości 30</td>
    </tr>
    <tr>
        <td>login</td>
        <td>znakowe(50 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający login</td>
    </tr>
    <tr>
        <td>haszowane_hasło</td>
        <td>znakowe(64)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający haszowane hasło, o długości 64</td>
    </tr>
     <tr>
        <th style="text-align: center;" colspan="5">hurtownie</th>
    </tr>
    <tr>
        <td>id_hurtowni</td>
        <td>całkowite</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator hurtownii</td>
    </tr>
    <tr>
        <td>kod_hurtowni</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znakowy określający hurtownię</td>
    </tr>
    <tr>
        <td>ulica</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę ulicy</td>
    </tr>
    <tr>
        <td>numer_mieszkania</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer mieszkania</td>
    </tr>
    <tr>
        <td>województwo</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, o długości 20</td>
    </tr>
    <tr>
        <td>kod_pocztowy</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający kod pocztowy</td>
    </tr>
    <tr>
        <td>miejscowość</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający miejscowość</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, o długości 30</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, o długości 30</td>
    </tr>
    <tr>
        <td>status</td>
        <td>bool'owski</td>
        <td>tak</td>
        <td>nie</td>
        <td>zmienna określająca czy hurtownia dalej istnieje</td>
    </tr>
     <tr>
        <th style="text-align: center;" colspan="5">płatności</th>
    </tr>
    <tr>
        <td>id_płatności</td>
        <td>całkowite</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator płatności</td>
    </tr>
    <tr>
        <td>rodzaj_płatności</td>
        <td>znakowe(255 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znakowy określający rodzaj płatności</td>
    </tr>
    <tr>
        <td>dostępność</td>
        <td>bool'owski</td>
        <td>tak</td>
        <td>nie</td>
        <td>zmienna określająca czy dany rodzaj płatności jest dalej możliwy</td>
    </tr>
     <tr>
        <th style="text-align: center;" colspan="5">sprzedaże</th>
    </tr>
    <tr>
        <td>id_sprzedaży</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator sprzedaży</td>
    </tr>
    <tr>
        <td>id_płatności</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator płatności</td>
    </tr>
    <tr>
        <td>id_punktu_sprzedaży</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator punktu sprzedaży</td>
    </tr>
    <tr>
        <td>data_zlecenia_sprzedaży</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data wystawienia zlecenia sprzedaży</td>
    </tr>
    <tr>
        <td>data_zaksięgowania_płatności</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data zaksięgowowania płatności</td>
    </tr>
    <tr>
        <td>rabat</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca wielkość rabatu</td>
    </tr>
    <tr>
        <td>cena_sum_netto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca cenę sumaryczną netto</td>
    </tr>
    <tr>
        <td>cena_sum_brutto</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca cenę sumaryczną brutto</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">towary</th>
    </tr>
    <tr>
        <td>id_towaru</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator towaru</td>
    </tr>
    <tr>
        <td>nazwa</td>
        <td>znakowy(255 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę towaru</td>
    </tr>
    <tr>
        <td>kod_producenta</td>
        <td>znakowe(10 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znakowy określający kod producenta</td>
    </tr>
    <tr>
        <td>opis</td>
        <td>znakowe(1000 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający cechy, opinie o towarze</td>
    </tr>
    <tr>
        <td>dostępność</td>
        <td>boolowski</td>
        <td>tak</td>
        <td>nie</td>
        <td>wskazuje na dostępność towaru, tak bądź nie</td>
    </tr>
    <tr>
        <td>cena_jedn_netto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca wartość ceny pojedyńczego produktu netto</td>
    </tr>
    <tr>
        <td>cena_jedn_brutto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca wartość ceny pojedyńczego produktu brutto</td>
    </tr>
    <tr>
        <td>stawka_vat</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca wielkość stawki vat'u</td>
    </tr>
    <tr>
        <td>status</td>
        <td>bool'owski</td>
        <td>tak</td>
        <td>nie</td>
        <td>zmienna określająca czy towar jest dalej sprzedowany, tak czy nie</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">przesunięcia_magazynowe</th>
    </tr>
    <tr>
        <td>id_przesunięcia_magazynowego</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator przesunięcia magazynowego</td>
    </tr>
    <tr>
        <td>id_pracownik</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator pracownika</td>
    </tr>
    <tr>
        <td>data_zlecenia</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data wystawiwenia zlecenia</td>
    </tr>
    <tr>
        <td>data_realizacji</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data realizacji zlecenia</td>
    </tr>
    <tr>
        <td>data_odbioru_końcowego</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data odbioru przesunięcia towarowego</td>
    </tr>
    <tr>
        <td>id_hurtownia_źródłowa</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator hurtowni, z której przesuwamy towar</td>
    </tr>
    <tr>
        <td>id_hurtownia_docelowa</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator hurtowni, do której przesuwamy towar</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">zamówienia</th>
    </tr>
    <tr>
        <td>id_zamówienia</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfiaktor zamówienia</td>
    </tr>
    <tr>
        <td>id_dostawcy</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator dostawcy</td>
    </tr>
    <tr>
        <td>id_hurtownie</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator hurtowni</td>
    </tr>
    <tr>
        <td>id_pracownicy</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator pracownika</td>
    </tr>
    <tr>
        <td>data_zlecenia</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data wystawienia zlecenia</td>
    </tr>
    <tr>
        <td>data_odbioru</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data odbioru zamówienia</td>
    </tr>
    <tr>
        <td>cena_jedn_netto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca wartość ceny pojedyńczego produktu netto</td>
    </tr>
    <tr>
        <td>cena_jedn_brutto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca wartość ceny pojedyńczego produktu brutto</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">listy_przewozowe</th>
    </tr>
    <tr>
        <td>id_listu_przewozowego</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator listu przewozowego</td>
    </tr>
    <tr>
        <td>id_sprzedaż</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator sprzedaży</td>
    </tr>
    <tr>
        <td>id_dostawca</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator dostawcy</td>
    </tr>
    <tr>
        <td>id_przesunięcie_magazynowe</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfiaktor przesunięcia magazynowego</td>
    </tr>
    <tr>
        <td>data_wystawienia</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data wystawienia listu przewozowego</td>
    </tr>
    <tr>
        <td>data_przyjęcia_do_przewozu</td>
        <td>timestamp</td>
        <td>nie</td>
        <td>nie</td>
        <td>data przyjęcia towaru do przewozu</td>
    </tr>
    <tr>
        <td>sposób pakowania</td>
        <td>enumeryczny</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający sposób zapokowania towaru</td>
    </tr>
    <tr>
        <td>waga_kg</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca wagę towaru</td>
    </tr>
    <tr>
        <td>rodzaj_towaru</td>
        <td>znakowe(255 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający rodzaj towaru</td>
    </tr>
    <tr>
        <td>koszt_wysyłki_netto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca koszt wysyłki netto</td>
    </tr>
    <tr>
        <td>koszt_wysyłki_brutto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca koszt wysyłki brutto</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">faktury</th>
    </tr>
    <tr>
        <td>id_faktury</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator faktury</td>
    </tr>
    <tr>
        <td>id_pracownik</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator pracownika</td>
    </tr>
    <tr>
        <td>id_sprzedaż</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator sprzedaży</td>
    </tr>
    <tr>
        <td>id_dane_przedsiębiorstw</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator danego przedsiębiorstwa</td>
    </tr>
    <tr>
        <td>imię_nabywcy</td>
        <td>znakowy(255 max)</td>
        <td>nie</td>
        <td>nie</td>
        <td>ciąg znakowy określający imię nabywcy</td>
    </tr>
    <tr>
        <td>nazwisko_nabywcy</td>
        <td>znakowy(255 max)</td>
        <td>nie</td>
        <td>nie</td>_
        <td>ciąg znakowy określający nazwisko nabywcy</td>
    </tr>
    <tr>
        <td>numer_telefonu_nabywcy</td>
        <td>znakowy(16)</td>
        <td>nie</td>
        <td>nie</td>
        <td>ciąg znaków określający numer telefonu nabywcy</td>
    </tr>
    <tr>
        <td>email_nabywcy</td>
        <td>znakowe(255 max)</td>
        <td>nie</td>
        <td>nie</td>
        <td>ciąg znakowy określający email nabywcy</td>
    </tr>
    <tr>
        <td>id_pracownik</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfiaktor pracownika</td>
    </tr>
    <tr>
        <td>id_sprzedaż</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator sprzedaży</td>
    </tr>
    <tr>
        <td>stawka_vat</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca wielkość stawki vat'u</td>
    </tr>
    <tr>
        <td>data_wystawienia</td>
        <td>timestamp</td>
        <td>tak</td>
        <td>nie</td>
        <td>data wystawienia faktury</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">fundacje</th>
    </tr>
    <tr>
        <td>id_fundacji</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator fundacji</td>
    </tr>
     <tr>
        <td>ulica</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę ulicy, na której znajduje się fundacja</td>
    </tr>
    <tr>
        <td>numer_mieszkania</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer mieszknia fundacji</td>
    </tr>
    <tr>
        <td>województwo</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, w którym znajduje się fundacja, o długości 20</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(4)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, na którym znajduje się fundacja, o długości 4</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, na którym znajduje się fundacja, o długości 30</td>
    </tr>
    <tr>
        <td>kod_pocztowy</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg 30 znaków określający kod pocztowy miejscowości, w której znajduje się fundacja</td>
    </tr>
    <tr>
        <td>miejscowość</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający miejscowość, na której znajduje się fundacja</td>
    </tr>
    <tr>
        <td>nazwa</td>
        <td>znakowy(255 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znakowy określający nazwę fundacji</td>
    </tr>
    <tr>
        <td>numer_telefonu</td>
        <td>znakowy(16)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający numer telefon fundacji</td>
    </tr>
    <tr>
        <td>email</td>
        <td>znakowy(255 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znakowy określający email fundacji</td>
    </tr>
    <tr>
        <td>nip</td>
        <td>całkowity(13)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciag cyfr określający numer identyfikacyjny podatnika o długości 10, fundacji </td>
    </tr>
    <tr>
        <td>regon</td>
        <td>całkowity(14 lub 9)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg cyfr określający numer regon fundacji, o długości 9 bądź 14</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">start_up</th>
    </tr>
    <tr>
        <td>id_start_up</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator start up'u</td>
    </tr>
     <tr>
        <td>ulica</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę ulicy, na ktorej znajduje się start up</td>
    </tr>
    <tr>
        <td>numer_mieszkania</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer mieszkania start up'u</td>
    </tr>
    <tr>
        <td>kod_pocztowy</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający kod pocztowy miejscowości, w której znajduje się start up</td>
    </tr>
    <tr>
        <td>miejscowość</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający miejscowość, w której znajduje się start up</td>
    </tr>
   <tr>
        <td>województwo</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, w którym znajduje się start up, o długości 20</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, na którym znajduje się start up, o długości 30</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, na którym znajduje się start up, o długości 30</td>
    </tr>
    <tr>
        <td>nazwa</td>
        <td>znakowy(255 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę start up'u</td>
    </tr>
    <tr>
        <td>nip</td>
        <td>znakowy(13)</td>
        <td>nie</td>
        <td>tak</td>
        <td>ciag znaków określający numer identyfikacyjny podatnika o długości 10, start up'u</td>
    </tr>
    <tr>
        <td>regon</td>
        <td>znakowy(14 bądź 9 )</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciag znaków określający numer regon o długości 14 bądź 9, start up'u</td>
    </tr>
    <tr>
        <td>numer_telefonu</td>
        <td>znakowy(16)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciag znaków określający numer telefonu, start up'u</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">stanowiska</th>
    </tr>
    <tr>
        <td>id_stanowiska</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator stanowiska</td>
    </tr>
    <tr>
        <td>nazwa</td>
        <td>znakowy(30 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znaków określający nazwę stanowiska</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">uprawnienia</th>
    </tr>
    <tr>
        <td>id_uprawnienia</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator uprawnienia</td>
    </tr>
    <tr>
        <td>rodzaj</td>
        <td>znakowy(100 maks)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znaków określający rodzaj</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">datki</th>
    </tr>
    <tr>
        <td>id_datku</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator datku</td>
    </tr>
    <tr>
        <td>forma</td>
        <td>bool'owski</td>
        <td>tak</td>
        <td>nie</td>
        <td>rozróżnia czy mamy doczynienia z fundacją bądź start up'em</td>
    </tr>
    <tr>
        <td>kwota</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca kwotę przeznaczoną na fundację/start up</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">dane_przedsiębiorstw</th>
    </tr>
    <tr>
        <td>id_przedsiębiorstwa</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator przedsiębiorstwa</td>
    </tr>
    <tr>
        <td>ulica</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę ulicy, na ktorej znajduje się przedsiębiorstwo</td>
    </tr>
    <tr>
        <td>numer_mieszkania</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer mieszkania przedsiębiorstwa/td>
    </tr>
    <tr>
        <td>województwo</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, w którym znajduje się przedsiębiorstwo, o długości 20</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, na którym znajduje się przedsiębiorstwo, o długości 30</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, na którym znajduje się przedsiębiorstwo, o długości 30</td>
    </tr>
    <tr>
        <td>email</td>
        <td>znakowe(80)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znakowy określający email przedsiębiorstwa</td>
    </tr>
    <tr>
        <td>kod_pocztowy</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający kod pocztowy miejscowości miejscowości, w której znajduje się przedsiębiorstwo</td>
    </tr>
    <tr>
        <td>miejscowość</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający miejscowość, w której znajduje się przedsiębiorstwo</td>
    </tr>
    <tr>
        <td>nazwa_przedsiębiorstwa</td>
        <td>znakowy(255 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znakowy określający nazwę przedsiębiorstwa</td>
    </tr>
    <tr>
        <td>nip</td>
        <td>znakowy(13)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciag znaków określający numer identyfikacyjny podatnika o długości 10, przedsiębiorstwa</td>
    </tr>
    <tr>
        <td>regon</td>
        <td>znakowy(14 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciag cyfr określający numer regon długości 14 bądź 9, przedsiębiorstwa</td>
    </tr>
    <tr>
        <td>numer_telefonu</td>
        <td>znakowy(16)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciag cyfr określający numer telefonu, przedsiębiorstwa</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">pracownicy</th>
    </tr>
    <tr>
        <td>id_pracownika</td>
        <td>calkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator pracownika</td>
    </tr>
    <tr>
        <td>id_umowy</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator umowy</td>
    </tr>
    <tr>
        <td>id_stanowiska</td>
        <td>całkowity</td>
        <td>nie</td>
        <td>nie</td>
        <td>identyfikator stanowiska</td>
    </tr>
    <tr>
        <td>id_hurtownie</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator hurtowni</td>
    </tr>
    <tr>
        <td>imię</td>
        <td>znakowy(50 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający imię pracownika</td>
    </tr>
    <tr>
        <td>drugie_imię</td>
        <td>znakowy(50 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający drugie imię pracownika</td>
    </tr>
    <tr>
        <td>nazwisko</td>
        <td>znakowy(50 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający nazwisko pracownika</td>
    </tr>
    <tr>
        <td>pesel</td>
        <td>znakowy(11)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znaków określający pesel pracownika, o długości 11</td>
    </tr>
    <tr>
        <td>ulica</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający ulicę, na której mieszka pracownik</td>
    </tr>
    <tr>
        <td>numer_mieszkania</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający numer mieszkania, w którym mieszka pracownik</td>
    </tr>
    <tr>
        <td>kod_pocztowy</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający kod pocztowy miejscowości, w której mieszka pracownik</td>
    </tr>
    <tr>
        <td>miejscowość</td>
        <td>znakowe(30 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający miejsowość, w której mieszka pracownik</td>
    </tr>
    <tr>
        <td>województwo</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, w którym mieszka pracownik, o długości 20</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, w którym mieszka pracownik, o długości 30</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(30)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, w którym mieszka pracownik, o długości 30</td>
    </tr>
    <tr>
        <td>numer_telefonu</td>
        <td>znakowy(16)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znaków określający numer telefonu pracownika</td>
    </tr>
    <tr>
        <td>nip</td>
        <td>znakowy(13)</td>
        <td>nie</td>
        <td>tak</td>
        <td>ciąg znaków określający numer nip pracownika</td>
    </tr>
    <tr>
        <td>nazwa_użytkownika</td>
        <td>znakowy(50)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający nazwę użytkownika konta pracownika</td>
    </tr>
    <tr>
        <td>hashowane_hasło</td>
        <td>znakowy(64)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający hasz hasła pracownika</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">umowy</th>
    </tr>
    <tr>
        <td>id_umowy</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator umowy</td>
    </tr>
    <tr>
        <td>rodzaj</td>
        <td>znakowy(20 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znaków określający rodzaj umowy</td>
    </tr>
    <tr>
        <td>dokument</td>
        <td>bitowy(20 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg bitów odnoszący się do dokumentu</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">stany_magazynowe</th>
    </tr>
    <tr>
        <td>id_stanu_magazynowego</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator stanu magazynowego</td>
    </tr>
    <tr>
        <td>id_hurtownie</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator hurtowni</td>
    </tr>
    <tr>
        <td>id_towary</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator towaru</td>
    </tr>
    <tr>
        <td>ilość</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba całkowita określająca ilość towaru</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">towary_sprzedaże</th>
    </tr>
    <tr>
        <td>id_towary_sprzedaże</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator tabeli towary-sprzedaże</td>
    </tr>
    <tr>
        <td>id_towary</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator towaru</td>
    </tr>
    <tr>
        <td>id_sprzedaże</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator sprzedaży</td>
    </tr>
    <tr>
        <td>ilość</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba opisująca liczebność danego towaru</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">towary_kategorie</th>
    </tr>
    <tr>
        <td>id_towary_kategorie</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator tabeli towary-kategorie </td>
    </tr>
    <tr>
        <td>id_towary</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator towaru</td>
    </tr>
    <tr>
        <td>id_kategorie_towaru</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator kategorii</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">zamówienia_towary</th>
    </tr>
    <tr>
        <td>id_towary_sprzedaże</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator zamówienia</td>
    </tr>
    <tr>
        <td>id_sprzedaże</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator sprzedaży</td>
    </tr>
    <tr>
        <td>id_zamówienia</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator zamówienia</td>
    </tr>
    <tr>
        <td>cena_jednostkowa_netto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca cenę jednostkową towaru netto</td>
    </tr>
    <tr>
        <td>cena_jednostkowa_brutto</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca cenę jednostkową towaru brutto</td>
    </tr>
    <tr>
        <td>ilość</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba całkowita określająca ilość towaru</td>
    </tr>
     <tr>
        <th style="text-align: center;" colspan="5">przesunięcia_towary</th>
    </tr>
    <tr>
        <td>id_przesunięcia_towary</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator tabeli przesunięcia-towary</td>
    </tr>
     <tr>
        <td>id_przesunięcia_magazynowe</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator przesunięcia magazynowego</td>
    </tr>
    <tr>
        <td>id_towary</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator towaru</td>
    </tr>
     <tr>
        <td>ilość</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba całkowita określająca ilość towaru</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">uprawnienia_stanowiska</th>
    </tr>
    <tr>
        <td>id_uprawnienia_stanowiska</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator tabeli uprawnienia-stanowiska</td>
    </tr>
     <tr>
        <td>id_uprawnienia</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator uprawnień</td>
    </tr>
    <tr>
        <td>id_stanowiska</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator stanowiska</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">towary_datki</th>
    </tr>
    <tr>
        <td>id_towary_datki</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator tabeli towary-datki</td>
    </tr>
    <tr>
        <td>id_towary</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator towaru</td>
    </tr>
    <tr>
        <td>id_datki</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>identyfikator datku</td>
    </tr>
    <tr>
        <td>ilość</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg cyfr określający ilość towaru na datki</td>
    </tr>
</table>

## 5. Zdefiniowanie kluczy w tabelach

### Możliwe klucze kandydujące

<table>
    <tr>
        <th text-align: center>Nazwa tabeli</th>
        <th text-align: center>Nazwa klucza głównego</th>
    </tr>
    <tr>
       <td text-align: center>kategorie
</td> 
       <td text-align: center>id_kategorii</td> 
    </tr>
    <tr>
       <td text-align: center>punkty_sprzedaży
</td> 
       <td text-align: center>id_punktu_sprzedaży</td> 
    </tr>
    <tr>
       <td text-align: center>dostawcy</td> 
       <td text-align: center>id_dostawcy</td> 
    </tr>
    <tr>
       <td text-align: center>hurtownie</td> 
       <td text-align: center>id_hurtowni</td> 
    </tr>
    <tr>
       <td text-align: center>płatności</td> 
       <td text-align: center>id_płatności</td> 
    </tr>
    <tr>
       <td text-align: center>sprzedaże</td> 
       <td text-align: center>id_sprzedaży</td> 
    </tr>
    <tr>
       <td text-align: center>towary</td> 
       <td text-align: center>id_towaru</td> 
    </tr>
    <tr>
       <td text-align: center>przesunięcia_magazynowe
</td> 
       <td text-align: center>id_przesunięcia_magazynowego</td> 
    </tr>
    <tr>
       <td text-align: center>zamówienia</td> 
       <td text-align: center>id_zamówienia</td> 
    </tr>
    <tr>
       <td text-align: center>listy_przewozowe</td> 
       <td text-align: center>id_listu_przewozowego</td> 
    </tr>
    <tr>
       <td text-align: center>faktury</td> 
       <td text-align: center>id_faktury</td> 
    </tr>
    <tr>
       <td text-align: center>fundacje</td> 
       <td text-align: center>id_fundacji</td> 
    </tr>
    <tr>
       <td text-align: center>start_up
</td> 
       <td text-align: center>id_start_up</td> 
    </tr>
    <tr>
       <td text-align: center>stanowiska</td> 
       <td text-align: center>id_stanowiska</td> 
    </tr>
    <tr>
       <td text-align: center>uprawnienia</td> 
       <td text-align: center>id_uprawnienia</td> 
    </tr>
    <tr>
       <td text-align: center>datki</td> 
       <td text-align: center>id_datku</td> 
    </tr>
    <tr>
       <td text-align: center>dane_przedsiębiorstw
</td> 
       <td text-align: center>id_przedsiębiorstwa</td> 
    </tr>
    <tr>
       <td text-align: center>pracownicy</td> 
       <td text-align: center>id_pracownika</td> 
    </tr>
    <tr>
       <td text-align: center>umowy</td> 
       <td text-align: center>id_umowy</td> 
    </tr>
    <tr>
       <td text-align: center>stany_magazynowe</td> 
       <td text-align: center>id_stanu_magazynowego</td> 
    </tr>
</table>

### Klucze obce

<table>
    <tr>
        <th style="text-align: center;" colspan="5">kategorie</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>kategorie</td>
        <td>id_podkategorii	</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">punkty_sprzedaży</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>dane przedsiębiorstw</td>
        <td>id_przedsiębiorstw</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">sprzedaże</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>płatności</td>
        <td>id_płatności</td>
    </tr>
    <tr>
        <td>punkty_sprzedaży</td>
        <td>id_punkt_sprzedaży</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">przesunięcia_magazynowe
</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>pracownicy</td>
        <td>id_pracownika</td>
    </tr>
    <tr>
        <td>listy_przewozowe</td>
        <td>id_listu_przewozowego</td>
    </tr>
    <tr>
        <td>hurtownie</td>
        <td>id_hurtownia_źródłowa</td>
    </tr>
    <tr>
        <td>hurtownie</td>
        <td>id_hurtownia_docelowa</td>
    </tr>
    <tr>
        <td></td>
        <td></td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">zamówienia</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>dostawcy</td>
        <td>id_dostawcy</td>
    </tr>
    <tr>
        <td>hurtownie</td>
        <td>id_hurtownie</td>
    </tr>
    <tr>
        <td>pracownicy</td>
        <td>id_pracownicy</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">listy_przewozowe</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>sprzedaże</td>
        <td>id_sprzedaż</td>
    </tr>
    <tr>
        <td>dostawcy</td>
        <td>id_dostawca</td>
    </tr>
    <tr>
        <td>przesunięcie_magazynowe</td>
        <td>id_przesunięcia_magazynowego</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">datki</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>fundacje</td>
        <td>id_fundacja</td>
    </tr>
    <tr>
        <td>start up</td>
        <td>id_start_up</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">pracownicy</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>umowy</td>
        <td>id_umowy</td>
    </tr>
    <tr>
        <td>stanowiska</td>
        <td>id_stanowiska</td>
    </tr>
    <tr>
        <td>hurtownie</td>
        <td>id_hurtownii</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">stany_magazynowe</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>hurtownie</td>
        <td>id_hurtownii</td>
    </tr>
    <tr>
        <td>towary</td>
        <td>id_towaru</td>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">faktury</th>
    </tr>
    <tr>
        <th>Nazwa tabeli pierwotnej </th>
        <th>Nazwa klucza obcego</th>
    </tr>
    <tr>
        <td>sprzedaże</td>
        <td>id_sprzedaż</td>
    </tr>
    <tr>
        <td>pracownicy</td>
        <td>id_pracownik</td>
    </tr>
    <tr>
        <td>dane_przedsiębiorstw</td>
        <td>id_dane_przedsiębiorstw</td>
    </tr>
</table>

## 6. Identyfikowanie relacji tabel

<table>
<tr>
    <th text-align: center></th>
    <th text-align: center>kategorie</th>
    <th text-align: center>punkty_sprzedaży</th>
    <th text-align: center>dostawcy</th>
    <th text-align: center>hurtownie</th>
    <th text-align: center>płatności</th>
    <th text-align: center>sprzedaże</th>
    <th text-align: center>towary</th>
    <th text-align: center>przesunięcia_magazynowe</th>
    <th text-align: center>zamówienie</th>
    <th text-align: center>listy_przewozowe</th>
    <th text-align: center>faktury</th>
    <th text-align: center>fundacje</th>
    <th text-align: center>start up</th>
    <th text-align: center>stanowiska</th>
    <th text-align: center>dane_przedsiębiorstw</th>
    <th text-align: center>pracownicy</th>
    <th text-align: center>umowy</th>
    <th text-align: center>stany_magazynowe</th>
    <th text-align: center>datki</th>
    <th text-align: center>uprawnienia</th>
    <th text-align: center>umowy</th>
    
        
</tr>
<tr>
    <th text-align: center>kategorie</th>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>

</tr>
<tr>
    <th text-align: center>punkty_sprzedaży</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>dostawcy</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>hurtownie</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>  
    <td text-align: center>1:n</td>  
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>płatności</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>sprzedaże</th>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center>m:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    
</tr>
<tr>
    <th text-align: center>towary</th>
    <td text-align: center>m:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>m:n</td>
    <td text-align: center></td>
    <td text-align: center>m:n</td>
    <td text-align: center>m:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>  
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>przesunięcia_magazynowe</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>m:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>zamówienie</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>m:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>listy_przewozowe</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>faktury</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>fundacje</th>
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td>  
    <td text-align: center>1:n</td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
</tr>
<tr>
    <th text-align: center>start_up</th>
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td>  
    <td text-align: center>1:n</td>  
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>stanowiska</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>
    <td text-align: center>m:n</td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>dane_przedsiębiorstw</th>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>  
</tr>
<tr>
    <th text-align: center>pracownicy</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:n</td>
    <td text-align: center>1:n</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center>1:1</td>  
</tr>
<tr>
    <th text-align: center>datki</th>
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center>m:n</td>
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center>1:n</td>
    <td text-align: center>1:n</td>
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>  
    <td text-align: center></td>  
</tr>
<tr>
    <th text-align: center>umowy</th>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center>1:1</td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
<tr>
    <th text-align: center>stany_magazynowe</th>
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center>1:n</td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center>1:n</td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td> 
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
    <td text-align: center></td>
</tr>
</table>

## 7. Identyfikowanie problematycznych relacji wiele do wielu

We wcześniejszych krokach projektowych został rozwiązany problem relacji typu n:m

## 8. Diagram ERD

<img src="STMVendorerDatabaseProject.svg"/>

## 9. Diagram EER

<img src="img/eer.svg"/>
<img src="img/1.png"/>




## Cześć dotycząca zajęć z PSQL i MSSQL

##### 5.Tworzenie bazy danych w systemie PostgreSQL 
Uwtorzona przez nas baza danych:
<img src="imgp/1.png">
Uzupełnienie bazy tabelami:
<img src="imgp/2.png">
Skrypt użyty w tym celu, wygenerowany na podstawie ERD:

```sql
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
  ```
Dodanie kluczy głównych:

```sql
ALTER TABLE datki ADD PRIMARY KEY (pk);
ALTER TABLE start_upy ADD PRIMARY KEY (pk);
ALTER TABLE fundacje ADD PRIMARY KEY (pk);
ALTER TABLE towary ADD PRIMARY KEY (pk);
ALTER TABLE towary_datki ADD PRIMARY KEY (pk);
ALTER TABLE sprzedaże ADD PRIMARY KEY (pk);
ALTER TABLE towary_sprzedaże ADD PRIMARY KEY (pk);
ALTER TABLE płatności ADD PRIMARY KEY (pk);
ALTER TABLE punkty_sprzedaży ADD PRIMARY KEY (pk);
ALTER TABLE dane_przedsiębiorstw ADD PRIMARY KEY (pk);
ALTER TABLE hurtownie ADD PRIMARY KEY (pk);
ALTER TABLE stany_magazynowe ADD PRIMARY KEY (pk);
ALTER TABLE zamówienia ADD PRIMARY KEY (pk);
ALTER TABLE zamówienia_towary ADD PRIMARY KEY (pk);
ALTER TABLE dostawcy ADD PRIMARY KEY (pk);
ALTER TABLE pracownicy ADD PRIMARY KEY (pk);
ALTER TABLE stanowiska ADD PRIMARY KEY (pk);
ALTER TABLE stanowiska_uprawnienia ADD PRIMARY KEY (pk);
ALTER TABLE uprawnienia ADD PRIMARY KEY (pk);
ALTER TABLE umowy ADD PRIMARY KEY (pk);
ALTER TABLE przesunięcia_magazynowe ADD PRIMARY KEY (pk);
ALTER TABLE towary_przesunięcia ADD PRIMARY KEY (pk);
ALTER TABLE faktury ADD PRIMARY KEY (pk);
ALTER TABLE listy_przewozowe ADD PRIMARY KEY (pk);
ALTER TABLE kategorie ADD PRIMARY KEY (pk);
ALTER TABLE towary_kategorie ADD PRIMARY KEY (pk);
```

Dodanie kluczy obcych:

```sql
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
ALTER TABLE kategorie ADD CONSTRAINT kategorie_kategorie FOREIGN KEY (fk_podkategorii) REFERENCES kategorie (pk);
ALTER TABLE towary_kategorie ADD CONSTRAINT towary_towary_kategorie FOREIGN KEY (fk_towary) REFERENCES towary (pk);
ALTER TABLE towary_kategorie ADD CONSTRAINT kategorie_towary_kategorie FOREIGN KEY (fk_kategorie_towaru) REFERENCES kategorie (pk);
ALTER TABLE zamówienia_towary ADD CONSTRAINT zamówienia_towary_towary FOREIGN KEY (tk_towary) REFERENCES towary (pk);
ALTER TABLE faktury ADD CONSTRAINT dane_przedsiębiorstw FOREIGN KEY (fk_dane_przedsiębiorstw) REFERENCES dane_przedsiębiorstw (pk);
```
##### 6. Wstawianie danych do tabel bazy danych w systemie PostgreSQL 

<img src="imgp/3.png">

##### 7. Zarządzanie bazą danych PostgreSQL. 

Utorzony użytkownik/rola
<img src="imgp/4.png">

Przydzielenie uprawnień
<img src="imgp/5.png">

Tworzenie backup oraz restore:

<img src="imgp/6.png">
<img src="imgp/7.png">
<img src="imgp/8.png">
<img src="imgp/9.png">
<img src="imgp/10.png">
<img src="imgp/11.png">

## 8. Utworzenie bazy danych w narzędziu MS SQL Management Studio 18

<img src="img/11.png"/>
<img src="img/12.png"/>
<img src="img/13.png"/>
<img src="img/14.png"/>

## 9. Skrypt uzupełniający rekordy w bazie MSSQL

<img src="img/15.png"/>
<img src="img/16.png"/>

![Alt Text](https://j.gifs.com/nxWVWW.gif)

<img src="img/17.png"/>


## 10. Tworzenie nowego użytkownika MSSQL

<img src="img/18.png"/>
<img src="img/19.png"/>
<img src="img/20.png"/>
<img src="img/21.png"/>
<img src="img/22.png"/>

##  Eksport bazy MSSQL

<img src="img/23.png"/>
<img src="img/24.png"/>
<img src="img/25.png"/>
<img src="img/26.png"/>
<img src="img/27.png"/>
<img src="img/28.png"/>

##  Import kopii zapasowej do bazy MSSQL

<img src="img/29.png"/>
<img src="img/30.png"/>
<img src="img/31.png"/>

