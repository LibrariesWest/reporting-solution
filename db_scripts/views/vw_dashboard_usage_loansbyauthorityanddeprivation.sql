---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbyauthorityanddeprivation
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbyauthorityanddeprivation;
create or replace view vw_dashboard_usage_loansbyauthorityanddeprivation as
select
    ch.charge_authority as authority,
    coalesce(vu.imd_decile, null) as imd_decile,
    count(ch.key) as loans
from vw_charges_chargeshistory ch
join vw_users_geography vu on vu.user_key = ch.user_key
where ch.charge_authority is not null
and ch.date_charged > (now() - interval '1 year')
group by ch.charge_authority, vu.imd_decile
order by ch.charge_authority, vu.imd_decile;