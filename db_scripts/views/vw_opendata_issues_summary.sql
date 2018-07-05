---------------------------------------------------------------
-- view: vw_opendata_issues_summary
---------------------------------------------------------------

-- drop view vw_opendata_issues_summary;
create or replace view vw_opendata_issues_summary as
select
	to_char(ch.date_charged, 'YYYY-MM') as month_issued,
	ch.charge_authority as authority,
	case when ip.field_5 = '$<ITYP_desc_unknown>' then 'Unknown' else ip.field_5 end as item_type,
	count(ch.key) as issues,
	sum(ch.number_of_renewals) as renewals
from vw_charges_chargeshistory ch
join vw_items i on i.catalogue_key = ch.catalogue_key and i.call_sequence = ch.call_sequence and i.copy_number = ch.copy_number
join policy ip on ip.policy_type = 'ITYP' and ip.policy_name = i.item_type
where ch.date_charged >= (now() - interval '2 years')
and ch.charge_library in (select code from libraries)
group by month_issued, charge_authority, ip.field_5
order by month_issued, charge_authority, ip.field_5;