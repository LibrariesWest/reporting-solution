---------------------------------------------------------------
-- table: marc
---------------------------------------------------------------

-- drop table marc;
create table marc
(
  marc integer not null,
  tag_position integer not null,
  absolute_tag integer,
  tag_number character varying(5) not null,
  tag text,
  empty character(1),
  constraint pk_marc_marc_tagpos_tagnum primary key (marc, tag_position, tag_number)
);