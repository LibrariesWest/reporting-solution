---------------------------------------------------------------
-- view: vw_dashboard_reservations_fulfilledholdsbyauthorityandmonthinternal
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_fulfilledholdsbyauthorityandmonthinternal;
create or replace view vw_dashboard_reservations_fulfilledholdsbyauthorityandmonthinternal as
select
    h.pickup_authority,
    to_char(h.date_placed, 'YYYYMM') as month,
    count(h.key) as holds,
    avg(h.date_available::date - h.date_placed::date) as days_taken
from vw_holds h
where h.date_placed > (now() - interval '1 year')
and h.date_available is not null
and h.item_authority = h.pickup_authority
group by pickup_authority, month
order by pickup_authority, month;