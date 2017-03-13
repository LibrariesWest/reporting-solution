-- import transits
truncate transit;
copy transit from 'c:\dbdesign\symphonydata\transit.txt' delimiter '|';