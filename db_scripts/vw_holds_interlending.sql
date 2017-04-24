---------------------------------------------------------------
-- view: vw_holds_interlending
---------------------------------------------------------------

-- drop view vw_holds_interlending;
create or replace view vw_holds_interlending as 
select 
fn_librarytoauthority(il.policy_name) as item_authority,
fn_librarytoauthority(pl.policy_name) as pickup_authority,
it.policy_name as item_type,
to_char(h.date_placed, 'YYYY-MM') as month_placed,
to_char(h.date_available, 'YYYY-MM') as month_available,
count(h.key) as holds
from hold h
join item i
on i.catalogue_key = h.catalogue_key
and i.call_sequence = h.call_sequence
and i.copy_number = h.copy_number
join policy it
on it.policy_type = 'ITYP'
and it.policy_number = i.type
join policy pl
on pl.policy_type = 'LIBR'
and pl.policy_number = h.pickup_library
join policy il
on il.policy_type = 'LIBR'
and il.policy_number = i.library
where h.date_available is not null
and h.date_placed > '7-Jun-2016'
and fn_librarytoauthority(pl.policy_name) <> fn_librarytoauthority(il.policy_name)
group by to_char(h.date_placed, 'YYYY-MM'), to_char(h.date_available, 'YYYY-MM'), fn_librarytoauthority(pl.policy_name), fn_librarytoauthority(il.policy_name), it.policy_name
order by fn_librarytoauthority(il.policy_name), fn_librarytoauthority(pl.policy_name), it.policy_name, to_char(h.date_placed, 'YYYY-MM'), to_char(h.date_available, 'YYYY-MM');