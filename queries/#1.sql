-- I paesi con alte emissioni di CO₂ dipendono maggiormente dai combustibili fossili?
/*
Con questa query andiamo a verificare la relazione tra le emissioni di co2 e la quota energetica proveniente
da combustibili fossili di ogni paese.
Siccome abbiamo valori annuali ho evidenziato il massimo valore per ogni paese in modo tale da avere un singolo dato di riferimento.

Raggruppando per stato e ordinando sia per combustibili fossili che per emissioni di co2 si denota una certa proporzionalità diretta tra i due valori

----------

-- Are countries with high CO₂ emissions more dependent on fossil fuels?
With this query we are going to verify the relationship between CO2 emissions and the energy share coming from fossil fuels.
Since we have annual values ​​I have highlighted the maximum value for each country in order to have a single data for each country.
grouping by state and ordering both by fossil fuels and by co2 emissions shows a certain direct proportionality between the two values
*/


SELECT ENTITY, MAX(electricity_from_fossil_fuels_twh) AS max_fossil_fuels, MAX(value_co2_emissions_kt_by_country) AS max_co2_emissions
FROM globaldataonsustainableenergy s_e
WHERE (electricity_from_fossil_fuels_twh, value_co2_emissions_kt_by_country) IS NOT NULL
GROUP BY entity
ORDER BY max_fossil_fuels DESC
;
SELECT ENTITY, MAX(electricity_from_fossil_fuels_twh) AS max_fossil_fuels, MAX(value_co2_emissions_kt_by_country) AS max_co2_emissions
FROM globaldataonsustainableenergy s_e
WHERE (electricity_from_fossil_fuels_twh, value_co2_emissions_kt_by_country) IS NOT NULL
GROUP BY entity
ORDER BY max_co2_emissions DESC
;