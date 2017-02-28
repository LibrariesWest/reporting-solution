-- view: vw_transits
-- drop view vw_transits;
create or replace view vw_transits as 
select 
    i.id as item_id,
    ip.policy_name as item_type,
    t.date_time_transited as transited,
    fl.policy_name as from_library,
    fn_librarytoauthority(fl.policy_name::text) as from_authority,
    tl.policy_name as to_library,
    fn_librarytoauthority(tl.policy_name::text) as to_authority,
    pr.policy_name as reason
from transit t
join item i on t.catalogue_key = i.catalogue_key and t.call_sequence = i.call_sequence and t.copy_number = i.copy_number
join policy ip on ip.policy_number = i.type and ip.policy_type::text = 'ITYP'::text
join policy fl on fl.policy_number = t.from_library and fl.policy_type::text = 'LIBR'::text
join policy tl on tl.policy_number = t.to_library and tl.policy_type::text = 'LIBR'::text
join policy pr on pr.policy_number = t.reason_needed and pr.policy_type::text = 'TRANSIT_RSN'::text;