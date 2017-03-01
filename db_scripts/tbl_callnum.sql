---------------------------------------------------------------
-- table: callnum
---------------------------------------------------------------

-- drop table callnum;
create table callnum
(
  catalogue_key integer not null,
  call_sequence integer not null,
  library integer,
  item_number character varying(100),
  shelving_key character varying(100),
  class character varying(100),
  shadow integer,
  empty character(1),
  constraint pk_callnum_catkey_sequence primary key (catalogue_key, call_sequence)
);