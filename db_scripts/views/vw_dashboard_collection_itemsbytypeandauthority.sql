---------------------------------------------------------------
-- view: vw_dashboard_collection_itemsbytypeandauthority
---------------------------------------------------------------

-- drop view vw_dashboard_collection_itemsbytypeandauthority;
create or replace view vw_dashboard_collection_itemsbytypeandauthority as
select
    i.authority,
    i.item_type,
    count(i.item_id)
from vw_items i
where i.shadowed = 0
and i.current_location not in (
    'DISCARD',
    'LOST',
    'ON-ORDER',
    'LOST-PAID',
    'LOST-ASSUM',
    'LOST-CLAIM',
    'AVAIL-SOON',
    'CATALOGING')
group by i.authority, i.item_type
order by i.authority, i.item_type;