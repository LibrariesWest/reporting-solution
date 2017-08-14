---------------------------------------------------------------
-- view: vw_holds
---------------------------------------------------------------

-- drop view vw_holds;
create or replace view vw_holds as 
select 
    h.key,
    u.id as user_id,
    i.id as item_id,
    lp.policy_name as placed_library,
    fn_librarytoauthority(lp.policy_name) as placed_authority,
    ip.policy_name as item_library,
    fn_librarytoauthority(ip.policy_name) as item_authority,
    it.policy_name as item_type,
    ipp.policy_name as pickup_library,
    fn_librarytoauthority(ipp.policy_name) as pickup_authority,
    h.hold_priority,
    case
        when h.type = 'C' then 'Copy'
        when h.type = 'T' then 'Title'
        else null
    end as hold_level,
    rp.policy_name as hold_range,
    sp.policy_name as hold_status,
    h.date_placed as date_placed,
    h.date_expires as date_expires,
    h.date_notified as date_notified,
    h.date_inactive as date_inactive,
    hp.policy_name as inactive_reason,
    h.date_available as date_available,
    h.date_available_expires as date_available_expires,
    rep.policy_name as recall_status,
    h.date_recalled as date_recalled,
    h.position,
    cp.policy_name as client
from hold h
join users u on u.user_key = h.user_key
join item i on i.catalogue_key = h.catalogue_key and i.call_sequence = h.call_sequence and i.copy_number = h.copy_number
join policy it on it.policy_type = 'ITYP' and it.policy_number = i.type
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = h.library
join policy ip on ip.policy_type = 'LIBR' and ip.policy_number = h.item_library 
join policy ipp on ipp.policy_type = 'LIBR' and ipp.policy_number = h.pickup_library 
join policy cp on cp.policy_type = 'CTYP' and cp.policy_number = h.client_used
join policy sp on sp.policy_type = 'HOLD_STATUS' and sp.policy_number = h.hold_status
join policy hp on hp.policy_type = 'HOLD_REASON_TYPE' and hp.policy_number = h.inactive_reason
join policy rep on rep.policy_type = 'RECALL_STATUS' and rep.policy_number = h.recall_status
join policy rp on rp.policy_type = 'HOLD_RANGE' and rp.policy_number = h.range
where fn_librarytoauthority(lp.policy_name) is not null;