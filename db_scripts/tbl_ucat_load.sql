-- import user categories
truncate ucat;
copy ucat from 'c:\dbdesign\symphonydata\ucat.txt' delimiter '|';