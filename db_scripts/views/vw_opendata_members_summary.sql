---------------------------------------------------------------
-- view: vw_opendata_members_summary
---------------------------------------------------------------

-- drop view vw_opendata_members_summary;
create or replace view vw_opendata_members_summary as
select 
	authority as registered_authority,
	library as registered_library,
	round(count(*), -1) as users
from vw_users
where last_activity_date > (now() - interval '1 year')
group by authority, library
order by authority, library;
