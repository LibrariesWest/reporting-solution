-- view: vw_items
-- drop view vw_items;
create or replace view vw_items as 
select 
    i.catalogue_key,
    i.id,
    ip.policy_name as library,
    fn_librarytoauthority(ip.policy_name::text) as authority,
    i.last_activity_date as active,
    i.date_created as created,
    it.policy_name as type,
    i.price,
    i.date_last_charged as charged,
    i.shadow as shadowed
from item i
join policy ip on ip.policy_type::text = 'LIBR'::text and ip.policy_number = i.library
join policy it on it.policy_type::text = 'ITYP'::text and it.policy_number = i.type;