------------------------------------------------------
-- table: bill. load data
------------------------------------------------------

truncate bill;
copy bill from 'c:\dbdata\symphonydata\bill.txt' delimiter '|';