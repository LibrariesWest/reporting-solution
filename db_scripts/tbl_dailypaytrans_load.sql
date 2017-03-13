-- import dailypaytrans
truncate dailypaytrans;
copy dailypaytrans from 'c:\dbdesign\symphonydata\dailypaytrans.txt' delimiter '|';