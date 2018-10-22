---------------------------------------------------------------
-- table: userstatus.  indexes
---------------------------------------------------------------

-- index: cuix_userstatus_userkey
-- drop index cuix_userstatus_userkey;
create index cuix_userstatus_userkey on userstatus using btree (user_key);
alter table userstatus cluster on cuix_userstatus_userkey;