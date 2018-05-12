---------------------------------------------------------------
-- table: billpayment
---------------------------------------------------------------

-- drop table billpayment;
create table billpayment
(
  bill_payment_key integer not null,
  user_key integer,
  bill_number integer,
  payment_type integer,
  payment_date timestamp,
  payment_amount numeric,
  library integer,
  empty character(1),
  constraint pk_billpayment_paymentkey primary key (bill_payment_key)
);