---------------------------------------------------------------
-- table: hold
---------------------------------------------------------------

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
  date_placed timestamp,
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