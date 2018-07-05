---------------------------------------------------------------
-- view: vw_opendata_items
---------------------------------------------------------------

-- drop view vw_opendata_items;
create or replace view vw_opendata_items as
select
    i.catalogue_flex_key as catalogue_flex_key,
    i.item_id,
    i.authority,
    l.name as library,
    ip.field_5 as item_type,
    i.date_created as created,
    i.price,
	i.total_checkouts as issues,
    i.total_renewals as renewals
from vw_items i
join libraries l on l.code = i.library
join policy ip on ip.policy_type = 'ITYP' and ip.policy_name = i.item_type
where shadowed = 0
and current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
order by catalogue_flex_key, item_id, library;