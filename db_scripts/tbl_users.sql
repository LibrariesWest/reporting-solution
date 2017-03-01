-- table: users
-- drop table users;
create table users
(
  user_key integer not null,
  responsibility_code integer,
  id character varying(20),
  number_of_claims_returned integer,
  number_of_lost integer,
  mailing_address integer,
  address_offset_1 integer,
  address_offset_2 integer,
  address_offset_3 integer,
  library integer,
  location integer,
  profile integer,
  last_activity_date date,
  date_created date,
  user_access integer,
  status integer,
  birth_date integer,
  empty character(1),
  constraint pk_user_key primary key (user_key)
);