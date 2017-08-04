---------------------------------------------------------------
-- table: os_postcodes.  indexes
---------------------------------------------------------------

-- index: cuix_ospostcodes_postcode
-- drop index cuix_ospostcodes_postcode;
create unique index cuix_ospostcodes_postcode on os_postcodes using btree (postcode);
alter table os_postcodes cluster on cix_postcode;

-- index: uix_ospostcodes_postcodetrim
-- drop index uix_ospostcodes_postcodetrim;
create unique index uix_ospostcodes_postcodetrim on os_postcodes using btree (postcode_trim);

-- index: ix_ospostcodes_oa11cd
-- drop index ix_ospostcodes_oa11cd;
create index ix_ospostcodes_oa11cd on os_postcodes using btree (oa11cd);

-- index: ix_ospostcodes_admindistrictcode
-- drop index ix_ospostcodes_admindistrictcode;
create index ix_ospostcodes_admindistrictcode on os_postcodes using btree (admin_district_code);

-- index: ix_ospostcodes_admincountycode
-- drop index ix_ospostcodes_admincountycode;
create index ix_ospostcodes_admincountycode on os_postcodes using btree (admin_county_code);

-- index: ix_ospostcodes_adminwardcode
-- drop index ix_ospostcodes_adminwardcode;
create index ix_ospostcodes_adminwardcode on os_postcodes using btree (admin_ward_code);

-- index: ix_ospostcodes_geom.  a spatial index on the geometry.
-- drop index ix_ospostcodes_geom;
create index ix_ospostcodes_geom ON os_postcodes using gist (geom);