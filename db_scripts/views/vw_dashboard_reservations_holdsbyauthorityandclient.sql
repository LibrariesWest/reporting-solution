---------------------------------------------------------------
-- view: vw_dashboard_reservations_holdsbyauthorityandclient
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_holdsbyauthorityandclient;
create or replace view vw_dashboard_reservations_holdsbyauthorityandclient as 
select
    h.pickup_authority,
    h.client,
    count(h.key) as holds
from vw_holds h
where h.date_placed > (now() - interval '1 year')
group by pickup_authority, client
order by pickup_authority, client;