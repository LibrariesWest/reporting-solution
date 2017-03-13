-- import bills
truncate bill;
copy bill from 'c:\dbdesign\symphonydata\bill.txt' delimiter '|';