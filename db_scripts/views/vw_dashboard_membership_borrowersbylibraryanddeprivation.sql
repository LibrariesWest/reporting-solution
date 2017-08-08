---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbylibraryanddeprivation
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbylibraryanddeprivation;
create or replace view vw_dashboard_membership_borrowersbylibraryanddeprivation as
select 
    auths.authority as authority,
    auths.library as library,
    auths.imd_decile as imd_decile,  
    count(auths.user_key) as borrowers
from
    (select distinct us.user_key, us.authority, us.library, vu.imd_decile from
        (select user_key, fn_librarytoauthority(lp.policy_name) as authority, lp.policy_name as library
        from
            (select user_key, library from charge where date_charged > (now() - interval '1 year')
            union all 
            select user_key, library from chargehist where date_charged > (now() - interval '1 year')
            ) as ch
        join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = ch.library
        ) as us
        join vw_users_geography vu on us.user_key = vu.user_key
    ) as auths
where auths.authority is not null
group by authority, library, imd_decile
order by authority, library, imd_decile;