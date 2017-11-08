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
    count(*) as number_of_items
from vw_transits
-- don't include missing and lost etc
where current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
-- never include shadowed items
and shadowed = 0
group by from_library, from_authority, to_library, to_authority, item_type
order by from_library, from_authority, to_library, to_authority, item_type;
