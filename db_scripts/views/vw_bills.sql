---------------------------------------------------------------
-- view: vw_bills
---------------------------------------------------------------

-- drop view vw_bills;
create or replace view vw_bills as 
select
    u.user_key,
    b.bill_number,
    b.date_billed,
    u.id as user_id,
    i.id as item_id,
    itp.policy_name as item_type,
    li.policy_name as item_library,
    fn_librarytoauthority(li.policy_name) as item_authority,
    lp.policy_name as bill_library,
    fn_librarytoauthority(lp.policy_name) as bill_authority,
    br.policy_name as reason,
    b.amount_billed as amount,
    b.paid_in_full_flag
from bill b
left join users u on u.user_key = b.user_key
left join item i on i.catalogue_key = b.catalogue_key and i.call_sequence = b.call_sequence and i.copy_number = b.copy_number
left join policy itp on itp.policy_number = i.type and itp.policy_type = 'ITYP'
join policy br on br.policy_number = b.reason and br.policy_type = 'BRSN'
join policy lp on lp.policy_number = b.library and lp.policy_type = 'LIBR'
left join policy li on li.policy_number = i.library and li.policy_type = 'LIBR'
where fn_librarytoauthority(lp.policy_name) is not null;