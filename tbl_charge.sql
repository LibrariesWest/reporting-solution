-- Table: public.charge

-- DROP TABLE public.charge;

CREATE TABLE public.charge
(
  key integer NOT NULL,
  user_key integer,
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  charge_number integer,
  library integer,
  date_charged date,
  date_renewed date,
  number_of_renewals integer,
  location integer,
  accrued_fine numeric,
  overdue integer,
  status integer,
  number_of_unseen_renewals integer,
  empty character(1),
  CONSTRAINT pk_charge_key PRIMARY KEY (key)
);

-- Index: public.cuix_charge_key

-- DROP INDEX public.cuix_charge_key;

CREATE UNIQUE INDEX cuix_charge_key
  ON public.charge
  USING btree
  (key);
ALTER TABLE public.charge CLUSTER ON cuix_charge_key;

-- Index: public.ix_charge_catkey_sequence_copy

-- DROP INDEX public.ix_charge_catkey_sequence_copy;

CREATE INDEX ix_charge_catkey_sequence_copy
  ON public.charge
  USING btree
  (catalogue_key, call_sequence, copy_number);

-- Index: public.ix_charge_library

-- DROP INDEX public.ix_charge_library;

CREATE INDEX ix_charge_library
  ON public.charge
  USING btree
  (library);

-- Index: public.ix_charge_userkey

-- DROP INDEX public.ix_charge_userkey;

CREATE INDEX ix_charge_userkey
  ON public.charge
  USING btree
  (user_key);

