---------------------------------------------------------------
-- table: userxinfo.  indexes
---------------------------------------------------------------

-- index: cix_userxinfo_offset_entry
-- drop index cix_userxinfo_offset_entry;
create index cix_userxinfo_offset_entry on userxinfo using btree ("offset", entry_number);
alter table userxinfo cluster on cix_userxinfo_offset_entry;

-- index: ix_userxinfo_offset
-- drop index ix_userxinfo_offset;
create index ix_userxinfo_offset on userxinfo using btree ("offset");

-- index: ix_userxinfo_entrynumber
-- drop index ix_userxinfo_entrynumber;
create index ix_userxinfo_entrynumber on userxinfo using btree (entry_number);