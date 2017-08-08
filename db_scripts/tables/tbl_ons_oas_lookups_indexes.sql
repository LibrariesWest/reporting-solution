---------------------------------------------------------------
-- table: ons_oas_lookups.  indexes and geometry
---------------------------------------------------------------

-- index: cuix_oaslookups_oacode
-- drop index cuix_oaslookups_oacode;
create unique index cuix_oaslookups_oacode on ons_oas_lookups using btree (oa11cd);
alter table ons_oas_lookups cluster on cuix_oaslookups_oacode;

-- index: ix_oaslookups_oa_lsoa
-- drop index ix_oaslookups_oa_lsoa;
create unique index ix_oaslookups_oa_lsoa on ons_oas_lookups using btree (oa11cd, lsoa11cd);
