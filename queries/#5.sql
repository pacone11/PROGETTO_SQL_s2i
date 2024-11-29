-- Quali sono le caratteristiche energetiche dei paesi con alta densità di popolazione?
/*
Con questa query vogliamo andare a mettere in evidenza quali sono le maggiori fonti di energia dei paesi a più alta densità
di popolazione.
Siccome abbiamo dati annuali, tramite una subquery mi calcolo la media della densità per ogni paese,
i risultati verranno poi combinati con il dataset più generico evidenziando tutti i dati che vogliamo prendere in esame.
Ordinando in senso discendente per la densità, andiamo ad ottenere il risultato ricercato.

-----------

What are the energy characteristics of countries with high population density?

With this query I want to highlight which are the major energy sources in the highest density countries
of population.
Since we have annual data, using a subquery I calculate the average density for each country,
the results will then be combined with the more generic table highlighting all the data we want to examine.
By ordering in descending order by density, we obtain the desired results.

*/
SELECT g_i.entity, density.avg_density, MAX(electricity_from_fossil_fuels_twh) AS fossil_fuels, MAX (electricity_from_nuclear_twh) AS nuclear, MAX(electricity_from_renewables_twh) AS renewables, MAX(low_carbon_electricity_percent_electricity) AS low_carbon
FROM (
	SELECT entity, CAST(avg(density_p_km2) AS INT) AS avg_density
	FROM globaldataonsustainableenergy
	GROUP BY entity
	ORDER BY avg_density DESC
	) density
INNER JOIN globaldataonsustainableenergy g_i ON density.entity = g_i.entity
GROUP BY g_i.entity, density.avg_density
HAVING density.avg_density IS NOT NULL AND (MAX(electricity_from_fossil_fuels_twh), MAX (electricity_from_nuclear_twh), MAX(electricity_from_renewables_twh), MAX(low_carbon_electricity_percent_electricity)) IS NOT NULL
ORDER BY density.avg_density DESC