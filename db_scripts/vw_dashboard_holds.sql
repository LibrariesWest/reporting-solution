---------------------------------------------------------------
-- view: vw_dashboard_holds
---------------------------------------------------------------

-- drop view vw_dashboard_holds;
create view vw_dashboard_holds as 
select 
fn_librarytoauthority(lp.policy_name) as authority,
to_char(h.date_placed, 'YYYY-MM') as month,
count(h.key) as count
from hold h
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = h.library
where h.date_placed > (now() - interval '12 months')
group by (fn_librarytoauthority(lp.policy_name)), (to_char(h.date_placed, 'YYYY-MM'))
order by (fn_librarytoauthority(lp.policy_name)), (to_char(h.date_placed, 'YYYY-MM'));