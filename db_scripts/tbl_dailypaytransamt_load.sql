-- import dailypaytransamt
truncate dailypaytransamt;
copy dailypaytransamt from 'c:\dbdesign\symphonydata\dailypaytransamt.txt' delimiter '|';