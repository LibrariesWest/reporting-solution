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