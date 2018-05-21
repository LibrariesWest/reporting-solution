---------------------------------------------------------------
-- table: vendcyc
---------------------------------------------------------------

-- drop table vendcyc;
create table vendcyc
(
  key integer not null,
  vend_key integer,
  fiscal_cycle character varying (4),
  total_amount_list_price numeric,
  total_amount_ordered numeric,
  amount_ordered numeric,
  amount_funded integer,
  amount_invoiced_funded integer,
  total_paid numeric, 
  deposit_encumbrance_margin integer,
  ordered integer,
  received integer,
  average_days_to_receive integer,
  claim_period integer,
  cancellation_period integer,
  paid integer,
  invoiced integer,
  orders integer,
  cancelled integer,
  claims_sent integer,
  items_claimed integer,
  discount_type integer,
  quantity_1 integer,
  quantity_2 integer,
  quantity_3 integer,
  quantity_4 integer,
  quantity_5 integer,
  discount_1 integer,
  discount_2 integer,
  discount_3 integer,
  discount_4 integer,
  discount_5 integer,
  library integer,
  total_deposited integer,
  empty character(1),
  constraint pk_vendcyc_key primary key (key)
);