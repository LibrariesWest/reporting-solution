-- Table: public.callnum

-- DROP TABLE public.callnum;

CREATE TABLE public.callnum
(
  catalogue_key integer NOT NULL,
  call_sequence integer NOT NULL,
  library integer,
  item_number character varying(100),
  shelving_key character varying(100),
  class character varying(100),
  shadow integer,
  empty character(1),
  CONSTRAINT pk_callnum_catkey_sequence PRIMARY KEY (catalogue_key, call_sequence)
);

-- Index: public.cuix_callnum_catkey_sequence

-- DROP INDEX public.cuix_callnum_catkey_sequence;

CREATE UNIQUE INDEX cuix_callnum_catkey_sequence
  ON public.callnum
  USING btree
  (catalogue_key, call_sequence);
ALTER TABLE public.callnum CLUSTER ON cuix_callnum_catkey_sequence;

