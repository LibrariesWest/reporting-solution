---------------------------------------------------------------
-- view: vw_opendata_items_summary
---------------------------------------------------------------

-- drop view vw_opendata_items_summary;
create or replace view vw_opendata_items_summary as
select
    i.authority,
    case when ip.field_5 = '$<ITYP_desc_unknown>' then 'Unknown' else ip.field_5 end as item_type,
    count(i.item_id) as items,
	sum(i.total_checkouts) as total_issues,
    sum(i.total_renewals) as total_renewals
from vw_items i
join policy ip on ip.policy_type = 'ITYP' and ip.policy_name = i.item_type
where i.shadowed = 0
and i.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
and i.library in (select code from libraries)
group by i.authority, ip.field_5
order by i.authority, ip.field_5;