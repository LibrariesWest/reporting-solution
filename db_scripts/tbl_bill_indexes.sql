---------------------------------------------------------------
-- index: cuix_bill_userkey_billnumber
---------------------------------------------------------------

-- drop index cuix_bill_userkey_billnumber;
create unique index cuix_bill_userkey_billnumber on bill using btree (user_key, bill_number);
alter table bill cluster on cuix_bill_userkey_billnumber;

-- index: ix_bill_catkey_sequence_copy
-- drop index ix_bill_catkey_sequence_copy;
create index ix_bill_catkey_sequence_copy on bill using btree (catalogue_key, call_sequence, copy_number);

-- index: ix_bill_userkey
-- drop index ix_bill_userkey;
create index ix_bill_userkey on bill using btree (user_key);

-- index: ix_bill_library
-- drop index ix_bill_library;
create index ix_bill_library on bill using btree (library);

-- index: ix_bill_date
-- drop index public.ix_bill_date;
create index ix_bill_date on bill using btree (date_billed);

-- index: ix_bill_reason
-- drop index ix_bill_reason;
create index ix_bill_reason on bill using btree (reason);