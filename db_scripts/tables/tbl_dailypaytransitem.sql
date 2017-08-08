---------------------------------------------------------------
-- table: dailypaytransitem. 
---------------------------------------------------------------

-- drop table dailypaytransitem;
create table dailypaytransitem
(
  key integer not null,
  dailypaytrans_key integer,
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  bill_num integer,
  bill_reason integer,
  item_type integer,
  description text,
  quantity integer,
  sale_amt numeric,
  tax_amt numeric,
  empty character(1),
  constraint pk_dailypaytransitem_key primary key (key)
);