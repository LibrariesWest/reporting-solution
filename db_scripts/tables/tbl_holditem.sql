---------------------------------------------------------------
-- table: holditem
---------------------------------------------------------------

-- drop table holditem;
create table holditem
(
  catalogue_key integer, 
  call_sequence integer, 
  copy_number integer, 
  hold_key integer,
  empty character(1),
  constraint pk_holditem_catkey_sequence_copy primary key (catalogue_key, call_sequence, copy_number)
);