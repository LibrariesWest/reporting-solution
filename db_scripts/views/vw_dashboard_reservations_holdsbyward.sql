---------------------------------------------------------------
-- view: vw_dashboard_holdsbyward
---------------------------------------------------------------

-- drop view vw_dashboard_holdsbyward;
create or replace view vw_dashboard_holdsbyward as 
select 
    fn_librarytoauthority(lp.policy_name) as authority,
    to_char(h.date_placed, 'YYYY-MM') as month,
    count(h.key) as holds
from hold h
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = h.library
where h.date_placed > (now() - interval '12 months')
and fn_librarytoauthority(lp.policy_name) is not null
group by (fn_librarytoauthority(lp.policy_name)), (to_char(h.date_placed, 'YYYY-MM'))
order by (fn_librarytoauthority(lp.policy_name)), (to_char(h.date_placed, 'YYYY-MM'));