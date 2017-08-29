---------------------------------------------------------------
-- view: vw_dashboard_collection_itemsbytypeandlibrary
---------------------------------------------------------------

-- drop view vw_dashboard_collection_itemsbytypeandlibrary;
create or replace view vw_dashboard_collection_itemsbytypeandlibrary as 
select
    i.authority,
    i.library,
    i.item_type,
    count(*)
from vw_items i
where i.shadow = 0 and i.authority is not null
and i.current_location not in (
    'DISCARD', 
    'LOST', 
    'ON-ORDER', 
    'LOST-PAID', 
    'LOST-ASSUM', 
    'LOST-CLAIM', 
    'AVAIL-SOON', 
    'CATALOGING')
group by i.authority, i.library, i.item_type
order by i.authority, i.library, i.item_type;