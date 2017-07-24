---------------------------------------------------------------
-- view: vw_dashboard_usage_renewalsbyward
---------------------------------------------------------------

-- drop view vw_dashboard_usage_renewalsbyward;
create or replace view vw_dashboard_usage_renewalsbyward as 
select
	ow.name as ward,
	wc.renewals
from ( 	select
			op.admin_ward_code as ward_code,
			sum(chp.renewals) as renewals
		from
			( select
				case
					when u.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
					when u.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 and userxinfo.entry_number = 9036 limit 1)
					when u.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 and userxinfo.entry_number = 9036 limit 1)
					else null::text
				end as postcode,
				ch.number_of_renewals as renewals
			from
			(	select user_key, number_of_renewals from charge where date_charged > (now() - interval '1 year')
				union all
				select user_key, number_of_renewals from chargehist where date_charged > (now() - interval '1 year')
			) ch -- all user keys from charges in last year
			join users u on ch.user_key = u.user_key) chp -- all charges from last year with user postcode
			join os_postcodes op on op.postcode = chp.postcode
			group by op.admin_ward_code
			having count(chp.postcode) > 5) wc -- ward code and number of charges
join os_wards ow on ow.code = wc.ward_code );