-- Table: public.marc

-- DROP TABLE public.marc;

CREATE TABLE public.marc
(
  marc integer NOT NULL,
  tag_position integer NOT NULL,
  absolute_tag integer,
  tag_number character varying(10) NOT NULL,
  tag text,
  empty character(1),
  CONSTRAINT pk_marc_marc_tagpos_tagnum PRIMARY KEY (marc, tag_position, tag_number)
);

-- Index: public.cuix_marc_marc_tagpos_tagnum

-- DROP INDEX public.cuix_marc_marc_tagpos_tagnum;

CREATE UNIQUE INDEX cuix_marc_marc_tagpos_tagnum
  ON public.marc
  USING btree
  (marc, tag_position, tag_number);

-- Index: public.ix_marc_marc_tagnum

-- DROP INDEX public.ix_marc_marc_tagnum;

CREATE INDEX ix_marc_marc_tagnum
  ON public.marc
  USING btree
  (marc, tag_number);

