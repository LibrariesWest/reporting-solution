---------------------------------------------------------------
-- view: vw_opendata_holds_summary
---------------------------------------------------------------

-- drop view vw_opendata_holds_summary;
create or replace view vw_opendata_holds_summary as
select
	to_char(date_placed, 'YYYY-MM') as month_placed,
    item_authority,
    pickup_authority,
    count(h.key) as reservations,
    round(avg(date_available::date - date_placed::date)) as days_taken
from vw_holds h
where h.date_available is not null
and date_placed >= '7-Jun-2016'
-- filter out some libraries - acquisitions etc
and h.item_library not in (
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
and h.pickup_library not in (
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
group by month_placed, item_authority, pickup_authority
order by month_placed, item_authority, pickup_authority;