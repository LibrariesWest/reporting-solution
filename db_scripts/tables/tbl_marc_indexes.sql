---------------------------------------------------------------
-- table: marc.  indexes
---------------------------------------------------------------

-- index: ix_marc_marc
-- drop index ix_marc_marc;
create index ix_marc_marc on marc using btree (marc);

-- index: cuix_marc_marc_tagpos_tagnum
-- drop index cuix_marc_marc_tagpos_tagnum;
create unique index cuix_marc_marc_tagpos_tagnum on marc using btree (marc, tag_position, tag_number);

-- index: ix_marc_marc_tagnum
-- drop index ix_marc_marc_tagnum;
create index ix_marc_marc_tagnum on marc using btree (marc, tag_number);