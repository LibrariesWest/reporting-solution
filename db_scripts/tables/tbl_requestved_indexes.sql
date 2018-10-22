---------------------------------------------------------------
-- table: requestved.  indexes
---------------------------------------------------------------

-- index: cix_requestved_offset
-- drop index cix_requestved_offset;
create unique index cix_requestved_offset on requestved using btree ("offset");
alter table requestved cluster on cix_requestved_offset;
