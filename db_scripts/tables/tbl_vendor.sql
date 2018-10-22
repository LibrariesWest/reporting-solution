---------------------------------------------------------------
-- table: vendor
---------------------------------------------------------------

-- drop table vendor;
create table vendor
(
  key integer,
  library integer,
  vendor_id text,
  name_key text, 
  name text,
  number_of_cycles integer,
  copies_invoiced_not_funded integer,
  amount_invoiced_not_funded integer,
  number_of_invoices integer,
  tax_exempt_vendor integer,
  tax_paid_to_vendor integer,
  empty character(1),
  constraint pk_vendor_key primary key (key)
);