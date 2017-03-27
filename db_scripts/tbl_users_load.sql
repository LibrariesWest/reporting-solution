---------------------------------------------------------------
-- table: users.  load data
---------------------------------------------------------------

truncate users;
copy users from 'c:\dbdata\symphony\user.txt' delimiter '|';