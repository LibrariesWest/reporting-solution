---------------------------------------------------------------
-- table: userphone
---------------------------------------------------------------

-- drop table userphone;
create table userphone
(
  phone_key integer not null,
  user_key integer,
  empty character(1),
  constraint pk_userphone_key primary key (phone_key)
);