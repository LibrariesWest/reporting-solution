---------------------------------------------------------------
-- table: os_counties.  indexes and geometry
---------------------------------------------------------------

-- geometry: set srid.
select updategeometrysrid('os_counties', 'geom', 27700);

-- index: cuix_wards_code.  a unique clustered index on the ward code.
create unique index cuix_counties_code on os_counties using btree (code);
alter table os_counties cluster on cuix_counties_code;

-- Index: ix_wards_geom.  a spatial index on the geometry.
create index ix_counties_geom on os_counties using gist (geom);