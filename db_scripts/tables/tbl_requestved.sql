---------------------------------------------------------------
-- table: requestved
---------------------------------------------------------------

-- drop table requestved;
create table requestved
(
  "offset" integer,
  entry_position integer,
  absolute_entry integer,
  entry_number integer,
  ved_prefix text,
  entry text,
  empty character(1)
);