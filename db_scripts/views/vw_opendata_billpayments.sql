---------------------------------------------------------------
-- view: vw_opendata_billpayments
---------------------------------------------------------------

-- drop view vw_opendata_billpayments;
create or replace view vw_opendata_billpayments as
select
    to_char(bp.payment_date, 'YYYY-MM') as month_paid,
    bp.payment_authority as payment_authority,
    l.name as payment_library,
    rp.field_1 as bill_reason,
    bp.payment_type as payment_type,
    round(count(bp.bill_payment_key), -1) as number_of_payments,
    round(sum(bp.payment_amount), -1) as system_paid,
    round(sum((case when bp.payment_type = 'CANCEL' then 0 when bp.payment_type = 'FORGIVEN' then 0 else bp.payment_amount end)), -1) as real_amount_paid
from vw_bills_billpayments bp
join libraries l on l.code = bp.payment_library
join policy rp on rp.policy_type = 'BRSN' and rp.policy_name = bp.reason
where bp.payment_date >= date_trunc('month', (now() - interval '2 years')) 
and bp.payment_date < date_trunc('month', now())
group by month_paid, payment_authority, l.name, rp.field_1, payment_type
order by month_paid, payment_authority, l.name, rp.field_1, payment_type;