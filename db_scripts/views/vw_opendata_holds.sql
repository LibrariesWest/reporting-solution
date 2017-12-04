---------------------------------------------------------------
-- view: vw_opendata_holds
---------------------------------------------------------------

-- drop view vw_opendata_holds;
create or replace view vw_opendata_holds as
select
    item_library,
    item_authority,
    pickup_library,
    pickup_authority,
    to_char(date_placed, 'YYYY-MM') as month_placed,
	case 
		when client = 'WS_DS' then 'Website'
		when client = 'WS_PUBLIC' then 'App'
		when client = 'WORKFLOWS' then 'Branch'
	end as reservation_method,
    round(avg(date_available - date_placed)) as days_taken,
    count(h.key) as holds
from vw_holds h
where h.date_available is not null
group by placed_library, placed_authority, item_library, item_authority, pickup_library, pickup_authority, month_placed, reservation_method;
