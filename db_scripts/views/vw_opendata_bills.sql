---------------------------------------------------------------
-- view: vw_opendata_bills
---------------------------------------------------------------

-- drop view vw_opendata_bills;
create or replace view vw_opendata_bills as
select
    to_char(b.date_billed, 'YYYY-MM') as month_billed,
    b.bill_authority as bill_authority,
    l.name as bill_library,
	ip.field_5 as item_type,
    b.reason as bill_reason,
    case when count(*) > 4 then cast(count(*) as varchar) else '*' end as number_of_bills,
    case when count(*) > 4 then cast(sum(amount) as varchar) else '*' end as total_billed
from vw_bills b
join libraries l on l.code = b.bill_library
join policy ip on ip.policy_type = 'ITYP' and ip.policy_name = b.item_type
where b.date_billed >= date_trunc('month', (now() - interval '2 years'))
and b.date_billed < date_trunc('month', now())
group by month_billed, bill_authority, l.name, ip.field_5, b.reason
order by month_billed, bill_authority, l.name, ip.field_5, b.reason;