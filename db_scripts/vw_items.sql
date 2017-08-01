---------------------------------------------------------------
-- view: vw_items
---------------------------------------------------------------

-- drop view vw_items;
create or replace view vw_items as 
select
    c.flexible_key as catalogue_flex_key,
    i.catalogue_key,
    i.call_sequence,
    i.id as item_id,
    ip.policy_name as library,
    fn_librarytoauthority(ip.policy_name) as authority,
    it.policy_name as type,
    ihl.policy_name as home_location,
    il.policy_name as current_location,
    c1.policy_name as category_1,
    c2.policy_name as category_2,
    c3.policy_name as category_3,
    c4.policy_name as category_4,
    c5.policy_name as category_5,
    i.date_created as created,
    i.last_activity_date as last_activity_date,
    i.date_last_charged as date_last_charged,
    i.price,
    i.shadow as shadowed
from item i
join catalogue c on c.catalogue_key = i.catalogue_key
join policy ip on ip.policy_type = 'LIBR' and ip.policy_number = i.library
join policy it on it.policy_type = 'ITYP' and it.policy_number = i.type 
join policy il on il.policy_type = 'LOCN' and il.policy_number = i.current_location
join policy ihl on ihl.policy_type = 'LOCN' and ihl.policy_number = i.home_location
join policy c1 on c1.policy_type = 'ICT1' and c1.policy_number = i.category1
join policy c2 on c2.policy_type = 'ICT2' and c2.policy_number = i.category2
join policy c3 on c3.policy_type = 'ICT3' and c3.policy_number = i.category3
join policy c4 on c4.policy_type = 'ICT4' and c4.policy_number = i.category4
join policy c5 on c5.policy_type = 'ICT5' and c5.policy_number = i.category5;