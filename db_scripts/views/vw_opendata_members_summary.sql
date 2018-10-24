---------------------------------------------------------------
-- view: vw_opendata_members_summary
---------------------------------------------------------------

-- drop view vw_opendata_members_summary;
create or replace view vw_opendata_members_summary as
select 
	authority as registered_authority,
	libraries.name,
	round(count(*), -1) as users
from vw_users
join libraries on libraries.code = vw_users.library
where last_activity_date >= (now() - interval '1 year')
and library in (select code from libraries)
group by authority, libraries.name
having count(*) > 100
order by authority, libraries.name;