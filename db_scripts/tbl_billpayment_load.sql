------------------------------------------------------
-- table: billpayment. load data
------------------------------------------------------

truncate billpayment;
copy billpayment from 'c:\dbdata\symphonydata\billpayment.txt' delimiter '|';