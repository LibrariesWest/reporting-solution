------------------------------------------------------
-- table: bill. load data
------------------------------------------------------

truncate bill;
copy bill from 'c:\dbdata\symphony\bill.txt' delimiter '|';