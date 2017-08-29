---------------------------------------------------------------
-- view: vw_dashboard_bills_billsbyreasonlibrary
---------------------------------------------------------------

-- drop view vw_dashboard_bills_billsbyreasonlibrary;
create or replace view vw_dashboard_bills_billsbyreasonlibrary as
select
	b.bill_authority,
    b.library,
	b.reason,
    count(*) as number_of_bills,
    sum(b.amount) as total_billed
from vw_bills b
join vw_users u on u.user_key = b.user_key
where b.date_billed > (now() - interval '1 year')
group by b.bill_authority, b.library, b.reason
order by b.bill_authority, b.library, b.reason;