---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbyauthorityanddeprivation
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbyauthorityanddeprivation;
create or replace view vw_dashboard_usage_loansbyauthorityanddeprivation as
select
    fn_librarytoauthority(lp.policy_name) as authority,
    to_char(date_charged, 'YYYYMM') as month,
    coalesce(vu.imd_decile, 'Unknown') as imd_decile,
    count(ch.key) as loans
from
    (   select key, user_key, number_of_renewals, library, date_charged from charge where date_charged > (now() - interval '1 year')
        union all
        select key, user_key, number_of_renewals, library, date_charged from chargehist where date_charged > (now() - interval '1 year')
    ) as ch
join policy lp on lp.policy_type = 'LIBR' and lp.policy_number = ch.library
join vw_users_geography vu on vu.user_key = ch.user_key
where fn_librarytoauthority(lp.policy_name) is not null
group by authority, month, vu.imd_decile
order by authority, month, vu.imd_decile;