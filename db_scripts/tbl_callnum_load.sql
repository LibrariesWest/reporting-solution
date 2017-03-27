------------------------------------------------------
-- table: callnum. load data
------------------------------------------------------

truncate callnum;
copy callnum from 'c:\dbdata\symphonydata\callnum.txt' delimiter '|';