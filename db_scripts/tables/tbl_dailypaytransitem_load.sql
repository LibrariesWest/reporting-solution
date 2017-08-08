---------------------------------------------------------------
-- table: dailypaytransitem.  load data
---------------------------------------------------------------

truncate dailypaytransitem;
copy dailypaytransitem from 'c:\dbdata\symphony\dailypaytransitem.txt' delimiter '|';