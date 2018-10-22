---------------------------------------------------------------
-- table: invline.  indexes
---------------------------------------------------------------

-- index: cuix_invline_key
-- drop index cuix_invline_key;
create unique index cuix_invline_key on invline using btree (key);
alter table invline cluster on cuix_invline_key;
