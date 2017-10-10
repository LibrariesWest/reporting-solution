---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbyauthority;
create or replace view vw_dashboard_membership_borrowersbyauthority as
select 
    auth.charge_authority as authority, 
    count(auth.user_key) as borrowers
from
    (   select distinct 
            ch.user_key,
            ch.charge_authority
        from vw_charges_chargeshistory ch
        where ch.date_charged > (now() - interval '1 year')) auth
group by auth.charge_authority;