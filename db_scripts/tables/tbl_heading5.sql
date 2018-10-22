---------------------------------------------------------------
-- table: heading5
---------------------------------------------------------------

-- drop table heading5;
create table heading5
(
  key integer not null,
  library integer,
  term text,
  number_of_catalogs integer,
  type integer,
  headdsp_key integer,
  empty character(1),
  constraint pk_heading5_key primary key (key)
);