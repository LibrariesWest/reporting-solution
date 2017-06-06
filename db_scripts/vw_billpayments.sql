---------------------------------------------------------------
-- view: vw_billpayments
---------------------------------------------------------------

-- drop view vw_billpayments;
create or replace view vw_billpayments as 
select 
    bp.payment_date as date,
    lp.policy_name as library,
    fn_librarytoauthority(lp.policy_name) as authority,
    u.id as user_id,
    ptp.policy_name as type,
    bp.payment_amount as amount
from billpayment bp
join users u on u.user_key = bp.user_key
join policy ptp on ptp.policy_number = bp.payment_type and ptp.policy_type = 'PTYP'
join policy lp on lp.policy_number = bp.library and lp.policy_type = 'LIBR';