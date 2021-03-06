---------------------------------------------------------------
-- view: vw_opendata_issues
---------------------------------------------------------------

-- drop view vw_opendata_issues;
create or replace view vw_opendata_issues as
select
	to_char(ch.date_charged, 'YYYY-MM-DD') as date_issued,
	ch.charge_authority as authority,
	l.name as library,
	case when ip.field_5 = '$<ITYP_desc_unknown>' then 'Unknown' else ip.field_5 end as item_type,
	case when count(ch.key) > 4 then cast(count(ch.key) as varchar) else '*' end as issues,
    case when count(ch.key) > 4 then cast(sum(ch.number_of_renewals) as varchar) else '*' end as renewals
from vw_charges_chargeshistory ch
join vw_items i on i.catalogue_key = ch.catalogue_key and i.call_sequence = ch.call_sequence and i.copy_number = ch.copy_number
join libraries l on ch.charge_library = l.code
join policy ip on ip.policy_type = 'ITYP' and ip.policy_name = i.item_type
where ch.date_charged >= (now() - interval '2 years')
group by date_issued, charge_authority, l.name, ip.field_5;