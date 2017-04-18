---------------------------------------------------------------
-- table: ons_oas.  indexes and geometry
---------------------------------------------------------------

-- geometry: set srid.
select updategeometrysrid('ons_oas', 'geom', 27700);

-- index: cuix_oas_oacd.  a unique clustered index on the oa code.
create unique index cuix_oas_oacd on ons_oas using btree (oa11cd);
alter table ons_oas cluster on cuix_oas_oacd;

-- index: ix_oas_oalacd.  a unique index on the oa code.
create index ix_oas_oalacd on ons_oas using btree (lad11cd);

-- Index: ix_onsoas_geom.  a spatial index on the geometry.
create index ix_onsoas_geom on ons_oas using gist (geom);