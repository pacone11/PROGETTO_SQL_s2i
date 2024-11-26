CREATE TABLE IF NOT EXISTS GlobalMissingMigrantsDataset (
Incident_Type TEXT,
Incident_year INT,
Reported_Month TEXT,
Region_of_Origin TEXT,
Region_of_Incident TEXT,
Country_of_Origin TEXT,
Number_of_Dead INT,
Minimum_Estimated_Number_of_Missing INT,
Total_Number_of_Dead_and_Missing INT,
Number_of_Survivors INT,
Number_of_Females INT,
Number_of_Males INT,
Number_of_Children INT,
Cause_of_Death TEXT,
Migration_route TEXT,
Location_of_death TEXT,
Information_Source TEXT,
Latitude NUMERIC,
Longitude NUMERIC
);
SELECT * FROM GlobalMissingMigrantsDataset;


