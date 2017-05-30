---------------------------------------------------------------
-- view: vw_dashboard_booksonprescription
---------------------------------------------------------------

-- drop view vw_dashboard_booksonprescription;
create or replace view vw_dashboard_booksonprescription as
select 
    ( select (string_to_array(marc.tag, '~'::text))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '245'::text limit 1) as title,
    ( select (string_to_array(marc.tag, '~'::text))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '100'::text limit 1) as author,
    ( select (string_to_array(marc.tag, ' '::text))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '20'::text limit 1) as isbn,
    lp.policy_name as library,
    fn_librarytoauthority(lp.policy_name) as authority,
    count(key) as issues
from
	( select key, catalogue_key, call_sequence, copy_number, user_key, library from charge 
	union all 
	select key, catalogue_key, call_sequence, copy_number, user_key, library from chargehist) as ch
join item i
on i.catalogue_key = ch.catalogue_key
and i.call_sequence = ch.call_sequence
and i.copy_number = ch.copy_number
join policy it
on it.policy_type = 'ITYP'
and it.policy_number = i.type
and it.policy_name = 'B-O-P'
join policy lp
on lp.policy_type = 'LIBR'
and lp.policy_number = ch.library
join catalogue c
on c.catalogue_key = i.catalogue_key
group by title, author, isbn, lp.policy_name, authority;