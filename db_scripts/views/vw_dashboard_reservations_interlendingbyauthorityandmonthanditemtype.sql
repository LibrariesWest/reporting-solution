---------------------------------------------------------------
-- view: vw_dashboard_reservations_interlendingbyauthorityandmonthanditemtype
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_interlendingbyauthorityandmonthanditemtype;
create or replace view vw_dashboard_reservations_interlendingbyauthorityandmonthanditemtype as
select
    to_char(h.date_available, 'YYYYMM') as month_available,
    h.item_authority,
    h.pickup_authority,
    h.item_type,
    count(h.key) as number_of_holds
from vw_holds_interlending h
group by month_available, item_authority, pickup_authority, h.item_type
order by month_available, item_authority, pickup_authority, h.item_type;