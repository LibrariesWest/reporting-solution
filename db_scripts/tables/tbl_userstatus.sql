---------------------------------------------------------------
-- table: userstatus
---------------------------------------------------------------

-- drop table userstatus;
create table userstatus
(
  user_key integer not null,
  estimated_fines numeric,
  estimated_overdues integer,
  estimated_recalls integer,
  delinquent integer,
  empty character(1),
  constraint pk_userstatus_userkey primary key (user_key)
);