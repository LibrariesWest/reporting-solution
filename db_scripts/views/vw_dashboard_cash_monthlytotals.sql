---------------------------------------------------------------
-- view: vw_dashboard_cash_nonsystem_monthlytotals
---------------------------------------------------------------

-- drop view vw_dashboard_cash_nonsystem_monthlytotals
create or replace view vw_dashboard_cash_nonsystem_monthlytotals as
select
	to_char(day_time, 'YYYY-MM') as month,
	library,
	authority,
	item_type,
	payment_type,
	count(*) as number_of_payments,
	sum(sale_amt) as total_sale_amt,
	sum(tax_amt) as total_tax_amt
from vw_cashmanagement
where transaction_type = 'SALE'
group by month, library, authority, item_type, payment_type
order by month, library, authority, item_type, payment_type;