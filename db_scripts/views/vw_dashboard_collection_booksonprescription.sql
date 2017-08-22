---------------------------------------------------------------
-- view: vw_dashboard_usage_booksonprescription
---------------------------------------------------------------

-- drop view vw_dashboard_usage_booksonprescription;
create or replace view vw_dashboard_usage_booksonprescription as
select 
	bop_ch.type,
	bop_ch.title,
	bop_ch.isbn,
	authority,
	count(bop_ch.user_key) as users,
	sum(bop_ch.issues + bop_ch.renewals) as issues
from
	(select
		bop.type,
		bop.title,
		bop.isbn,
		ch.user_key,
		fn_librarytoauthority(lp.policy_name) as authority,
		count(key) as issues,
		sum(ch.number_of_renewals) as renewals
	from
	(	select user_key, date_charged, key, library, catalogue_key, call_sequence, copy_number, number_of_renewals from charge where date_charged >= (now() - interval '1 year')
		union all 
		select user_key, date_charged, key, library, catalogue_key, call_sequence, copy_number, number_of_renewals from chargehist where date_charged >= (now() - interval '1 year')
	) as ch
	join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = ch.library
	join vw_catalogue c on c.catalogue_key = ch.catalogue_key
	join booksonprescription bop on c.isbn = bop.isbn
	group by bop.type, bop.title, bop.isbn, user_key, fn_librarytoauthority(lp.policy_name)
) as bop_ch
group by bop_ch.type, bop_ch.title, bop_ch.isbn, authority
order by bop_ch.type, bop_ch.title, authority;