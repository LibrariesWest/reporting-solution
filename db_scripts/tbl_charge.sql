-- table: charge
-- drop table charge;
create table charge
(
  key integer not null,
  user_key integer,
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  charge_number integer,
  library integer,
  date_charged date,
  date_renewed date,
  number_of_renewals integer,
  location integer,
  accrued_fine numeric,
  overdue integer,
  status integer,
  number_of_unseen_renewals integer,
  empty character(1),
  constraint pk_charge_key primary key (key)
);

-- index: cuix_charge_key
-- drop index cuix_charge_key;
create unique index cuix_charge_key on charge using btree (key);
alter table charge cluster on cuix_charge_key;

-- index: ix_charge_userkey
-- drop index ix_charge_userkey;
create index ix_charge_userkey on charge using btree (user_key);

-- Index: public.ix_charge_catkey_sequence_copy
-- drop index ix_charge_catkey_sequence_copy;
create index ix_charge_catkey_sequence_copy on charge using btree (catalogue_key, call_sequence, copy_number);

-- index: ix_charge_library
-- drop index ix_charge_library;
create index ix_charge_library on charge using btree (library);

-- index: ix_charge_datecharged
-- drop index ix_charge_datecharged;
create index ix_charge_datecharged on charge using btree (date_charged);