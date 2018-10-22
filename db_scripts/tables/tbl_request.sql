---------------------------------------------------------------
-- table: request
---------------------------------------------------------------

-- drop table request;
create table request
(
  key integer not null,
  user_key integer,
  date_reviewed date,
  catalog_key integer,
  call_sequence integer,
  copy_number integer,
  service_library integer,
  status integer,
  responded integer,
  request_id character varying(50),
  date_placed date,
  date_responded date,
  date_modified date,
  type integer,
  operator integer,
  request_offset integer,
  response_offset integer,
  origin_library integer,
  empty character(1),
  constraint pk_request_key primary key (key)
);