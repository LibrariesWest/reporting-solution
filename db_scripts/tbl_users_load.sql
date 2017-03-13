-- import users
truncate users;
copy users from 'c:\dbdesign\symphonydata\user.txt' delimiter '|';