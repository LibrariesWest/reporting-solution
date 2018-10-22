---------------------------------------------------------------
-- table: invlink.  indexes
---------------------------------------------------------------

-- index: cuix_invlink_key
-- drop index cuix_invlink_key;
create unique index cuix_invlink_key on invlink using btree (key);
alter table invlink cluster on cuix_invlink_key;
