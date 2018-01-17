-----------------------------------------------
-- view: vw_dashboard_membership_registrationsbyweek
-----------------------------------------------

-- drop view vw_dashboard_membership_registrationsbyweek;
create or replace view vw_dashboard_membership_registrationsbyweek as
select
    to_char(date_trunc('week', date_created), 'YYYYMMdd') as week_beginning,
    authority,
    library,
    count(*)
from vw_users
where date_created > (now() - interval '2 years')
group by date_trunc('week', date_created), authority, library
order by date_trunc('week', date_created), authority, library;