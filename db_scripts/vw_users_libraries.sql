-- view: vw_users_libraries
-- drop view vw_users_libraries;
create or replace view vw_users_libraries as 
select 
    u.id,
    fn_librarytoauthority(u.id::text) as authority,
    case
        when u.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
        when u.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 and userxinfo.entry_number = 9036 limit 1)
        when u.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 and userxinfo.entry_number = 9036 limit 1)
        else null::text
    end as postcode
from users u
join policy ul on ul.policy_type::text = 'LIBR'::text and ul.policy_number = u.library
join policy us on us.policy_type::text = 'USTN'::text and us.policy_number = u.status
join policy up on up.policy_type::text = 'UPRF'::text and up.policy_number = u.profile
where u.id::text = ul.policy_name::text;