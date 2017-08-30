---------------------------------------------------------------
-- view: vw_dashboard_reservations_interlendingbyauthorityav
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_interlendingbyauthorityav;
create or replace view vw_dashboard_reservations_interlendingbyauthorityav as
select
    to_char(h.date_available, 'YYYYMM') as month_available,
    h.item_authority,
    h.pickup_authority,
    count(h.key) as number_of_holds
from vw_holds_interlending_av
group by month_available, item_authority, pickup_authority
order by month_available, item_authority, pickup_authority;