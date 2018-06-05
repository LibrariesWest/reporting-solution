---------------------------------------------------------------
-- view: vw_opendata_members_summary
---------------------------------------------------------------

-- drop view vw_opendata_members_summary;
create or replace view vw_opendata_members_summary as
select 
	authority as registered_authority,
	round(count(*), -1) as users
from vw_users
where last_activity_date >= (now() - interval '1 year')
and library in (select code from libraries)
group by authority
order by authority;