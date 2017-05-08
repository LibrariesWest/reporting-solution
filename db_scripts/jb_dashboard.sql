------------------------------------------------------
-- job: data dashboard
-- custom reporting dashboard definitions export
------------------------------------------------------

copy(select * from vw_dashboard_holds) to 'c:\dbdata\dashboard\holds.csv' csv;
copy(select * from vw_dashboard_issues) to 'c:\dbdata\dashboard\issues.csv' csv;
copy(select * from vw_dashboard_residentusers) to 'c:\dbdata\dashboard\residentusers.csv' csv;
copy(select * from vw_dashboard_borrowersbylibrary) to 'c:\dbdata\dashboard\borrowersbylibrary.csv' csv;
copy(select * from vw_dashboard_borrowersbyauthority) to 'c:\dbdata\dashboard\borrowersbyauthority.csv' csv;