---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbyauthority;
create or replace view vw_dashboard_usage_loansbyauthority as 
select 
    fn_librarytoauthority(lp.policy_name) as authority, 
    to_char(date_charged, 'YYYYMM') as month, 
    count(ch.key) as loans
from
    (select key, library, date_charged from charge where date_charged > (now() - interval '1 year')
    union 
    select key, library, date_charged from chargehist where date_charged > (now() - interval '1 year')
    ) as ch
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = ch.library
where fn_librarytoauthority(lp.policy_name) is not null
group by authority, month
order by authority, month, loans desc;