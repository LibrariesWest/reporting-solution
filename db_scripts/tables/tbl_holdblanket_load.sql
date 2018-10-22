---------------------------------------------------------------
-- table: holdblanket.  load data
---------------------------------------------------------------

truncate holdblanket;
alter table holdblanket alter column expiration_date type character varying(10);
copy holdblanket from 'c:\dbdata\symphony\holdblanket.txt' delimiter '|';
update holdblanket set expiration_date = null where expiration_date = 'NEVER';
alter table holdblanket alter column expiration_date type date using to_date(expiration_date, 'DD/MM/YYYY');
