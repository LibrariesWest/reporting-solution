---------------------------------------------------------------
-- table: invline.  load data
---------------------------------------------------------------

truncate invline;
alter table invline alter column date_paid type character varying(10);
copy invline from 'c:\dbdata\symphony\invline.txt' delimiter '|';
update invline set date_paid = null where date_paid = 'NEVER';
alter table invline alter column date_paid type date using to_date(date_paid, 'DD/MM/YYYY');