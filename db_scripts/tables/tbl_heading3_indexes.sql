---------------------------------------------------------------
-- table: heading3.  indexes
---------------------------------------------------------------

-- index: cuix_heading3_key
-- drop index cuix_heading3_key;
create unique index cuix_heading3_key on heading3 using btree (key);
alter table heading3 cluster on cuix_heading3_key;