---------------------------------------------------------------
-- view: vw_opendata_bills_summary
---------------------------------------------------------------

-- drop view vw_opendata_bills_summary;
create or replace view vw_opendata_bills_summary as
select
    to_char(b.date_billed, 'YYYY') as year_billed,
    b.bill_authority as bill_authority,
    b.reason as bill_reason,
    round(count(*), -1) as number_of_bills,
    round(sum(amount), -1) as total_billed
from vw_bills b
where b.date_billed >= '7-Jun-2016'
-- filter out some libraries - acquisitions etc
and b.bill_library not in (
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
group by year_billed, bill_authority, bill_reason
order by year_billed, bill_authority, bill_reason;