---------------------------------------------------------------
-- table: request.  indexes
---------------------------------------------------------------

-- index: cuix_request_key
-- drop index cuix_request_key;
create unique index cuix_request_key on request using btree (key);
alter table request cluster on cuix_request_key;
