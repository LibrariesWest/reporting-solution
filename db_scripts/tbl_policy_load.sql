---------------------------------------------------------------
-- table: policy.  load data
---------------------------------------------------------------

truncate policy;
copy policy from 'c:\dbdata\symphony\policy.txt' delimiter '|';