---------------------------------------------------------------
-- table: userphone.  load data
---------------------------------------------------------------

truncate userphone;
copy userphone from 'c:\dbdata\symphony\userphone.txt' delimiter '|';