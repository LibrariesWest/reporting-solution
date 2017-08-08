---------------------------------------------------------------
-- view: vw_dashboard_bills_paymentsbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_bills_paymentsbyauthority;
create or replace view vw_dashboard_bills_paymentsbyauthority as
select 
    fn_librarytoauthority(lp.policy_name) as authority,
    tp.policy_name as payment_type,
    count(bill_payment_key) as number_of_payments,
    sum(payment_amount) as total_paid
from billpayment bp
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = bp.library
join policy tp on tp.policy_type = 'PTYP' and tp.policy_number = bp.payment_type
where bp.payment_date > now() - interval '1 year'
group by authority, tp.policy_name
order by authority, tp.policy_name;