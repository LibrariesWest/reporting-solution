---------------------------------------------------------------
-- view: vw_dashboard_movement_transitsoversixweeks
---------------------------------------------------------------

-- drop view vw_dashboard_movement_transitsoversixweeks;
create or replace view vw_dashboard_movement_transitsoversixweeks as
select
    t.date_time_transited as date_transited,
    t.item_id,
    c.title as title,
    c.author as author,
    cn.shelving_key as shelving_key,
    t.item_type,
    t.home_location,
    t.from_library,
    t.from_authority,
    t.to_library,
    t.to_authority
from vw_transits t
join vw_catalogue c on c.catalogue_key = t.catalogue_key
join callnum cn on cn.catalogue_key = t.catalogue_key and cn.call_sequence = t.call_sequence
where t.date_time_transited < (now() - interval '6 weeks')
and t.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
order by t.date_time_transited;