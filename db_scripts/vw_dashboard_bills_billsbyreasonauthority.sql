---------------------------------------------------------------
-- view: vw_dashboard_bills_billsbyreasonauthority
---------------------------------------------------------------

-- drop view vw_dashboard_bills_billsbyreasonauthority;
create or replace view vw_dashboard_bills_billsbyreasonauthority as
select
    fn_librarytoauthority(bl.policy_name) as authority,
    br.policy_name as reason,
    count(*) as number_of_bills,
	sum(b.amount_billed) as total_billed
from bill b
join users u
on u.user_key = b.user_key
join policy br on br.policy_type = 'BRSN' and br.policy_number = b.reason
join policy bl on bl.policy_type = 'LIBR' and bl.policy_number = b.library
where b.date_billed > (now() - interval '1 year')
group by fn_librarytoauthority(bl.policy_name), br.policy_name
order by fn_librarytoauthority(bl.policy_name), br.policy_name;