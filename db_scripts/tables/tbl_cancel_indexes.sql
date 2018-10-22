------------------------------------------------------
-- table: cancel. indexes
------------------------------------------------------

-- index: cuix_cancel_key
-- drop index cuix_cancel_key;
create unique index cuix_cancel_key on cancel using btree (key);
alter table cancel cluster on cuix_cancel_key;
