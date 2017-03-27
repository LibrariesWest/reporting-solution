---------------------------------------------------------------
-- table: users.  load data
---------------------------------------------------------------

truncate users;
copy users from 'c:\dbdata\symphonydata\user.txt' delimiter '|';