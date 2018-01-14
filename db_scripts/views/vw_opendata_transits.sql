---------------------------------------------------------------
-- view: vw_opendata_transits
---------------------------------------------------------------

-- drop view vw_opendata_transits;
create or replace view vw_opendata_transits as
select
    t.date_time_transited as date_transited,
    t.item_type,
    t.from_library,
    t.from_authority,
    t.to_library,
    t.to_authority
from vw_transits t
join vw_catalogue c on c.catalogue_key = t.catalogue_key
join callnum cn on cn.catalogue_key = t.catalogue_key and cn.call_sequence = t.call_sequence
where t.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
and c.shadowed = 0
and t.from_library not in (
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
and t.to_library not in (
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
order by t.date_time_transited;
