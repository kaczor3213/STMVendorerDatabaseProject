<table>
    <tr>
        <th text-align: center>Rodzaj związku</th>
        <th text-align: center>Reguła usuwania z baz danych</th>
    </tr>
    <tr>
       <td text-align: center>uprawnienia_stanowiska_uprawnienia</td> 
       <td text-align: center>usuwamie kaskadowe</td> 
    </tr>
    <tr>
       <td text-align: center>stanowiska_stanowiska_uprawnienia
</td> 
       <td text-align: center>usuwanie kaskadowe</td> 
    </tr>
    <tr>
       <td text-align: center>stanowiska_pracownicy</td> 
       <td text-align: center>ustawienie wartości null dla `fk_stanowiska` </td> 
    </tr>
    <tr>
       <td text-align: center>pracownicy_umowy</td> 
       <td text-align: center></td>ustawienie wartości `false` dla atrybutu `zatrudniony` w tabeli `pracownicy`
    </tr>
    <tr>
       <td text-align: center>pracownicy_przesunięcia_magazynowe</td> 
       <td text-align: center>brak zmian</td> 
    </tr>
    <tr>
       <td text-align: center>pracownicy_faktury</td> 
       <td text-align: center>brak zmian</td> 
    </tr>
    <tr>
       <td text-align: center>pracownicy_zamówienia</td> 
       <td text-align: center>brak zmian</td> 
    </tr>
    <tr>
       <td text-align: center>hurtownie_pracownicy</td> 
       <td text-align: center>ustawienie wartości `null` dla atrybutu `zatrudniony` w tabeli `pracownicy`</td>
    </tr>
    <tr>
       <td text-align: center>hurtownie_towary_stany_magazynowe</td> 
       <td text-align: center>usuwanie kaskadowe</td>
    </tr> 
    <tr>
       <td text-align: center>hurtownie_zamówienia</td> 
       <td text-align: center>ustawienie wartości status na `false` w tabeli hurtownie</td>
    </tr> 
    <tr>
       <td text-align: center>przesunięcia_magazynowe_listy_przewozowe</td> 
       <td text-align: center>ustawwienie wartości null dla `fk_przesunięcie_magazynowe`</td> 
    </tr>
    <tr>
       <td text-align: center>przesunięcie_magazynowe_towary_przesunięcia</td> 
       <td text-align: center>usuwanie kaskadowe</td> 
    </tr>
    <tr>
       <td text-align: center>towary_towary_przesunięcia</td> 
       <td text-align: center>usuwanie kaskadowe</td> 
    </tr>
    <tr>
       <td text-align: center>hurtownie_przesunięcie_magazynowe</td> 
       <td text-align: center>usuwanie kaskadowe</td>
    </tr>
    <tr>
       <td text-align: center>towary_stany_magazynowe</td> 
       <td text-align: center>usuwanie_kaskadowe</td>
    </tr>
    <tr>
       <td text-align: center>towary_towary_sprzedaże</td> 
       <td text-align: center>usuwanie_kaskadowe</td> 
    </tr>
    <tr>
       <td text-align: center>towary_towary_kategorie</td> 
       <td text-align: center>usuwanie kaskadowe</td> 
    </tr> 
    <tr>
       <td text-align: center>towary_datki</td> 
       <td text-align: center>brak zmian</td>
    </tr> 
        <tr>
       <td text-align: center>kategorie_towary_kategorie</td> 
       <td text-align: center>usuwanie kaskadowe</td>
    </tr>
    <tr>
       <td text-align: center>kategorie_kategorie</td> 
       <td text-align: center>usuwanie kaskadowe i ustawienie id_podkategorii, kategorii nadrzędnej na null</td>
    </tr>
    <tr>
       <td text-align: center>dostawcy_zamówienia</td> 
       <td text-align: center>brak zmian</td>
    </tr>
    <tr>
       <td text-align: center>dostawcy_faktury</td> 
       <td text-align: center>brak zmian</td>
    </tr>    
    <tr>
       <td text-align: center>zamówienia_towary_sprzedaże</td> 
       <td text-align: center>brak zmian</td>
    </tr>
    <tr>
       <td text-align: center>sprzedaże_towary_sprzedaże</td> 
       <td text-align: center>brak zmian</td>
    </tr>    
    <tr>
       <td text-align: center>start_upy_datki</td> 
       <td text-align: center>brak zmian</td>
    </tr>  
    <tr>
       <td text-align: center>fundacje_datki</td> 
       <td text-align: center></td>
    </tr> 
     <tr>
       <td text-align: center>datki_towary_datki</td> 
       <td text-align: center>brak zmian</td>
    </tr>   
    <tr>
       <td text-align: center>sprzedaże_faktury</td> 
       <td text-align: center>brak zmian</td>
    </tr>  
    <tr>
       <td text-align: center>sprzedaże_listy_przewozowe</td> 
       <td text-align: center>brak zmian</td>
    </tr>  
    <tr>
       <td text-align: center>płatności_sprzedaże</td> 
       <td text-align: center>zmiana wartości dostępność na 'false'</td>
    </tr>  
    <tr>
       <td text-align: center>punkty_sprzedaży_sprzedaże</td> 
       <td text-align: center>ustawienie wartości status na `false` w tabeli punkty sprzedaży</td>
    </tr>  
    <tr>
       <td text-align: center>dane_przedsiębiorstw_punkty_sprzedaży</td> 
       <td text-align: center>brak zmian</td>
    </tr>   
</table>