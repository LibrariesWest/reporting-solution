------------------------------------------------------
-- custom reporting database.  create views
------------------------------------------------------

-- connect to the database
\c customreporting;
set client_encoding = 'UTF8';

-- create the base views.  used for browsing the tables by administrators
\i 'views/vw_bills.sql'
\i 'views/vw_billpayments.sql'
\i 'views/vw_bills_billpayments.sql'
\i 'views/vw_cashmanagement.sql'
\i 'views/vw_catalogue.sql'
\i 'views/vw_charges.sql'
\i 'views/vw_chargeshistory.sql'
\i 'views/vw_charges_chargeshistory.sql'
\i 'views/vw_charges_booksonprescription.sql'
\i 'views/vw_holds.sql'
\i 'views/vw_holds_interlending.sql'
\i 'views/vw_holds_interlending_av.sql'
\i 'views/vw_holds_interlending_books.sql'
\i 'views/vw_holds_fulfilment_external.sql'
\i 'views/vw_holds_fulfilment_internal.sql'
\i 'views/vw_items.sql'
\i 'views/vw_transits.sql'
\i 'views/vw_users.sql'
\i 'views/vw_users_libraries.sql'
\i 'views/vw_users_public.sql'
\i 'views/vw_users_geography.sql'

-- create the open data views. these will ensure anonymisation and privacy considerations.
\i 'views/vw_opendata_bills.sql'
\i 'views/vw_opendata_bills_summary.sql'
\i 'views/vw_opendata_billpayments.sql'
\i 'views/vw_opendata_billpayments_summary.sql'
\i 'views/vw_opendata_cashmanagement.sql'
\i 'views/vw_opendata_holds.sql'
\i 'views/vw_opendata_holds_summary.sql'
\i 'views/vw_opendata_issues.sql'
\i 'views/vw_opendata_issues_summary.sql'
\i 'views/vw_opendata_items.sql'
\i 'views/vw_opendata_items_summary.sql'
\i 'views/vw_opendata_members.sql'
\i 'views/vw_opendata_members_summary.sql'
\i 'views/vw_opendata_titles.sql'
\i 'views/vw_opendata_transits.sql'
\i 'views/vw_opendata_transits_summary.sql'

-- create the dashboard views. these are used in visualisations so should only return specific aspects of the data
\i 'views/vw_dashboard_bills_billsbyauthorityandmonth.sql'
\i 'views/vw_dashboard_bills_billsbyauthorityandmonthunpaid.sql'
\i 'views/vw_dashboard_bills_billsbydeprivation.sql'
\i 'views/vw_dashboard_bills_billsbyreasonauthority.sql'
\i 'views/vw_dashboard_bills_billsbyreasonlibrary.sql'
\i 'views/vw_dashboard_bills_paymentsbyauthority.sql'
\i 'views/vw_dashboard_bills_paymentsbyauthorityanditemtypeandmonth.sql'
\i 'views/vw_dashboard_bills_paymentsbyauthorityanditemtypeprofileandmonth.sql'
\i 'views/vw_dashboard_bills_paymentsbylibrary.sql'
\i 'views/vw_dashboard_bills_paymentsbylibraryanditemtypeandmonth.sql'
\i 'views/vw_dashboard_bills_paymentsbylibraryanditemtypeprofileandmonth.sql'

\i 'views/vw_dashboard_cash_dailytotals.sql'

\i 'views/vw_dashboard_collection_itemsbytypeandauthority.sql'
\i 'views/vw_dashboard_collection_itemsbytypeandlibrary.sql'
\i 'views/vw_dashboard_collection_mostissuedandreneweditems.sql'
\i 'views/vw_dashboard_collection_mostissueditems.sql'
\i 'views/vw_dashboard_collection_mosttravelleditems.sql'
\i 'views/vw_dashboard_collection_newtitleswithholdsnocopies.sql'
\i 'views/vw_dashboard_collection_newtitleswithnocopies.sql'
\i 'views/vw_dashboard_collection_titleswithhighholdratio.sql'
\i 'views/vw_dashboard_collection_titleswithhighholdsnocopies.sql'
\i 'views/vw_dashboard_collection_titleswithnocopies.sql'

\i 'views/vw_dashboard_membership_borrowersbyauthority.sql'
\i 'views/vw_dashboard_membership_borrowersbyauthorityagegender.sql'
\i 'views/vw_dashboard_membership_borrowersbyauthorityanddeprivation.sql'
\i 'views/vw_dashboard_membership_borrowersbylibrary.sql'
\i 'views/vw_dashboard_membership_borrowersbylibraryagegender.sql'
\i 'views/vw_dashboard_membership_borrowersbylibraryanddeprivation.sql'
\i 'views/vw_dashboard_membership_borrowersbylibraryanddeprivation_geo.sql'
\i 'views/vw_dashboard_membership_borrowersbyward.sql'
\i 'views/vw_dashboard_membership_borrowersbyward_geo.sql'

\i 'views/vw_dashboard_membership_registrationsbyweek.sql'
\i 'views/vw_dashboard_membership_registeredactivebyauthority.sql'
\i 'views/vw_dashboard_membership_registeredactivebylibrary.sql'
\i 'views/vw_dashboard_membership_registeredactivebyresidentauthority.sql'
\i 'views/vw_dashboard_membership_registeredactivebyward.sql'
\i 'views/vw_dashboard_membership_registeredactivebyward_geo.sql'
\i 'views/vw_dashboard_membership_registeredbyauthority.sql'
\i 'views/vw_dashboard_membership_registeredbylibrary.sql'
\i 'views/vw_dashboard_membership_registeredbyward.sql'
\i 'views/vw_dashboard_membership_registeredbyward_geo.sql'

\i 'views/vw_dashboard_movement_transitsbyitemauthority.sql'
\i 'views/vw_dashboard_movement_transitsoversixweeks.sql'

\i 'views/vw_dashboard_reservations_fulfilledholdsbyauthorityandmonth.sql'
\i 'views/vw_dashboard_reservations_fulfilledholdsbyauthorityandmonthexternal.sql'
\i 'views/vw_dashboard_reservations_fulfilledholdsbyauthorityandmonthinternal.sql'
\i 'views/vw_dashboard_reservations_fulfilledholdsbylibrary.sql'

\i 'views/vw_dashboard_reservations_holdsbyauthorityandmonth.sql'
\i 'views/vw_dashboard_reservations_holdsbyauthorityandclient.sql'
\i 'views/vw_dashboard_reservations_holdsbylibrary.sql'
\i 'views/vw_dashboard_reservations_holdsbyward.sql'
\i 'views/vw_dashboard_reservations_holdsbyward_geo.sql'
\i 'views/vw_dashboard_reservations_holdsoversixweeks.sql'

\i 'views/vw_dashboard_reservations_interlendingbyauthorityandmonthanditemtype.sql'
\i 'views/vw_dashboard_reservations_interlendingbyauthorityandmonthav.sql'
\i 'views/vw_dashboard_reservations_interlendingbyauthorityandmonthbooks.sql'

\i 'views/vw_dashboard_usage_loansbyauthorityandmonth.sql'
\i 'views/vw_dashboard_usage_loansbyauthorityanddeprivation.sql'
\i 'views/vw_dashboard_usage_loansbylibrary.sql'
\i 'views/vw_dashboard_usage_loansbylibraryanddayofweek.sql'
\i 'views/vw_dashboard_usage_loansbyward.sql'
\i 'views/vw_dashboard_usage_loansbyward_geo.sql'

\i 'views/vw_dashboard_usage_booksonprescription.sql'
\i 'views/vw_dashboard_usage_renewalsbyauthorityandmonth.sql'
\i 'views/vw_dashboard_usage_renewalsbyauthorityanddeprivation.sql'
\i 'views/vw_dashboard_usage_renewalsbylibrary.sql'
\i 'views/vw_dashboard_usage_renewalsbyward.sql'
\i 'views/vw_dashboard_usage_renewalsbyward_geo.sql'