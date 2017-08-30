---------------------------------------------------------------
-- view: vw_dashboard_reservations_holdsbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_holdsbylibrary;
create or replace view vw_dashboard_reservations_holdsbylibrary as 
select
    h.pickup_authority,
    h.pickup_library,
    count(h.key) as holds
from vw_holds h
where h.date_placed > (now() - interval '1 year')
group by pickup_authority, pickup_library
order by pickup_authority, pickup_library;