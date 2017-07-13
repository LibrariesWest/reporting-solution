---------------------------------------------------------------
-- view: vw_dashboard_longholds
---------------------------------------------------------------

-- drop view vw_dashboard_longholds;
create or replace view vw_dashboard_longholds as
select 
    h.date_placed as placed,
    i.id as item_id,
    ip.policy_name as item_library,
    ipp.policy_name as pickup_library,
    case
        when h.type = 'C' then 'Copy'
        when h.type = 'T' then 'Title'
        else null
    end as level,
    rp.policy_name as range
from hold h
join item i on i.catalogue_key = h.catalogue_key and i.call_sequence = h.call_sequence and i.copy_number = h.copy_number
join policy ip on ip.policy_number = h.item_library and ip.policy_type = 'LIBR'
join policy ipp on ipp.policy_number = h.pickup_library and ipp.policy_type = 'LIBR'
join policy sp on sp.policy_type = 'HOLD_STATUS' and sp.policy_number = h.hold_status
join policy rp on rp.policy_type = 'HOLD_RANGE' and rp.policy_number = h.range
where sp.policy_name = 'ACTIVE'
and h.date_available is null
and h.date_placed < now() - interval '3 months'
and fn_librarytoauthority(ip.policy_name) is not null
order by date_placed;