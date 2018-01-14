---------------------------------------------------------------
-- table: libraries. indexes
---------------------------------------------------------------

-- index: cuix_libraries_code
-- drop index cuix_libraries_code;
create unique index cuix_libraries_code on libraries using btree (code);
alter table libraries cluster on cuix_libraries_code;
