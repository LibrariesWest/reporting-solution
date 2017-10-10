---------------------------------------------------------------
-- view: vw_dashboard_bills_paymentsbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_bills_paymentsbylibrary;
create or replace view vw_dashboard_bills_paymentsbylibrary as
select 
    bp.authority,
    bp.library,
    bp.payment_type,
    count(bp.bill_payment_key) as number_of_payments,
    sum(bp.payment_amount) as total_paid
from vw_billpayments bp
where bp.payment_date > (now() - interval '1 year')
group by bp.authority, bp.library, bp.payment_type
order by bp.authority, bp.library, bp.payment_type;