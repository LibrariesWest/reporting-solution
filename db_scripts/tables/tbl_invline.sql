---------------------------------------------------------------
-- table: invline
---------------------------------------------------------------

-- drop table invline;
create table invline
(
  key integer,
  orderline_fundcyc_key integer, 
  invoice_key integer, 
  library integer, 
  line_number character varying (10), 
  type integer, 
  status integer, 
  number_of_copies integer, 
  vendor_final_price numeric, 
  final_price numeric, 
  number_of_links integer, 
  number_of_copies_linked integer, 
  amount_linked numeric, 
  date_paid date, 
  native_calc_tax numeric, 
  vendor_calc_tax numeric, 
  tax_policy integer, 
  material_type integer,
  empty character(1),
  constraint pk_invline_key primary key (key)
);