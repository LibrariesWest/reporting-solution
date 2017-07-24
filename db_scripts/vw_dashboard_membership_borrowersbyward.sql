---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbyward
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbyward;
create or replace view vw_dashboard_membership_borrowersbyward as
select
    vu.ward as ward,
    sum(ch.number_of_renewals) as renewals
from
    (	select user_key, number_of_renewals from charge where date_charged > (now() - interval '1 year')
        union all
        select user_key, number_of_renewals from chargehist where date_charged > (now() - interval '1 year')
	) ch
join vw_users_geography vu on ch.user_key = vu.user_key
group by vu.ward;