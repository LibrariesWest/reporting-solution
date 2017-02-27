-- table: os_postcodes
-- drop table os_postcodes;
create table os_postcodes
(
  postcode character varying(8) not null,
  positional_quality_indicator integer,
  eastings numeric,
  northings numeric,
  country_code character varying(9),
  nhs_regional_ha_code character varying(9),
  nhs_ha_code character varying(9),
  admin_county_code character varying(9),
  admin_district_code character varying(9),
  admin_ward_code character varying(9),
  constraint pk_postcode primary key (postcode)
);

-- index: cix_postcode
-- drop index cix_postcode;
create unique index cix_postcode on os_postcodes using btree (postcode);
alter table os_postcodes cluster on cix_postcode;