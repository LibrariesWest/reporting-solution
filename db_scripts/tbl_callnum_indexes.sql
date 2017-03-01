---------------------------------------------------------------
-- index: cuix_callnum_catkey_sequence
---------------------------------------------------------------

-- drop index cuix_callnum_catkey_sequence;
create unique index cuix_callnum_catkey_sequence on callnum using btree (catalogue_key, call_sequence);
alter table callnum cluster on cuix_callnum_catkey_sequence;