---------------------------------------------------------------
-- table: ons_census_sw_religions.  a lookup of religions for oa areas
---------------------------------------------------------------

truncate ons_census_sw_religions;
copy ons_census_sw_religions from 'c:\dbdata\ons\oa_sw_religion.csv' delimiter ',' csv header;
