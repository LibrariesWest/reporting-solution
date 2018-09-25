------------------------
-- view: vw_banes_civica
------------------------

-- 
create or replace view vw_banes_civica as 
select
    to_char(day_time, 'YYYYMMDD') as cash_day,
	case 
    	when item_type = 'SALESVAT' then 'SALES - Vatable'
        when item_type = 'SALESNOVAT' then 'SALES - Non Vatable'
    else 'HIRE & FINES' end as sale_type,
    case 
    	when item_type = 'SALESVAT' then 'W'
        when item_type = 'SALESNOVAT' then 'Z'
    else 'V' end as vat,
    case 
    	when item_type = 'SALESVAT' then 'YA1'
        when item_type = 'SALESNOVAT' then 'YA1'
    else 'YF2' end as cost_code,
    library,
	sum(sale_amt) as money_taken
from vw_cashmanagement
where authority = 'Bath and North East Somerset'
and library in ('BNBL', 'BNKY', 'BNMN')
and transaction_type = 'SALE'
and day_time > '7-Jun-2016'
group by to_char(day_time, 'YYYYMMDD') as cash_day, sale_type, vat, cost_code, library
order by to_char(day_time, 'YYYYMMDD') as cash_day, sale_type, vat, cost_code, library;