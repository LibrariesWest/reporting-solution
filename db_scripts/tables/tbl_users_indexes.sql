---------------------------------------------------------------
-- table: users.  indexes
---------------------------------------------------------------

-- index: cuix_user_key
-- drop index cuix_user_key;
create unique index cuix_users_key on users using btree (user_key);
alter table users cluster on cuix_users_key;

-- index: ix_user_id
-- drop index ix_user_id;
create index ix_users_id on users using btree (id);

-- index: ix_users_address1
-- drop index ix_users_address1;
create index ix_users_address1 on users using btree (address_offset_1);

-- index: ix_users_address2
-- drop index ix_users_address2;
create index ix_users_address2 on users using btree (address_offset_2);

-- index: ix_users_address3
-- drop index ix_users_address3;
create index ix_users_address3 on users using btree (address_offset_3);

-- index: ix_users_library
-- drop index ix_users_library;
create index ix_users_library on users using btree (library);

-- index: ix_users_profile
-- drop index ix_users_profile;
create index ix_users_profile on users using btree (profile);

-- index: ix_users_lastactivity
-- drop index ix_users_lastactivity;
create index ix_users_lastactivity on users using btree (last_activity_date);

-- index: ix_users_datecreated
-- drop index ix_users_datecreated;
create index ix_users_datecreated on users using btree (date_created);

-- index: ix_user_created
-- drop index ix_user_created;
create index ix_users_created on users using btree (date_created);

-- index: ix_users_access
-- drop index ix_users_access;
create index ix_users_access on users using btree (user_access);

-- index: ix_users_status
-- drop index ix_users_status;
create index ix_users_status on users using btree (status);

-- index: ix_users_postcodetrim
-- drop index ix_users_postcodetrim;
create index ix_users_postcodetrim on users using btree (postcode_trim);