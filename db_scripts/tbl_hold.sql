-- Table: public.hold

-- DROP TABLE public.hold;

CREATE TABLE public.hold
(
  key integer NOT NULL,
  user_key integer,
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  hold_priority integer,
  item_library integer,
  type character varying(1),
  usergroup_key integer,
  library integer,
  pickup_library integer,
  date_placed date,
  date_expires date,
  date_notified date,
  number_of_notices integer,
  item_available character varying(1),
  recall_status integer,
  hold_status integer,
  inactive_reason integer,
  date_inactive date,
  range integer,
  date_recalled date,
  date_available date,
  date_available_expires date,
  "position" integer,
  date_reordered date,
  client_used integer,
  empty character(1),
  CONSTRAINT pk_hold_key PRIMARY KEY (key)
);

-- Index: public.cuix_hold_key

-- DROP INDEX public.cuix_hold_key;

CREATE UNIQUE INDEX cuix_hold_key
  ON public.hold
  USING btree
  (key);
ALTER TABLE public.hold CLUSTER ON cuix_hold_key;

-- Index: public.ix_hold_catkey_sequence_copy

-- DROP INDEX public.ix_hold_catkey_sequence_copy;

CREATE INDEX ix_hold_catkey_sequence_copy
  ON public.hold
  USING btree
  (catalogue_key, call_sequence, copy_number);

-- Index: public.ix_hold_itemlibrary

-- DROP INDEX public.ix_hold_itemlibrary;

CREATE INDEX ix_hold_itemlibrary
  ON public.hold
  USING btree
  (item_library);

-- Index: public.ix_hold_pickuplibrary

-- DROP INDEX public.ix_hold_pickuplibrary;

CREATE INDEX ix_hold_pickuplibrary
  ON public.hold
  USING btree
  (pickup_library);

-- Index: public.ix_hold_userkey

-- DROP INDEX public.ix_hold_userkey;

CREATE INDEX ix_hold_userkey
  ON public.hold
  USING btree
  (user_key);

