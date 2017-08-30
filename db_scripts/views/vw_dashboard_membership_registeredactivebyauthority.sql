---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredactivebyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredactivebyauthority;
create or replace view vw_dashboard_membership_registeredactivebyauthority as
select
	u.authority as authority,
    count(*) as users
from vw_users u
where u.authority is not null
and u.last_activity_date > (now() - interval '1 year')
group by u.library
order by u.library;