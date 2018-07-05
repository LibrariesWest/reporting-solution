---------------------------------------------------------------
-- view: vw_opendata_transits_summary
---------------------------------------------------------------

-- drop view vw_opendata_transits_summary;
create or replace view vw_opendata_transits_summary as
select
    ip.field_5 as item_type,
    t.from_authority,
    t.to_authority,
    count(t.item_id) as items
from vw_transits t
join vw_catalogue c on c.catalogue_key = t.catalogue_key
join callnum cn on cn.catalogue_key = t.catalogue_key and cn.call_sequence = t.call_sequence
join policy ip on ip.policy_type = 'ITYP' and ip.policy_name = t.item_type
where t.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
and c.shadowed = 0
and t.from_library in (select code from libraries)
and t.to_library in (select code from libraries)
group by ip.field_5, t.from_authority, t.to_authority
order by ip.field_5, t.from_authority, t.to_authority;