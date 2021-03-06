---------------------------------------------------------------
-- view: vw_dashboard_reservations_interlendingbyauthorityandmonthbooks
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_interlendingbyauthorityandmonthbooks;
create or replace view vw_dashboard_reservations_interlendingbyauthorityandmonthbooks as
select
    to_char(h.date_available, 'YYYYMM') as month_available,
    h.item_authority,
    h.pickup_authority,
    count(h.key) as number_of_holds
from vw_holds_interlending_books h
group by month_available, item_authority, pickup_authority
order by month_available, item_authority, pickup_authority;