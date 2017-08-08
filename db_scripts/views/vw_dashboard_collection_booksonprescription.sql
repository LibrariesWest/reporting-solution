---------------------------------------------------------------
-- view: vw_dashboard_collection_booksonprescription
---------------------------------------------------------------

-- drop view vw_dashboard_collection_booksonprescription;
create or replace view vw_dashboard_collection_booksonprescription as
select
	title,
	author,
	isbn,
	library,
	authority,
	count(distinct user_key) users,
	count(key) as issues,
	sum(renewals) as renewals
from
	(select
	    ( select replace(replace((string_to_array(marc.tag, '~'))[1] || (string_to_array(marc.tag, '~'))[2], '/c', ''), ':b','') as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '245' limit 1) as title,
	    ( select (string_to_array(marc.tag, '~'))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '100' limit 1) as author,
	    ( select (string_to_array(marc.tag, ' '))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '20' limit 1) as isbn,
	    key,
	    user_key,
	    lp.policy_name as library,
	    fn_librarytoauthority(lp.policy_name) as authority,
	    number_of_renewals as renewals,
	    date_charged
	from
		( select user_key, date_charged, key, catalogue_key, call_sequence, copy_number, library, number_of_renewals from charge where date_charged > (now() - interval '1 year') 
		union all 
		select user_key, date_charged, key, catalogue_key, call_sequence, copy_number, library, number_of_renewals from chargehist where date_charged > (now() - interval '1 year')) as ch
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
	on c.catalogue_key = i.catalogue_key) as bop
group by title, author, isbn, library, authority
order by title, author, isbn, library, authority;