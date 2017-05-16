---------------------------------------------------------------
-- view: vw_dashboard_transits
---------------------------------------------------------------

-- drop view vw_dashboard_transits;
create or replace view vw_dashboard_transits as
select
    fn_librarytoauthority(lpf.policy_name) as from_authority,
    lpf.policy_name as from_library,
    fn_librarytoauthority(lpt.policy_name) as to_authority,
    lpt.policy_name as to_library,
    count(*) as items
from transit t
join policy lpf
on lpf.policy_type = 'LIBR'
and lpf.policy_number = t.from_library
join policy lpt
on lpt.policy_type = 'LIBR'
and lpt.policy_number = t.to_library
where fn_librarytoauthority(lpf.policy_name) is not null
group by from_authority, lpf.policy_name, to_authority, lpt.policy_name;