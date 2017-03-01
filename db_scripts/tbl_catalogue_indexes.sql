---------------------------------------------------------------
-- index: cuix_catalogue_key
---------------------------------------------------------------
-- drop index cuix_catalogue_key;
create unique index cuix_catalogue_key on catalogue using btree (catalogue_key);
alter table catalogue cluster on cuix_catalogue_key;

-- index: ix_catalogue_key_marc
-- drop index ix_catalogue_key_marc;
create index ix_catalogue_key_marc on catalogue using btree (catalogue_key, marc);