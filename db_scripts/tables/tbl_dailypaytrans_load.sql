---------------------------------------------------------------
-- table: dailypaytrans.  load data
---------------------------------------------------------------

-- import dailypaytrans
truncate dailypaytrans;
copy dailypaytrans from 'c:\dbdata\symphony\dailypaytrans.txt' delimiter '|';