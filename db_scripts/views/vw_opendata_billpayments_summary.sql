---------------------------------------------------------------
-- view: vw_opendata_billpayments_summary
---------------------------------------------------------------

-- drop view vw_opendata_billpayments_summary;
create or replace view vw_opendata_billpayments_summary as
select
    to_char(bp.payment_date, 'YYYY-MM') as month_paid,
    bp.payment_authority as payment_authority,
    bp.payment_type as payment_type,
    count(bp.bill_payment_key) as number_of_payments,
    sum(bp.payment_amount) as total_paid
from vw_bills_billpayments bp
where bp.payment_date >= '7-Jun-2016'
-- filter out some libraries - acquisitions etc
and bp.library not in (
    'BNACQ', 
    'BSACQ', 
    'BSBP', 
    'BSCS', 
    'DELETE', 
    'DOACQ',
    'DOHQ',
    'DOPRISGM',
    'DOPRISPO',
    'DOPRISVE',
    'DOSLS',
    'NSACQ',
    'POACQ',
    'SGACQ',
    'SGEP',
    'SGLP',
    'SOHDQ',
    'SOMIM',
    'SOSAR',
    'SOSST')
group by month_paid, payment_authority, payment_type
order by month_paid, payment_authority, payment_type;
