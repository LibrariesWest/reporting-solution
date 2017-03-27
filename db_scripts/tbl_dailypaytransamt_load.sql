---------------------------------------------------------------
-- table: dailypaytransamt.  load data
---------------------------------------------------------------

truncate dailypaytransamt;
copy dailypaytransamt from 'c:\dbdata\symphonydata\dailypaytransamt.txt' delimiter '|';