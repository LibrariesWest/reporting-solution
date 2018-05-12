---------------------------------------------------------------
-- view: vw_holds_fulfilment_external
---------------------------------------------------------------

-- drop view vw_holds_fulfilment_external;
create or replace view vw_holds_fulfilment_external as 
select 
    pickup_authority, 
    to_char(h.date_placed, 'YYYY-MM') as month,
    round(avg(h.date_available::date - h.date_placed::date)) as days,
    count(h.key)
from vw_holds h
where h.date_available is not null and h.hold_status = 'INACTIVE' and h.date_placed >= '7-Jun-2016'
and pickup_authority <> item_authority
group by to_char(h.date_placed, 'YYYY-MM'), pickup_authority
order by to_char(h.date_placed, 'YYYY-MM'), pickup_authority;