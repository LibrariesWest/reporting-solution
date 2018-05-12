---------------------------------------------------------------
-- table: vendcyc.  indexes
---------------------------------------------------------------

-- index: cuix_vendcyc_key
-- drop index cuix_vendcyc_key;
create unique index cuix_vendcyc_key on vendcyc using btree (key);
alter table vendcyc cluster on cuix_vendcyc_key;

-- index: ix_vendcyc_vendkey
-- drop index ix_vendcyc_vendkey;
create index ix_vendcyc_vendkey on vendcyc using btree (vend_key);

-- index: ix_vendcyc_library
-- drop index ix_vendcyc_library;
create index ix_vendcyc_library on vendcyc using btree (library);
