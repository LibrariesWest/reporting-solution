---------------------------------------------------------------
-- table: ons_lsoas.  indexes and geometry
---------------------------------------------------------------

-- geometry: set srid.
select updategeometrysrid('ons_lsoas', 'geom', 27700);

-- index: cuix_oas_oacd.  a unique clustered index on the oa code.
create unique index cuix_lsoas_oacd on ons_lsoas using btree (lsoa11cd);
alter table ons_lsoas cluster on cuix_lsoas_oacd;

-- Index: ix_onslsoas_geom.  a spatial index on the geometry.
create index ix_onslsoas_geom on ons_lsoas using gist (geom);