---------------------------------------------------------------
-- view: vw_dashboard_bills_billsbyauthorityandmonth
---------------------------------------------------------------

-- drop view vw_dashboard_bills_billsbyauthorityandmonth;
create or replace view vw_dashboard_bills_billsbyauthorityandmonth as
select
	b.bill_authority,
    to_char(b.date_billed, 'YYYYMM') as bill_month,
    count(*) as number_of_bills,
    sum(b.amount) as total_billed
from vw_bills b
join vw_users u on u.user_key = b.user_key
where b.date_billed > (now() - interval '1 year')
group by b.bill_authority, bill_month
order by b.bill_authority, bill_month;