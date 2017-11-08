---------------------------------------------------------------
-- view: vw_opendata_issues
---------------------------------------------------------------

-- drop view vw_opendata_issues;
create or replace view vw_opendata_issues as
select
	to_char(ch.date_charged, 'YYYYMM') as month_issued,
	ch.charge_authority as issue_authority,
	i.item_type as item_type,
	count(ch.key) as number_of_issues,
	sum(ch.number_of_renewals) as number_of_renewals
from vw_charges_chargeshistory ch
join vw_items i on i.catalogue_key = ch.catalogue_key and i.call_sequence = ch.call_sequence and i.copy_number = ch.copy_number;
