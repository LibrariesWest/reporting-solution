-----------------------------------------------
-- view: vw_dashboard_membership_newusersbyweek
-----------------------------------------------

-- drop view vw_dashboard_membership_newusersbyweek;
create or replace view vw_dashboard_membership_newusersbyweek as
select
    date_trunc('week',date_created) as week,
    authority,
    library,
    count(*)
from vw_users
group by date_trunc('week',date_created), authority, library
order by date_trunc('week',date_created), authority, library;