--------------------------------------------------------------------------
-- view: vw_dashboard_bills_paymentsbylibraryanditemtypeprofileandmonth
--------------------------------------------------------------------------

-- drop view vw_dashboard_bills_paymentsbylibraryanditemtypeprofileandmonth;
create or replace view vw_dashboard_bills_paymentsbylibraryanditemtypeprofileandmonth as
select
    bp.payment_authority,
    bp.payment_library,
    to_char(bp.payment_date, 'YYYYMM') as payment_month,
    bp.item_authority,
    bp.item_type,
    bp.reason,
    bp.payment_type,
    vu.profile,
    count(bp.bill_payment_key) as number_of_payments,
    sum(bp.payment_amount) as total_paid
from vw_bills_billpayments bp
join vw_users vu on bp.user_key = vu.user_key
group by payment_month, bp.payment_authority, bp.payment_library, bp.reason, bp.payment_type, bp.item_authority, bp.item_type, bp.payment_type, vu.profile
order by payment_month, bp.payment_authority, bp.payment_library, bp.reason, bp.payment_type, bp.item_authority, bp.item_type, bp.payment_type, vu.profile;