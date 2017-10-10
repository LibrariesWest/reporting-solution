---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbyward
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbyward;
create or replace view vw_dashboard_membership_borrowersbyward as
select
    vu.ward_name,
    vu.ward_code,
    count(ch.key) as borrowers
from vw_charges_chargeshistory ch
join vw_users_geography vu on ch.user_key = vu.user_key
group by vu.ward_name, vu.ward_code
order by vu.ward_name, vu.ward_code;