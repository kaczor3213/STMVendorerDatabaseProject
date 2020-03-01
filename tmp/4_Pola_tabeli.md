<table>
    <tr>
        <th>nazwa pola</th>
        <th>typ pola</th>
        <th>czy pole jest wymagane</th>
        <th>czy jest unikatowa</th>
        <th>opis</th>
    </tr>
    <tr>
        <th style="text-align: center;" colspan="5">kategorie_towarów</th>
    </tr>
    <tr>
        <td>id_kategorii_towaru</td>
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
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, o długości 6</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(4)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, o długości 4</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, o długości 2</td>
    </tr>
    <tr>
        <td>numer_telefou</td>
        <td>znakowe(11)</td>
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
        <td>znakowe(2)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, o długości 2</td>
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
        <td>całkowity(10)</td>
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
        <td>znakowe(4)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, o długości 4</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, o długości 6</td>
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
        <td>znakowe(2</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, o długości 2</td>
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
        <td>znakowe(4)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, o długości 4</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, o długości 6</td>
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
        <td>województwo_odbiorcy</td>
        <td>znakowe(2)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg określający województwo, w którym jest odbiorca, o długości 2</td>
    </tr>
    <tr>
        <td>powiat_odbiorcy</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg określający powiat, w którym jest odbiorca, o długości 4</td>
    </tr>
    <tr>
        <td>gmina_odbiorcy</td>
        <td>znakowe(20 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg określający gminę, w której jest odbiorca, o długości 6</td>
    </tr>
    <tr>
        <td>miejscowość_odbiorcy</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg określający miejscowosć, w której jest odbiorca</td>
    </tr>
    <tr>
        <td>ulica_odbiorcy</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg określający nazwę ulicy, na której jest odbiorca</td>
    </tr>
    <tr>
        <td>numer_mieszkania_odbiorcy</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg określający numer mieszkania, odbiorcy</td>
    </tr>
    <tr>
        <td>kod_pocztowy_odbiorcy</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg 6 znaków określający kod pocztowy miejscowości, w której znajduje się odbiorca</td>
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
        <td>waga</td>
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
        <td>nazwa_nabywcy</td>
        <td>znakowy(255 max)</td>
        <td>nie</td>
        <td>nie</td>
        <td>ciąg znakowy określający nazwę nabywcy</td>
    </tr>
    <tr>
        <td>ulica_nabywcy</td>
        <td>znakowe(80 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający ulicę, na której znajduje się nabywca</td>
    </tr>
    <tr>
        <td>numer_mieszkania_nabywcy</td>
        <td>znakowe(6 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer mieszkania nabywcy</td>
    </tr>
    <tr>
        <td>kod_pocztowy_nabywcy</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg 6 znaków określający kod pocztowy miejscowości, w której znajduje się nabywca</td>
    </tr>
    <tr>
        <td>miejscowość_nabywcy</td>
        <td>znakowe(35 max)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający miejscowość, w której znajduje się nabywca</td>
    </tr>
    <tr>
        <td>numer_telefonu_nabywcy</td>
        <td>znakowy(11)</td>
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
        <td>nip</td>
        <td>znakowy(10)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający numer nip nabywcy, o długości 10</td>
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
        <td>znakowe(2)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, w którym znajduje się fundacja, o długości 2</td>
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
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, na którym znajduje się fundacja, o długości 6</td>
    </tr>
    <tr>
        <td>kod_pocztowy</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg 6 znaków określający kod pocztowy miejscowości, w której znajduje się fundacja</td>
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
        <td>znakowy(11)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znaków określający numer telefon fundacji, o długości 11 bądź 9</td>
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
        <td>całkowity(10)</td>
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
        <td>znakowe(2)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, w którym znajduje się start up, o długości 2</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(4)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, na którym znajduje się start up, o długości 4</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, na którym znajduje się start up, o długości 6</td>
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
        <td>znakowy(10)</td>
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
        <td>znakowy(20 max)</td>
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
        <td>znakowe(2)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, w którym znajduje się przedsiębiorstwo, o długości 2</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(4)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, na którym znajduje się przedsiębiorstwo, o długości 4</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, na którym znajduje się przedsiębiorstwo, o długości 6</td>
    </tr>
    <tr>
        <td>emial</td>
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
        <td>znakowy(10)</td>
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
        <td>znakowe(2)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający województwo, w którym mieszka pracownik, o długości 2</td>
    </tr>
    <tr>
        <td>powiat</td>
        <td>znakowe(4)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający powiat, w którym mieszka pracownik, o długości 4</td>
    </tr>
    <tr>
        <td>gmina</td>
        <td>znakowe(6)</td>
        <td>tak</td>
        <td>nie</td>
        <td>ciąg znakowy określający gminę, w którym mieszka pracownik, o długości 6</td>
    </tr>
    <tr>
        <td>numer_telefonu</td>
        <td>znakowy(9 min 11 max)</td>
        <td>tak</td>
        <td>tak</td>
        <td>ciąg znaków określający numer telefonu pracownika</td>
    </tr>
    <tr>
        <td>nip</td>
        <td>znakowy(10)</td>
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
        <th style="text-align: center;" colspan="5">towary_kategorie_towarów</th>
    </tr>
    <tr>
        <td>id_towary_kategorie_towarów</td>
        <td>całkowity</td>
        <td>tak</td>
        <td>tak</td>
        <td>identyfikator tabeli towary-kategorie towarów</td>
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
        <th style="text-align: center;" colspan="5">towary_zamówienia</th>
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
        <td>cena_jednostkowa</td>
        <td>decymalny</td>
        <td>tak</td>
        <td>nie</td>
        <td>liczba zmiennoprzecinkowa określająca cenę jednostkową towaru</td>
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