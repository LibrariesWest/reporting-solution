---------------------------------------------------------------
-- view: vw_dashboard_reservations_fulfilledholdsbyauthorityandmonth
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_fulfilledholdsbyauthorityandmonth;
create or replace view vw_dashboard_reservations_fulfilledholdsbyauthorityandmonth as
select
    h.pickup_authority,
    to_char(h.date_placed, 'YYYYMM') as month,
    count(h.key) as holds,
    avg(h.date_available::date - h.date_placed::date) as days_taken
from vw_holds h
where h.date_placed > (now() - interval '1 year')
and h.date_available is not null
group by pickup_authority, month
order by pickup_authority, month;