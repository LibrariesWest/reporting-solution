---------------------------------------------------------------
-- view: vw_opendata_catalogue
---------------------------------------------------------------

-- drop view vw_opendata_catalogue;
create or replace view vw_opendata_catalogue as select
    c.flexible_key,
    c.title,
    c.author,
    c.isbn,
    c.year_of_publication,
    c.date_created
from vw_catalogue c
where c.shadowed = 0
and exists (select catalogue_key from item i where c.catalogue_key = i.catalogue_key and i.shadow = 0);