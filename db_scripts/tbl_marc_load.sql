---------------------------------------------------------------
-- table: marc.  load data
---------------------------------------------------------------

truncate marc;
copy marc from 'c:\dbdata\symphony\marc.txt' delimiter '|';