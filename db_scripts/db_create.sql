------------------------------------------------------
-- custom reporting database.  create script.
------------------------------------------------------

-- 1.  create the database.
drop database customreporting;
create database customreporting;
\c customreporting;

-- 2.  authorities function
\i fn_librarytoauthority.sql

-- 3.  bill table
\i tbl_bill.sql
\i tbl_bill_load.sql
\i tbl_bill_indexes.sql

-- 4.  billpayments table
\i tbl_billpayments.sql
\i tbl_billpayments_load.sql
\i tbl_billpayments_indexes.sql