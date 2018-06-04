---------------------------------------------------------------
-- table: ons_oas_population_female
---------------------------------------------------------------

truncate ons_oas_population_female;
copy ons_oas_population_female from 'c:\dbdata\ons\oa_SW_mid2016females.csv' delimiter ',' csv header;