-- table: hold
-- drop table hold;
create table hold
(
  key integer not null,
  user_key integer,
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  hold_priority integer,
  item_library integer,
  type character varying(1),
  usergroup_key integer,
  library integer,
  pickup_library integer,
  date_placed date,
  date_expires date,
  date_notified date,
  number_of_notices integer,
  item_available character varying(1),
  recall_status integer,
  hold_status integer,
  inactive_reason integer,
  date_inactive date,
  range integer,
  date_recalled date,
  date_available date,
  date_available_expires date,
  "position" integer,
  date_reordered date,
  client_used integer,
  empty character(1),
  constraint pk_hold_key primary key (key)
);

-- index: cuix_hold_key
-- drop index cuix_hold_key;
create unique index cuix_hold_key on hold using btree (key);
alter table hold cluster on cuix_hold_key;

-- index: ix_hold_userkey
-- drop index ix_hold_userkey;
create index ix_hold_userkey on hold using btree (user_key);

-- index: ix_hold_catkey_sequence_copy
-- drop index ix_hold_catkey_sequence_copy;
create index ix_hold_catkey_sequence_copy on hold using btree (catalogue_key, call_sequence, copy_number);

-- index: ix_hold_itemlibrary
-- drop index ix_hold_itemlibrary;
create index ix_hold_itemlibrary on hold using btree (item_library);

-- index: ix_hold_type
-- drop index ix_hold_type;
create index ix_hold_type on hold using btree (type);

-- index: ix_hold_library
-- drop index ix_hold_library;
create index ix_hold_library on hold using btree (library);

-- index: ix_hold_pickuplibrary
-- drop index ix_hold_pickuplibrary;
create index ix_hold_pickuplibrary on hold using btree (pickup_library);

-- index: ix_hold_dateplaced
-- drop index ix_hold_dateplaced;
create index ix_hold_dateplaced on hold using btree (date_placed);

-- index: ix_hold_status
-- drop index ix_hold_status;
create index ix_hold_status on hold using btree (hold_status);

-- index: ix_hold_range
-- drop index ix_hold_range;
create index ix_hold_range on hold using btree (range);

-- index: ix_hold_dateavailable
-- drop index ix_hold_dateavailable;
create index ix_hold_dateavailable on hold using btree (date_available);

-- index: ix_hold_client
-- drop index ix_hold_client;
create index ix_hold_client on hold using btree (client_used);