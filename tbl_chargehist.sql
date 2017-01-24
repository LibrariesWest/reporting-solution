-- Table: public.chargehist

-- DROP TABLE public.chargehist;

CREATE TABLE public.chargehist
(
  key integer NOT NULL,
  user_key integer,
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  chargehist_number integer,
  library integer,
  date_charged date,
  date_renewed date,
  number_of_renewals integer,
  location integer,
  accrued_fine numeric,
  overdue integer,
  date_time_discharged date,
  discharge_library integer,
  number_of_unseen_renewals integer,
  empty character(1),
  CONSTRAINT pk_chargehist_key PRIMARY KEY (key)
);

-- Index: public.cuix_chargehist_key

-- DROP INDEX public.cuix_chargehist_key;

CREATE UNIQUE INDEX cuix_chargehist_key
  ON public.chargehist
  USING btree
  (key);
ALTER TABLE public.chargehist CLUSTER ON cuix_chargehist_key;

-- Index: public.ix_chargehist_catkey_sequence_copy

-- DROP INDEX public.ix_chargehist_catkey_sequence_copy;

CREATE INDEX ix_chargehist_catkey_sequence_copy
  ON public.chargehist
  USING btree
  (catalogue_key, call_sequence, copy_number);

-- Index: public.ix_chargehist_library

-- DROP INDEX public.ix_chargehist_library;

CREATE INDEX ix_chargehist_library
  ON public.chargehist
  USING btree
  (library);

-- Index: public.ix_chargehist_userkey

-- DROP INDEX public.ix_chargehist_userkey;

CREATE INDEX ix_chargehist_userkey
  ON public.chargehist
  USING btree
  (user_key);

