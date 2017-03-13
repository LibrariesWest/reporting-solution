-- import charges
truncate charge;
alter table charge alter column date_renewed type character varying(10);
copy charge from 'c:\dbdesign\symphonydata\charge.txt' delimiter '|';
update charge set date_renewed = null where date_renewed = 'NEVER';
alter table charge alter column date_renewed type date using to_date(date_renewed, 'DD/MM/YYYY');