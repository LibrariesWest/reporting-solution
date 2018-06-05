---------------------------------------------------------------
-- view: vw_opendata_members
---------------------------------------------------------------

-- drop view vw_opendata_members;
create or replace view vw_opendata_members as
select 
	u.authority as registered_authority,
	l.name as registered_library,
	u.district_name, 
	u.district_code, 
	u.county_name,
	u.county_code,
	u.ward_name,
	u.ward_code,
	u.msoa_name,
	u.msoa_code,
	u.lsoa_name,
	u.lsoa_code,
	case when count(*) > 4 then cast(count(*) as varchar) else '*' end as users
from vw_users_geography u
join libraries l on l.code = u.library
where u.last_activity_date >= (now() - interval '1 year')
group by u.authority, l.name, u.district_name, u.district_code, u.county_name, u.county_code, u.ward_name, u.ward_code, u.msoa_name, u.msoa_code, u.lsoa_name, u.lsoa_code
order by u.authority, l.name, u.district_name, u.district_code, u.county_name, u.county_code, u.ward_name, u.ward_code, u.msoa_name, u.msoa_code, u.lsoa_name, u.lsoa_code;