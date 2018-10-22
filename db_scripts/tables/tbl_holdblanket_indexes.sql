---------------------------------------------------------------
-- table: holdblanket.  indexes
---------------------------------------------------------------

-- index: cuix_holdblanket_key
-- drop index cuix_holdblanket_key;
create unique index cuix_holdblanket_key on holdblanket using btree (key);
alter table holdblanket cluster on cuix_holdblanket_key;
