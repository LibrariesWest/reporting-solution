---------------------------------------------------------------
-- view: vw_dashboard_reservations_holdsbyauthorityandmonth
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_holdsbyauthorityandmonth;
create or replace view vw_dashboard_reservations_holdsbyauthorityandmonth as 
select
    h.pickup_authority,
    to_char(h.date_placed, 'YYYYMM') as month,
    count(h.key) as holds
from vw_holds h
where h.date_placed > (now() - interval '1 year')
group by pickup_authority, month
order by pickup_authority, month;