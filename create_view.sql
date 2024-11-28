/* 
Creo una vista contenente la differenza di alcuni valori su cui ho deciso di focalizzare lo studio.
Lo spazio temporale preso in esame è quello compreso tra gli estremi forniti dal dataset, ovvero 2000 e 2020.
Vado poi a filtrare dai risultati le righe completamente null.
-----
I create a view containing the difference of some values on which I decided to focus.
The timeframe examined is in between the extremes provided by the dataset, i.e. 2000 and 2020.
I then filter the completely null rows from the results.
*/
CREATE VIEW difference_view AS(
	WITH difference AS (	
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
);





	

