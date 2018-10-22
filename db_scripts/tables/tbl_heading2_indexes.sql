---------------------------------------------------------------
-- table: heading2.  indexes
---------------------------------------------------------------

-- index: cuix_heading2_key
-- drop index cuix_heading2_key;
create unique index cuix_heading2_key on heading2 using btree (key);
alter table heading2 cluster on cuix_heading2_key;