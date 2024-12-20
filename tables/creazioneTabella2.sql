CREATE TABLE IF NOT EXISTS globalDataOnSustainableEnergy (
Entity VARCHAR(56),
Year INT,
Access_to_electricity_percent_ofpopulation NUMERIC,
Access_to_clean_fuels_for_cooking NUMERIC, 
Renewable_electricity_generating_capacity_per_capita NUMERIC,
Financial_flows_to_developing_countries_USD NUMERIC,
Renewable_energy_share_in_the_total_final_energy_consumption_percent NUMERIC,
Electricity_from_fossil_fuels_TWh NUMERIC,
Electricity_from_nuclear_TWh NUMERIC,
Electricity_from_renewables_TWh NUMERIC,
Low_carbon_electricity_percent_electricity NUMERIC,
Primary_energy_consumption_per_capita_kWh_person NUMERIC,
Energy_intensity_level_of_primary_energy_MJ_2017_PPP_GDP NUMERIC,
Value_co2_emissions_kt_by_country NUMERIC,
Renewables_equivalent_primary_energy NUMERIC,
gdp_growth NUMERIC,
gdp_per_capita NUMERIC,
Density_P_Km2 NUMERIC,
Land_Area_Km2 NUMERIC,
Latitude NUMERIC,
Longitude NUMERIC
);
SELECT * FROM globalDataOnSustainableEnergy;