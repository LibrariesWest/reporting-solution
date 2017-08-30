---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredbyauthority;
create or replace view vw_dashboard_membership_registeredbyauthority as
select
	u.authority,
    count(*) as users
from vw_users u
where u.authority is not null
group by u.authority
order by u.authority;