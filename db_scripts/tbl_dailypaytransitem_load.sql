---------------------------------------------------------------
-- table: dailypaytransitem.  load data
---------------------------------------------------------------

truncate dailypaytransitem;
copy dailypaytransitem from 'c:\dbdata\symphonydata\dailypaytransitem.txt' delimiter '|';