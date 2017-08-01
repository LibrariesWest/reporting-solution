---------------------------------------------------------------
-- view: vw_holds_interlending
---------------------------------------------------------------

-- drop view vw_holds_interlending;
create or replace view vw_holds_interlending as 
select
    *
from vw_holds vh
where vh.date_available is not null
and vh.item_authority <> vh.pickup_authority;