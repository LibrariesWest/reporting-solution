---------------------------------------------------------------
-- table: heading2.  load data
---------------------------------------------------------------

truncate heading2;
copy heading2 from 'c:\dbdata\symphony\heading2.txt' delimiter '|';