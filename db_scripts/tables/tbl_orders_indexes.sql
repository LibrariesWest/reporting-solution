---------------------------------------------------------------
-- table: orders.  indexes
---------------------------------------------------------------

-- index: cuix_orders_key
-- drop index cuix_orders_key;
create unique index cuix_orders_key on orders using btree (key);
alter table orders cluster on cuix_orders_key;

