---------------------------------------------------------------
-- view: vw_dashboard_issues
---------------------------------------------------------------

-- drop view vw_dashboard_issues;
create or replace view vw_dashboard_issues as 
select 
    fn_librarytoauthority(lp.policy_name) as authority, 
    to_char(date_charged, 'YYYYMM') as month, 
    count(ch.key) as issues
from
    (select key, library, date_charged from charge where date_charged > (now() - interval '1 year')
    union 
    select key, library, date_charged from chargehist where date_charged > (now() - interval '1 year')
    ) as ch
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = ch.library
where fn_librarytoauthority(lp.policy_name) is not null
group by authority, month
order by authority, month;