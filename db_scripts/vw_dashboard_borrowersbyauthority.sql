---------------------------------------------------------------
-- view: vw_dashboard_borrowersbyauthority
---------------------------------------------------------------

-- drop view vw_dashboard_borrowersbyauthority;
create or replace view vw_dashboard_borrowersbyauthority as
select auths.authority, count(auths.user_key) from
(select distinct us.user_key, us.authority from
(select user_key, fn_librarytoauthority(lp.policy_name) as authority
from
(select user_key, library from charge where date_charged > now() - interval '1 year' union select user_key, library from chargehist where date_charged > now() - interval '1 year') ch
join policy lp
on lp.policy_type = 'LIBR'
and lp.policy_number = ch.library) us) auths
group by authority