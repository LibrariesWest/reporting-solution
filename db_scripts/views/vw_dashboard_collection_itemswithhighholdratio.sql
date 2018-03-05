---------------------------------------------------------------
-- view: vw_dashboard_collection_itemswithhighholdratio
---------------------------------------------------------------

-- drop view vw_dashboard_collection_itemswithhighholdratio;
create or replace view vw_dashboard_collection_itemswithhighholdratio as
select 
	vc.flexible_key,
	vc.author,
	vc.title, 
	vc.isbn,
	ids.*
from
(select * from 
(select 
	titles.catalogue_key,
	titles.authority,
	titles.number_items,
	count(*) as number_of_holds,
	round((titles.number_items / count(*)::float)::numeric, 3) as ratio
from
(select 
	c.catalogue_key, 
	fn_librarytoauthority(il.policy_name) as authority, 
	count(*) as number_items
from catalogue c
join item i on i.catalogue_key = c.catalogue_key
join policy il on il.policy_type = 'LIBR' and il.policy_number = i.library
join policy ihl on ihl.policy_type = 'LOCN' and ihl.policy_number = i.home_location
join policy icl on icl.policy_type = 'LOCN' and icl.policy_number = i.current_location
where i.shadow = 0 and ihl.policy_name not in ('MISSING', 'LOST', 'BINDERY', 'DISCARD', 'LOST_ASSUM')
and icl.policy_name not in ('MISSING', 'LOST', 'BINDERY', 'DISCARD', 'LOST_ASSUM')
group by c.catalogue_key, fn_librarytoauthority(il.policy_name)) titles
join hold h on h.catalogue_key = titles.catalogue_key
join policy hl on hl.policy_type = 'LIBR' and hl.policy_number = h.library
where h.date_available is null and h.date_inactive is null
and fn_librarytoauthority(hl.policy_name) = titles.authority
group by titles.catalogue_key, titles.authority, titles.number_items
order by ratio) ratios
where ratio <= 0.2) ids
join vw_catalogue vc on vc.catalogue_key = ids.catalogue_key
order by ids.ratio;