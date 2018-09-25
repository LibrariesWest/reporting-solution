---------------------------------------------------------------
-- view: vw_dashboard_cash_breakdown
---------------------------------------------------------------

-- drop view vw_dashboard_cash_breakdown
create or replace view vw_dashboard_cash_breakdown as
select
	day_time,
	authority,
	library,
	transaction_type,
	payment_type,
	amount,
	bill_reason,
	item_type,
	payment_group,
	description,
	quantity,
	sale_amt,
	tax_amt
from vw_cashmanagement
order by day_time;