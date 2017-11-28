---------------------------------------------------------------
-- table: ons_census_sw_ethnicity.  a lookup of ethnic groups for oa areas
---------------------------------------------------------------

truncate ons_census_sw_ethnicity;
copy ons_census_sw_ethnicity from 'c:\dbdata\ons\ons_census_sw_ethnicity.csv' delimiter ',' csv header;
