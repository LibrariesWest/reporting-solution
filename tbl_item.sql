-- Table: public.item

-- DROP TABLE public.item;

CREATE TABLE public.item
(
  catalogue_key integer NOT NULL,
  call_sequence integer NOT NULL,
  copy_number integer NOT NULL,
  id character varying(64),
  library integer,
  home_location integer,
  current_location integer,
  last_activity_date date,
  date_created date,
  type integer,
  transit_status integer,
  reserve_status integer,
  price numeric,
  category1 integer,
  category2 integer,
  last_user_key integer,
  date_last_charged date,
  shadow integer,
  empty character(1),
  CONSTRAINT pk_item_catkey_sequence_copy PRIMARY KEY (catalogue_key, call_sequence, copy_number)
);

-- Index: public.cuix_item_catkey_sequence_copy

-- DROP INDEX public.cuix_item_catkey_sequence_copy;

CREATE UNIQUE INDEX cuix_item_catkey_sequence_copy
  ON public.item
  USING btree
  (catalogue_key, call_sequence, copy_number);
ALTER TABLE public.item CLUSTER ON cuix_item_catkey_sequence_copy;

-- Index: public.ix_item_id

-- DROP INDEX public.ix_item_id;

CREATE UNIQUE INDEX ix_item_id
  ON public.item
  USING btree
  (id COLLATE pg_catalog."default");

-- Index: public.ix_item_library

-- DROP INDEX public.ix_item_library;

CREATE INDEX ix_item_library
  ON public.item
  USING btree
  (library);

-- Index: public.ix_item_type

-- DROP INDEX public.ix_item_type;

CREATE INDEX ix_item_type
  ON public.item
  USING btree
  (type);

