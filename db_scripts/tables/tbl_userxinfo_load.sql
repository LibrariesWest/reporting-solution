---------------------------------------------------------------
-- table: userxinfo.  load data
---------------------------------------------------------------

truncate userxinfo;
copy userxinfo from 'c:\dbdata\symphony\userxinfo.txt' delimiter '|';