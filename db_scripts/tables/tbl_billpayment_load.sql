------------------------------------------------------
-- table: billpayment. load data
------------------------------------------------------

truncate billpayment;
copy billpayment from 'c:\dbdata\symphony\billpayment.txt' delimiter '|';