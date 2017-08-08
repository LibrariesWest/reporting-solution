---------------------------------------------------------------
-- table: charge.  indexes
---------------------------------------------------------------

-- index: cuix_charge_key
-- drop index cuix_charge_key;
create unique index cuix_charge_key on charge using btree (key);
alter table charge cluster on cuix_charge_key;

-- index: ix_charge_userkey
-- drop index ix_charge_userkey;
create index ix_charge_userkey on charge using btree (user_key);

-- Index: public.ix_charge_catkey_sequence_copy
-- drop index ix_charge_catkey_sequence_copy;
create index ix_charge_catkey_sequence_copy on charge using btree (catalogue_key, call_sequence, copy_number);

-- index: ix_charge_library
-- drop index ix_charge_library;
create index ix_charge_library on charge using btree (library);

-- index: ix_charge_datecharged
-- drop index ix_charge_datecharged;
create index ix_charge_datecharged on charge using btree (date_charged);

-- index: ix_charge_location
-- drop index ix_charge_location;
create index ix_charge_location on charge using btree (location);

-- index: ix_charge_status
-- drop index ix_charge_status;
create index ix_charge_status on charge using btree (status);