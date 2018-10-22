---------------------------------------------------------------
-- table: userstatus.  load data
---------------------------------------------------------------

truncate userstatus;
copy userstatus from 'c:\dbdata\symphony\userstatus.txt' delimiter '|';