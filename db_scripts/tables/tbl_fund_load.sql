---------------------------------------------------------------
-- table: fund.  load data
---------------------------------------------------------------

truncate fund;
copy fund from 'c:\dbdata\symphony\fund.txt' delimiter '|';