---------------------------------------------------------------
-- view: vw_catalogue
---------------------------------------------------------------

-- drop view vw_catalogue;
create or replace view public.vw_catalogue as 
select
    c.catalogue_key,
    c.flexible_key,
    c.year_of_publication as published,
    pf.policy_name as format,
    ( select rtrim(rtrim((string_to_array(marc.tag, '~'))[1], ':'), '/') as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '245' limit 1) as title,
    ( select rtrim((string_to_array(marc.tag, '~'))[1], ',') as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '100' limit 1) as author,
    ( select (string_to_array(marc.tag, ' '))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number = '20' limit 1) as isbn,
    c.date_created,
    c.date_catalogued,
    c.date_modified,
    c.create_name,
    c.modify_name,
    c.heading_offset,
    c.number_of_copies_on_open_order,
    c.shadow as shadowed
from catalogue c
join policy pf on pf.policy_type = 'FORM' and pf.policy_number = c.format;