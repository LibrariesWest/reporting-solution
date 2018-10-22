---------------------------------------------------------------
-- table: holdblanket
---------------------------------------------------------------

-- drop table holdblanket;
create table holdblanket
(
  key integer not null, 
  user_key integer, 
  holdblanket_id character varying(20), 
  copies_needed integer, 
  copies_received integer, 
  expiration_date date,
  empty character(1),
  constraint pk_holdblanket_key primary key (key)
);