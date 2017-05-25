---------------------------------------------------------------
-- view: vw_dashboard_mosttravelleditems
---------------------------------------------------------------

-- drop view vw_dashboard_mosttravelleditems;
create or replace view vw_dashboard_mosttravelleditems as 
select 
    *
from items i
join chargehist ch
on ch.catalogue_key = i.catalogue_key
and ch.call_sequence = i.call_sequence
and ch.copy_number = i.copy_number
join policy cl
on cl.policy_type = 'LIBR'
and cl.policy_number = ch.library
join policy il
on il.policy_type = 'LIBR'
and il.policy_number = i.library
join users u
on u.user_key = ch.user_key
join users clu
on clu.user_id = cl.policy_name
join users ilu
on ilu.user_id = il.policy_name