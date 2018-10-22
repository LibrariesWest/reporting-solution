---------------------------------------------------------------
-- table: heading1.  load data
---------------------------------------------------------------

truncate heading1;
copy heading1 from 'c:\dbdata\symphony\heading1.txt' delimiter '|';