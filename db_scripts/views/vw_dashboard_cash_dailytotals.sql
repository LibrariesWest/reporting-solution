---------------------------------------------------------------
-- view: vw_cash_dailytotals
---------------------------------------------------------------

-- drop view vw_cash_dailytotals
create or replace view vw_dashboard_cash_dailytotals as
select 
	to_char(day_time, 'YYYY-MM-DD') as day,
	library, 
	authority,
	coalesce(bill_reason, payment_group) as bill_type,
	payment_type,
	count(*) as number_of_payments,
	sum(sale_amt) as total_sale_amt,
	sum(tax_amt) as total_tax_amt
from vw_cashmanagement
group by day, library, authority, bill_type, payment_type
order by day, library, authority, bill_type, payment_type;


