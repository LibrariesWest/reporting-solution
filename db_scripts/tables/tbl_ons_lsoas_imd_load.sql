---------------------------------------------------------------
-- table: ons_lsoas_imd
---------------------------------------------------------------

truncate ons_lsoas_imd;
copy ons_lsoas_imd from 'c:\dbdata\ons\lsoa-imd.csv' delimiter ',' csv header;