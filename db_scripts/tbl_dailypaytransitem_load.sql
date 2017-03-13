-- import dailypaytransitem
truncate dailypaytransitem;
copy dailypaytransitem from 'c:\dbdesign\symphonydata\dailypaytransitem.txt' delimiter '|';