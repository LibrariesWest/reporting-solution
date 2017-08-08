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
    category_1,
    category_2,
    category_3,
    category_4,
    category_5,
    date_created,
    last_activity_date,
    date_last_charged,
    price,
    shadowed
from vw_items
where shadowed = 0
and il.policy_name not in ('DISCARD');