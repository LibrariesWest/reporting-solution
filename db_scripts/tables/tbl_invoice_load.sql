---------------------------------------------------------------
-- table: invoice.  load data
---------------------------------------------------------------

truncate invoice;
alter table invoice alter column date_locked type character varying(10);
alter table invoice alter column date_ready type character varying(10);
copy invoice from 'c:\dbdata\symphony\invoice.txt' delimiter '|';
update invoice set date_locked = null where date_locked = 'NEVER';
update invoice set date_ready = null where date_ready = 'NEVER';
alter table invoice alter column date_locked type date using to_date(date_locked, 'DD/MM/YYYY');
alter table invoice alter column date_ready type date using to_date(date_ready, 'DD/MM/YYYY');