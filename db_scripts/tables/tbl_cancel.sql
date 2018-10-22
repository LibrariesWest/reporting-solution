---------------------------------------------------------------
-- table: cancel
---------------------------------------------------------------

-- drop table cancel
create table cancel
(
  key integer, 
  orderline_key integer, 
  date_created date, 
  date_modified date, 
  date_cancelled date, 
  cancel_reason integer, 
  copies_cancelled integer,
  empty character(1),
  constraint pk_cancel_key primary key (key)
);