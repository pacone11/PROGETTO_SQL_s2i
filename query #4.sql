/* 
L'obiettivo della query è quello di evidenziare le differenze riguardanti l'accesso e la provenienza
dell'energia tra il 2020 e il 2000.
Con un 'WITH' mi creo una tabella temporanea che mi serve a filtrare solo i dati riguardanti gli
anni che mi interessano.
Poi, siccome mi servono le differenze tra gli anni 2020 e 2000 utilizzo una subquery per evidenziarmi 
i dati che mi servono. 
Siccome ci saranno molte righe completamente 'null' (per come è impostata la sottrazione tra
il valore evidenziato e quello del precedente, partizionati per paese), che vado a nascondere 
per pulizia dei risultati.
L'ordinamenteìo finale può variare a seconda della particolare condizione che si vuole verificare
*/
WITH difference AS(
	SELECT * 
	FROM public.globaldataonsustainableenergy
	WHERE YEAR = 2000 OR YEAR = 2020
)
SELECT *
FROM (
	SELECT entity, 
	access_to_electricity_percent_ofpopulation - LAG(access_to_electricity_percent_ofpopulation) OVER (PARTITION BY entity ORDER BY year) AS electricity_access_diff,
	access_to_clean_fuels_for_cooking - LAG(access_to_clean_fuels_for_cooking) OVER (PARTITION BY entity ORDER BY year) AS cooking_fuel_diff,
	renewable_electricity_generating_capacity_per_capita - LAG(renewable_electricity_generating_capacity_per_capita) OVER (PARTITION BY entity ORDER BY year) AS generated_renewable_energ_p_c_diff,
	electricity_from_fossil_fuels_twh - LAG(electricity_from_fossil_fuels_twh) OVER (PARTITION BY entity ORDER BY year) AS electricity_from_fossil_fuels_diff,
	electricity_from_nuclear_twh - LAG(electricity_from_nuclear_twh) OVER (PARTITION BY entity ORDER BY year) AS electr_from_nuclear_diff,
	electricity_from_renewables_twh - LAG(electricity_from_renewables_twh) OVER (PARTITION BY entity ORDER BY year) AS electr_from_renewable_diff,
	low_carbon_electricity_percent_electricity - LAG(low_carbon_electricity_percent_electricity) OVER (PARTITION BY entity ORDER BY year) AS electr_from_low_carbon_diff
FROM difference
) subquery
WHERE NOT (
	electricity_access_diff IS NULL
	AND cooking_fuel_diff IS NULL 
	AND generated_renewable_energ_p_c_diff IS NULL 
	AND electricity_from_fossil_fuels_diff IS NULL 
	AND electr_from_nuclear_diff IS NULL 
	AND electr_from_renewable_diff IS NULL 
	AND electr_from_low_carbon_diff IS NULL
	)
ORDER BY electricity_access_diff DESC




	

