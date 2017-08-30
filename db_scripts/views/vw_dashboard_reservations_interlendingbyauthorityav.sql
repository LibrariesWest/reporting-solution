---------------------------------------------------------------
-- view: vw_dashboard_reservations_interlendingbyauthorityav
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_interlendingbyauthorityav;
create or replace view vw_dashboard_reservations_interlendingbyauthorityav as 
select 
    *
from vw_holds_interlending
where item_type in ( '' );