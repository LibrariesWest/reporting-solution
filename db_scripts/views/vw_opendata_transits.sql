---------------------------------------------------------------
-- view: vw_opendata_transits
---------------------------------------------------------------

-- drop view vw_opendata_transits;
create or replace view vw_opendata_transits as
select
    t.date_time_transited as date_transited,
    t.item_type,
    fl.name as from_library,
    t.from_authority,
    tl.name as to_library,
    t.to_authority
from vw_transits t
join vw_catalogue c on c.catalogue_key = t.catalogue_key
join callnum cn on cn.catalogue_key = t.catalogue_key and cn.call_sequence = t.call_sequence
join libraries fl on fl.code = t.from_library
join libraries tl on tl.code = t.to_library
where t.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
and c.shadowed = 0
order by t.date_time_transited;