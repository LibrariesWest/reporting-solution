---------------------------------------------------------------
-- view: vw_charges
---------------------------------------------------------------

-- drop view vw_charges;
create or replace view vw_charges as 
select 
    u.user_key,
    u.id as user_id,
    i.id as item_id,
    lp.policy_name as charge_library,
    fn_librarytoauthority(lp.policy_name) as charge_authority,
    c.date_charged as date_charged,
    c.date_renewed as date_renewed,
    c.number_of_renewals as number_of_renewals,
    c.number_of_unseen_renewals as number_of_unseen_renewals,
    c.accrued_fine as accrued_fine,
    case
        when c.overdue = 0 then 'No'
        else 'Yes'
    end as overdue
from charge c
join users u on u.user_key = c.user_key
join item i on i.catalogue_key = c.catalogue_key and i.call_sequence = c.call_sequence and i.copy_number = c.copy_number
join policy lp on lp.policy_number = c.library and lp.policy_type = 'LIBR'
where fn_librarytoauthority(lp.policy_name) is not null;