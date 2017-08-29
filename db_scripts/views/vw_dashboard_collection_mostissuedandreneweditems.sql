---------------------------------------------------------------
-- view: vw_dashboard_collection_mostissuedandreneweditems
---------------------------------------------------------------

-- drop view vw_dashboard_collection_mostissuedandreneweditems;
create or replace view vw_dashboard_collection_mostissuedandreneweditems as 
select
    i.item_id,
    count(ch.key) as issues,
    sum(ch.number_of_renewals) as renewals,
    sum(ch.number_of_renewals) + count(ch.key) as issues_and_renewals
from vw_charges_chargeshistory ch
join vw_items i on i.catalogue_key = ch.catalogue_key and i.call_sequence = ch.call_sequence and i.copy_number = ch.copy_number
where ch.date_charged > (now() - interval '1 year')
group by i.item_id
order by issues_and_renewals desc
limit 100;