---------------------------------------------------------------
-- table: chargehist.
---------------------------------------------------------------

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
  date_charged timestamp,
  date_due timestamp,
  date_renewed timestamp,
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