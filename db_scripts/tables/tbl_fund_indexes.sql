---------------------------------------------------------------
-- table: fund.  indexes
---------------------------------------------------------------

-- index: cuix_fund_key
-- drop index cuix_fund_key;
create unique index cuix_fund_key on fund using btree (key);
alter table fund cluster on cuix_fund_key;

-- index: ix_fund_library
-- drop index ix_fund_library;
create index ix_fund_library on fund using btree (library);

-- index: ix_fund_id
-- drop index ix_fund_id;
create index ix_fund_id on fund using btree (id);

-- index: ix_fund_namekey
-- drop index ix_fund_namekey;
create index ix_fund_namekey on fund using btree (name_key);