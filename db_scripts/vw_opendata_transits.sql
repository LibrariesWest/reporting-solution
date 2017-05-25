---------------------------------------------------------------
-- view: vw_opendata_transits
---------------------------------------------------------------

-- drop view vw_opendata_transits;
create or replace view vw_opendata_transits as
select
    i.id as item_id,
    ity.policy_name as item_type,
    fn_librarytoauthority(lpf.policy_name) as from_authority,
    lpf.policy_name as from_library,
    fn_librarytoauthority(lpt.policy_name) as to_authority,
    lpt.policy_name as to_library
from transit t
join item i
on i.catalogue_key = t.catalogue_key
and i.call_sequence = t.call_sequence
and i.copy_number = t.copy_number
join policy ity
on ity.policy_type = 'ITYP'
and ity.policy_number = i.type
join policy lpf
on lpf.policy_type = 'LIBR'
and lpf.policy_number = t.from_library
join policy lpt
on lpt.policy_type = 'LIBR'
and lpt.policy_number = t.to_library
join policy tr
on tr.policy_type = 'TRANSIT_RSN'
and tr.policy_number = t.reason_needed
group by from_authority, lpf.policy_name, to_authority, lpt.policy_name;