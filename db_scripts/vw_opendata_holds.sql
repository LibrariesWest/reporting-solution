---------------------------------------------------------------
-- view: vw_opendata_holds
---------------------------------------------------------------

-- drop view vw_opendata_holds;
create or replace view vw_opendata_holds as
select
    placed_library,
    placed_authority,
    item_library,
    item_authority,
    pickup_library,
    pickup_authority,
    to_char(date_placed, 'YYYYMM') as month_placed,
    client,
    round(avg(date_available - date_placed)) as days_taken,
    count(h.key) as holds
from vw_hold
where h.date_available is not null
group by placed_library, placed_authority, item_library, item_authority, pickup_library, pickup_authority, month_placed, client;