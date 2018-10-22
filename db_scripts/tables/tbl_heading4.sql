---------------------------------------------------------------
-- table: heading4
---------------------------------------------------------------

-- drop table heading4;
create table heading4
(
  key integer not null,
  library integer,
  term text,
  number_of_catalogs integer,
  type integer,
  headdsp_key integer,
  empty character(1),
  constraint pk_heading4_key primary key (key)
);