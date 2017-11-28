---------------------------------------------------------------
-- table:
---------------------------------------------------------------

-- drop table ons_census_sw_disability

truncate ons_census_sw_disability;
copy ons_census_sw_disability from 'c:\dbdata\ons\oa_sw_disability.csv' delimiter ',' csv header;
