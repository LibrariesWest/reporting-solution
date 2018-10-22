------------------------------------------------------
-- table: cancel. load data
------------------------------------------------------

truncate cancel;
alter table cancel alter column date_cancelled type character varying(20);
copy cancel from 'c:\dbdata\symphony\cancel.txt' delimiter '|';
update cancel set date_cancelled = null where date_cancelled = 'NEVER';
alter table cancel alter column date_cancelled type date using to_date(date_cancelled, 'DD/MM/YYYY');
