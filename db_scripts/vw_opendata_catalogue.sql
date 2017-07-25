---------------------------------------------------------------
-- view: vw_opendata_catalogue
---------------------------------------------------------------

-- drop view vw_opendata_catalogue;
create or replace view vw_opendata_catalogue as 
select
    c.flexible_key as flexible_key,
    ( select (string_to_array(marc.tag, '~'))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '245' limit 1) as title,
    ( select (string_to_array(marc.tag, '~'))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '100' limit 1) as author,
    ( select (string_to_array(marc.tag, ' '))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '20' limit 1) as isbn,
    c.year_of_publication as published,
    pf.policy_name as format,
    ( select count(item.catalogue_key) from item where item.catalogue_key = c.catalogue_key) as items,
    ( select count(distinct item.library) from item where item.catalogue_key = c.catalogue_key) as libraries,
    c.date_catalogued as catalogued,
    c.number_of_copies_on_open_order
from catalogue c
join policy pf on pf.policy_type = 'FORM' and pf.policy_number = c.format
where c.shadow = 0;