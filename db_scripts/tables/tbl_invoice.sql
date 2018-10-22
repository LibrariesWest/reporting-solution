---------------------------------------------------------------
-- table: invoice
---------------------------------------------------------------

-- drop table invoice;
create table invoice
(
  key integer not null,
  vendor_key integer,
  library integer, 
  id character varying (50), 
  date_created date,
  date_modified date, 
  invoice_date date, 
  number_of_copies integer,
  copies_paid integer,
  number_of_lines_paid integer,
  vendor_total_amount numeric,
  total_amount numeric,
  total_amount_linked numeric,
  vendor_total_amount_paid numeric,
  total_amount_paid numeric,
  number_of_lines integer,
  number_of_links integer,
  created_in_fiscal_cycle integer,
  native_subtotal numeric,
  native_subtotal_amt_paid numeric,
  vendor_subtotal numeric,
  vendor_subtotal_amt_paid numeric,
  native_tax_total numeric,
  native_tax_total_amt_paid numeric,
  vendor_tax_total numeric,
  vendor_tax_amt_paid numeric,
  auto_tax_line_type numeric,
  tax_calculated numeric, 
  paid_to_vendor integer,
  tax_structure_policy integer,
  created_by character varying (20),
  modified_by character varying (20),
  date_ready date,
  date_locked date,
  tax_exempt_vendor integer,
  remit_to_vendor numeric,
  empty character(1),
  constraint pk_invoice_key primary key (key)
);