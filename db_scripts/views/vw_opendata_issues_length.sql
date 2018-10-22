---------------------------------------------------------------
-- view: vw_opendata_issues_lengths
---------------------------------------------------------------

-- drop view vw_opendata_issues_lengths;
create or replace view vw_opendata_issues_lengths as
select 
	c.flexible_key as catalogue_flex_key,
	c.title as title,
    c.author as author,
    c.isbn as ISBN,
	i.item_type,
	round(avg(ch.date_time_discharged::date - ch.date_charged::date)) as days
from vw_chargeshistory ch
join vw_items i on i.catalogue_key = ch.catalogue_key and i.call_sequence = ch.call_sequence and i.copy_number = ch.copy_number
join vw_catalogue c on c.catalogue_key = ch.catalogue_key
where ch.date_charged > (now() - interval '2 years')
group by c.catalogue_key, c.flexible_key, c.title, c.author, c.isbn, i.item_type
having count(*) > 100
order by c.author, c.title, c.isbn, i.item_type;