-- I paesi che ricevono più finanziamenti hanno una minore dipendenza da combustibili fossili?
/*
Con questa query voglio andare a verificare se i paesi che ricevono più finanziamenti per lo sviluppo di tecnologie per energia rinnovabile
sono anche quelli che dipendono minormente dall'energia proveniente da combustibili fossili.
Sicoome ho dati annuali, per avere un singolo valore per ogni paese vado a prendere solo il massimo tra tutti.
Ordinando per 'financial flows' in modo discendente si può notare che, in generale, i paesi che ricevono più finanziamento sono quelli che utilizzano meno combustibili fossili.

----------

-- Do countries that receive more funding have less dependence on fossil fuels?

With this query I want to check whether the countries that receive more funding for the development of renewable energy technologies
are also those that are least dependent on energy from fossil fuels.
Since I have annual data, to have a single value for each country I will only take the maximum among all.
Sorting by 'financial flows' in descending order we can see that, in general, the countries that receive the most financing are those that use the least fossil fuels.

*/
SELECT entity, MAX(financial_flows_to_developing_countries_usd) AS financial_flows_usd, MAX(electricity_from_fossil_fuels_twh) AS fossil_fuels_energy
FROM globaldataonsustainableenergy
GROUP BY entity
HAVING MAX(financial_flows_to_developing_countries_usd) IS NOT NULL
ORDER BY MAX(financial_flows_to_developing_countries_usd) DESC