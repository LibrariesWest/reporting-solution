---------------------------------------------------------------
-- view: vw_dashboard_movement_transitsoversixweeks
---------------------------------------------------------------

-- drop view vw_dashboard_movement_transitsoversixweeks;
create or replace view vw_dashboard_movement_transitsoversixweeks as
select
    t.date_time_transited as date_transited,
    i.id as item_id,
    ipt.policy_name as item_type,
    iph.policy_name as home_location,
    lpf.policy_name as from_library,
    fn_librarytoauthority(lpf.policy_name) as from_authority,
    lpt.policy_name as to_library,
    fn_librarytoauthority(lpt.policy_name) as to_authority
from transit t
join item i on i.catalogue_key = t.catalogue_key and i.call_sequence = t.call_sequence and i.copy_number = t.copy_number
join policy lpf on lpf.policy_type = 'LIBR' and lpf.policy_number = t.from_library
join policy lpt on lpt.policy_type = 'LIBR' and lpt.policy_number = t.to_library
join policy ipt on ipt.policy_type = 'ITYP' and ipt.policy_number = i.type
join policy iph on iph.policy_type = 'LOCN' and iph.policy_number = i.home_location
where date_time_transited < (now() - interval '6 weeks')
and fn_librarytoauthority(lpf.policy_name) is not null
and iph.policy_name not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
order by date_time_transited;