---------------------------------------------------------------
-- table: policy.  load data
---------------------------------------------------------------

truncate policy;
copy policy from 'c:\dbdata\symphonydata\policy.txt' delimiter '|';