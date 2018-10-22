---------------------------------------------------------------
-- table: orders.  load data
---------------------------------------------------------------

truncate orders;
alter table orders alter column date_to_claim type character varying(10);
alter table orders alter column date_to_cancel type character varying(10);
alter table orders alter column date_ready type character varying(10);
alter table orders alter column date_mailed type character varying(10);
copy orders from 'c:\dbdata\symphony\orders.txt' delimiter '|';
update orders set date_to_claim = null where date_to_claim = 'NEVER';
update orders set date_to_cancel = null where date_to_cancel = 'NEVER';
update orders set date_ready = null where date_ready = 'NEVER';
update orders set date_mailed = null where date_mailed = 'NEVER';
alter table orders alter column date_to_claim type date using to_date(date_to_claim, 'DD/MM/YYYY');
alter table orders alter column date_to_cancel type date using to_date(date_to_cancel, 'DD/MM/YYYY');
alter table orders alter column date_ready type date using to_date(date_ready, 'DD/MM/YYYY');
alter table orders alter column date_mailed type date using to_date(date_mailed, 'DD/MM/YYYY');