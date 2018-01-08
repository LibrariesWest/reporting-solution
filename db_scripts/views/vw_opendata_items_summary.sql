---------------------------------------------------------------
-- view: vw_opendata_items_summary
---------------------------------------------------------------

-- drop view vw_opendata_items_summary;
create or replace view vw_opendata_items_summary as
select
    authority,
    item_type,
    count(item_id) as items,
	sum(total_checkouts) as total_issues,
    sum(total_renewals) as total_renewals
from vw_items
-- don't include shadowed items
where shadowed = 0
-- also dont include missing and lost
and current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
and library not in (
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
group by authority, item_type;