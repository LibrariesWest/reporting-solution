---------------------------------------------------------------
-- table: dist.  load data
---------------------------------------------------------------

truncate dist;
alter table dist alter column date_received type character varying(10);
alter table dist alter column date_loaded_delivered type character varying(10);
copy dist from 'c:\dbdata\symphony\dist.txt' delimiter '|';
update dist set date_received = null where date_received = 'NEVER';
update dist set date_loaded_delivered = null where date_loaded_delivered = 'NEVER';
alter table dist alter column date_received type date using to_date(date_received, 'DD/MM/YYYY');
alter table dist alter column date_loaded_delivered type date using to_date(date_loaded_delivered, 'DD/MM/YYYY');