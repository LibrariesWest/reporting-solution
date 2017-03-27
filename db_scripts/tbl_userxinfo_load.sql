---------------------------------------------------------------
-- table: userxinfo.  load data
---------------------------------------------------------------

truncate userxinfo;
copy userxinfo from 'c:\dbdata\symphonydata\userxinfo.txt' delimiter '|';