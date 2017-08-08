---------------------------------------------------------------
-- table: ons_uk_population.  a table to store authority population
---------------------------------------------------------------

-- drop table ons_uk_population
create table ons_uk_population
(
  code character varying(9),
  name character varying(50),
  population integer,
  constraint pk_onsukpopulation_code primary key (code)
);