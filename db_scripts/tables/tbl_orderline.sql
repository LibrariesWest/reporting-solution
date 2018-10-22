---------------------------------------------------------------
-- table: orderline
---------------------------------------------------------------

-- drop table orderline;
create table orderline
(
  key integer not null,
  order_key integer,
  user_key integer,
  link_key integer,
  catalogue_key integer,
  call_sequence integer,
  order_number integer,
  library integer,
  date_ordered date,
  vendor_unit_list_price numeric,
  unit_list_price numeric,
  discount integer,
  number_of_copies integer,
  vendor_extended_price numeric,
  extended_price numeric,
  unit_price numeric,
  amount_encumbered numeric,
  amount_invoiced numeric, 
  total_paid numeric,
  received integer,
  invoiced integer,
  paid integer,
  funded integer,
  loaded integer,
  cancelled integer,
  extended_info integer,
  claimed integer,
  delvered integer, 
  holdings_dists integer,
  category1 integer,
  category2 integer,
  category3 integer,
  category4 integer,
  material_type integer,
  empty character(1),
  constraint pk_orderline_key primary key (key)
);