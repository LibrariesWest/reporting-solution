---------------------------------------------------------------
-- table: userphone.  indexes
---------------------------------------------------------------

-- index: cuix_userphone_phonekey_user
-- drop index cuix_userphone_phonekey_user;
create unique index cuix_userphone_phonekey_user on userphone using btree (phone_key, user_key);
alter table userphone cluster on cuix_userphone_phonekey_user;

-- index: ix_userphone_ukey
-- drop index ix_userphone_ukey;
create index ix_userphone_ukey on userphone using btree (user_key);