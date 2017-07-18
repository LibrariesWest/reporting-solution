------------------------------------------------------
-- custom reporting database.  create script.
------------------------------------------------------

-- 1.  create the database.
create database customreporting;
\c customreporting;

set client_encoding = 'UTF8';

-- Add PostGIS extensions
create extension postgis;

-- 2.  authorities function
\i fn_librarytoauthority.sql

-- 3.  bill table
\i tbl_bill.sql
\i tbl_bill_load.sql
\i tbl_bill_indexes.sql

-- 4.  billpayments table
\i tbl_billpayment.sql
\i tbl_billpayment_load.sql
\i tbl_billpayment_indexes.sql

-- 5.  callnum table
\i tbl_callnum.sql
\i tbl_callnum_load.sql
\i tbl_callnum_indexes.sql

-- 6.  catalogue table
\i tbl_catalogue.sql
\i tbl_catalogue_load.sql
\i tbl_catalogue_indexes.sql

-- 7.  charge table
\i tbl_charge.sql
\i tbl_charge_load.sql
\i tbl_charge_indexes.sql

-- 8.  charge history table
\i tbl_chargehist.sql
\i tbl_chargehist_load.sql
\i tbl_chargehist_indexes.sql

-- 9.  daily pay trans table
\i tbl_dailypaytrans.sql
\i tbl_dailypaytrans_load.sql
\i tbl_dailypaytrans_indexes.sql

-- 10.  daily pay trans amount table
\i tbl_dailypaytransamt.sql
\i tbl_dailypaytransamt_load.sql
\i tbl_dailypaytransamt_indexes.sql

-- 11.  daily pay trans item table
\i tbl_dailypaytransitem.sql
\i tbl_dailypaytransitem_load.sql
\i tbl_dailypaytransitem_indexes.sql

-- 12.  hold table
\i tbl_hold.sql
\i tbl_hold_load.sql
\i tbl_hold_indexes.sql

-- 13.  item table 
\i tbl_item.sql
\i tbl_item_load.sql
\i tbl_item_indexes.sql

-- 14.  marc table 
\i tbl_marc.sql
\i tbl_marc_load.sql
\i tbl_marc_indexes.sql

-- 15.  policy table 
\i tbl_policy.sql
\i tbl_policy_load.sql
\i tbl_policy_indexes.sql

-- 16.  transit table 
\i tbl_transit.sql
\i tbl_transit_load.sql
\i tbl_transit_indexes.sql

-- 17.  ucat table 
\i tbl_ucat.sql
\i tbl_ucat_load.sql
\i tbl_ucat_indexes.sql

-- 18.  users table 
\i tbl_users.sql
\i tbl_users_load.sql
\i tbl_users_indexes.sql

-- 19.  users table 
\i tbl_userxinfo.sql
\i tbl_userxinfo_load.sql
\i tbl_userxinfo_indexes.sql

-- 20.  os postcodes table 
\i tbl_os_postcodes.sql
\i tbl_os_postcodes_load.sql
\i tbl_os_postcodes_indexes.sql

--21.  os wards table
-- this file is dynamically generated in a previous step.
\i tbl_os_wards.sql
\i tbl_os_wards_indexes.sql

--22.  os districts table
-- this file is dynamically generated in a previous step.
\i tbl_os_districts.sql
\i tbl_os_districts_indexes.sql

--23.  os counties table
-- this file is dynamically generated in a previous step.
\i tbl_os_counties.sql
\i tbl_os_counties_indexes.sql

--24.  output areas table
-- this file is dynamically generated in a previous step.
\i tbl_ons_oas.sql
\i tbl_ons_oas_indexes.sql

--25.  output area lookups table
\i tbl_ons_oas_lookups.sql
\i tbl_ons_oas_lookups_indexes.sql

--26.  lower super output areas table
-- this file is dynamically generated in a previous step.
\i tbl_ons_lsoas.sql
\i tbl_ons_lsoas_indexes.sql

--27.  lower super output area deprivation table
\i tbl_ons_lsoas_imd.sql
\i tbl_ons_lsoas_imd_load.sql
\i tbl_ons_lsoas_imd_indexes.sql

--28.  output area female population
\i tbl_ons_oas_population_female.sql
\i tbl_ons_oas_population_female_load.sql
\i tbl_ons_oas_population_female_indexes.sql

--29.  output area male population
\i tbl_ons_oas_population_male.sql
\i tbl_ons_oas_population_male_load.sql
\i tbl_ons_oas_population_male_indexes.sql

--30.  authority population
\i tbl_ons_uk_population.sql
\i tbl_ons_uk_population_load.sql
\i tbl_ons_uk_population_indexes.sql

--31.  create the base views.  used for browsing the tables by administrators
\i vw_billpayments.sql
\i vw_bills_billpayments.sql
\i vw_bills.sql
\i vw_cashmanagement.sql
\i vw_catalogue.sql
\i vw_charges_chargeshistory.sql
\i vw_charges.sql
\i vw_chargeshistory.sql
\i vw_holds.sql
\i vw_holds_interlending.sql
\i vw_holds_interlending_av.sql
\i vw_holds_interlending_books.sql
\i vw_holds_fulfilment_external.sql
\i vw_holds_fulfilment_internal.sql
\i vw_items.sql
\i vw_transits.sql
\i vw_users.sql
\i vw_users_libraries.sql
\i vw_users_public.sql
\i vw_users_geography.sql

--32. create the open data views. these will ensure anonymisation and privacy considerations.
\i vw_opendata_billpayments.sql
\i vw_opendata_holds.sql
\i vw_opendata_transits.sql

--33. create the dashboard views. these are used in visualisations so should only return specific aspects of the data

