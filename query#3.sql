/*
Con questa query ho voluto mettere in evidenza la relazione tra i migranti vittime di incidenti 
e la situazione economico-sanitaria del loro paese di origine.
Per farlo mi sono creato creato una 'sottotabella' tramite una subquery che vada ed evidenziarmi
il numero di incidenti e la somma delle vittime per ogni paese di origine.
Ho deciso di filtrare i risultati rimuovendo i dati degli incidenti di cui non abbiamo il paese di origine delle
vittime.
Dopodichè ho effettuato un INNER JOIN con i dati generali dei paesi facendo combaciare 'country' con 'country_of_origin'
delle vittime.
Mettendo in evidenza dati come la mortalità infantile, aspettative di vita, salario minimo, spese mediche etc.
Dalla tabella risultante si evince come il gran numero di migranti vittime di incidenti provenga da paesi in cui
la situazione economico-sanitaria sia molto grave
*/

SELECT g_i.country, inc_per_country.incidents_number, inc_per_country.dead_numb, g_i.grossprimary_education_enrollment_percent, g_i.gross_tertiary_education_enrollment_percent, g_i.infant_mortality, g_i.life_expectancy, g_i.maternal_mortality_ratio, g_i.minimum_wage, g_i.out_of_pocket_health_expenditure
FROM
    (SELECT country_of_origin, COUNT(1) AS incidents_number, SUM(number_of_dead) AS dead_numb
    FROM globalmissingmigrantsdataset m_m 
    GROUP BY country_of_origin
    HAVING country_of_origin <> 'Unknown'
    ) inc_per_country
INNER JOIN globalcountryinformationdataset g_i
ON inc_per_country.country_of_origin = g_i.country
ORDER BY inc_per_country.incidents_number DESC;