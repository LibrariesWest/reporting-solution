-- Table: public.billpayment

-- DROP TABLE public.billpayment;

CREATE TABLE public.billpayment
(
  bill_payment_key integer NOT NULL,
  user_key integer,
  bill_number integer,
  payment_type integer,
  payment_date date,
  payment_amount numeric,
  library integer,
  empty character(1),
  CONSTRAINT pk_billpayment_paymentkey PRIMARY KEY (bill_payment_key)
)
WITH (
  OIDS=FALSE
);

-- Index: public.cuix_billpayment_paymentkey

-- DROP INDEX public.cuix_billpayment_paymentkey;

CREATE UNIQUE INDEX cuix_billpayment_paymentkey
  ON public.billpayment
  USING btree
  (bill_payment_key);
ALTER TABLE public.billpayment CLUSTER ON cuix_billpayment_paymentkey;

-- Index: public.ix_billpayment_billnumber

-- DROP INDEX public.ix_billpayment_billnumber;

CREATE INDEX ix_billpayment_billnumber
  ON public.billpayment
  USING btree
  (bill_number);

-- Index: public.ix_billpayment_date

-- DROP INDEX public.ix_billpayment_date;

CREATE INDEX ix_billpayment_date
  ON public.billpayment
  USING btree
  (payment_date);

-- Index: public.ix_billpayment_userkey

-- DROP INDEX public.ix_billpayment_userkey;

CREATE INDEX ix_billpayment_userkey
  ON public.billpayment
  USING btree
  (user_key);

-- Index: public.ix_billpayment_userkey_billnumber

-- DROP INDEX public.ix_billpayment_userkey_billnumber;

CREATE INDEX ix_billpayment_userkey_billnumber
  ON public.billpayment
  USING btree
  (user_key, bill_number);

