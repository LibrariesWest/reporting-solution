---------------------------------------------------------------
-- view: vw_bills_billpayments
---------------------------------------------------------------

-- drop view vw_bills_billpayments;
create or replace view vw_bills_billpayments as 
select 
    bp.payment_date,
    b.date_billed,
    u.id as user_id,
    i.id as item_id,
    itp.policy_name as item_type,
    li.policy_name as item_library,
    fn_librarytoauthority(li.policy_name) as item_authority,
    lp.policy_name as bill_library,
    fn_librarytoauthority(lp.policy_name) as bill_authority,
    pl.policy_name as payment_library,
    fn_librarytoauthority(pl.policy_name) as payment_authority,
    br.policy_name as reason,
    pt.policy_name as payment_type,
    bp.payment_amount,
    b.amount_billed as bill_amount,
    b.paid_in_full_flag as paid
from bill b
join item i on i.catalogue_key = b.catalogue_key and i.call_sequence = b.call_sequence and i.copy_number = b.copy_number
join policy itp on itp.policy_number = i.type and itp.policy_type = 'ITYP'
join users u on u.user_key = b.user_key
join policy lp on lp.policy_number = b.library and lp.policy_type = 'LIBR'
join policy li on li.policy_number = i.library and li.policy_type = 'LIBR'
join policy br on br.policy_number = b.reason and br.policy_type = 'BRSN'
join billpayment bp on bp.bill_number = b.bill_number and bp.user_key = b.user_key
join policy pt on pt.policy_number = bp.payment_type and pt.policy_type = 'PTYP'
join policy pl on pl.policy_number = bp.library and pl.policy_type = 'LIBR';