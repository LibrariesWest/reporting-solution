---------------------------------------------------------------
-- table: fund
---------------------------------------------------------------

-- drop table fund;
create table fund
(
  key integer not null,
  library integer,
  id character varying (20),
  name_key character varying (200),
  account_number character varying (50),
  name character varying(200),
  extended_offset integer,
  number_of_cycles integer,
  level_1 integer,
  level_2 integer,
  level_3 integer,
  level_4 integer,
  level_5 integer,
  level_6 integer, 
  empty character(1),
  constraint pk_dist_key primary key (key)
);