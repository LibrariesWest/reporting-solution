-----------------------------------------------
-- view: vw_dashboard_membership_registrationsbyweek
-----------------------------------------------

-- drop view vw_dashboard_membership_registrationsbyweek;
create or replace view vw_dashboard_membership_registrationsbyweek as
select
    date_trunc('week', date_created) as week,
    authority,
    library,
    count(*)
from vw_users
group by date_trunc('week', date_created), authority, library
order by date_trunc('week', date_created), authority, library;