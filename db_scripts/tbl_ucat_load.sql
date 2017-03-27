---------------------------------------------------------------
-- table: ucat.  load data
---------------------------------------------------------------

truncate ucat;
copy ucat from 'c:\dbdata\symphonydata\ucat.txt' delimiter '|';