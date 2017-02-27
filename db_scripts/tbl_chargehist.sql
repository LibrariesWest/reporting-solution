-- table: chargehist
-- drop table chargehist;
create table chargehist
(
  key integer not null,
  user_key integer,
  catalogue_key integer,
  call_sequence integer,
  copy_number integer,
  chargehist_number integer,
  library integer,
  date_charged date,
  date_renewed date,
  number_of_renewals integer,
  location integer,
  accrued_fine numeric,
  overdue integer,
  date_time_discharged date,
  discharge_library integer,
  number_of_unseen_renewals integer,
  empty character(1),
  constraint pk_chargehist_key primary key (key)
);

-- index: cuix_chargehist_key
-- drop index cuix_chargehist_key;
create unique index cuix_chargehist_key on chargehist using btree (key);
alter table chargehist cluster on cuix_chargehist_key;

-- index: ix_chargehist_userkey
-- drop index ix_chargehist_userkey;
create index ix_chargehist_userkey on chargehist using btree (user_key);

-- index: ix_chargehist_catkey_sequence_copy
-- drop index ix_chargehist_catkey_sequence_copy;
create index ix_chargehist_catkey_sequence_copy on chargehist using btree (catalogue_key, call_sequence, copy_number);

-- index: ix_chargehist_library
-- drop index ix_chargehist_library;
create index ix_chargehist_library on chargehist using btree (library);

-- index: ix_chargehist_datecharged
-- drop index ix_chargehist_datecharged;
create index ix_chargehist_datecharged on chargehist using btree (date_charged);