---------------------------------------------------------------
-- table: request.  load data
---------------------------------------------------------------

truncate request;
alter table request alter column date_reviewed type character varying(10);
alter table request alter column date_responded type character varying(10);
alter table request alter column date_modified type character varying(10);
copy request from 'c:\dbdata\symphony\request.txt' delimiter '|';
update request set date_reviewed = null where date_reviewed = 'NEVER';
update request set date_responded = null where date_responded = 'NEVER';
update request set date_modified = null where date_modified = 'NEVER';
alter table request alter column date_reviewed type date using to_date(date_reviewed, 'DD/MM/YYYY');
alter table request alter column date_responded type date using to_date(date_responded, 'DD/MM/YYYY');
alter table request alter column date_modified type date using to_date(date_modified, 'DD/MM/YYYY');