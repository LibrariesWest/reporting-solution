---------------------------------------------------------------
-- view: vw_holds_interlending_av
---------------------------------------------------------------

-- drop view vw_holds_interlending_av;
create or replace view vw_holds_interlending_av as 
select 
    *
from vw_holds_interlending
where item_type in (
    'AV',
    'AUDIO',
    'DVD_EX',
    'DVD_18_PR',
    'DVD_U_ST',
    'DVD_15_PR',
    'MUS_CD',
    'DVD_15_ST',
    'VISUAL',
    'DVD_U_PR',
    'CSPW',
    'DVD_BX_12',
    'DVD_BX_15',
    'DVD_PG_ST',
    'DVD_BX_U',
    'DVD_12_PR',
    'DVD_BX_EX',
    'DVD_PG_PR',
    'DVD_18_ST',
    'DVD_12_ST',
    'ASPW',
    'DVD_BX_PG',
    'DVD_BX_18'
);