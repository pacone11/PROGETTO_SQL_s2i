/* 
L'obiettivo è quello di mettere in relazione 'PIL' ed 'Energia Rinnovabile Generata' 

Utilizzo una CTE per creare due "tabelle temporanee" che hanno rispettivamente:
-i primi 50 paesi per prodotto interno lordo (gdp)
-i primi 50 paesi per energia rinnovabile generata per capita (siccome l'ultimo anno a disposizione è il 2020
decido di prendere quello come riferimento e di scartare i paesi di cui non abbiamo il dato)

Faccio quindi un inner join delle tabelle così ottenute utilizzando come dato comune 
le coordinate (Latitudine e Longitudine) 
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
	ON t_gdp.latitude = t_r_el.latitude AND t_gdp.longitude = t_r_el.longitude
;
