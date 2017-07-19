---------------------------------------------------------------
-- table: os_postcodes.  indexes
---------------------------------------------------------------

-- index: cix_postcode
-- drop index cix_postcode;
create unique index cix_ospostcodes_postcode on os_postcodes using btree (postcode);
alter table os_postcodes cluster on cix_postcode;

-- index: uix_postcodes_geom.  a spatial index on the geometry.
create index ix_ospostcodes_geom ON os_postcodes using gist (geom);