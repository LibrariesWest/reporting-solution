-- view: vw_items
-- drop view vw_items;
create or replace view vw_items as 
select 
    i.catalogue_key,
    i.id,
    ip.policy_name as library,
    fn_librarytoauthority(ip.policy_name::text) as authority,
    it.policy_name as type,
    ihl.policy_name as home_location,
    il.policy_name as current_location,
    i.date_created as created,
    i.last_activity_date as activity,
    i.date_last_charged as charged,
    i.price,
    i.shadow as shadowed
from item i
join policy ip on ip.policy_type::text = 'LIBR'::text and ip.policy_number = i.library
join policy it on it.policy_type::text = 'ITYP'::text and it.policy_number = i.type 
join policy il on il.policy_type::text = 'LOCN'::text and il.policy_number = i.current_location
join policy ihl on ihl.policy_type::text = 'LOCN'::text and ihl.policy_number = i.home_location;