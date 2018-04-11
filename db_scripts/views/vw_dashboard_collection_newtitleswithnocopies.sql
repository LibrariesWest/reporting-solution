---------------------------------------------------------------
-- view: vw_dashboard_collection_newtitleswithnocopiesbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_collection_newtitleswithnocopiesbyauthority;
create or replace view vw_dashboard_collection_newtitleswithnocopiesbyauthority as
select 
	a.authority,
	c.flexible_key,
	c.year_of_publication,
	c.title,
	c.author,
	(select item_type from vw_items vi where vi.catalogue_key = c.catalogue_key limit 1) as item_type,
	(select shelving_key from callnum call where call.catalogue_key = c.catalogue_key limit 1) as call_number
from vw_catalogue c
cross join (select distinct fn_librarytoauthority(p.policy_name) as authority from policy p where p.policy_type = 'LIBR' and fn_librarytoauthority(p.policy_name) is not null) a
left join (
	select authority, catalogue_key, count(item_id) as number_of_items from vw_items i
	where i.shadowed = 0 and i.current_location not in ('MISSING', 'LOST', 'DISCARD', 'LOST_ASSUM') and i.home_location not in ('MISSING', 'LOST', 'DISCARD', 'LOST_ASSUM')
	group by authority, catalogue_key
) it on it.authority = a.authority and it.catalogue_key = c.catalogue_key
where it.number_of_items is null
and c.year_of_publication is not null 
and (c.year_of_publication >= date_part('year', current_date) - 1)
and (c.year_of_publication < date_part('year', current_date) + 1);