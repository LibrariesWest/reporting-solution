---------------------------------------------------------------
-- view: vw_dashboard_reservations_holdsbyward
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_holdsbyward;
create or replace view vw_dashboard_reservations_holdsbyward as 
select 
    u.ward_name,
    u.ward_code,
    count(h.key) as holds
from hold h
join vw_users_geography u on u.user_key = h.user_key
where h.date_placed > (now() - interval '1 year')
group by u.ward_name, u.ward_code
order by u.ward_name, u.ward_code;