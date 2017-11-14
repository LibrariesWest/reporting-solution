---------------------------------------------------------------
-- view: vw_opendata_transits
---------------------------------------------------------------

-- drop view vw_opendata_transits;
create or replace view vw_opendata_transits as
    t.date_time_transited as date_transited,
    t.item_id,
    c.title as title,
    c.author as author,
    t.item_type,
    t.from_library,
    t.from_authority,
    t.to_library,
    t.to_authority
from vw_transits t
join vw_catalogue c on c.catalogue_key = t.catalogue_key
join callnum cn on cn.catalogue_key = t.catalogue_key and cn.call_sequence = t.call_sequence
where t.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
order by t.date_time_transited;
and shadow = 0;
