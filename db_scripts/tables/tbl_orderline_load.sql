---------------------------------------------------------------
-- table: orderline.  load data
---------------------------------------------------------------

truncate orderline;
copy orderline from 'c:\dbdata\symphony\orderline.txt' delimiter '|';