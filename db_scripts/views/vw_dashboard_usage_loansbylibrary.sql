---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbylibrary;
create or replace view vw_dashboard_usage_loansbylibrary as
select
    ch.charge_authority as authority,
    ch.charge_library as library,
    count(*) as loans
from vw_charges_chargeshistory ch
where ch.charge_authority is not null
and ch.date_charged > (now() - interval '1 year')
group by  ch.charge_authority, ch.charge_library
order by ch.charge_authority, ch.charge_library;