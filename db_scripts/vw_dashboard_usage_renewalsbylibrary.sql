---------------------------------------------------------------
-- view: vw_dashboard_usage_renewalsbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_usage_renewalsbylibrary;
create or replace view vw_dashboard_usage_renewalsbylibrary as 
select 
    fn_librarytoauthority(lp.policy_name) as authority,
    lp.policy_name as library, 
    sum(ch.number_of_renewals) as renewals
from
    (select key, number_of_renewals, library, date_charged from charge where date_charged > (now() - interval '1 year')
    union all
    select key, number_of_renewals, library, date_charged from chargehist where date_charged > (now() - interval '1 year')
    ) as ch
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = ch.library
where fn_librarytoauthority(lp.policy_name) is not null
group by fn_librarytoauthority(lp.policy_name), lp.policy_name
order by fn_librarytoauthority(lp.policy_name), lp.policy_name;