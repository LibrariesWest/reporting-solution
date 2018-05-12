---------------------------------------------------------------
-- table: charge.  load data
---------------------------------------------------------------

truncate charge;
alter table charge alter column date_renewed type character varying(20);
copy charge from 'c:\dbdata\symphony\charge.txt' delimiter '|';
update charge set date_renewed = null where date_renewed = 'NEVER';
alter table charge alter column date_renewed type timestamp using to_timestamp(date_renewed, 'DD/MM/YYYY HH24:MI:SS');