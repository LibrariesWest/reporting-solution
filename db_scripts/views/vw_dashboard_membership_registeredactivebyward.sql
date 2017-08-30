---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredbyward
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredbyward;
create or replace view vw_dashboard_membership_registeredbyward as
select
	case
    	when vu.county_name is null then vu.district_name
        else vu.county_name
    end as resident_authority,
	vu.ward_code as ward_code,
	vu.ward_name as ward_name,
    count(*) as users
from vw_users_geography vu
where vu.last_activity_date > (now() - interval '1 year')
group by resident_authority, ward_code, ward_name;