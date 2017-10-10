---------------------------------------------------------------
-- view: vw_dashboard_movement_transitsbyitemauthority
---------------------------------------------------------------

-- drop view vw_dashboard_movement_transitsbyitemauthority;
create or replace view vw_dashboard_movement_transitsbyitemauthority as
select
    t.from_authority,
    t.to_authority,
    t.item_type,
    count(t.item_id)
from vw_transits t
where t.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
group by from_authority, to_authority, item_type;