---------------------------------------------------------------
-- table: dailypaytrans.  indexes
---------------------------------------------------------------

-- index: cuix_dailypaytrans_key
-- drop index cuix_dailypaytrans_key;
create unique index cuix_dailypaytrans_key on dailypaytrans using btree (key);
alter table dailypaytrans cluster on cuix_dailypaytrans_key;

-- index: ix_dailypaytrans_timestamp
-- drop index ix_dailypaytrans_timestamp;
create index ix_dailypaytrans_timestamp on dailypaytrans using btree (timestamp);

-- index: ix_dailypaytrans_library
-- drop index ix_dailypaytrans_library;
create index ix_dailypaytrans_library on dailypaytrans using btree (library_id);

-- Index: ix_dailypaytrans_station
-- drop index ix_dailypaytrans_station;
create index ix_dailypaytrans_station on dailypaytrans using btree (station_id);

-- Index: ix_dailypaytrans_patron
-- drop index ix_dailypaytrans_patron;
create index ix_dailypaytrans_patron on dailypaytrans using btree (patron);

-- index: ix_dailypaytrans_transactiontype
-- drop index ix_dailypaytrans_transactiontype;
create index ix_dailypaytrans_transactiontype on dailypaytrans using btree (transaction_type);