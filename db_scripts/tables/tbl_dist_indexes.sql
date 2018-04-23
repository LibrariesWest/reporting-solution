---------------------------------------------------------------
-- table: dist.  indexes
---------------------------------------------------------------

-- index: cuix_dist_key
-- drop index cuix_dist_key;
create unique index cuix_dist_key on dist using btree (key);
alter table dist cluster on cuix_dist_key;

-- index: ix_dist_orderlinekey
-- drop index ix_dist_orderlinekey;
create index ix_dist_orderlinekey on dist using btree (orderline_key);

-- index: ix_dist_userkey
-- drop index ix_dist_userkey;
create index ix_dist_userkey on dist using btree (user_key);

