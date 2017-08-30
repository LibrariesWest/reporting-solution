---------------------------------------------------------------
-- view: vw_dashboard_usage_renewalsbyauthorityandmonth
---------------------------------------------------------------

-- drop view vw_dashboard_usage_renewalsbyauthorityandmonth;
create or replace view vw_dashboard_usage_renewalsbyauthorityandmonth as
select
    ch.charge_authority as authority,
    to_char(date_charged, 'YYYYMM') as month,
    sum(ch.number_of_renewals) as renewals
from vw_charges_chargeshistory ch
where ch.charge_authority is not null
and ch.date_charged > (now() - interval '1 year')
group by ch.charge_authority, month
order by ch.charge_authority, month;