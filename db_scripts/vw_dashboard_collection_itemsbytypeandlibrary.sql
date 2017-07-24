---------------------------------------------------------------
-- view: vw_dashboard_collection_itemsbytypeandlibrary
---------------------------------------------------------------

-- drop view vw_dashboard_collection_itemsbytypeandlibrary;
create or replace view vw_dashboard_collection_itemsbytypeandlibrary as 
select
    fn_librarytoauthority(ip.policy_name) as authority,
    ip.policy_name as library,
    it.policy_name as type,
    count(*)
from item i
join catalogue c
on c.catalogue_key = i.catalogue_key
join policy ip on ip.policy_type = 'LIBR' and ip.policy_number = i.library
join policy it on it.policy_type = 'ITYP' and it.policy_number = i.type
join policy il on il.policy_type = 'LOCN' and il.policy_number = i.current_location
where i.shadow = 0
and fn_librarytoauthority(ip.policy_name) is not null
and il.policy_name not in ('DISCARD', 'LOST', 'ON-ORDER', 'LOST-PAID', 'LOST-ASSUM', 'LOST-CLAIM', 'AVAIL-SOON', 'CATALOGING')
group by fn_librarytoauthority(ip.policy_name), ip.policy_name, it.policy_name
order by fn_librarytoauthority(ip.policy_name), ip.policy_name, it.policy_name;