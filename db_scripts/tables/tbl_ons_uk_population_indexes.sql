---------------------------------------------------------------
-- table: ons_uk_population. indexes
---------------------------------------------------------------

-- index: cuix_onsukpopulation_code.  a unique clustered index on the ons code.
create unique index cuix_onsukpopulation_code on ons_uk_population using btree (code);
alter table ons_uk_population cluster on cuix_onsukpopulation_code;