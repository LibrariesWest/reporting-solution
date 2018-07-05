---------------------------------------------------------------
-- view: vw_opendata_titles
---------------------------------------------------------------

-- drop view vw_opendata_titles;
create or replace view vw_opendata_titles as 
select
    c.flexible_key as catalogue_flex_key,
    c.title as title,
    c.author as author,
    c.isbn as ISBN,
    c.year_of_publication as published_year,
    c.date_created as created
from vw_catalogue c
where c.shadowed = 0
and exists (
    select 
        catalogue_key
    from vw_items i 
    where c.catalogue_key = i.catalogue_key 
    and i.shadowed = 0
    and i.current_location not in ('DISCARD', 'MISSING', 'LOST', 'LOST-CLAIM', 'STOLEN', 'LOST-ASSUM')
    and i.library in (select code from libraries)
);
