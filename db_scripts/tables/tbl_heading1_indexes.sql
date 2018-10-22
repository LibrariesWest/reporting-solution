---------------------------------------------------------------
-- table: heading1.  indexes
---------------------------------------------------------------

-- index: cuix_heading1_key
-- drop index cuix_heading1_key;
create unique index cuix_heading1_key on heading1 using btree (key);
alter table heading1 cluster on cuix_heading1_key;