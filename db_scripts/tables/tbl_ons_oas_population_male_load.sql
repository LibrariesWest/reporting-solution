---------------------------------------------------------------
-- table: ons_oas_population_male
---------------------------------------------------------------

truncate ons_oas_population_male;
copy ons_oas_population_male from 'c:\dbdata\ons\oa_sw_mid2016_males.csv' delimiter ',' csv header;