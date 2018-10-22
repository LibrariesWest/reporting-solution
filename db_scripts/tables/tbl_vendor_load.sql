---------------------------------------------------------------
-- table: vendor.  load data
---------------------------------------------------------------

truncate vendor;
copy vendor from 'c:\dbdata\symphony\vendor.txt' delimiter '|';