---------------------------------------------------------------
-- table: vendcyc.  load data
---------------------------------------------------------------

truncate vendcyc;
copy vendcyc from 'c:\dbdata\symphony\vendcyc.txt' delimiter '|';