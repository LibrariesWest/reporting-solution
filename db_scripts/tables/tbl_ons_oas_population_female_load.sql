---------------------------------------------------------------
-- table: ons_oas_population_female
---------------------------------------------------------------

truncate ons_oas_population_female;
copy ons_oas_population_female from 'c:\dbdata\ons\OA_SW_Mid2015Females.csv' delimiter ',' csv header;