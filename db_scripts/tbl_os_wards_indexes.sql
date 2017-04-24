---------------------------------------------------------------
-- table: os_wards.  indexes and geometry
---------------------------------------------------------------

-- geometry: set srid.
select updategeometrysrid('os_wards', 'geom', 27700);

-- index: cuix_wards_code.  a unique clustered index on the ward code.
create unique index cuix_wards_code on os_wards using btree (code);
alter table os_wards cluster on cuix_wards_code;

-- Index: ix_wards_geom.  a spatial index on the geometry.
create index ix_wards_geom on os_wards using gist (geom);