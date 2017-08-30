---------------------------------------------------------------
-- view: vw_dashboard_reservations_holdsoversixweeks
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_holdsoversixweeks;
create or replace view vw_dashboard_reservations_holdsoversixweeks as
select 
    h.date_placed as placed,
    h.item_id,
    h.item_authority,
    h.item_library,
    h.pickup_authority,
    h.pickup_library,
    h.hold_level,
    h.hold_range
from vw_holds h
where h.hold_status = 'ACTIVE'
and h.date_available is null
and h.date_placed < (now() - interval '6 weeks')
order by h.date_placed;