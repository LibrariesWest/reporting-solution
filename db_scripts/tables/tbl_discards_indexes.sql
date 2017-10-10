---------------------------------------------------------------
-- table: discards.  indexes
---------------------------------------------------------------

-- index: ix_discards_itemid
-- drop index ix_discards_itemid;
create index ix_discards_itemid on discards using btree (item_id);