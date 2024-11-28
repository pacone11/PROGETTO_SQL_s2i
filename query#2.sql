/*
L'obiettivo di questa query è quella di evidenziare i paesi che producono più energia rinnovabile.
Poichè abbiamo dati annuali, ho calcolato il massimo valore in una subquery, in modo da avere un singolo
riferimento per ogni paese.
Poi ho messo in evidenza il paese, l'anno e il valore massimo di energia rinnovabile trovato 
facendo uno Join tra la 'tabella temporanea' creata e la tabella generale
sul nome del paese (entity) e il valore dell'energia generata.
Ho ordinato i risultati  in modo tale da avere una visione chiara
e immediata di quali sono i paesi che hanno generato più energia rinnovabile, evidenziandone l'anno.
*/
SELECT gdse.entity, gdse.year, c_max.max_ren_en
FROM globaldataonsustainableenergy gdse
JOIN (
    SELECT entity, MAX(renewable_electricity_generating_capacity_per_capita) AS max_ren_en
    FROM globaldataonsustainableenergy
    WHERE renewable_electricity_generating_capacity_per_capita IS NOT NULL
    GROUP BY entity
	) c_max
ON gdse.entity = c_max.entity
	AND gdse.renewable_electricity_generating_capacity_per_capita = c_max.max_ren_en
ORDER BY max_ren_en DESC;
