---------------------------------------------------------------
-- view: vw_cash_dailytotals
---------------------------------------------------------------

-- drop view vw_cash_dailytotals
create or replace view vw_dashboard_cash_dailytotals as
select 
	day_time,
	library, 
	authority,
	bill_reason,
	count(*) as number_of_payments,
	sum(sale_amt) as total_sale_amt,
	sum(tax_amt) as total_tax_amt
from vw_cashmanagement
group by day_time, library, authority, bill_reason
order by day_time, library, authority, bill_reason;