---------------------------------------------------------------
-- table: hold.  load data
---------------------------------------------------------------

truncate hold;
alter table hold alter column date_recalled type character varying(10);
alter table hold alter column date_available type character varying(10);
alter table hold alter column date_available_expires type character varying(10);
alter table hold alter column date_reordered type character varying(10);
alter table hold alter column date_notified type character varying(10);
alter table hold alter column date_inactive type character varying(10);
alter table hold alter column date_expires type character varying(10);
copy hold from 'c:\dbdata\symphony\hold.txt' delimiter '|';
update hold set date_recalled = null where date_recalled = 'NEVER';
update hold set date_available = null where date_available = 'NEVER';
update hold set date_available_expires = null where date_available_expires = 'NEVER';
update hold set date_reordered = null where date_reordered = 'NEVER';
update hold set date_notified = null where date_notified = 'NEVER';
update hold set date_inactive = null where date_inactive = 'NEVER';
update hold set date_expires = null where date_expires = 'NEVER';
alter table hold alter column date_recalled type date using to_date(date_recalled, 'DD/MM/YYYY');
alter table hold alter column date_available type date using to_date(date_available, 'DD/MM/YYYY');
alter table hold alter column date_available_expires type date using to_date(date_available_expires, 'DD/MM/YYYY');
alter table hold alter column date_reordered type date using to_date(date_reordered, 'DD/MM/YYYY');
alter table hold alter column date_notified type date using to_date(date_notified, 'DD/MM/YYYY');
alter table hold alter column date_inactive type date using to_date(date_inactive, 'DD/MM/YYYY');
alter table hold alter column date_expires type date using to_date(date_expires, 'DD/MM/YYYY');
