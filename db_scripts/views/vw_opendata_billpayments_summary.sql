---------------------------------------------------------------
-- view: vw_opendata_billpayments_summary
---------------------------------------------------------------

-- drop view vw_opendata_billpayments_summary;
create or replace view vw_opendata_billpayments_summary as
select
    fy.financial_year as financial_year_paid,
    bp.payment_authority as payment_authority,
    bp.payment_type as payment_type,
    round(count(bp.bill_payment_key), -1) as number_of_payments,
    round(sum(bp.payment_amount), -1) as total_paid
from vw_bills_billpayments bp
join financial_year fy on bp.payment_date between fy.beginning and fy.ending
where fy.beginning >= (now() - interval '2 years')
and bp.payment_library in (select code from libraries)
group by financial_year, payment_authority, payment_type
order by financial_year, payment_authority, payment_type;