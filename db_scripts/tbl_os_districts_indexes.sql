---------------------------------------------------------------
-- table: os_districts.  indexes and geometry
---------------------------------------------------------------

-- geometry: set srid.
select updategeometrysrid('os_districts', 'geom', 27700);

-- index: cuix_wards_code.  a unique clustered index on the ward code.
create unique index cuix_districts_code on os_districts using btree (code);
alter table os_districts cluster on cuix_districts_code;

-- Index: ix_wards_geom.  a spatial index on the geometry.
create index ix_districts_geom on os_districts using gist (geom);