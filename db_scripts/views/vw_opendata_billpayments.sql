---------------------------------------------------------------
-- view: vw_opendata_billpayments
---------------------------------------------------------------

-- drop view vw_opendata_billpayments;
create or replace view vw_opendata_billpayments as
select
    to_char(bp.payment_date, 'YYYY-MM') as month_paid,
    bp.payment_authority as payment_authority,
    l.name as payment_library,
    bp.reason as bill_reason,
    bp.payment_type as payment_type,
    count(bp.bill_payment_key) as number_of_payments,
    sum(bp.payment_amount) as total_paid
from vw_bills_billpayments bp
join libraries l on l.code = bp.payment_library
where bp.payment_date >= (now() - interval '2 years')
and bp.payment_date < date_trunc('month', now())
group by month_paid, payment_authority, payment_library, bill_reason, payment_type
order by month_paid, payment_authority, payment_library, bill_reason, payment_type;