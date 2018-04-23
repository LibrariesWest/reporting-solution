---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbylibraryanddayofweek
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbylibraryanddayofweek;
create or replace view vw_dashboard_usage_loansbylibraryanddayofweek as
select 
	charge_authority as authority,
	charge_library as library, 
	day as day_of_week,
	day_number as day_number,
	round(avg(ch)) as loans
from
	(select charge_authority, charge_library, date_charged, to_char(date_charged, 'day') as day, date_part('dow', date_charged) as day_number, count(*) as ch
	from vw_charges_chargeshistory
	where charge_authority is not null
	and date_charged > (now() - interval '1 year')
	group by charge_authority, charge_library, date_charged, date_part('dow', date_charged)
	order by charge_authority, charge_library, date_charged, date_part('dow', date_charged)) charges
group by charge_authority, charge_library, day_number, day
having count(*) > 30
order by charge_authority, charge_library, day_number;