---------------------------------------------------------------
-- table: dailypaytransamt.  load data
---------------------------------------------------------------

truncate dailypaytransamt;
copy dailypaytransamt from 'c:\dbdata\symphony\dailypaytransamt.txt' delimiter '|';