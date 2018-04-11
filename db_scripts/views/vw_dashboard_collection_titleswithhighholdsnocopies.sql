---------------------------------------------------------------
-- view: vw_dashboard_collection_titleswithhighholdsnocopies
---------------------------------------------------------------

-- drop view vw_dashboard_collection_titleswithhighholdsnocopies;
create or replace view vw_dashboard_collection_titleswithhighholdsnocopies as
select
	distinct
	vc.flexible_key,
	vc.author,
	vc.title,
	vc.year_of_publication,
	(select item_type from vw_items vi where vi.catalogue_key = vc.catalogue_key limit 1) as item_type,
	(select shelving_key from callnum call where call.catalogue_key = vc.catalogue_key limit 1) as call_number,
	counts.catalogue_key,
	counts.authority,
	counts.number_of_holds
from
	(select 
		holds.catalogue_key,
		holds.hold_authority as authority,
		holds.number_of_holds,
		count(i.item_id) as number_of_items
	from 
		(select
			c.catalogue_key,
			fn_librarytoauthority(hl.policy_name) as hold_authority,
			count(*) as number_of_holds
		from hold h
		join policy hl on hl.policy_type = 'LIBR' and hl.policy_number = h.pickup_library
		join catalogue c on h.catalogue_key = c.catalogue_key
		where h.date_available is null and h.date_inactive is null
		group by fn_librarytoauthority(hl.policy_name), c.catalogue_key) as holds
	left join vw_items i on i.catalogue_key = holds.catalogue_key and i.authority = holds.hold_authority
	and i.shadowed = 0 and i.current_location not in ('MISSING', 'LOST', 'DISCARD', 'LOST_ASSUM') and i.home_location not in ('MISSING', 'LOST', 'DISCARD', 'LOST_ASSUM')
	group by holds.catalogue_key, holds.hold_authority, holds.number_of_holds) counts
join vw_catalogue vc on vc.catalogue_key = counts.catalogue_key
where counts.number_of_items = 0 and counts.number_of_holds >= 5
order by counts.number_of_holds desc;