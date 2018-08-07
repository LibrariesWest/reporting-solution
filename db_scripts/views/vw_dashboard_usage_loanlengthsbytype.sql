---------------------------------------------------------------
-- view: vw_dashboard_usage_loanlengthsbyitemtype
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loanlengthsbyitemtype;
create or replace view vw_dashboard_usage_loanlengthsbyitemtype as
select 
	p.field_5 as item_type,
	count(*) as issues,
	round(avg(date_part('days', age(ch.date_time_discharged, ch.date_charged)))::numeric, 1) as days
from chargehist ch
join item i on i.catalogue_key = ch.catalogue_key and i.call_sequence = ch.call_sequence and i.copy_number = ch.copy_number
join policy p on p.policy_type = 'ITYP' and p.policy_number = i.type
where ch.date_time_discharged > (now() - interval '1 year')
group by item_type
order by issues desc;