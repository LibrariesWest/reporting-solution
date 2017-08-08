---------------------------------------------------------------
-- table: os_districts.  indexes and geometry
---------------------------------------------------------------

-- geometry: set srid.
select updategeometrysrid('os_districts', 'geom', 27700);

-- index: cuix_osdistricts_code.  a unique clustered index on the ward code.
create unique index cuix_osdistricts_code on os_districts using btree (code);
alter table os_districts cluster on cuix_osdistricts_code;

-- Index: ix_osdistricts_geom.  a spatial index on the geometry.
create index ix_osdistricts_geom on os_districts using gist (geom);