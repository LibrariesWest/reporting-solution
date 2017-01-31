---------------------------------------------------------------
-- TABLE: bill
---------------------------------------------------------------

CREATE TABLE public.bill
(
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  user_key integer NOT NULL,
  bill_number integer NOT NULL,
  library integer,
  amount_billed numeric,
  date_billed date,
  reason integer,
  paid_in_full_flag boolean,
  tax numeric,
  empty character(1),
  CONSTRAINT pk_bill_userkey_billnumber PRIMARY KEY (user_key, bill_number)
);

-- Index: cuix_bill_userkey_billnumber
-- DROP INDEX cuix_bill_userkey_billnumber;
CREATE UNIQUE INDEX cuix_bill_userkey_billnumber ON bill USING btree (user_key, bill_number);
ALTER TABLE bill CLUSTER ON cuix_bill_userkey_billnumber;

-- Index: ix_bill_catkey_sequence_copy
-- DROP INDEX ix_bill_catkey_sequence_copy;
CREATE INDEX ix_bill_catkey_sequence_copy ON bill USING btree (catalogue_key, call_sequence, copy_number);

-- Index: public.ix_bill_date
-- DROP INDEX public.ix_bill_date;

CREATE INDEX ix_bill_date ON bill USING btree (date_billed);

-- Index: public.ix_bill_userkey
-- DROP INDEX ix_bill_userkey;

CREATE INDEX ix_bill_userkey ON bill USING btree (user_key);
