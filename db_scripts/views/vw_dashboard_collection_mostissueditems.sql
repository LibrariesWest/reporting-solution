---------------------------------------------------------------
-- view: vw_dashboard_collection_mostissueditems
---------------------------------------------------------------

-- drop view vw_dashboard_collection_mostissueditems;
create or replace view vw_dashboard_collection_mostissueditems as 
select 
    i.id as item_id,
    count(ch.key) as issues,
    sum(ch.number_of_renewals) as renewals
from vw_charges_chargeshistory as ch
join vw_items i on i.catalogue_key = ch.catalogue_key and i.call_sequence = ch.call_sequence and i.copy_number = ch.copy_number
where ch.date_charged > (now() - interval '1 year')
group by item_id
order by issues desc
limit 100;