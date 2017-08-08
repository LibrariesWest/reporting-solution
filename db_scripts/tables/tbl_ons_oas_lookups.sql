------------------------------------------------------------------------------------
-- table: ons_oas_lookups.  a lookup to find lsoa (and other geographies) from os
------------------------------------------------------------------------------------

-- drop table ons_oas_lookups
create table ons_oas_lookups
(
  oa11cd character varying(9),
  lad16cd character varying(9),
  lad16nm character varying(50),
  lsoa11cd character varying(9),
  lsoa11nm character varying(50),
  msoa11cd character varying(9),
  msoa11nm character varying(50),
  lep17cd1 character varying(9),
  lep17nm1 character varying(50),
  lep17cd2 character varying(9),
  lep17nm2 character varying(50),
  fid integer,
  constraint pk_onsoalookups_code primary key (oa11cd)
);