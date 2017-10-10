---------------------------------------------------------------
-- view: vw_dashboard_bills_billsbyreasonauthority
---------------------------------------------------------------

-- drop view vw_dashboard_bills_billsbyreasonauthority;
create or replace view vw_dashboard_bills_billsbyreasonauthority as
select
	b.bill_authority,
	b.reason,
    count(b.bill_number) as number_of_bills,
    sum(b.amount) as total_billed
from vw_bills b
join vw_users u on u.user_key = b.user_key
where b.date_billed > (now() - interval '1 year')
group by b.bill_authority, b.reason
order by b.bill_authority, b.reason;