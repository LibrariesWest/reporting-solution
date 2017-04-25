---------------------------------------------------------------
-- view: vw_dashboard_residentusers
---------------------------------------------------------------

-- drop view vw_dashboard_residentusers;
create or replace view vw_dashboard_residentusers as
select
up.authority, 
up.active_users,
p.population,
round((cast(up.active_users as numeric) / cast(p.population as numeric)) * 100, 1) as percentage
from 
(select
case when county_name is null then district_name
else county_name end as authority,
case when county is null then district
else county end as authority_code,
count(id) as active_users
from vw_users_geography u
where last_activity_date > (now() - interval '6 months')
group by authority, authority_code
order by active_users desc
limit 11) up
join ons_uk_population p
on p.code = up.authority_code;