---------------------------------------------------------------
-- table: holditem.  indexes
---------------------------------------------------------------

-- index: cuix_holditem_catkey_sequence_copy
-- drop index cuix_holditem_catkey_sequence_copy;
create unique index cuix_holditem_catkey_sequence_copy on holditem using btree (catalogue_key, call_sequence, copy_number);
alter table holditem cluster on cuix_holditem_catkey_sequence_copy;
