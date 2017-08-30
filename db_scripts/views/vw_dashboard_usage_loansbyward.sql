---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbyward
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbyward;
create or replace view vw_dashboard_usage_loansbyward as
select
	u.ward_name,
	u.ward_code,
    count(ch.user_key) as loans
from vw_charges_chargeshistory ch
join vw_users_geography u on ch.user_key = u.user_key
where ch.date_charged > (now() - interval '1 year')
group by u.ward_name, u.ward_code
order by u.ward_name, u.ward_code;