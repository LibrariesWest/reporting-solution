-- view: vw_holds
-- drop view vw_holds;
create or replace view vw_holds as 
select 
    u.id as user_id,
    i.id as item_id,
    lp.policy_name as library,
    fn_librarytoauthority(lp.policy_name::text) as authority,
    ip.policy_name as item_library,
    fn_librarytoauthority(ip.policy_name::text) as item_authority,
    ipp.policy_name as pickup_library,
    fn_librarytoauthority(ipp.policy_name::text) as pickup_authority,
    h.hold_priority,
    case
        when h.type::text = 'c'::text then 'Copy'::text
        when h.type::text = 't'::text then 'Title'::text
        else null::text
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
join policy lp on lp.policy_number = h.library and lp.policy_type::text = 'libr'::text
join policy ip on ip.policy_number = h.item_library and ip.policy_type::text = 'libr'::text
join policy ipp on ipp.policy_number = h.pickup_library and ipp.policy_type::text = 'libr'::text
join policy cp on cp.policy_type::text = 'ctyp'::text and cp.policy_number = h.client_used
join policy sp on sp.policy_type::text = 'hold_status'::text and sp.policy_number = h.hold_status
join policy hp on hp.policy_type::text = 'hold_reason_type'::text and hp.policy_number = h.inactive_reason
join policy rep on rep.policy_type::text = 'recall_status'::text and rep.policy_number = h.recall_status
join policy rp on rp.policy_type::text = 'hold_range'::text and rp.policy_number = h.range;