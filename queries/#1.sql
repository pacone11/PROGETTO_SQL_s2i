-- I paesi con alte emissioni di CO₂ dipendono maggiormente dai combustibili fossili?
/*
Con questa query andiamo a verificare la relazione tra le emissioni di co2 del e la quota energetica proveniente
da combustibili fossili.
Siccome abbiamo valori annuali ho evidenziato il massimo valore per ogni paese in modo tale da avere un singolo dato per ognipaese
raggruppando per stato e ordinando sia per combustibili fossili che per emissioni di co2 si denota una certa proporzionalità diretta tra i due valori
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