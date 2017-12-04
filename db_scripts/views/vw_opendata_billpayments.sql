---------------------------------------------------------------
-- view: vw_opendata_billpayments
---------------------------------------------------------------

-- drop view vw_opendata_billpayments;
create or replace view vw_opendata_billpayments as
select
    to_char(bp.payment_date, 'YYYY-MM') as month_paid,
    bp.payment_authority as payment_authority,
    bp.payment_library as payment_library,
    bp.reason as bill_reason,
    bp.payment_type as payment_type,
    count(bp.bill_payment_key) as number_of_payments,
    sum(bp.payment_amount) as total_paid
from vw_bills_billpayments bp
group by month_paid, payment_authority, payment_library, bill_reason, payment_type
order by month_paid, payment_authority, payment_library, bill_reason, payment_type;
