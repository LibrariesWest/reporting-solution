---------------------------------------------------------------
-- view: vw_opendata_issues
---------------------------------------------------------------

-- drop view vw_opendata_issues;
create or replace view vw_opendata_issues as
select
	to_char(ch.date_charged, 'YYYYMMDD') as date_issued,
	ch.charge_authority as authority,
	ch.charge_library as library,
	i.item_type as item_type,
	count(ch.key) as issues,
	sum(ch.number_of_renewals) as renewals
from vw_charges_chargeshistory ch
join vw_items i on i.catalogue_key = ch.catalogue_key and i.call_sequence = ch.call_sequence and i.copy_number = ch.copy_number
group by date_issued, charge_authority, charge_library, item_type;