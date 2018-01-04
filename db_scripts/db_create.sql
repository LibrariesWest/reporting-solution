------------------------------------------------------
-- custom reporting database.  create script.
------------------------------------------------------

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

-- hold table
\i 'tables/tbl_hold.sql'
\i 'tables/tbl_hold_load.sql'
\i 'tables/tbl_hold_indexes.sql'

-- item table 
\i 'tables/tbl_item.sql'
\i 'tables/tbl_item_load.sql'
\i 'tables/tbl_item_indexes.sql'

-- marc table 
\i 'tables/tbl_marc.sql'
\i 'tables/tbl_marc_load.sql'
\i 'tables/tbl_marc_indexes.sql'

-- policy table 
\i 'tables/tbl_policy.sql'
\i 'tables/tbl_policy_load.sql'
\i 'tables/tbl_policy_indexes.sql'

-- transit table 
\i 'tables/tbl_transit.sql'
\i 'tables/tbl_transit_load.sql'
\i 'tables/tbl_transit_indexes.sql'

-- ucat table 
\i 'tables/tbl_ucat.sql'
\i 'tables/tbl_ucat_load.sql'
\i 'tables/tbl_ucat_indexes.sql'

-- users table 
\i 'tables/tbl_userxinfo.sql'
\i 'tables/tbl_userxinfo_load.sql'
\i 'tables/tbl_userxinfo_indexes.sql'

-- users table 
\i 'tables/tbl_users.sql'
\i 'tables/tbl_users_load.sql'
\i 'tables/tbl_users_indexes.sql'

-- discards table for doing discard analysis
\i 'tables/tbl_discards.sql'
\i 'tables/tbl_discards_indexes.sql'

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
\i 'views/vw_dashboard_bills_paymentsbylibrary.sql'
\i 'views/vw_dashboard_bills_paymentsbyauthorityanditemtypeandmonth.sql'

\i 'views/vw_dashboard_collection_itemsbytypeandauthority.sql'
\i 'views/vw_dashboard_collection_itemsbytypeandlibrary.sql'
\i 'views/vw_dashboard_collection_mostissuedandreneweditems.sql'
\i 'views/vw_dashboard_collection_mostissueditems.sql'
\i 'views/vw_dashboard_collection_mosttravelleditems.sql'

\i 'views/vw_dashboard_membership_borrowersbyauthority.sql'
\i 'views/vw_dashboard_membership_borrowersbyauthorityanddeprivation.sql'
\i 'views/vw_dashboard_membership_borrowersbylibrary.sql'
\i 'views/vw_dashboard_membership_borrowersbylibraryanddeprivation.sql'
\i 'views/vw_dashboard_membership_borrowersbyward.sql'
\i 'views/vw_dashboard_membership_borrowersbyward_geo.sql'

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
\i 'views/vw_dashboard_usage_loansbyward.sql'
\i 'views/vw_dashboard_usage_loansbyward_geo.sql'

\i 'views/vw_dashboard_usage_booksonprescription.sql'
\i 'views/vw_dashboard_usage_renewalsbyauthorityandmonth.sql'
\i 'views/vw_dashboard_usage_renewalsbyauthorityanddeprivation.sql'
\i 'views/vw_dashboard_usage_renewalsbylibrary.sql'
\i 'views/vw_dashboard_usage_renewalsbyward.sql'
\i 'views/vw_dashboard_usage_renewalsbyward_geo.sql'

-- then run our dashboard set of jobs
\i 'jobs/jb_dashboard.sql'

-- and then our open data set of jobs
\i 'jobs/jb_opendata.sql'
