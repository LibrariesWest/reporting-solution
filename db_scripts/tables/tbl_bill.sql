---------------------------------------------------------------
-- table: bill
---------------------------------------------------------------

-- drop table bill
create table bill
(
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  user_key integer not null,
  bill_number integer not null,
  library integer,
  amount_billed numeric,
  date_billed timestamp,
  reason integer,
  paid_in_full_flag boolean,
  tax numeric,
  empty character(1),
  constraint pk_bill_userkey_billnumber primary key (user_key, bill_number)
);