-- Table: public.transit

-- DROP TABLE public.transit;

CREATE TABLE public.transit
(
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  hold_key integer,
  date_time_transited date,
  library integer,
  from_library integer,
  to_library integer,
  reason_needed integer,
  empty character(1)
);

-- Index: public.cix_transit_date

-- DROP INDEX public.cix_transit_date;

CREATE INDEX cix_transit_date
  ON public.transit
  USING btree
  (date_time_transited);

-- Index: public.ix_transit_fromlibrary

-- DROP INDEX public.ix_transit_fromlibrary;

CREATE INDEX ix_transit_fromlibrary
  ON public.transit
  USING btree
  (from_library);

-- Index: public.ix_transit_library

-- DROP INDEX public.ix_transit_library;

CREATE INDEX ix_transit_library
  ON public.transit
  USING btree
  (library);

-- Index: public.ix_transit_tolibrary

-- DROP INDEX public.ix_transit_tolibrary;

CREATE INDEX ix_transit_tolibrary
  ON public.transit
  USING btree
  (to_library);

