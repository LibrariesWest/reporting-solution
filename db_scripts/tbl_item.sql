-- table: item
-- drop table item;
create table item
(
  catalogue_key integer not null,
  call_sequence integer not null,
  copy_number integer not null,
  id character varying(64),
  library integer,
  home_location integer,
  current_location integer,
  last_activity_date date,
  date_created date,
  type integer,
  transit_status integer,
  reserve_status integer,
  number_of_copy_holds integer,
  number_of_bills integer, 
  number_of_charges integer,
  total_charges integer, 
  price numeric,
  category1 integer,
  category2 integer,
  last_user_key integer,
  date_last_charged date,
  shadow integer,
  total_checkouts integer,
  total_renewals integer,
  empty character(1),
  constraint pk_item_catkey_sequence_copy primary key (catalogue_key, call_sequence, copy_number)
);