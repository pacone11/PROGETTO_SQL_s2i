/*
L'obiettivo di questa query è di evidenziare come sia cambiato l'accesso e l'approccio
energetico (tra il 2000 e il 2020)  in base al PIL del paese (riferito al 2023).
In particolare facciamo un focus sui paesi a PIL più basso per vedere se le loro condizioni
sono migliorate nel tempo.
Sfrutto la vista creata precedentemente, contenente tutti i valori pertinenti rigurdanti la
differenza negli anni, per fare un 'INNER JOIN' con la tabella dei dati generali globali
dalla quale vado a selezionare solo i valori del PIL (gdp).
Andando ad ordinare i risultati per gdp crescente si possono osservare i risultati cercati.

----------

The goal of this query is to highlight how access and approaches to energy have changed over time
(between 2000 and 2020) based on the country's GDP (referring to 2023).
In particular we focus on countries with lower GDP to see if they have improved
their conditions over time.
I use the DIFFERENCE view created previously, containing all the relevant values I want to focus on
then I do an 'INNER JOIN' with the global general data table from which I am going to select only the GDP values.
Sorting the results by ascending gdp you can observe the searched results.
*/
SELECT d_v.*, g_i.gdp
FROM difference_view d_v
INNER JOIN globalcountryinformationdataset g_i
ON d_v.entity = g_i. country
WHERE g_i.gdp IS NOT NULL
ORDER BY g_i.gdp 
