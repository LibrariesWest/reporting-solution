---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbyauthorityanddeprivation
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbyauthorityanddeprivation;
create or replace view vw_dashboard_membership_borrowersbyauthorityanddeprivation as
select
    auth.charge_authority as authority,
    auth.lsoa_code as lsoa_code,
    auth.imd_decile,
    count(auth.user_key) as borrowers
from
    (   select distinct
            ch.user_key,
            ch.charge_authority,
            ch.charge_library,
            vu.lsoa_code,
            vu.imd_decile
        from vw_charges_chargeshistory ch
        join vw_users_geography vu on ch.user_key = vu.user_key
        where ch.date_charged > (now() - interval '1 year')) auth
group by auth.charge_authority, auth.lsoa_code, auth.imd_decile
order by auth.charge_authority, auth.lsoa_code, auth.imd_decile;