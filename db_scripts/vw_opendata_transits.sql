---------------------------------------------------------------
-- view: vw_opendata_transits
---------------------------------------------------------------

-- drop view vw_opendata_transits;
create or replace view vw_opendata_transits as
select
    from_library,
    from_authority,
    to_library,
    to_authority,
    item_type,
    count(*) as items
from vw_transits
group by from_library, from_authority, to_library, to_authority, item_type
order by from_library, from_authority, to_library, to_authority, item_type;