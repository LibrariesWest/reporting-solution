-- table: marc
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

-- index: ix_marc_marc
-- drop index ix_marc_marc;
create index ix_marc_marc on marc using btree (marc);

-- index: cuix_marc_marc_tagpos_tagnum
-- drop index cuix_marc_marc_tagpos_tagnum;
create unique index cuix_marc_marc_tagpos_tagnum on marc using btree (marc, tag_position, tag_number);

-- index: ix_marc_marc_tagnum
-- drop index ix_marc_marc_tagnum;
create index ix_marc_marc_tagnum on marc using btree (marc, tag_number);