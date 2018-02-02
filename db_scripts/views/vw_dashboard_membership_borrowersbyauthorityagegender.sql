---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbyauthorityagegender
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbyauthorityagegender;
create or replace view vw_dashboard_membership_borrowersbyauthorityagegender as
select 
    auth.charge_authority as authority,
    auth.gender as gender,
    auth.age as age,
    count(auth.user_key) as borrowers
from
    (   select distinct 
            ch.user_key,
            u.user_cat1 as gender,
            date_part('year', age(u.birth_date)) as age,
            ch.charge_authority
        from vw_charges_chargeshistory ch
        join vw_users u on u.user_key = ch.user_key
        where ch.date_charged > (now() - interval '1 year')) auth
group by auth.charge_authority, auth.gender, auth.age
order by auth.charge_authority, auth.gender, auth.age;