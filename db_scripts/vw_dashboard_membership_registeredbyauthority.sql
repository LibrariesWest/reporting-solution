---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredbyauthority;
create or replace view vw_dashboard_membership_registeredbyauthority as
select
	fn_librarytoauthority(ul.policy_name) as authority,
    count(*) as users
from users u
join policy ul on ul.policy_type = 'LIBR' and ul.policy_number = u.library
where fn_librarytoauthority(ul.policy_name) is not null
group by fn_librarytoauthority(ul.policy_name)
order by fn_librarytoauthority(ul.policy_name);