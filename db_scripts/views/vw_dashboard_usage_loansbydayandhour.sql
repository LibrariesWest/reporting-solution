---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbydayandhour
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbydayandhour;
create or replace view vw_dashboard_usage_loansbydayandhour as
select
	date_part('isodow', ch.date_charged) as day_of_week,
	date_part('hour', ch.date_charged) as hour_of_day,
    count(key) as number_of_issues
from vw_charges_chargeshistory ch
where ch.date_charged > (now() - interval '1 year')
and charge_authority is not null
group by day_of_week, hour_of_day
having count(key) > 30
order by day_of_week, hour_of_day;