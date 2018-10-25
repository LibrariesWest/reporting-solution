---------------------------------------------------------------
-- view: vw_cash_dailytotals
---------------------------------------------------------------

-- drop view vw_cash_dailytotals
create or replace view vw_dashboard_cash_dailytotals as
select 
	day_time,
	library, 
	authority,
	station,
	transaction_type,
	bill_reason,
	item_type,
	count(*) as number_of_payments,
	sum(sale_amt) as total_sale_amt,
	sum(tax_amt) as total_tax_amt
from vw_cashmanagement
where transaction_type = 'SALE'
group by day_time, library, authority, station, bill_reason, transaction_type, item_type
order by day_time, library, authority, station, bill_reason, transaction_type, item_type;
