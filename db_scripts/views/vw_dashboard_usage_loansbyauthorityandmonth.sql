---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbyauthorityandmonth
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbyauthorityandmonth;
create or replace view vw_dashboard_usage_loansbyauthorityandmonth as 
select 
    ch.charge_authority as authority, 
    to_char(date_charged, 'YYYYMM') as month, 
    count(*) as loans
from vw_charges_chargeshistory as ch
where ch.charge_authority is not null
and ch.date_charged > (now() - interval '1 year')
group by ch.charge_authority, month
order by ch.charge_authority, month;