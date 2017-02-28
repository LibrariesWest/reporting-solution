-- view: vw_chargeshistory
-- drop view vw_chargeshistory;
create or replace view vw_chargeshistory as 
select 
    u.id as "user",
    i.id as item,
    lp.policy_name as library,
    fn_librarytoauthority(lp.policy_name::text) as authority,
    c.date_charged as charged,
    c.date_renewed as renewed,
    c.number_of_renewals as renewals,
    c.number_of_unseen_renewals as unseen,
    c.accrued_fine as fine,
    case
        when c.overdue = 0 then 'no'::text
        else 'yes'::text
    end as overdue,
    c.date_time_discharged as discharged,
    ldp.policy_name as discharge_library,
    fn_librarytoauthority(ldp.policy_name::text) as discharge_authority
from chargehist c
join users u on u.user_key = c.user_key
join item i on i.catalogue_key = c.catalogue_key and i.call_sequence = c.call_sequence and i.copy_number = c.copy_number
join policy lp on lp.policy_number = c.library and lp.policy_type::text = 'LIBR'::text
join policy ldp on ldp.policy_number = c.discharge_library and ldp.policy_type::text = 'LIBR'::text;