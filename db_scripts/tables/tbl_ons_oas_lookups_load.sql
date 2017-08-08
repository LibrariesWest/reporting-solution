---------------------------------------------------------------
-- table: ons_oas_lookups.  a lookup to find lsoa from os
---------------------------------------------------------------

truncate ons_oas_lookups;
copy ons_oas_lookups from 'c:\dbdata\ons\oa-lookups.csv' delimiter ',' csv header;
