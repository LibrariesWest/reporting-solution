-- Table: public.policy

-- DROP TABLE public.policy;

CREATE TABLE public.policy
(
  policy_number integer,
  policy_type character varying(40),
  policy_name character varying(40),
  empty character(1)
);

-- Index: public.cix_type_number

-- DROP INDEX public.cix_type_number;

CREATE INDEX cix_type_number
  ON public.policy
  USING btree
  (policy_type COLLATE pg_catalog."default", policy_number);
ALTER TABLE public.policy CLUSTER ON cix_type_number;

-- Index: public.ix_policy_name

-- DROP INDEX public.ix_policy_name;

CREATE INDEX ix_policy_name
  ON public.policy
  USING btree
  (policy_name COLLATE pg_catalog."default");

-- Index: public.ix_policy_type

-- DROP INDEX public.ix_policy_type;

CREATE INDEX ix_policy_type
  ON public.policy
  USING btree
  (policy_type COLLATE pg_catalog."default");

