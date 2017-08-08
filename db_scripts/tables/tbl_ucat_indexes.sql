---------------------------------------------------------------
-- table: ucat.  indexes
---------------------------------------------------------------

-- index: cuix_ucat_ukey_cat
-- drop index cuix_ucat_ukey_cat;
create unique index cuix_ucat_ukey_cat on ucat using btree (user_key, category);
alter table ucat cluster on cuix_ucat_ukey_cat;

-- index: ix_ucat_ukey
-- drop index ix_ucat_ukey;
create index ix_ucat_ukey on ucat using btree (user_key);