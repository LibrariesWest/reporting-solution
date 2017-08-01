---------------------------------------------------------------
-- table: os_postcodes.  load data
---------------------------------------------------------------

copy os_postcodes from 'c:\dbdata\os\postcodes.csv' delimiter ',' csv;

-- add the geometry column for the table
select AddGeometryColumn ('os_postcodes','geom',27700,'POINT',2);
-- and update the column to store the coordinates
update os_postcodes set geom = ST_SetSRID(ST_MakePoint(eastings, northings), 27700);
select UpdateGeometrySRID('os_postcodes', 'geom', 27700);

-- add an output area lookup (takes about 13 mins)
alter table os_postcodes add column oa11cd character varying(9);
update os_postcodes p
set oa11cd = (
    select oa11cd from ons_oas oa
    where (p.admin_district_code = oa.lad11cd OR p.admin_county_code = oa.lad11cd)
    and st_within(p.geom, oa.geom)
);

-- add a non-whitespace version of the postcode
alter table os_postcodes add column postcode_trim character varying(8);
update os_postcodes set postcode_trim = replace(postcode, ' ', '');