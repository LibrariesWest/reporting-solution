---------------------------------------------------------------
-- view: vw_holds_fulfilment_external
---------------------------------------------------------------

-- drop view vw_holds_fulfilment_external;
create or replace view vw_holds_fulfilment_external as 
select 
fn_librarytoauthority(pl.policy_name) as authority,
to_char(h.date_placed, 'YYYY-MM'), 
round(avg(h.date_available - h.date_placed)) as days, 
count(h.key) as holds
from hold h
join item i
on i.catalogue_key = h.catalogue_key
and i.call_sequence = h.call_sequence
and i.copy_number = h.copy_number
join policy pl
on pl.policy_type = 'LIBR'
and pl.policy_number = h.pickup_library
join policy il
on il.policy_type = 'LIBR'
and il.policy_number = i.library
where h.date_available is not null
and h.hold_status = 1
and h.date_placed > '7-Jun-2016'
and fn_librarytoauthority(pl.policy_name) <> fn_librarytoauthority(il.policy_name)
group by to_char(h.date_placed, 'YYYY-MM'), fn_librarytoauthority(pl.policy_name)
order by to_char(h.date_placed, 'YYYY-MM'), fn_librarytoauthority(pl.policy_name);