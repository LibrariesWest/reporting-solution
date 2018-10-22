---------------------------------------------------------------
-- table: heading3
---------------------------------------------------------------

-- drop table heading1;
create table heading3
(
  key integer not null,
  library integer,
  term text,
  number_of_catalogs integer,
  type integer,
  headdsp_key integer,
  empty character(1),
  constraint pk_heading3_key primary key (key)
);