--------------------------------------------------------------------
-- job: open data
-- this set of SQL scripts exports libraries west open data
--------------------------------------------------------------------

copy(select * from vw_opendata_bills) to 'c:\dbdata\opendata\bills.csv' csv header;
copy(select * from vw_opendata_bills_summary) to 'c:\dbdata\opendata\bills_summary.csv' csv header;
copy(select * from vw_opendata_billpayments) to 'c:\dbdata\opendata\billpayments.csv' csv header;
copy(select * from vw_opendata_billpayments_summary) to 'c:\dbdata\opendata\billpayments_summary.csv' csv header;
copy(select * from vw_opendata_cashmanagement) to 'c:\dbdata\opendata\cashmanagement.csv' csv header;
copy(select * from vw_opendata_titles) to 'c:\dbdata\opendata\catalogue.csv' csv header;
copy(select * from vw_opendata_holds) to 'c:\dbdata\opendata\holds.csv' csv header;
copy(select * from vw_opendata_holds_summary) to 'c:\dbdata\opendata\holds_summary.csv' csv header;
copy(select * from vw_opendata_issues) to 'c:\dbdata\opendata\issues.csv' csv header;
copy(select * from vw_opendata_issues_summary) to 'c:\dbdata\opendata\issues_summary.csv' csv header;
copy(select * from vw_opendata_items where authority = 'Bath and North East Somerset') to 'c:\dbdata\opendata\items_banes.csv' csv header;
copy(select * from vw_opendata_items where authority = 'Bristol') to 'c:\dbdata\opendata\items_bristol.csv' csv header;
copy(select * from vw_opendata_items where authority = 'Dorset') to 'c:\dbdata\opendata\items_dorset.csv' csv header;
copy(select * from vw_opendata_items where authority = 'North Somerset') to 'c:\dbdata\opendata\items_northsomerset.csv' csv header;
copy(select * from vw_opendata_items where authority = 'Poole') to 'c:\dbdata\opendata\items_poole.csv' csv header;
copy(select * from vw_opendata_items where authority = 'Somerset') to 'c:\dbdata\opendata\items_somerset.csv' csv header;
copy(select * from vw_opendata_items where authority = 'South Gloucestershire') to 'c:\dbdata\opendata\items_southglos.csv' csv header;
copy(select * from vw_opendata_items_summary) to 'c:\dbdata\opendata\items_summary.csv' csv header;
copy(select * from vw_opendata_members) to 'c:\dbdata\opendata\members.csv' csv header;
copy(select * from vw_opendata_transits) to 'c:\dbdata\opendata\transits.csv' csv header;
