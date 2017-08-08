------------------------------------------------------
-- table: callnum. load data
------------------------------------------------------

truncate callnum;
copy callnum from 'c:\dbdata\symphony\callnum.txt' delimiter '|';