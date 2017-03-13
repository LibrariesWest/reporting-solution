-- import user extended info
truncate userxinfo;
copy userxinfo from 'c:\dbdesign\symphonydata\userxinfo.txt' delimiter '|';