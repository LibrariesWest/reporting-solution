---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredbylibrary;
create or replace view vw_dashboard_membership_registeredbylibrary as
select
	u.authority as authority,
    u.library as library,
    count(*) as users
from vw_users u
where u.authority is not null
group by u.authority, u.library
order by u.authority, u.library;