---------------------------------------------------------------
-- table: orders
---------------------------------------------------------------

-- drop table orders;
create table orders
(
  key integer not null,
  vendcyc_key integer,
  library integer,
  fiscal_cycle character varying (4),
  id character varying (10),
  date_created date,
  date_modified date,
  date_to_claim date, 
  date_to_cancel date,
  last_number integer,
  date_ready date,
  date_mailed date,
  ordered integer,
  invoiced integer,
  paid integer,
  received integer,
  claimed integer,
  cancelled integer,
  number_of_line_items integer,
  amount_ordered numeric,
  amount_funded numeric,
  amount_invoiced numeric,
  total_amount_paid numeric,
  type integer,
  extended_info_offset integer
  empty character(1),
  constraint pk_orders_key primary key (key)
);