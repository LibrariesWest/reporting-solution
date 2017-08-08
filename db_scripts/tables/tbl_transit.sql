---------------------------------------------------------------
-- table: transit
---------------------------------------------------------------

-- drop table transit;
create table transit
(
  catalogue_key integer not null,
  call_sequence integer not null,
  copy_number integer not null,
  hold_key integer,
  date_time_transited date,
  library integer,
  from_library integer,
  to_library integer,
  reason_needed integer,
  empty character(1),
  constraint pk_transit_catkey_callsequence_copynumber primary key (catalogue_key, call_sequence, copy_number)
);