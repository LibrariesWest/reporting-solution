---------------------------------------------------------------
-- table: invlink.  load data
---------------------------------------------------------------

truncate invlink;
copy invlink from 'c:\dbdata\symphony\invlink.txt' delimiter '|';