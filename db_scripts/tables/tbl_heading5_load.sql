---------------------------------------------------------------
-- table: heading5.  load data
---------------------------------------------------------------

truncate heading5;
copy heading5 from 'c:\dbdata\symphony\heading5.txt' delimiter '|';