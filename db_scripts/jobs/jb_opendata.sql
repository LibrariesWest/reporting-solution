--------------------------------------------------------------------
-- job: open data
-- this set of SQL scripts exports libraries west open data
--------------------------------------------------------------------

copy(select * from vw_opendata_bills) to 'c:\dbdata\opendata\bills.csv' csv header;
copy(select * from vw_opendata_billpayments) to 'c:\dbdata\opendata\billpayments.csv' csv header;
copy(select * from vw_opendata_cashmanagement) to 'c:\dbdata\opendata\cashmanagement.csv' csv header;
copy(select * from vw_opendata_catalogue) to 'c:\dbdata\opendata\catalogue.csv' csv header;
copy(select * from vw_opendata_holds) to 'c:\dbdata\opendata\holds.csv' csv header;
copy(select * from vw_opendata_issues) to 'c:\dbdata\opendata\issues.csv' csv header;
copy(select * from vw_opendata_items) to 'c:\dbdata\opendata\items.csv' csv header;
copy(select * from vw_opendata_members) to 'c:\dbdata\opendata\members.csv' csv header;
copy(select * from vw_opendata_transits) to 'c:\dbdata\opendata\transits.csv' csv header;

