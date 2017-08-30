---------------------------------------------------------------
-- view: vw_dashboard_bills_paymentsbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_bills_paymentsbyauthority;
create or replace view vw_dashboard_bills_paymentsbyauthority as
select
    to_char(bp.payment_date, 'YYYYMM') as payment_month,
    bp.authority as payment_authority,
    bp.item_authority,
    bp.item_type,
    bp.payment_type,
    count(bp.bill_payment_key) as number_of_payments,
    sum(bp.payment_amount) as total_paid
from vw_bills_billpayments bp
group by bp.authority, bp.payment_type
order by bp.authority, bp.payment_type;