---------------------------------------------------------------
-- table: dailypaytrans.
---------------------------------------------------------------

-- drop table dailypaytrans;
create table dailypaytrans
(
  key integer not null,
  "timestamp" date,
  library_id integer,
  station_id integer,
  clerk integer,
  patron integer,
  override integer,
  transaction_type integer,
  empty character(1),
  constraint pk_dailypaytrans_key primary key (key)
);