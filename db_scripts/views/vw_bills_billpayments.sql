---------------------------------------------------------------
-- view: vw_bills_billpayments
---------------------------------------------------------------

-- drop view vw_bills_billpayments;
create or replace view vw_bills_billpayments as
select
    *
from vw_bills b
join vw_billpayments bp on bp.bill_number = b.bill_number and bp.user_key = b.user_key;