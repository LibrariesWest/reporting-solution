---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredactivebyresidentauthority
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredactivebyresidentauthority;
create or replace view vw_dashboard_membership_registeredactivebyresidentauthority as
select
    up.authority as authority,
    up.active_users as users,
    p.population as population,
    round((cast(up.active_users as numeric) / cast(p.population as numeric)) * 100, 1) as percentage
from
    (select
        case
            when county_name is null then district_name
            else county_name
        end as authority,
        case
            when county_code is null then district_code
            else county_code
        end as authority_code,
        count(id) as active_users
    from vw_users_geography u
    where last_activity_date > (now() - interval '1 year')
    group by authority, authority_code,
        case
            when county_name is null then district_name
            else county_name
        end,
        case
            when county_code is null then district_code
            else county_code
        end
    order by active_users desc
    limit 11) as up
join ons_uk_population p
on p.code = up.authority_code
where up.authority is not null;