---------------------------------------------------------------
-- view: vw_dashboard_activeborrowers
---------------------------------------------------------------

-- drop view vw_dashboard_activeborrowers;
create or replace view vw_dashboard_activeborrowers as
select count(distinct user_key), auth from
(select user_key, fn_librarytoauthority(policy.policy_name) as auth from charge join policy on policy.policy_type = 'LIBR' and policy.policy_number = charge.library where date_charged >= '1-Apr-2016' and date_charged < '1-Apr-2017'
union 
select user_key, fn_librarytoauthority(policy.policy_name) as auth from chargehist join policy on policy.policy_type = 'LIBR' and policy.policy_number = chargehist.library where date_charged >= '1-Apr-2016' and date_charged < '1-Apr-2017') c
where auth is not null
group by auth