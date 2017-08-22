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
    shadowed
from vw_items 
where shadowed = 0
and current_location not in ('DISCARD');