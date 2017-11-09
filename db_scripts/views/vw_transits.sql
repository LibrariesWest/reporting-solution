---------------------------------------------------------------
-- view: vw_transits
---------------------------------------------------------------

-- drop view vw_transits;
create or replace view vw_transits as
select
    i.id as item_id,
    t.catalogue_key,
    t.call_sequence,
    t.copy_number,
    ip.policy_name as item_type,
    ihl.policy_name as home_location,
    icl.policy_name as current_location,
    h.key as hold_key,
    t.date_time_transited as date_time_transited,
    fl.policy_name as from_library,
    fn_librarytoauthority(fl.policy_name) as from_authority,
    tl.policy_name as to_library,
    fn_librarytoauthority(tl.policy_name) as to_authority,
    hl.policy_name as home_library,
    fn_librarytoauthority(hl.policy_name) as home_authority,
    pr.policy_name as transit_reason,
	i.shadow
from transit t
join item i on t.catalogue_key = i.catalogue_key and t.call_sequence = i.call_sequence and t.copy_number = i.copy_number
left join hold h on h.key = t.hold_key 
join policy ihl on ihl.policy_number = i.home_location and ihl.policy_type = 'LOCN'
join policy icl on icl.policy_number = i.current_location and icl.policy_type = 'LOCN'
join policy ip on ip.policy_number = i.type and ip.policy_type = 'ITYP'
join policy hl on hl.policy_number = i.library and hl.policy_type = 'LIBR'
join policy fl on fl.policy_number = t.from_library and fl.policy_type = 'LIBR'
join policy tl on tl.policy_number = t.to_library and tl.policy_type = 'LIBR'
join policy pr on pr.policy_number = t.reason_needed and pr.policy_type = 'TRANSIT_RSN'
where fn_librarytoauthority(hl.policy_name) is not null;