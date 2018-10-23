------------------------------------------------------
-- custom reporting database.  create script.
------------------------------------------------------

-- drop connections to the database
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'customreporting';

-- if the database exists, drop it
drop database if exists customreporting;

-- create the database.
create database customreporting;
\c customreporting;

set client_encoding = 'UTF8';

-- Add PostGIS extensions
create extension postgis;

-- authorities function
\i 'functions/fn_librarytoauthority.sql'

-- os wards table
-- this file is dynamically generated in a previous step.
\i 'tables/tbl_os_wards.sql'
\i 'tables/tbl_os_wards_indexes.sql'

-- os districts table
-- this file is dynamically generated in a previous step.
\i 'tables/tbl_os_districts.sql'
\i 'tables/tbl_os_districts_indexes.sql'

-- os counties table
-- this file is dynamically generated in a previous step.
\i 'tables/tbl_os_counties.sql'
\i 'tables/tbl_os_counties_indexes.sql'

-- output areas table
-- this file is dynamically generated in a previous step.
\i 'tables/tbl_ons_oas.sql'
\i 'tables/tbl_ons_oas_indexes.sql'

-- output area lookups table
\i 'tables/tbl_ons_oas_lookups.sql'
\i 'tables/tbl_ons_oas_lookups_load.sql'
\i 'tables/tbl_ons_oas_lookups_indexes.sql'

-- lower super output areas table
-- this file is dynamically generated in a previous step.
\i 'tables/tbl_ons_lsoas.sql'
\i 'tables/tbl_ons_lsoas_indexes.sql'

-- lower super output area deprivation table
\i 'tables/tbl_ons_lsoas_imd.sql'
\i 'tables/tbl_ons_lsoas_imd_load.sql'
\i 'tables/tbl_ons_lsoas_imd_indexes.sql'

-- output area female population
\i 'tables/tbl_ons_oas_population_female.sql'
\i 'tables/tbl_ons_oas_population_female_load.sql'
\i 'tables/tbl_ons_oas_population_female_indexes.sql'

-- output area male population
\i 'tables/tbl_ons_oas_population_male.sql'
\i 'tables/tbl_ons_oas_population_male_load.sql'
\i 'tables/tbl_ons_oas_population_male_indexes.sql'

-- authority population
\i 'tables/tbl_ons_uk_population.sql'
\i 'tables/tbl_ons_uk_population_load.sql'
\i 'tables/tbl_ons_uk_population_indexes.sql'

-- OS postcodes table 
\i 'tables/tbl_os_postcodes.sql'
\i 'tables/tbl_os_postcodes_load.sql'
\i 'tables/tbl_os_postcodes_indexes.sql'

-- books on prescription
\i 'tables/tbl_booksonprescription.sql'
\i 'tables/tbl_booksonprescription_load.sql'
\i 'tables/tbl_booksonprescription_indexes.sql'

-- audit table
\i 'tables/tbl_audit.sql'
\i 'tables/tbl_audit_load.sql'
\i 'tables/tbl_audit_indexes.sql'

-- bill table
\i 'tables/tbl_bill.sql'
\i 'tables/tbl_bill_load.sql'
\i 'tables/tbl_bill_indexes.sql'

-- billpayments table
\i 'tables/tbl_billpayment.sql'
\i 'tables/tbl_billpayment_load.sql'
\i 'tables/tbl_billpayment_indexes.sql'

-- callnum table
\i 'tables/tbl_callnum.sql'
\i 'tables/tbl_callnum_load.sql'
\i 'tables/tbl_callnum_indexes.sql'

-- cancel table
\i 'tables/tbl_cancel.sql'
\i 'tables/tbl_cancel_load.sql'
\i 'tables/tbl_cancel_indexes.sql'

-- catalogue table
\i 'tables/tbl_catalogue.sql'
\i 'tables/tbl_catalogue_load.sql'
\i 'tables/tbl_catalogue_indexes.sql'

-- charge table
\i 'tables/tbl_charge.sql'
\i 'tables/tbl_charge_load.sql'
\i 'tables/tbl_charge_indexes.sql'

-- charge history table
\i 'tables/tbl_chargehist.sql'
\i 'tables/tbl_chargehist_load.sql'
\i 'tables/tbl_chargehist_indexes.sql'

-- daily pay trans table
\i 'tables/tbl_dailypaytrans.sql'
\i 'tables/tbl_dailypaytrans_load.sql'
\i 'tables/tbl_dailypaytrans_indexes.sql'

-- daily pay trans amount table
\i 'tables/tbl_dailypaytransamt.sql'
\i 'tables/tbl_dailypaytransamt_load.sql'
\i 'tables/tbl_dailypaytransamt_indexes.sql'

-- daily pay trans item table
\i 'tables/tbl_dailypaytransitem.sql'
\i 'tables/tbl_dailypaytransitem_load.sql'
\i 'tables/tbl_dailypaytransitem_indexes.sql'

-- acquisitions distribution table
\i 'tables/tbl_dist.sql'
\i 'tables/tbl_dist_load.sql'
\i 'tables/tbl_dist_indexes.sql'

-- acquisitions fund table
\i 'tables/tbl_fund.sql'
\i 'tables/tbl_fund_load.sql'
\i 'tables/tbl_fund_indexes.sql'

-- heading1 table
\i 'tables/tbl_heading1.sql'
\i 'tables/tbl_heading1_load.sql'
\i 'tables/tbl_heading1_indexes.sql'

-- heading1 table
\i 'tables/tbl_heading2.sql'
\i 'tables/tbl_heading2_load.sql'
\i 'tables/tbl_heading2_indexes.sql'

-- heading1 table
\i 'tables/tbl_heading3.sql'
\i 'tables/tbl_heading3_load.sql'
\i 'tables/tbl_heading3_indexes.sql'

-- heading1 table
\i 'tables/tbl_heading4.sql'
\i 'tables/tbl_heading4_load.sql'
\i 'tables/tbl_heading4_indexes.sql'

-- heading1 table
\i 'tables/tbl_heading5.sql'
\i 'tables/tbl_heading5_load.sql'
\i 'tables/tbl_heading5_indexes.sql'

-- headingved table
\i 'tables/tbl_headingved.sql'
\i 'tables/tbl_headingved_load.sql'
\i 'tables/tbl_headingved_indexes.sql'

-- hold table
\i 'tables/tbl_hold.sql'
\i 'tables/tbl_hold_load.sql'
\i 'tables/tbl_hold_indexes.sql'

-- holdblanket table
\i 'tables/tbl_holdblanket.sql'
\i 'tables/tbl_holdblanket_load.sql'
\i 'tables/tbl_holdblanket_indexes.sql'

-- holditem table
\i 'tables/tbl_holditem.sql'
\i 'tables/tbl_holditem_load.sql'
\i 'tables/tbl_holditem_indexes.sql'

-- invline table
\i 'tables/tbl_invline.sql'
\i 'tables/tbl_invline_load.sql'
\i 'tables/tbl_invline_indexes.sql'

-- invlink table
\i 'tables/tbl_invlink.sql'
\i 'tables/tbl_invlink_load.sql'
\i 'tables/tbl_invlink_indexes.sql'

-- invlink table
\i 'tables/tbl_invoice.sql'
\i 'tables/tbl_invoice_load.sql'
\i 'tables/tbl_invoice_indexes.sql'

-- item table 
\i 'tables/tbl_item.sql'
\i 'tables/tbl_item_load.sql'
\i 'tables/tbl_item_indexes.sql'

-- libraries table 
\i 'tables/tbl_libraries.sql'
\i 'tables/tbl_libraries_load.sql'
\i 'tables/tbl_libraries_indexes.sql'

-- marc table 
\i 'tables/tbl_marc.sql'
\i 'tables/tbl_marc_load.sql'
\i 'tables/tbl_marc_indexes.sql'

-- orders table 
\i 'tables/tbl_orders.sql'
\i 'tables/tbl_orders_load.sql'
\i 'tables/tbl_orders_indexes.sql'

-- orderline table 
\i 'tables/tbl_orderline.sql'
\i 'tables/tbl_orderline_load.sql'
\i 'tables/tbl_orderline_indexes.sql'

-- policy table 
\i 'tables/tbl_policy.sql'
\i 'tables/tbl_policy_load.sql'
\i 'tables/tbl_policy_indexes.sql'

-- request table 
\i 'tables/tbl_request.sql'
\i 'tables/tbl_request_load.sql'
\i 'tables/tbl_request_indexes.sql'

-- requestved table 
\i 'tables/tbl_requestved.sql'
\i 'tables/tbl_requestved_load.sql'
\i 'tables/tbl_requestved_indexes.sql'

-- transit table 
\i 'tables/tbl_transit.sql'
\i 'tables/tbl_transit_load.sql'
\i 'tables/tbl_transit_indexes.sql'

-- ucat table 
\i 'tables/tbl_ucat.sql'
\i 'tables/tbl_ucat_load.sql'
\i 'tables/tbl_ucat_indexes.sql'

-- user extended info table 
\i 'tables/tbl_userxinfo.sql'
\i 'tables/tbl_userxinfo_load.sql'
\i 'tables/tbl_userxinfo_indexes.sql'

-- users table 
\i 'tables/tbl_users.sql'
\i 'tables/tbl_users_load.sql'
\i 'tables/tbl_users_indexes.sql'

-- user phone table
\i 'tables/tbl_userphone.sql'
\i 'tables/tbl_userphone_load.sql'
\i 'tables/tbl_userphone_indexes.sql'


-- user status table
\i 'tables/tbl_userstatus.sql'
\i 'tables/tbl_userstatus_load.sql'
\i 'tables/tbl_userstatus_indexes.sql'

-- vendor table
\i 'tables/tbl_vendor.sql'
\i 'tables/tbl_vendor_load.sql'
\i 'tables/tbl_vendor_indexes.sql'

-- vendcyc table
\i 'tables/tbl_vendcyc.sql'
\i 'tables/tbl_vendcyc_load.sql'
\i 'tables/tbl_vendcyc_indexes.sql'

-- discards table for doing discard analysis
\i 'tables/tbl_discards.sql'
\i 'tables/tbl_discards_indexes.sql'

-- financial year table for reporting against financial year
\i 'tables/tbl_financialyear.sql'
\i 'tables/tbl_financialyear_load.sql'
\i 'tables/tbl_financialyear_indexes.sql'

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
\i 'views/vw_ons_lsoa_pop.sql'
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

\i 'views/vw_dashboard_usage_loansbyauthorityanddeprivation.sql'
\i 'views/vw_dashboard_usage_loansbyauthorityandmonth.sql'
\i 'views/vw_dashboard_usage_loansbydayandhour.sql'
\i 'views/vw_dashboard_usage_loansbydayandhouraverage.sql'
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

vacuum analyze;

-- then run our dashboard set of jobs
\i 'jobs/jb_dashboard.sql'

-- and then our open data set of jobs
\i 'jobs/jb_opendata.sql'
