---------------------------------------------------------------
-- table: orders.  load data
---------------------------------------------------------------

truncate orders;
copy orders from 'c:\dbdata\symphony\orders.txt' delimiter '|';