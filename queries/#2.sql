-- Quali paesi hanno la minore percentuale di accesso all'elettricità rispetto alla popolazione totale?
/* L'obiettivo di questa query è di verificare quali sono i popoli che hanno minor accesso all'elettricità.

Ho creato prima due CTE:
una che va ad individuare la percentuale di popolazione che ha accesso all'energia elettrica (ho preso come riferimento l'anno 2020, che è il dato più aggiornato a disposizione)
l'altra che evidenzia i paesi con popolazione maggiore, prendendo in esame solo i primi 50.
Ho poi fatto un INNER JOIN basato sul nome del paese e ho ordinato i risultati per mostrare prima i paesi che hanno 
una percentuale minore di accesso all'elettricità.

----------

-- Which countries have the lowest percentage of electricity access relative to the total population?
The objective of this query is to verify which populations have the least access to electricity.

I created two CTEs:
one that identifies the percentage of the population that has access to electricity,
the other which highlights countries with a larger population, examining only the top 50.
I then did an INNER JOIN based on the country name and sorted the results to show first the countries that have  
a lower percentage of access to electricity.
*/
WITH 
	s_e_data AS (
	SELECT s_e.entity, s_e.access_to_electricity_percent_ofpopulation
	FROM globaldataonsustainableenergy s_e
	WHERE year = 2020 AND s_e.access_to_electricity_percent_ofpopulation < 100
	ORDER BY s_e.access_to_electricity_percent_ofpopulation
	),
	g_i_data AS(
	SELECT g_i.country, g_i.population
	FROM globalcountryinformationdataset g_i
	ORDER BY g_i.population DESC
	LIMIT 50
	)
SELECT g_i_data.country, g_i_data.population, s_e_data.access_to_electricity_percent_ofpopulation
FROM g_i_data
INNER JOIN s_e_data 
ON g_i_data.country = s_e_data.entity
ORDER by s_e_data.access_to_electricity_percent_ofpopulation 