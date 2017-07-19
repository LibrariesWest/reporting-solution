---------------------------------------------------------------
-- view: vw_dashboard_movement_transitsoversixweeks
---------------------------------------------------------------

-- drop view vw_dashboard_movement_transitsoversixweeks;
create or replace view vw_dashboard_movement_transitsoversixweeks as
select
    t.date_time_transited as date_transited,
    i.id as item_id,
    lpf.policy_name as from_library,
    lpt.policy_name as to_library
from transit t
join item i on i.catalogue_key = t.catalogue_key and i.call_sequence = t.call_sequence and i.copy_number = t.copy_number
join policy lpf on lpf.policy_type = 'LIBR' and lpf.policy_number = t.from_library
join policy lpt on lpt.policy_type = 'LIBR' and lpt.policy_number = t.to_library
where date_time_transited < now() - interval '6 weeks'
and fn_librarytoauthority(lpf.policy_name) is not null
order by date_time_transited;