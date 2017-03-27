---------------------------------------------------------------
-- table: chargehist.  indexes
---------------------------------------------------------------

-- index: cuix_chargehist_key
-- drop index cuix_chargehist_key;
create unique index cuix_chargehist_key on chargehist using btree (key);
alter table chargehist cluster on cuix_chargehist_key;

-- index: ix_chargehist_userkey
-- drop index ix_chargehist_userkey;
create index ix_chargehist_userkey on chargehist using btree (user_key);

-- index: ix_chargehist_catkey_sequence_copy
-- drop index ix_chargehist_catkey_sequence_copy;
create index ix_chargehist_catkey_sequence_copy on chargehist using btree (catalogue_key, call_sequence, copy_number);

-- index: ix_chargehist_library
-- drop index ix_chargehist_library;
create index ix_chargehist_library on chargehist using btree (library);

-- index: ix_chargehist_datecharged
-- drop index ix_chargehist_datecharged;
create index ix_chargehist_datecharged on chargehist using btree (date_charged);