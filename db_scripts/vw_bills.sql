-- view: vw_bills
-- drop view vw_bills;
create or replace view vw_bills as 
select 
    b.date_billed,
    u.id as user_id,
    i.id as item_id,
    itp.policy_name as item_type,
    li.policy_name as item_library,
    fn_librarytoauthority(li.policy_name::text) as item_authority,
    lp.policy_name as bill_library,
    fn_librarytoauthority(lp.policy_name::text) as bill_authority,
    bp.policy_name as reason,
    b.amount_billed as amount,
    b.paid_in_full_flag as paid
from bill b
join item i on i.catalogue_key = b.catalogue_key and i.call_sequence = b.call_sequence and i.copy_number = b.copy_number
join policy itp on itp.policy_number = i.type and itp.policy_type::text = 'ITYP'::text
join users u on u.user_key = b.user_key
join policy lp on lp.policy_number = b.library and lp.policy_type::text = 'LIBR'::text
join policy li on li.policy_number = i.library and li.policy_type::text = 'LIBR'::text
join policy bp on bp.policy_number = b.reason and bp.policy_type::text = 'BRSN'::text;