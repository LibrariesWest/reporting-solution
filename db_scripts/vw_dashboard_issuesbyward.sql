---------------------------------------------------------------
-- view: vw_dashboard_issuesbyward
---------------------------------------------------------------

-- drop view vw_dashboard_issuesbyward;
create view vw_dashboard_issuesbyward as 
select
op.admin_ward_code as ward_code,
count(chp.user_key) as issues
from
	(select 
	ch.user_key,
	case
		when u.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
		when u.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 and userxinfo.entry_number = 9036 limit 1)
		when u.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 and userxinfo.entry_number = 9036 limit 1)
		else null::text
	end as postcode
	from
		(select user_key from charge where date_charged > (now() - interval '1 year')
		union 
		select user_key from chargehist where date_charged > (now() - interval '1 year')) ch
	join users u
	on ch.user_key = u.user_key) chp
join os_postcodes op
on replace(op.postcode, ' ', '') = replace(upper(chp.postcode), ' ', '')
group by op.admin_ward_code;