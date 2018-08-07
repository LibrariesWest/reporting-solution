------------------------
-- view: vw_banes_civica
------------------------

-- Custom view for B&NES to extract cash management data
select
	case 
    	when item_type = 'SALESVAT' then 'SALES - Vatable'
        when item_type = 'SALESNOVAT' then 'SALES -Non vatable'
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
    '' as sub_account,
	sum(sale_amt) as moeny_taken
from vw_cashmanagement
where authority = 'Bath and North East Somerset'
and day_time >= '17-May-2018' and day_time < '25-May-2018'
and transaction_type = 'SALE'
group by sale_type, vat, cost_code, library;