---------------------------------------------------------------
-- view: vw_opendata_holds
---------------------------------------------------------------

-- drop view vw_opendata_holds;
create or replace view vw_opendata_holds as
select
	to_char(date_placed, 'YYYY-MM') as month_placed,
    item_library,
    item_authority,
    pickup_library,
    pickup_authority,
	case 
		when client = 'WS_DS' then 'Website'
		when client = 'WS_PUBLIC' then 'App'
		when client = 'WORKFLOWS' then 'Branch'
	end as reservation_method,
    count(h.key) as holds,
    round(avg(date_available - date_placed)) as days_taken
from vw_holds h
where h.date_available is not null
and date_placed >= '7-Jun-2016'
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
group by month_placed, placed_library, placed_authority, item_library, item_authority, pickup_library, pickup_authority, reservation_method
order by month_placed, placed_library, placed_authority, item_library, item_authority, pickup_library, pickup_authority, reservation_method;