-- import callnums
truncate callnum;
copy callnum from 'c:\dbdesign\symphonydata\callnum.txt' delimiter '|';