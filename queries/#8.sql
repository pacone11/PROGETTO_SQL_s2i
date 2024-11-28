/* 
L'obiettivo è quello di mettere in relazione 'PIL' e 'Capacità di Energia Rinnovabile Generata per capita'
In particolare per vedere come i paesi con PIL più alto si comportano riguardo il 
tema dell'energia rinnovabile.

Utilizzo una CTE per creare due "tabelle temporanee" che hanno rispettivamente:
-i primi 50 paesi per prodotto interno lordo (gdp)
-i primi 50 paesi per energia rinnovabile generata per capita (siccome l'ultimo anno a disposizione è il 2020
decido di prendere quello come riferimento e di scartare i paesi di cui non abbiamo il dato)

Faccio quindi un 'INNER JOIN' delle tabelle così ottenute utilizzando come dato comune 
il nome del paese.

Ordinando i risultati per 'Capacità di Energia Rinnovabile Generata per capita'
vado a vedere quali tra i paesi 'più forti' si impegna di più sul fronte dell'energia rinnovabile

---------

The goal is to relate 'GDP' and 'renewable electricity generating capacity percapita' 
in order to see how the countries with a higher gdp behave on renewable energies.

I use a CTE to create two "temporary tables" that have respectively:
-the top 50 countries by gross domestic product (gdp)
-the top 50 countries for renewable energy generated per capita (since the last year available is 2020
I decided to take that as a reference and discard the countries for which we do not have data)

I then do an 'INNER JOIN' of the tables thus obtained using common data 
the coordinates (Latitude and Longitude).

I order the results by 'renewable electricity generating capacity percapita'
to see how the 'more powerful' countries act on renewable energies field.
*/
WITH 
	top50_gdp_countries AS (
		SELECT *
		FROM globalcountryinformationdataset g_i
		ORDER BY gdp DESC
		LIMIT 50
	),
		top50_renewable_elect_gen AS (
		SELECT *
		FROM globaldataonsustainableenergy s_e
		WHERE year = 2020 AND renewable_electricity_generating_capacity_per_capita IS NOT NULL
		ORDER BY renewable_electricity_generating_capacity_per_capita DESC
		LIMIT 50
	)
SELECT t_gdp.country, t_gdp.gdp, t_r_el.renewable_electricity_generating_capacity_per_capita
FROM top50_gdp_countries t_gdp
INNER JOIN top50_renewable_elect_gen t_r_el 
	ON t_gdp.country = t_r_el.entity
	-- t_gdp.latitude = t_r_el.latitude AND t_gdp.longitude = t_r_el.longitude
ORDER BY t_r_el.renewable_electricity_generating_capacity_per_capita DESC
;
