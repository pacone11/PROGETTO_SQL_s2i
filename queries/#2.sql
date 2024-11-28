-- Quali paesi hanno la minore percentuale di accesso all'elettricità rispetto alla popolazione totale?
/* L'obiettivo di questa query è di verificare quali sono i popoli che hanno minor accesso all'elettricità.

Ho creato prima due CTE:
una che va ad individuare la percentuale di popolazione che ha accesso all'energia elettrica,
l'altra che evidenzia i paesi con una popolazione maggiore, prendendo in esame solo i primi 50.
Ho poi fatto un INNER JOIN basato sul nome del paese e ho ordinato i risultati per mostrare prima i paesi che hanno 
una percentuale minore di accesso all'elettricità.
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