---------------------------------------------------------------
-- table: item.  indexes
---------------------------------------------------------------

-- index: cuix_item_catkey_sequence_copy
-- drop index cuix_item_catkey_sequence_copy;
create unique index cuix_item_catkey_sequence_copy on item using btree (catalogue_key, call_sequence, copy_number);
alter table item cluster on cuix_item_catkey_sequence_copy;

-- index: ix_item_id
-- drop index ix_item_id;
create unique index ix_item_id on item using btree (id);

-- index: ix_item_library
-- drop index ix_item_library;
create index ix_item_library on item using btree (library);

-- index: ix_item_homelocation
-- drop index ix_item_homelocation;
create index ix_item_homelocation on item using btree (home_location);

-- index: ix_item_homelocation
-- drop index ix_item_homelocation;
create index ix_item_currentlocation on item using btree (current_location);

-- index: ix_item_lastactivity
-- drop index ix_item_lastactivity;
create index ix_item_lastactivity on item using btree (last_activity_date);

-- index: ix_item_type
-- drop index ix_item_type;
create index ix_item_type on item using btree (type);

-- index: ix_item_transitstatus
-- drop index ix_item_transitstatus;
create index ix_item_transitstatus on item using btree (transit_status);

-- index: ix_item_reservestatus
-- drop index ix_item_reservestatus;
create index ix_item_reservestatus on item using btree (reserve_status);