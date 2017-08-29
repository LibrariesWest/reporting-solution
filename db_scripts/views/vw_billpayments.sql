---------------------------------------------------------------
-- view: vw_billpayments
---------------------------------------------------------------

-- drop view vw_billpayments;
create or replace view vw_billpayments as 
select
    bp.bill_payment_key,
    u.user_key,
    u.id as user_id,
    bp.bill_number,
    bp.payment_date as payment_date,
    lp.policy_name as library,
    fn_librarytoauthority(lp.policy_name) as authority,
    ptp.policy_name as payment_type,
    bp.payment_amount as payment_amount
from billpayment bp
join users u on u.user_key = bp.user_key
join policy ptp on ptp.policy_number = bp.payment_type and ptp.policy_type = 'PTYP'
join policy lp on lp.policy_number = bp.library and lp.policy_type = 'LIBR'
where fn_librarytoauthority(lp.policy_name) is not null;