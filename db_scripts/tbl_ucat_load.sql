---------------------------------------------------------------
-- table: ucat.  load data
---------------------------------------------------------------

truncate ucat;
copy ucat from 'c:\dbdata\symphony\ucat.txt' delimiter '|';