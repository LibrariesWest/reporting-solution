---------------------------------------------------------------
-- view: vw_dashboard_borrowersbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_borrowersbylibrary;
create or replace view vw_dashboard_borrowersbylibrary as
select fn_librarytoauthority(lp.policy_name) as authority, lp.policy_name as library, count(user_key) from
(select distinct user_key, library from 
(select user_key, library from charge where date_charged > now() - interval '1 year' union select user_key, library from chargehist where date_charged > now() - interval '1 year') ch) us
join policy lp
on lp.policy_type = 'LIBR'
and lp.policy_number = us.library
group by authority, lp.policy_name