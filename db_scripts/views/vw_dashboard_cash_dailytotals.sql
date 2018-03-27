---------------------------------------------------------------
-- view: vw_cash_dailytotals
---------------------------------------------------------------

-- drop view vw_cash_dailytotals
create or replace view vw_dashboard_cash_dailytotals as
select 
	date_paid,
	library, 
	authority,
	payment_reason,
	count(*) as number_of_payments,
	sum(sale_amt) as total_sale_amt,
	sum(tax_amt) as total_tax_amt
from vw_cashmanagement
group by date_paid, library, authority, payment_reason
order by date_paid, library, authority, payment_reason;