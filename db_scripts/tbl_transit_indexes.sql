---------------------------------------------------------------
-- table: transit.  indexes
---------------------------------------------------------------

-- index: cix_transit_date
-- drop index cix_transit_date;
create index cix_transit_date on transit using btree (date_time_transited);

-- index: cuix_transit_catkey_callsequence_copynumber
-- drop index cuix_transit_catkey_callsequence_copynumber;
create unique index cuix_transit_catkey_callsequence_copynumber on transit using btree (catalogue_key, call_sequence, copy_number);
alter table transit cluster on cuix_transit_catkey_callsequence_copynumber;

-- index: ix_transit_holdkey
-- drop index ix_transit_holdkey;
create index ix_transit_holdkey on transit using btree (hold_key);

-- index: ix_transit_datetransited
-- drop index ix_transit_datetransited;
create index ix_transit_datetransited on transit using btree (date_time_transited);

-- index: ix_transit_library
-- drop index ix_transit_library;
create index ix_transit_library on transit using btree (library);

-- index: ix_transit_fromlibrary
-- drop index ix_transit_fromlibrary;
create index ix_transit_fromlibrary on transit using btree (from_library);

-- index: ix_transit_tolibrary
-- drop index ix_transit_tolibrary;
create index ix_transit_tolibrary on transit using btree (to_library);

-- index: ix_transit_reasonneeded
-- drop index ix_transit_reasonneeded;
create index ix_transit_reasonneeded on transit using btree (reason_needed);