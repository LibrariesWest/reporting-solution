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
		ch.charge_authority as authority,
		count(ch.key) as issues,
		sum(ch.number_of_renewals) as renewals
	from vw_charges_chargeshistory ch
	join vw_catalogue c on c.catalogue_key = ch.catalogue_key and ch.date_charged > (now() - interval '1 year')
	join booksonprescription bop on c.isbn = bop.isbn
	group by bop.type, bop.title, bop.isbn, user_key, ch.charge_authority
) as bop_ch
group by bop_ch.type, bop_ch.title, bop_ch.isbn, authority
order by bop_ch.type, bop_ch.title, authority;