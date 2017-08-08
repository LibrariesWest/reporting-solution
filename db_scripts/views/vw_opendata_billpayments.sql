---------------------------------------------------------------
-- view: vw_opendata_billpayments
---------------------------------------------------------------

-- drop view vw_opendata_billpayments;
create or replace view vw_opendata_billpayments as
select
    to_char(bp.payment_date, 'YYYYMM') as month,
    lp.policy_name as library,
    fn_librarytoauthority(lp.policy_name) as authority,
    ptp.policy_name as payment_type,
    bp.payment_amount as amount
from billpayment bp
join bill b
on b.bill_number = bp.bill_number
and b.user_key = bp.user_key
join users u on u.user_key = bp.user_key
join policy ptp on ptp.policy_number = bp.payment_type and ptp.policy_type = 'PTYP'
join policy lp on lp.policy_number = bp.library and lp.policy_type = 'LIBR'
join policy brp on brp.policy_type = 'BRSN';