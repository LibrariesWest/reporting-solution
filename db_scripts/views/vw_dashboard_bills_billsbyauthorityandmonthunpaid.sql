---------------------------------------------------------------
-- view: vw_dashboard_bills_billsbyauthorityandmonthunpaid
---------------------------------------------------------------

-- drop view vw_dashboard_bills_billsbyauthorityandmonthunpaid;
create or replace view vw_dashboard_bills_billsbyauthorityandmonthunpaid as
select
	b.bill_authority,
    b.reason,
    to_char(b.date_billed, 'YYYYMM') as bill_month,
    count(b.bill_number) as number_of_bills,
    sum(b.amount) as total_billed
from vw_bills b
join vw_users u on u.user_key = b.user_key
where b.date_billed > (now() - interval '5 years')
and b.paid_in_full_flag is false
group by b.bill_authority, b.reason, bill_month
order by b.bill_authority, b.reason, bill_month;