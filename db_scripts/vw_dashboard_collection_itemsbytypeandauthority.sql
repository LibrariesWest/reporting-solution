---------------------------------------------------------------
-- view: vw_dashboard_collection_itemsbytypeandauthority
---------------------------------------------------------------

-- drop view vw_dashboard_collection_itemsbytypeandauthority;
create or replace view vw_dashboard_collection_itemsbytypeandauthority as 
select
    fn_librarytoauthority(ip.policy_name) as authority,
    it.policy_name as type,
    count(*)
from item i
join catalogue c
on c.catalogue_key = i.catalogue_key
join policy ip on ip.policy_type = 'LIBR' and ip.policy_number = i.library
join policy it on it.policy_type = 'ITYP' and it.policy_number = i.type
join policy il on il.policy_type = 'LOCN' and il.policy_number = i.current_location
where i.shadow = 0
and il.policy_name not in ('DISCARD')
group by fn_librarytoauthority(ip.policy_name), it.policy_name
order by fn_librarytoauthority(ip.policy_name), it.policy_name;