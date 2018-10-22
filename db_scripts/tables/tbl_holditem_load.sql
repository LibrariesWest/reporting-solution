---------------------------------------------------------------
-- table: holditem.  load data
---------------------------------------------------------------

truncate holditem;
copy holditem from 'c:\dbdata\symphony\holditem.txt' delimiter '|';
