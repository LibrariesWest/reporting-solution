-- Table: public.catalogue

-- DROP TABLE public.catalogue;

CREATE TABLE public.catalogue
(
  catalogue_key integer NOT NULL,
  status integer,
  year_of_publication integer,
  format integer,
  marc integer,
  date_created date,
  date_catalogued date,
  date_modified date,
  create_name character varying(20),
  modify_name character varying(20),
  heading_offset integer,
  marclist_offset integer,
  shadow integer,
  number_of_copies_on_open_order integer,
  marc_file integer,
  empty character(1),
  CONSTRAINT pk_catalogue_key PRIMARY KEY (catalogue_key)
);

-- Index: public.cuix_catalogue_key

-- DROP INDEX public.cuix_catalogue_key;

CREATE UNIQUE INDEX cuix_catalogue_key
  ON public.catalogue
  USING btree
  (catalogue_key);
ALTER TABLE public.catalogue CLUSTER ON cuix_catalogue_key;

