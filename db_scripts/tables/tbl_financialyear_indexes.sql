---------------------------------------------------------------
-- table: financial year.  indexes
---------------------------------------------------------------

-- index: cuix_financialyear_year
-- drop index cuix_financialyear_year;
create unique index cuix_financialyear_year on financial_year using btree (financial_year, beginning, ending);
alter table financial_year cluster on cuix_financialyear_year;