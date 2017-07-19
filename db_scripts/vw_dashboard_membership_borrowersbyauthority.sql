---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbyauthority;
create or replace view vw_dashboard_membership_borrowersbyauthority as
select 
    auths.authority as authority, 
    count(auths.user_key) as borrowers
from
    (select distinct us.user_key, us.authority from
        (select user_key, fn_librarytoauthority(lp.policy_name) as authority
        from
            (select user_key, library from charge where date_charged > now() - interval '1 year' 
            union all 
            select user_key, library from chargehist where date_charged > now() - interval '1 year'
            ) as ch
        join policy lp
        on lp.policy_type = 'LIBR'
        and lp.policy_number = ch.library
        ) as us
    ) as auths
where auths.authority is not null
group by authority;