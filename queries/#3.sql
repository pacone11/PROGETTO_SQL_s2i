-- Quali paesi sono più vicini a una produzione di elettricità totalmente "low-carbon" ?
/*
Con questa query vado a ricercare quelli che sono i paesi più vicini ad una produzione di energia 'low carbon'.
Siccome abbiamo dati annuali, per avere un unico valore per ogni paese ho preso come riferimento il massimo tra tutti gli anni.

Ordinando per queso parametro così definito andiamo a raggiungere lo scopo della query che evidenzia che ci sono diversi paesi 
che producono già energia 100% low-carbon e molti altri che sono vicini al traguardo
*/
SELECT entity, MAX(low_carbon_electricity_percent_electricity) AS max_low_carbon_electr_percentage
FROM globaldataonsustainableenergy
GROUP BY entity
HAVING MAX(low_carbon_electricity_percent_electricity) IS NOT NULL
ORDER BY max_low_carbon_electr_percentage DESC