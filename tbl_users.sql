-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
  user_key integer NOT NULL,
  responsibility_code integer,
  id character varying(20),
  number_of_claims_returned integer,
  number_of_lost integer,
  mailing_address integer,
  address_offset_1 integer,
  address_offset_2 integer,
  address_offset_3 integer,
  library integer,
  location integer,
  profile integer,
  last_activity_date date,
  date_created date,
  user_access integer,
  status integer,
  empty character(1),
  CONSTRAINT pk_user_key PRIMARY KEY (user_key)
);

-- Index: public.cuix_user_key

-- DROP INDEX public.cuix_user_key;

CREATE UNIQUE INDEX cuix_user_key
  ON public.users
  USING btree
  (user_key);
ALTER TABLE public.users CLUSTER ON cuix_user_key;

-- Index: public.ix_user_created

-- DROP INDEX public.ix_user_created;

CREATE INDEX ix_user_created
  ON public.users
  USING btree
  (date_created);

-- Index: public.ix_user_id

-- DROP INDEX public.ix_user_id;

CREATE INDEX ix_user_id
  ON public.users
  USING btree
  (id COLLATE pg_catalog."default");

-- Index: public.ix_user_profile_library

-- DROP INDEX public.ix_user_profile_library;

CREATE INDEX ix_user_profile_library
  ON public.users
  USING btree
  (profile, library);

