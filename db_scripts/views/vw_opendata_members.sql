---------------------------------------------------------------
-- view: vw_opendata_members
---------------------------------------------------------------

-- drop view vw_opendata_members;
create or replace view vw_opendata_members as
select 
	authority as registered_authority,
	library as registered_library,
	district_name, 
	district_code, 
	county_name,
	county_code,
	ward_name,
	ward_code,
	msoa_name,
	msoa_code,
	lsoa_name,
	lsoa_code,
	case when count(*) > 4 then cast(count(*) as varchar) else '*' end as users
from vw_users_geography 
where last_activity_date > (now() - interval '1 year')
group by authority, library, district_name, district_code, county_name, county_code, ward_name, ward_code, msoa_name, msoa_code, lsoa_name, lsoa_code
order by authority, library, district_name, district_code, county_name, county_code, ward_name, ward_code, msoa_name, msoa_code, lsoa_name, lsoa_code;
