---------------------------------------------------------------
-- table: transit.  load data
---------------------------------------------------------------

truncate transit;
copy transit from 'c:\dbdata\symphony\transits.txt' delimiter '|';