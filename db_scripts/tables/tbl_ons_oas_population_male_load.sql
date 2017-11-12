---------------------------------------------------------------
-- table: ons_oas_population_male
---------------------------------------------------------------

truncate ons_oas_population_male;
copy ons_oas_population_male from 'c:\dbdata\ons\OA_SW_Mid2015Males.csv' delimiter ',' csv header;