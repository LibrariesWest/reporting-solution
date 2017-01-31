-- Table: public.os_postcodes

-- DROP TABLE public.os_postcodes;

CREATE TABLE public.os_postcodes
(
  postcode character varying(8) NOT NULL,
  positional_quality_indicator integer,
  eastings numeric,
  northings numeric,
  country_code character varying(9),
  nhs_regional_ha_code character varying(9),
  nhs_ha_code character varying(9),
  admin_county_code character varying(9),
  admin_district_code character varying(9),
  admin_ward_code character varying(9),
  CONSTRAINT pk_postcode PRIMARY KEY (postcode)
);

-- Index: public.cix_postcode

-- DROP INDEX public.cix_postcode;

CREATE UNIQUE INDEX cix_postcode
  ON public.os_postcodes
  USING btree
  (postcode COLLATE pg_catalog."default");
ALTER TABLE public.os_postcodes CLUSTER ON cix_postcode;

