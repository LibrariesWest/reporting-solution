---------------------------------------------------------------
-- view: vw_opendata_bills
---------------------------------------------------------------

-- drop view vw_opendata_bills;
create or replace view vw_opendata_bills as
select
    to_char(b.date_billed, 'YYYY-MM') as month_billed,
    b.bill_authority as bill_authority,
    l.name as bill_library,
	b.item_type as item_type,
    b.reason as bill_reason,
    count(*) as number_of_bills,
    sum(amount) as total_billed
from vw_bills b
join libraries l on l.code = b.bill_library
where b.date_billed >= (now() - interval '2 years')
and b.date_billed < date_trunc('month', now())
group by month_billed, bill_authority, l.name, item_type, bill_reason
order by month_billed, bill_authority, l.name, item_type, bill_reason;