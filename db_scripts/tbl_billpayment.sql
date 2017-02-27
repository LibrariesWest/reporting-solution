-- table: public.billpayment
-- drop table public.billpayment;
create table billpayment
(
  bill_payment_key integer NOT NULL,
  user_key integer,
  bill_number integer,
  payment_type integer,
  payment_date date,
  payment_amount numeric,
  library integer,
  empty character(1),
  constraint pk_billpayment_paymentkey primary key (bill_payment_key)
);

-- index: cuix_billpayment_paymentkey
-- drop index cuix_billpayment_paymentkey;
create unique index cuix_billpayment_paymentkey on billpayment using btree (bill_payment_key);
alter table billpayment cluster on cuix_billpayment_paymentkey;

-- index: ix_billpayment_userkey_billnumber
-- drop index ix_billpayment_userkey_billnumber;
create index ix_billpayment_userkey_billnumber on billpayment using btree (user_key, bill_number);

-- index: ix_billpayment_userkey
-- drop index ix_billpayment_userkey;
create index ix_billpayment_userkey on billpayment using btree (user_key);

-- index: ix_billpayment_billnumber
-- drop index ix_billpayment_billnumber;
create index ix_billpayment_billnumber on billpayment using btree (bill_number);

-- index: ix_billpayment_type
-- drop index ix_billpayment_type;
create index ix_billpayment_type on billpayment using btree (payment_type);

-- index: ix_billpayment_date
-- drop index ix_billpayment_date;
create index ix_billpayment_date on billpayment using btree (payment_date);