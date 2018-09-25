--------------------------------------------------------------------
-- view: vw_dashboard_membership_registeredactivebyageanddeprivation
--------------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredactivebyageanddeprivation;
create or replace view vw_dashboard_membership_registeredactivebyageanddeprivation as
select
    users_lsoa.lsoa_code,
    users_lsoa.imd_decile,
    lsoa_lookups.lad16cd,
    lsoa_lookups.lad16nm,
    users_lsoa.zero_to_sixteen as members_zero_to_sixteen,
    users_lsoa.seventeen_to_sixty as members_seventeen_to_sixty,
    users_lsoa.over_sixty as members_over_sixty,
    users_lsoa.members as members,
    lsoa_pop.zero_to_sixteen as population_zero_to_sixteen,
    lsoa_pop.seventeen_to_sixty as population_seventeen_to_sixty,
    lsoa_pop.over_sixty as population_over_sixty,
    lsoa_pop.all_ages as population_total,
    round(100.0 * (users_lsoa.zero_to_sixteen::numeric / lsoa_pop.zero_to_sixteen::numeric)) as members_zero_to_sixteen_percent,
    round(100.0 * (users_lsoa.seventeen_to_sixty::numeric / lsoa_pop.seventeen_to_sixty::numeric)) as members_seventeen_to_sixty_percent,
    round(100.0 * (users_lsoa.over_sixty::numeric / lsoa_pop.over_sixty::numeric)) as members_over_sixty_percent,
    round(100.0 * (users_lsoa.members::numeric / lsoa_pop.all_ages::numeric)) as members_percent
from
    (select
        users.lsoa_code as lsoa_code,
        users.imd_decile,
        sum(users.zero_to_sixteen) as zero_to_sixteen,
        sum(users.seventeen_to_sixty) as seventeen_to_sixty,
        sum(users.over_sixty) as over_sixty,
        count(users.user_key) as members
    from
        (   select distinct
                vu.user_key,
                vu.lsoa_code,
                vu.imd_decile,
                (case 
                    when date_part('year', age(vu.birth_date)) < 17
                    then 1 else 0 
                end) as zero_to_sixteen,
                (case 
                    when date_part('year', age(vu.birth_date)) > 16 and date_part('year', age(vu.birth_date)) < 61 
                    then 1 else 0 
                end) as seventeen_to_sixty,
                (case 
                    when date_part('year', age(vu.birth_date)) > 60
                    then 1 else 0 
                end) as over_sixty
            from vw_users_geography vu
            where vu.last_activity_date > (now() - interval '1 year')
        ) users
    group by users.lsoa_code, users.imd_decile) users_lsoa
join vw_ons_lsoa_pop lsoa_pop on lsoa_pop.lsoa11cd = users_lsoa.lsoa_code
join (select distinct lsoa11cd, lad16cd, lad16nm from ons_oas_lookups) lsoa_lookups on lsoa_lookups.lsoa11cd = lsoa_pop.lsoa11cd
order by users_lsoa.lsoa_code, users_lsoa.imd_decile;