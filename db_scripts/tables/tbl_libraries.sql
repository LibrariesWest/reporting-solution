---------------------------------------------------------------
-- table: libraries
---------------------------------------------------------------

-- drop table libraries;
create table libraries
(
  code character varying(8) not null,
  name character varying(50),
  type character varying(20),
  public boolean,
  constraint pk_libraries_code primary key (code)
);