---------------------------------------------------------------
-- table: booksonprescription
---------------------------------------------------------------

-- drop table booksonprescription
create table booksonprescription
(
  type character (20),
  title character varying (200),
  isbn character varying (13),
  constraint pk_booksonprescription_isbn primary key (isbn)
);