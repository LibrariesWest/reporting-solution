-- import bill payment data
truncate billpayment;
copy billpayment from 'c:\dbdesign\symphonydata\billpayment.txt' delimiter '|';