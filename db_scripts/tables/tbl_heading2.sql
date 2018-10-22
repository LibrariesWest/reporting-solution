---------------------------------------------------------------
-- table: heading2
---------------------------------------------------------------

-- drop table heading1;
create table heading2
(
  key integer not null,
  library integer,
  term text,
  number_of_catalogs integer,
  type integer,
  headdsp_key integer,
  empty character(1),
  constraint pk_heading2_key primary key (key)
);