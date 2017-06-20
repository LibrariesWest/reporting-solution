------------------------------------------------------
-- job: data dashboard
-- custom reporting dashboard definitions export
------------------------------------------------------

copy(select * from vw_dashboard_booksonprescription) to 'c:\dbdata\dashboard\bop.csv' csv header;
copy(select * from vw_dashboard_borrowersbyauthority) to 'c:\dbdata\dashboard\borrowersbyauthority.csv' csv header;
copy(select * from vw_dashboard_borrowersbylibrary) to 'c:\dbdata\dashboard\borrowersbylibrary.csv' csv header;
copy(select * from vw_dashboard_holds) to 'c:\dbdata\dashboard\holds.csv' csv header;
copy(select * from vw_dashboard_issues) to 'c:\dbdata\dashboard\issues.csv' csv header;
copy(select * from vw_dashboard_issuesbylibrary) to 'c:\dbdata\dashboard\issuesbylibrary.csv' csv header;
copy(select * from vw_dashboard_issuesbyward_geo) to 'c:\dbdata\dashboard\issuesbyward.geojson';
copy(select * from vw_dashboard_longholds) to 'c:\dbdata\dashboard\longholds.csv';
copy(select * from vw_dashboard_longtransits) to 'c:\dbdata\dashboard\longtransits.csv';
copy(select * from vw_dashboard_mostissueditems) to 'c:\dbdata\dashboard\mostissueditems.csv';
copy(select * from vw_dashboard_mosttravelleditems) to 'c:\dbdata\dashboard\mosttravelleditems.csv';
copy(select * from vw_dashboard_residentusers) to 'c:\dbdata\dashboard\residentusers.csv' csv header;
copy(select * from vw_dashboard_transits) to 'c:\dbdata\dashboard\transits.csv' csv header;