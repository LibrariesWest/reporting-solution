---------------------------------------------------------------
-- view: vw_holds
---------------------------------------------------------------

-- drop view vw_holds;
create or replace view vw_holds as 
select 
    u.id as user_id,
    i.id as item_id,
    lp.policy_name as library,
    fn_librarytoauthority(lp.policy_name) as authority,
    ip.policy_name as item_library,
    fn_librarytoauthority(ip.policy_name) as item_authority,
    ipp.policy_name as pickup_library,
    fn_librarytoauthority(ipp.policy_name) as pickup_authority,
    h.hold_priority,
    case
        when h.type = 'C' then 'Copy'
        when h.type = 'T' then 'Title'
        else null
    end as level,
    rp.policy_name as range,
    sp.policy_name as status,
    h.date_placed as placed,
    h.date_expires as expired,
    h.date_notified as notified,
    h.date_inactive as inactive,
    hp.policy_name as inactive_reason,
    h.date_available as available,
    h.date_available_expires as available_expires,
    rep.policy_name as recall_status,
    h.date_recalled as recalled,
    h.position,
    cp.policy_name as client
from hold h
join users u on u.user_key = h.user_key
join item i on i.catalogue_key = h.catalogue_key and i.call_sequence = h.call_sequence and i.copy_number = h.copy_number
join policy lp on lp.policy_number = h.library and lp.policy_type = 'LIBR'
join policy ip on ip.policy_number = h.item_library and ip.policy_type = 'LIBR'
join policy ipp on ipp.policy_number = h.pickup_library and ipp.policy_type = 'LIBR'
join policy cp on cp.policy_type = 'CTYP' and cp.policy_number = h.client_used
join policy sp on sp.policy_type = 'HOLD_STATUS' and sp.policy_number = h.hold_status
join policy hp on hp.policy_type = 'HOLD_REASON_TYPE' and hp.policy_number = h.inactive_reason
join policy rep on rep.policy_type = 'RECALL_STATUS' and rep.policy_number = h.recall_status
join policy rp on rp.policy_type = 'HOLD_RANGE' and rp.policy_number = h.range;