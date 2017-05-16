---------------------------------------------------------------
-- view: vw_dashboard_issuesbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_issuesbylibrary;
create view vw_dashboard_issuesbylibrary as 
select lp.policy_name as library, 
count(ch.key) as issues
from
(select key, library, date_charged from charge where date_charged > (now() - interval '1 year')
union all
select key, library, date_charged from chargehist where date_charged > (now() - interval '1 year')) ch
join policy lp
on lp.policy_type = 'LIBR'
and lp.policy_number = ch.library
where fn_librarytoauthority(lp.policy_name) is not null
group by lp.policy_name
order by issues desc;