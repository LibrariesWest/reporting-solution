---------------------------------------------------------------
-- table: heading4.  indexes
---------------------------------------------------------------

-- index: cuix_heading4_key
-- drop index cuix_heading4_key;
create unique index cuix_heading4_key on heading4 using btree (key);
alter table heading4 cluster on cuix_heading4_key;