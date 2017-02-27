-- table: dailypaytransamt
-- drop table dailypaytransamt;
create table dailypaytransamt
(
  key integer not null,
  dailypaytrans_key integer,
  payment_type integer,
  amount numeric,
  bcctxinfo_key integer,
  empty character(1),
  constraint pk_dailypaytransamt_key primary key (key)
);

-- index: cuix_dailypaytransamt_key
-- drop index cuix_dailypaytransamt_key;
create unique index cuix_dailypaytransamt_key on dailypaytransamt using btree (key);
alter table dailypaytransamt cluster on cuix_dailypaytransamt_key;

-- index: ix_dailypaytransamt_dailypaytranskey
-- drop index ix_dailypaytransamt_dailypaytranskey;
create index ix_dailypaytransamt_dailypaytranskey on dailypaytransamt using btree (dailypaytrans_key);

-- index: ix_dailypaytransamt_paymenttype
-- drop index ix_dailypaytransamt_paymenttype;
create index ix_dailypaytransamt_paymenttype on dailypaytransamt using btree (payment_type);