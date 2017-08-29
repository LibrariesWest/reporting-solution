---------------------------------------------------------------
-- view: vw_bills_billpayments
---------------------------------------------------------------

-- drop view vw_bills_billpayments;
create or replace view vw_bills_billpayments as
select
    b.user_key,
    b.bill_number,
    b.date_billed,
    b.user_id,
    b.item_id,
    b.item_type,
    b.item_library,
    b.item_authority,
    b.bill_library,
    b.bill_authority,
    b.reason,
    b.amount as billed_amount,
    b.paid,
    bp.bill_payment_key,
    bp.payment_date as payment_date,
    bp.library as billpayment_library,
    bp.authority as billpayment_authority,
    bp.payment_type,
    bp.payment_amount as billpayment_amount
from vw_bills b
join vw_billpayments bp on bp.bill_number = b.bill_number and bp.user_key = b.user_key;