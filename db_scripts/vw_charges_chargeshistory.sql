---------------------------------------------------------------
-- view: vw_charges_chargeshistory
---------------------------------------------------------------

-- drop view vw_charges_chargeshistory;
create or replace view vw_charges_chargeshistory as 
select 
    uh.id as user_id,
    ih.id as item,
    lph.policy_name as library,
    fn_librarytoauthority(lph.policy_name::text) as authority,
    ch.date_charged as charged,
    ch.date_renewed as renewed,
    ch.number_of_renewals as renewals,
    ch.number_of_unseen_renewals as unseen,
    ch.accrued_fine as fine,
        case
            when ch.overdue = 0 then 'No'::text
            else 'Yes'::text
        end as overdue,
    ch.date_time_discharged as discharged,
    ldph.policy_name as discharge_library,
    fn_librarytoauthority(ldph.policy_name::text) as discharge_authority
from chargehist ch
join users uh on uh.user_key = ch.user_key
join item ih on ih.catalogue_key = ch.catalogue_key and ih.call_sequence = ch.call_sequence and ih.copy_number = ch.copy_number
join policy lph on lph.policy_number = ch.library and lph.policy_type::text = 'LIBR'::text
join policy ldph on ldph.policy_number = ch.discharge_library and ldph.policy_type::text = 'LIBR'::text
union all
select 
    u.id as user_id,
    i.id as item,
    lp.policy_name as library,
    fn_librarytoauthority(lp.policy_name::text) as authority,
    c.date_charged as charged,
    c.date_renewed as renewed,
    c.number_of_renewals as renewals,
    c.number_of_unseen_renewals as unseen,
    c.accrued_fine as fine,
        case
            when c.overdue = 0 then 'No'::text
            else 'Yes'::text
        end as overdue,
    null::date as discharged,
    null::character varying as discharge_library,
    null::text as discharge_authority
from charge c
join users u on u.user_key = c.user_key
join item i on i.catalogue_key = c.catalogue_key and i.call_sequence = c.call_sequence and i.copy_number = c.copy_number
join policy lp on lp.policy_number = c.library and lp.policy_type::text = 'LIBR'::text;