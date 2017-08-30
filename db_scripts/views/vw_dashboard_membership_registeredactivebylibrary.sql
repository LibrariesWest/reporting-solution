---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredactivebylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredactivebylibrary;
create or replace view vw_dashboard_membership_registeredactivebylibrary as
select
	u.authority as authority,
    u.library as library,
    count(*) as users
from vw_users u
where u.authority is not null
and u.last_activity_date > (now() - interval '1 year')
group by u.authority, u.library
order by u.authority, u.library;