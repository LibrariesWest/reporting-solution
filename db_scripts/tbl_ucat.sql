-- table: ucat
-- drop table ucat;
create table ucat
(
  user_key integer not null,
  category integer not null,
  value integer,
  empty character(1),
  constraint pk_ucat_ukey_category primary key (user_key, category)
);