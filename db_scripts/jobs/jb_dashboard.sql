------------------------------------------------------
-- job: data dashboard
-- custom reporting dashboard definitions export
------------------------------------------------------

copy(select * from vw_dashboard_bills_billsbyauthorityandmonth) to 'c:\dbdata\dashboard\bills_billsbyauthorityandmonth.csv' csv header;
copy(select * from vw_dashboard_bills_billsbyauthorityandmonthunpaid) to 'c:\dbdata\dashboard\bills_billsbyauthorityandmonthunpaid.csv' csv header;
copy(select * from vw_dashboard_bills_billsbydeprivation) to 'c:\dbdata\dashboard\bills_billsbydeprivation.csv' csv header;
copy(select * from vw_dashboard_bills_billsbyreasonauthority) to 'c:\dbdata\dashboard\bills_billsbyreasonauthority.csv' csv header;
copy(select * from vw_dashboard_bills_billsbyreasonlibrary) to 'c:\dbdata\dashboard\bills_billsbyreasonlibrary.csv' csv header;
copy(select * from vw_dashboard_bills_paymentsbyauthority) to 'c:\dbdata\dashboard\bills_paymentsbyauthority.csv' csv header;
copy(select * from vw_dashboard_bills_paymentsbyauthorityanditemtypeandmonth) to 'c:\dbdata\dashboard\bills_paymentsbyauthorityanditemtypeandmonth.csv' csv header;
copy(select * from vw_dashboard_bills_paymentsbyauthorityanditemtypeprofileandmonth) to 'c:\dbdata\dashboard\bills_paymentsbyauthorityanditemtypeprofileandmonth.csv' csv header;
copy(select * from vw_dashboard_bills_paymentsbylibrary) to 'c:\dbdata\dashboard\bills_paymentsbylibrary.csv' csv header;
copy(select * from vw_dashboard_bills_paymentsbylibraryanditemtypeandmonth) to 'c:\dbdata\dashboard\bills_paymentsbylibraryanditemtypeandmonth.csv' csv header;
copy(select * from vw_dashboard_bills_paymentsbylibraryanditemtypeprofileandmonth) to 'c:\dbdata\dashboard\bills_paymentsbylibraryanditemtypeprofileandmonth.csv' csv header;

copy(select * from vw_dashboard_cash_dailytotals) to 'c:\dbdata\dashboard\cash_dailytotals.csv' csv header;

copy(select * from vw_dashboard_membership_borrowersbyauthority) to 'c:\dbdata\dashboard\membership_borrowersbyauthority.csv' csv header;
copy(select * from vw_dashboard_membership_borrowersbyauthorityagegender) to 'c:\dbdata\dashboard\membership_borrowersbyauthorityagegender.csv' csv header;
copy(select * from vw_dashboard_membership_borrowersbyauthorityanddeprivation) to 'c:\dbdata\dashboard\membership_borrowersbyauthorityanddeprivation.csv' csv header;
copy(select * from vw_dashboard_membership_borrowersbylibrary) to 'c:\dbdata\dashboard\membership_borrowersbylibrary.csv' csv header;
copy(select * from vw_dashboard_membership_borrowersbylibraryagegender) to 'c:\dbdata\dashboard\membership_borrowersbylibraryagegender.csv' csv header;
copy(select * from vw_dashboard_membership_borrowersbylibraryanddeprivation) to 'c:\dbdata\dashboard\membership_borrowersbylibraryanddeprivation.csv' csv header;
copy(select * from vw_dashboard_membership_borrowersbyward_geo) to 'c:\dbdata\dashboard\membership_borrowersbyward.geojson' csv header;
copy(select * from vw_dashboard_membership_borrowersbyward) to 'c:\dbdata\dashboard\membership_borrowersbyward.csv' csv header;
copy(select * from vw_dashboard_membership_registeredactivebyauthority) to 'c:\dbdata\dashboard\membership_registeredactivebyauthority.csv' csv header;
copy(select * from vw_dashboard_membership_registeredactivebylibrary) to 'c:\dbdata\dashboard\membership_registeredactivebylibrary.csv' csv header;
copy(select * from vw_dashboard_membership_registeredactivebyresidentauthority) to 'c:\dbdata\dashboard\membership_registeredactivebyresidentauthority.csv' csv header;
copy(select * from vw_dashboard_membership_registeredactivebyward_geo) to 'c:\dbdata\dashboard\membership_registeredactivebyward.geojson' csv header;
copy(select * from vw_dashboard_membership_registeredactivebyward) to 'c:\dbdata\dashboard\membership_registeredactivebyward.csv' csv header;
copy(select * from vw_dashboard_membership_registeredbyauthority) to 'c:\dbdata\dashboard\membership_registeredbyauthority.csv' csv header;
copy(select * from vw_dashboard_membership_registeredbylibrary) to 'c:\dbdata\dashboard\membership_registeredbylibrary.csv' csv header;
copy(select * from vw_dashboard_membership_registeredbyward_geo) to 'c:\dbdata\dashboard\membership_registeredbyward.geojson' csv header;
copy(select * from vw_dashboard_membership_registeredbyward) to 'c:\dbdata\dashboard\membership_registeredbyward.csv' csv header;
copy(select * from vw_dashboard_membership_registrationsbyweek) to 'c:\dbdata\dashboard\membership_registrationsbyweek.csv' csv header;

copy(select * from vw_dashboard_movement_transitsbyitemauthority) to 'c:\dbdata\dashboard\movement_transitsbyitemauthority.csv' csv header;
copy(select * from vw_dashboard_movement_transitsoversixweeks) to 'c:\dbdata\dashboard\movement_transitsoversixweeks.csv' csv header;

copy(select * from vw_dashboard_reservations_fulfilledholdsbyauthorityandmonth) to 'c:\dbdata\dashboard\reservations_fulfilledholdsbyauthorityandmonth.csv' csv header;
copy(select * from vw_dashboard_reservations_fulfilledholdsbyauthorityandmonthexternal) to 'c:\dbdata\dashboard\reservations_fulfilledholdsbyauthorityandmonthexternal.csv' csv header;
copy(select * from vw_dashboard_reservations_fulfilledholdsbyauthorityandmonthinternal) to 'c:\dbdata\dashboard\reservations_fulfilledholdsbyauthorityandmonthinternal.csv' csv header;
copy(select * from vw_dashboard_reservations_fulfilledholdsbylibrary) to 'c:\dbdata\dashboard\reservations_fulfilledholdsbylibrary.csv' csv header;
copy(select * from vw_dashboard_reservations_holdsbyauthorityandclient) to 'c:\dbdata\dashboard\reservations_holdsbyauthorityandclient.csv' csv header;
copy(select * from vw_dashboard_reservations_holdsbyauthorityandmonth) to 'c:\dbdata\dashboard\reservations_holdsbyauthorityandmonth.csv' csv header;
copy(select * from vw_dashboard_reservations_holdsbylibrary) to 'c:\dbdata\dashboard\reservations_holdsbylibrary.csv' csv header;
copy(select * from vw_dashboard_reservations_holdsbyward_geo) to 'c:\dbdata\dashboard\reservations_holdsbyward.geojson';
copy(select * from vw_dashboard_reservations_holdsbyward) to 'c:\dbdata\dashboard\reservations_holdsbyward.csv' csv header;
copy(select * from vw_dashboard_reservations_holdsoversixweeks) to 'c:\dbdata\dashboard\reservations_holdsoversixweeks.csv' csv header;
copy(select * from vw_dashboard_reservations_interlendingbyauthorityandmonthanditemtype) to 'c:\dbdata\dashboard\reservations_interlendingbyauthorityandmonthanditemtype.csv' csv header;
copy(select * from vw_dashboard_reservations_interlendingbyauthorityandmonthav) to 'c:\dbdata\dashboard\reservations_interlendingbyauthorityandmonthav.csv' csv header;
copy(select * from vw_dashboard_reservations_interlendingbyauthorityandmonthbooks) to 'c:\dbdata\dashboard\reservations_interlendingbyauthorityandmonthbooks.csv' csv header;

-- copy(select * from vw_dashboard_usage_booksonprescription) to 'c:\dbdata\dashboard\usage_booksonprescription.csv' csv header;
copy(select * from vw_dashboard_usage_loansbyauthorityanddeprivation) to 'c:\dbdata\dashboard\usage_loansbyauthorityanddeprivation.csv' csv header;
copy(select * from vw_dashboard_usage_loansbyauthorityandmonth) to 'c:\dbdata\dashboard\usage_loansbyauthorityandmonth.csv' csv header;
copy(select * from vw_dashboard_usage_loansbylibrary) to 'c:\dbdata\dashboard\usage_loansbylibrary.csv' csv header;
copy(select * from vw_dashboard_usage_loansbyward_geo) to 'c:\dbdata\dashboard\usage_loansbyward.geojson';
copy(select * from vw_dashboard_usage_loansbyward) to 'c:\dbdata\dashboard\usage_loansbyward.csv' csv header;
copy(select * from vw_dashboard_usage_renewalsbyauthorityanddeprivation) to 'c:\dbdata\dashboard\usage_renewalsbyauthorityanddeprivation.csv' csv header;
copy(select * from vw_dashboard_usage_renewalsbyauthorityandmonth) to 'c:\dbdata\dashboard\usage_renewalsbyauthorityandmonth.csv' csv header;
copy(select * from vw_dashboard_usage_renewalsbylibrary) to 'c:\dbdata\dashboard\usage_renewalsbylibrary.csv' csv header;
copy(select * from vw_dashboard_usage_renewalsbyward_geo) to 'c:\dbdata\dashboard\usage_renewalsbyward.geojson';
copy(select * from vw_dashboard_usage_renewalsbyward) to 'c:\dbdata\dashboard\usage_renewalsbyward.csv' csv header;

copy(select * from vw_dashboard_collection_itemsbytypeandauthority) to 'c:\dbdata\dashboard\collection_itemsbytypeandauthority.csv' csv header;
copy(select * from vw_dashboard_collection_itemsbytypeandlibrary) to 'c:\dbdata\dashboard\collection_itemsbytypeandlibrary.csv' csv header;
-- copy(select * from vw_dashboard_collection_mostissuedandreneweditems) to 'c:\dbdata\dashboard\collection_mostissuedandreneweditems.csv' csv header;
-- copy(select * from vw_dashboard_collection_mostissueditems) to 'c:\dbdata\dashboard\collection_mostissueditems.csv' csv header;
-- copy(select * from vw_dashboard_collection_mosttravelleditems) to 'c:\dbdata\dashboard\collection_mosttravelleditems.csv' csv header;
copy(select * from vw_dashboard_collection_newtitleswithholdsnocopies) to 'c:\dbdata\dashboard\collection_newtitleswithholdsnocopies.csv' csv header;
copy(select * from vw_dashboard_collection_newtitleswithnocopies) to 'c:\dbdata\dashboard\collection_newtitleswithnocopies.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithhighholdratio) to 'c:\dbdata\dashboard\collection_titleswithhighholdratio.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithhighholdsnocopies) to 'c:\dbdata\dashboard\collection_titleswithhighholdsnocopies.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithnocopies where authority='Bath and North East Somerset') to 'c:\dbdata\dashboard\collection_titleswithnocopies_banes.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithnocopies where authority='Bristol') to 'c:\dbdata\dashboard\collection_titleswithnocopies_bristol.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithnocopies where authority='Dorset') to 'c:\dbdata\dashboard\collection_titleswithnocopies_dorset.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithnocopies where authority='North Somerset') to 'c:\dbdata\dashboard\collection_titleswithnocopies_northsomerset.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithnocopies where authority='Poole') to 'c:\dbdata\dashboard\collection_titleswithnocopies_poole.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithnocopies where authority='Somerset') to 'c:\dbdata\dashboard\collection_titleswithnocopies_somerset.csv' csv header;
copy(select * from vw_dashboard_collection_titleswithnocopies where authority='South Gloucestershire') to 'c:\dbdata\dashboard\collection_titleswithnocopies_southglos.csv' csv header;

-- create a javascript file with a variable showing the data updated
copy(select 'var dashboard_updated = "' || to_char(now(), 'YYYY-MM-DD') || '"') to 'c:\dbdata\dashboard\dashboard-updated.js'
