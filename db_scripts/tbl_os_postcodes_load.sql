---------------------------------------------------------------
-- table: os_postcodes.  load data
---------------------------------------------------------------

copy os_postcodes from 'c:\dbdata\os\postcodes.csv' delimiter ',' csv;

-- add the geometry column for the table
select AddGeometryColumn ('os_postcodes','geom',27700,'POINT',2);
-- and update the column to store the coordinates
update os_postcodes set geom = ST_SetSRID(ST_MakePoint(eastings, northings), 27700);
select UpdateGeometrySRID('os_postcodes', 'geom', 27700);