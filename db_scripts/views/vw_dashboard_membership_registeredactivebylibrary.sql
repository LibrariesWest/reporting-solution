---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredactivebylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredactivebylibrary;
create or replace view vw_dashboard_membership_registeredactivebylibrary as
select
	fn_librarytoauthority(ul.policy_name) as authority,
    ul.policy_name as library,
    count(*) as users
from users u
join policy ul
on ul.policy_type = 'LIBR' and ul.policy_number = u.library
where u.last_activity_date > (now() - interval '1 year')
and fn_librarytoauthority(ul.policy_name) is not null
group by fn_librarytoauthority(ul.policy_name), ul.policy_name
order by fn_librarytoauthority(ul.policy_name), ul.policy_name;