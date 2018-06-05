---------------------------------------------------------------
-- view: vw_opendata_items_summary
---------------------------------------------------------------

-- drop view vw_opendata_items_summary;
create or replace view vw_opendata_items_summary as
select
    authority,
    item_type,
    count(item_id) as items,
	sum(total_checkouts) as total_issues,
    sum(total_renewals) as total_renewals
from vw_items
where shadowed = 0
and current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
and library in (select code from libraries)
group by authority, item_type
order by authority, item_type;