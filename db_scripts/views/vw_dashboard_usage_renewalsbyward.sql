---------------------------------------------------------------
-- view: vw_dashboard_usage_renewalsbyward
---------------------------------------------------------------

-- drop view vw_dashboard_usage_renewalsbyward;
create or replace view vw_dashboard_usage_renewalsbyward as
select
	u.ward_name,
    sum(ch.number_of_renewals) as renewals
from
	(	select user_key, number_of_renewals from charge where date_charged > (now() - interval '1 year')
     	union all
     	select user_key, number_of_renewals from chargehist where date_charged > (now() - interval '1 year')
	) ch
join vw_users_geography u on ch.user_key = u.user_key
group by u.ward_name;