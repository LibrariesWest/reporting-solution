---------------------------------------------------------------
-- view: vw_dashboard_bills_paymentsbyauthorityanditemtypeandmonth
---------------------------------------------------------------

-- drop view vw_dashboard_bills_paymentsbyauthorityanditemtypeandmonth;
create or replace view vw_dashboard_bills_paymentsbyauthorityanditemtypeandmonth as
select
    to_char(bp.payment_date, 'YYYYMM') as payment_month,
    bp.payment_authority,
    bp.item_authority,
    bp.item_type,
    bp.reason,
    bp.payment_type,
    count(bp.bill_payment_key) as number_of_payments,
    sum(bp.payment_amount) as total_paid
from vw_bills_billpayments bp
group by payment_month, bp.payment_authority, bp.reason, bp.payment_type, bp.item_authority, bp.item_type, bp.payment_type
order by payment_month, bp.payment_authority, bp.reason, bp.payment_type, bp.item_authority, bp.item_type, bp.payment_type;