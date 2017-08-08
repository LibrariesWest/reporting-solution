---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbylibrary;
create or replace view vw_dashboard_usage_loansbylibrary as 
select 
    fn_librarytoauthority(lp.policy_name) as authority,
    lp.policy_name as library, 
    count(ch.key) as loans
from
    (   select key, library, date_charged from charge where date_charged > (now() - interval '1 year')
        union all
        select key, library, date_charged from chargehist where date_charged > (now() - interval '1 year')
    ) as ch
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = ch.library
where fn_librarytoauthority(lp.policy_name) is not null
group by lp.policy_name
order by fn_librarytoauthority(lp.policy_name), lp.policy_name, loans desc;