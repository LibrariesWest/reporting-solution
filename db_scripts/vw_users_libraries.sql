---------------------------------------------------------------
-- view: vw_users_libraries
---------------------------------------------------------------

-- drop view vw_users_libraries;
create or replace view vw_users_libraries as
select
    u.id,
    fn_librarytoauthority(u.id) as authority,
    u.postcode
from vw_users u
where u.id = u.library;