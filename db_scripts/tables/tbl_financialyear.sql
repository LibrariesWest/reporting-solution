---------------------------------------------------------------
-- table: financial year
---------------------------------------------------------------

-- drop table financial_year;
create table financial_year
(
  financial_year character (9),
  beginning date,
  ending date,
  constraint pk_financialyear_year primary key (financial_year)
);