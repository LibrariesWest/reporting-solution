------------------------------------------------------
-- table: booksonprescription. indexes
------------------------------------------------------

-- index: cuix_booksonprescription_isbn
-- drop index cuix_booksonprescription_isbn;
create unique index cuix_booksonprescription_isbn on booksonprescription using btree (isbn);
alter table booksonprescription cluster on cuix_booksonprescription_isbn;

-- index: ix_booksonprescription_type
-- drop index ix_booksonprescription_type;
create index ix_booksonprescription_type on booksonprescription using btree (type);
