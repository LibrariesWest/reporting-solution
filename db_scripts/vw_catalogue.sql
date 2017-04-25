---------------------------------------------------------------
-- view: vw_catalogue
---------------------------------------------------------------

-- drop view vw_catalogue;
create or replace view public.vw_catalogue as 
select
    c.catalogue_key as id,
    c.flexible_key as flex_key,
    ( select (string_to_array(marc.tag, '~'::text))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '245'::text limit 1) as title,
    ( select (string_to_array(marc.tag, '~'::text))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '100'::text limit 1) as author,
    ( select (string_to_array(marc.tag, ' '::text))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '020'::text limit 1) as isbn,
    c.year_of_publication as published,
    pf.policy_name as format,
    ( select count(item.catalogue_key) as count from item where item.catalogue_key = c.catalogue_key) as items,
    ( select count(distinct item.library) as count from item where item.catalogue_key = c.catalogue_key) as libraries,
    c.date_catalogued as catalogued,
    c.number_of_copies_on_open_order,
    c.shadow as shadowed
from catalogue c
join policy pf on pf.policy_type::text = 'FORM'::text and pf.policy_number = c.format;