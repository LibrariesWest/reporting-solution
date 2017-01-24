-- Table: public.userxinfo

-- DROP TABLE public.userxinfo;

CREATE TABLE public.userxinfo
(
  "offset" integer,
  entry_number integer,
  entry text,
  empty character(1)
);

-- Index: public.cix_userxinfo_offset_entry

-- DROP INDEX public.cix_userxinfo_offset_entry;

CREATE INDEX cix_userxinfo_offset_entry
  ON public.userxinfo
  USING btree
  ("offset", entry_number);
ALTER TABLE public.userxinfo CLUSTER ON cix_userxinfo_offset_entry;

