----------------------------------------------------------------------------
-- view: vw_dashboard_membership_registeredactivebylibraryanddeprivation
----------------------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredactivebylibraryanddeprivation;
create or replace view vw_dashboard_membership_registeredactivebylibraryanddeprivation as
select
    auth.authority as authority,
    auth.library as library,
    auth.lsoa_code as lsoa_code,
    auth.imd_decile,
    count(auth.user_key) as members
from
    (   select distinct
            vu.user_key,
            vu.birth_date,
            vu.authority,
            vu.library,
            vu.lsoa_code,
            vu.imd_decile
        from vw_users_geography vu
        where vu.last_activity_date > (now() - interval '1 year')) auth
group by auth.authority, auth.library, auth.lsoa_code, auth.imd_decile, auth.lsoa_code;