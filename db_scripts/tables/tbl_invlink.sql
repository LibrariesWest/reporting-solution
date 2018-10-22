---------------------------------------------------------------
-- table: invlink
---------------------------------------------------------------

-- drop table invlink;
create table invlink
(
  key integer not null,
  invline_key integer, 
  funding_fundcyc_key integer, 
  key_type integer, 
  number_of_copies integer,
  total_amount_linked numeric,
  library integer,
  empty character(1),
  constraint pk_invlink_key primary key (key)
);