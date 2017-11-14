---------------------------------------------------------------
-- view: vw_opendata_items
---------------------------------------------------------------

-- drop view vw_opendata_items;
create or replace view vw_opendata_items as
select
    catalogue_flex_key,
    item_id,
    authority,
    library,
    item_type,
    date_created as created,
    price,
	total_checkouts as issues,
    total_renewals as renewals
from vw_items
-- don't include shadowed items
where shadowed = 0
-- also dont include missing and lost
and current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM');