---------------------------------------------------------------
-- view: vw_opendata_members_summary
---------------------------------------------------------------

-- drop view vw_opendata_members_summary;
create or replace view vw_opendata_members_summary as
select 
	authority as registered_authority,
	library as registered_library,
	round(count(*), -1) as users
from vw_users
where last_activity_date > (now() - interval '1 year')
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
group by authority, library
order by authority, library;
