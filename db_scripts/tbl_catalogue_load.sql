---------------------------------------------------------------
-- table: catalogue.  load data
---------------------------------------------------------------

truncate catalogue;
alter table catalogue alter column date_catalogued type character varying(10);
alter table catalogue alter column date_modified type character varying(10);
copy catalogue from 'c:\dbdata\symphonydata\catalogue.txt' delimiter '|';
update catalogue set date_catalogued = null where date_catalogued = 'NEVER';
update catalogue set date_modified = null where date_modified = 'NEVER';
alter table catalogue alter column date_catalogued type date using to_date(date_catalogued, 'DD/MM/YYYY');
alter table catalogue alter column date_modified type date using to_date(date_modified, 'DD/MM/YYYY');