---------------------------------------------------------------
-- view: vw_opendata_holds
---------------------------------------------------------------

-- drop view vw_opendata_holds;
create or replace view vw_opendata_holds as
select
	to_char(date_placed, 'YYYY-MM') as month_placed,
    item_authority,
    il.name as item_library,
    pickup_authority,
    pl.name as pickup_library,
	case 
		when client = 'WS_DS' then 'Website'
		when client = 'WS_PUBLIC' then 'Mobile App'
		when client = 'WORKFLOWS' then 'Library'
	end as reservation_method,
    case when count(h.key) > 4 then cast(count(h.key) as varchar) else '*' end as holds,
    round(avg(date_available::date - date_placed::date)) as days_taken
from vw_holds h
join libraries pl on pl.code = h.pickup_library
join libraries il on il.code = h.item_library
where h.date_available is not null
and date_placed >= date_trunc('month', (now() - interval '2 years'))
group by month_placed, item_authority, il.name, pickup_authority, pl.name, reservation_method
order by month_placed, item_authority, il.name, pickup_authority, pl.name, reservation_method;