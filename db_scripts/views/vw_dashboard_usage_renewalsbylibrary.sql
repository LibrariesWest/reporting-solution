---------------------------------------------------------------
-- view: vw_dashboard_usage_renewalsbylibrary
---------------------------------------------------------------

-- drop view vw_dashboard_usage_renewalsbylibrary;
create or replace view vw_dashboard_usage_renewalsbylibrary as
select
    ch.charge_authority as authority,
    ch.charge_library as library,
    sum(ch.number_of_renewals) as renewals
from vw_charges_chargeshistory as ch
where ch.charge_authority is not null
and ch.date_charged > (now() - interval '1 year')
group by authority, library
order by authority, library;