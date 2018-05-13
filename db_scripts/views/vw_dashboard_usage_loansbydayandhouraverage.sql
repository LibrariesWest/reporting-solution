---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbydayandhouraverage
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbydayandhouraverage;
create or replace view vw_dashboard_usage_loansbydayandhouraverage as
select 
	charges.day_of_week,
	charges.hour_of_day,
	round(avg(charges.number_of_issues)) as loans
from
	(select
		charge_library,
		date_part('isodow', ch.date_charged) as day_of_week,
		date_part('hour', ch.date_charged) as hour_of_day,
		count(*) as number_of_issues
	from vw_charges_chargeshistory ch
	where ch.date_charged > (now() - interval '1 year')
	and charge_authority is not null
	group by charge_library, day_of_week, hour_of_day
	order by charge_library, day_of_week, hour_of_day) charges
group by charges.day_of_week, charges.hour_of_day
order by charges.day_of_week, charges.hour_of_day;