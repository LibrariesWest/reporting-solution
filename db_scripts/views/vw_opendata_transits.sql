---------------------------------------------------------------
-- view: vw_opendata_transits
---------------------------------------------------------------

-- drop view vw_opendata_transits;
create or replace view vw_opendata_transits as
select
    to_char(t.date_time_transited, 'YYYY-MM-DD') as date_transited,
    ip.field_5 as item_type,
    fl.name as from_library,
    t.from_authority as from_authority,
    tl.name as to_library,
    t.to_authority as to_authority
from vw_transits t
join vw_catalogue c on c.catalogue_key = t.catalogue_key
join callnum cn on cn.catalogue_key = t.catalogue_key and cn.call_sequence = t.call_sequence
join libraries fl on fl.code = t.from_library
join libraries tl on tl.code = t.to_library
join policy ip on ip.policy_type = 'ITYP' and ip.policy_name = t.item_type
where t.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
and c.shadowed = 0
order by t.date_time_transited;