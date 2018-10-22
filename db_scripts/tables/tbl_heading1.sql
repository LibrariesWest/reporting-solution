---------------------------------------------------------------
-- table: heading1
---------------------------------------------------------------

-- drop table heading1;
create table heading1
(
  key integer not null,
  library integer,
  term text,
  number_of_catalogs integer,
  type integer,
  headdsp_key integer,
  empty character(1),
  constraint pk_heading1_key primary key (key)
);