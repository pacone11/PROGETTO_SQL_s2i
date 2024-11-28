-- I paesi che ricevono più finanziamenti hanno una minore dipendenza da combustibili fossili?
/*
Con questa query voglio andare andare a verificare se i paesi che ricevono più finanziamenti per lo sviluppo di tecnologie per energia rinnovabile
sono anche quelli che dipendono minormente dall'energia proveniente da combustibili fossili.
Sicoome ho dati annuali, per avere un singolo valore per ogni paese vado a prendere solo il massimo tra tutti.
Ordinando per 'financial flows' in modo discendente si può notare che, in generale, i paesi che ricevono più finanziamento sono quelli che utilizzano meno combustibili fossili.
*/
SELECT entity, MAX(financial_flows_to_developing_countries_usd) AS financial_flows_usd, MAX(electricity_from_fossil_fuels_twh) AS fossil_fuels_energy
FROM globaldataonsustainableenergy
GROUP BY entity
HAVING MAX(financial_flows_to_developing_countries_usd) IS NOT NULL
ORDER BY MAX(financial_flows_to_developing_countries_usd) DESC