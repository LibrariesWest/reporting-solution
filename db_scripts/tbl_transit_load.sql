---------------------------------------------------------------
-- table: transit.  load data
---------------------------------------------------------------

truncate transit;
copy transit from 'c:\dbdata\symphonydata\transit.txt' delimiter '|';