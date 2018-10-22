---------------------------------------------------------------
-- table: orderline.  indexes
---------------------------------------------------------------

-- index: cuix_orderline_key
-- drop index cuix_orderline_key;
create unique index cuix_orderline_key on orderline using btree (key);
alter table orderline cluster on cuix_orderline_key;

