---------------------------------------------------------------
-- table: chargehist.  load data
---------------------------------------------------------------

truncate chargehist;
alter table chargehist alter column date_renewed type character varying(20);
copy chargehist from 'c:\dbdata\symphony\chargehist.txt' delimiter '|';
update chargehist set date_renewed = null where date_renewed = 'NEVER';
alter table chargehist alter column date_renewed type timestamp using to_timestamp(date_renewed, 'DD/MM/YYYY HH24:MI:SS');