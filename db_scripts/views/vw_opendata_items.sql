---------------------------------------------------------------
-- view: vw_opendata_items
---------------------------------------------------------------

-- drop view vw_opendata_items;
create or replace view vw_opendata_items as
select
    catalogue_flex_key,
    item_id,
    library,
    authority,
    item_type,
    home_location,
    current_location,
    date_created,
    date_last_charged,
    price,
	total_checkouts,
    total_renewals
from vw_items
-- don't include shadowed items
where shadowed = 0
-- also dont include missing and lost
and current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM');