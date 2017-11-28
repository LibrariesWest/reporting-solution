---------------------------------------------------------------
-- 
---------------------------------------------------------------

-- drop table ons_census_sw_disability
create table ons_census_sw_disability
(
  oa_code character varying(9),
  total integer,
  limited_lot integer,
  limited_little integer,
  not_limited integer
  constraint pk_onsswdisability_code primary key (oa_code)
);