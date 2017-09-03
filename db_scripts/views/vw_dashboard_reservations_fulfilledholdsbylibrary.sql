---------------------------------------------------------------
-- view: vw_dashboard_reservations_fulfilledholdsbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_fulfilledholdsbylibrary;
create or replace view vw_dashboard_reservations_fulfilledholdsbylibrary as
select
    h.pickup_authority,
    h.pickup_library,
    count(h.key) as holds,
    avg(h.date_available - h.date_placed) as days_taken
from vw_holds h
where h.date_placed > (now() - interval '1 year')
and h.date_available is not null
group by pickup_authority, pickup_library
order by pickup_authority, pickup_library;