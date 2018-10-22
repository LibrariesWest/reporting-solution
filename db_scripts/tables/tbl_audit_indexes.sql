------------------------------------------------------
-- table: audit. indexes
------------------------------------------------------

-- index: cuix_audit_key
-- drop index cuix_audit_key;
create unique index cuix_audit_key on audit using btree (key);
alter table audit cluster on cuix_audit_key;
