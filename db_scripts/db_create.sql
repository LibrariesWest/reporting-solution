------------------------------------------------------
-- custom reporting database.  create script.
------------------------------------------------------

-- 1.  create the database.
create database customreporting;
\c customreporting;

set client_encoding = 'UTF8';

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

-- 10.  daily pay trans amt table
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

-- 15.  os postcodes table 
\i tbl_ospostcodes.sql
\i tbl_ospostcodes_load.sql
\i tbl_ospostcodes_indexes.sql

-- 16.  policy table 
\i tbl_policy.sql
\i tbl_policy_load.sql
\i tbl_policy_indexes.sql

-- 17.  transit table 
\i tbl_transit.sql
\i tbl_transit_load.sql
\i tbl_transit_indexes.sql

-- 18.  ucat table 
\i tbl_ucat.sql
\i tbl_ucat_load.sql
\i tbl_ucat_indexes.sql

-- 19.  users table 
\i tbl_users.sql
\i tbl_users_load.sql
\i tbl_users_indexes.sql

-- 20.  users table 
\i tbl_userxinfo.sql
\i tbl_userxinfo_load.sql
\i tbl_userxinfo_indexes.sql

-- 21.  create the views
\i vw_billpayments.sql
\i vw_bills_billpayments.sql
\i vw_bills.sql
\i vw_cashmanagement.sql
\i vw_catalogue.sql
\i vw_charges_chargeshistory.sql
\i vw_charges.sql
\i vw_charges_history.sql
\i vw_holds.sql
\i vw_items.sql
\i vw_transits.sql
\i vw_users_libraries.sql
\i vw_users_public.sql
\i vw_users.sql