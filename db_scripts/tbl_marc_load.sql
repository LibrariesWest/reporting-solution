---------------------------------------------------------------
-- table: marc.  load data
---------------------------------------------------------------

truncate marc;
copy marc from 'c:\dbdata\symphonydata\marc.txt' delimiter '|';