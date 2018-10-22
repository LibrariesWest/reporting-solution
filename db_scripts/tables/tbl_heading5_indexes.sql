---------------------------------------------------------------
-- table: heading5.  indexes
---------------------------------------------------------------

-- index: cuix_heading5_key
-- drop index cuix_heading5_key;
create unique index cuix_heading5_key on heading5 using btree (key);
alter table heading5 cluster on cuix_heading5_key;