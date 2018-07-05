---------------------------------------------------------------
-- view: vw_opendata_holds_summary
---------------------------------------------------------------

-- drop view vw_opendata_holds_summary;
create or replace view vw_opendata_holds_summary as
select
	to_char(date_placed, 'YYYY-MM') as month_placed,
    item_authority,
    pickup_authority,
    count(h.key) as reservations,
    round(avg(date_available::date - date_placed::date)) as days_taken
from vw_holds h
where h.date_available is not null
and date_placed >= date_trunc('month', (now() - interval '2 years'))
and date_placed < date_trunc('month', now())
and h.item_library in (select code from libraries)
and h.pickup_library in (select code from libraries)
group by month_placed, item_authority, pickup_authority
order by month_placed, item_authority, pickup_authority;