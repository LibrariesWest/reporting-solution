---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbylibrary;
create or replace view vw_dashboard_membership_borrowersbylibrary as
select 
    auth.charge_authority as authority,
    auth.charge_library as library,
    count(auth.user_key) as borrowers
from
    (   select distinct 
            user_key,
            ch.charge_authority,
            ch.charge_library
        from vw_charges_chargeshistory ch
        where ch.date_charged > (now() - interval '1 year')) auth
group by auth.charge_authority, auth.charge_library;