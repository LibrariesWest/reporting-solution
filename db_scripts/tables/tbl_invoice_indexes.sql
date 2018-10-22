---------------------------------------------------------------
-- table: invlink.  indexes
---------------------------------------------------------------

-- index: cuix_invoice_key
-- drop index cuix_invoice_key;
create unique index cuix_invoice_key on invoice using btree (key);
alter table invoice cluster on cuix_invoice_key;
