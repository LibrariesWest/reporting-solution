------------------------------------------------------
-- table: audit. load data
------------------------------------------------------

truncate audit;
copy audit from 'c:\dbdata\symphony\audit.txt' delimiter '|';