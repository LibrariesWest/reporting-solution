---------------------------------------------------------------
-- table: vendor.  indexes
---------------------------------------------------------------

-- index: cuix_vendor_key
-- drop index cuix_vendor_key;
create unique index cuix_vendor_key on vendor using btree (key);
alter table vendor cluster on cuix_vendor_key;