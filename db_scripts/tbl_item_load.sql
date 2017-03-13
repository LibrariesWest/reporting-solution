-- import items
truncate item;
alter table item alter column date_last_charged type character varying(10);
alter table item alter column last_activity_date type character varying(10);
copy item from 'c:\dbdesign\symphonydata\item.txt' delimiter '|';
update item set date_last_charged = null where date_last_charged = 'NEVER';
update item set last_activity_date = null where last_activity_date = 'NEVER';
alter table item alter column date_last_charged type date using to_date(date_last_charged, 'DD/MM/YYYY');
alter table item alter column last_activity_date type date using to_date(last_activity_date, 'DD/MM/YYYY');
-- then recreate vw_items