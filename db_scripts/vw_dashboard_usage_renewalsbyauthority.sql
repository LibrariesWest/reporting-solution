---------------------------------------------------------------
-- view: vw_dashboard_usage_renewalsbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_usage_renewalsbyauthority;
create or replace view vw_dashboard_usage_renewalsbyauthority as 
select 
    fn_librarytoauthority(lp.policy_name) as authority, 
    to_char(date_charged, 'YYYYMM') as month, 
    sum(ch.renewals) as renewals
from
    (select key, renewals, library, date_charged from charge where date_charged > (now() - interval '6 months')
    union 
    select key, renewals, library, date_charged from chargehist where date_charged > (now() - interval '6 months')
    ) as ch
join policy lp
on lp.policy_type = 'LIBR'
and lp.policy_number = ch.library
where fn_librarytoauthority(lp.policy_name) is not null
group by authority, month
order by authority, month;