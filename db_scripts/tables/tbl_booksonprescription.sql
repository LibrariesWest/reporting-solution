---------------------------------------------------------------
-- table: booksonprescription
---------------------------------------------------------------

-- drop table booksonprescription
create table booksonprescription
(
  isbn character (13),
  title character varying (200),
  type character varying (20),
  constraint pk_booksonprescription_isbn primary key (isbn)
);