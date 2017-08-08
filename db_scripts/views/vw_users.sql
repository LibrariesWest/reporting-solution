---------------------------------------------------------------
-- view: vw_users
---------------------------------------------------------------

-- drop view vw_users;
create or replace view vw_users as
select
    u.id,
    up.policy_name as profile,
    us.policy_name as status,
    ul.policy_name as library,
    fn_librarytoauthority(ul.policy_name) as authority,
    ucp1.policy_name as user_cat1,
    ucp2.policy_name as user_cat2,
    ucp3.policy_name as user_cat3,
    ucp4.policy_name as user_cat4,
    ucp5.policy_name as user_cat5,
    ucp6.policy_name as user_cat6,
    ucp7.policy_name as user_cat7,
    ucp8.policy_name as user_cat8,
    ucp9.policy_name as user_cat9,
    ucp10.policy_name as user_cat10,
    ucp11.policy_name as user_cat11,
    ucp12.policy_name as user_cat12,
    u.postcode_trim,
    case
	    when u.birth_date = 0 then null
	    else ('J' || cast(u.birth_date as text))::date
    end as birth_date,
    u.date_created as date_created,
    u.last_activity_date as last_activity_date
from users u
join policy ul on ul.policy_type = 'LIBR' and ul.policy_number = u.library
join policy us on us.policy_type = 'USTN' and us.policy_number = u.status
join policy up on up.policy_type = 'UPRF' and up.policy_number = u.profile
left outer join ucat uc1 on uc1.user_key = u.user_key and uc1.category = 1
left outer join policy ucp1 on ucp1.policy_type = 'CAT1' and ucp1.policy_number = uc1.value
left outer join ucat uc2 on uc2.user_key = u.user_key and uc2.category = 2
left outer join policy ucp2 on ucp2.policy_type = 'CAT2' and ucp2.policy_number = uc2.value
left outer join ucat uc3 on uc3.user_key = u.user_key and uc3.category = 3
left outer join policy ucp3 on ucp3.policy_type = 'CAT3' and ucp3.policy_number = uc3.value
left outer join ucat uc4 on uc4.user_key = u.user_key and uc4.category = 4
left outer join policy ucp4 on ucp4.policy_type = 'CAT4' and ucp4.policy_number = uc4.value
left outer join ucat uc5 on uc5.user_key = u.user_key and uc5.category = 5
left outer join policy ucp5 on ucp5.policy_type = 'CAT5' and ucp5.policy_number = uc5.value
left outer join ucat uc6 on uc6.user_key = u.user_key and uc6.category = 6
left outer join policy ucp6 on ucp6.policy_type = 'CAT6' and ucp6.policy_number = uc6.value
left outer join ucat uc7 on uc7.user_key = u.user_key and uc7.category = 7
left outer join policy ucp7 on ucp7.policy_type = 'CAT7' and ucp7.policy_number = uc7.value
left outer join ucat uc8 on uc8.user_key = u.user_key and uc8.category = 8
left outer join policy ucp8 on ucp8.policy_type = 'CAT8' and ucp8.policy_number = uc8.value
left outer join ucat uc9 on uc9.user_key = u.user_key and uc9.category = 9
left outer join policy ucp9 on ucp9.policy_type = 'CAT9' and ucp9.policy_number = uc9.value
left outer join ucat uc10 on uc10.user_key = u.user_key and uc10.category = 10
left outer join policy ucp10 on ucp10.policy_type = 'CAT10' and ucp10.policy_number = uc10.value
left outer join ucat uc11 on uc11.user_key = u.user_key and uc11.category = 11
left outer join policy ucp11 on ucp11.policy_type = 'CAT11' and ucp11.policy_number = uc11.value
left outer join ucat uc12 on uc12.user_key = u.user_key and uc12.category = 12
left outer join policy ucp12 on ucp12.policy_type = 'CAT12' and ucp12.policy_number = uc12.value
where fn_librarytoauthority(ul.policy_name) is not null;