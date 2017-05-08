---------------------------------------------------------------
-- view: vw_users
---------------------------------------------------------------

-- drop view vw_users;
create or replace view vw_users as 
select 
    u.id,
    up.policy_name as profile,
    case
        when u.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
        when u.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 and userxinfo.entry_number = 9036 limit 1)
        when u.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 and userxinfo.entry_number = 9036 limit 1)
        else null::text
    end as postcode,
    ul.policy_name as library,
    fn_librarytoauthority(ul.policy_name::text) as authority,
    ( select ucp1.policy_name from ucat uc1 join policy ucp1 on ucp1.policy_type::text = 'CAT1'::text and ucp1.policy_number = uc1.value where uc1.user_key = u.user_key and uc1.category = 1 ) as gender,
    ( select ucp2.policy_name from ucat uc2 join policy ucp2 on ucp2.policy_type::text = 'CAT2'::text and ucp2.policy_number = uc2.value where uc2.user_key = u.user_key and uc2.category = 2 ) as id_check,
    ( select ucp3.policy_name from ucat uc3 join policy ucp3 on ucp3.policy_type::text = 'CAT3'::text and ucp3.policy_number = uc3.value where uc3.user_key = u.user_key and uc3.category = 3 ) as ethnicity,
    ( select ucp4.policy_name from ucat uc4 join policy ucp4 on ucp4.policy_type::text = 'CAT4'::text and ucp4.policy_number = uc4.value where uc4.user_key = u.user_key and uc4.category = 4 ) as peoples_network,
    ( select ucp5.policy_name from ucat uc5 join policy ucp5 on ucp5.policy_type::text = 'CAT5'::text and ucp5.policy_number = uc5.value where uc5.user_key = u.user_key and uc5.category = 5 ) as marketing,
    ( select ucp6.policy_name from ucat uc6 join policy ucp6 on ucp6.policy_type::text = 'CAT6'::text and ucp6.policy_number = uc6.value where uc6.user_key = u.user_key and uc6.category = 6 ) as religion_belief,
    ( select ucp7.policy_name from ucat uc7 join policy ucp7 on ucp7.policy_type::text = 'CAT7'::text and ucp7.policy_number = uc7.value where uc7.user_key = u.user_key and uc7.category = 7 ) as how_heard,
    ( select ucp8.policy_name from ucat uc8 join policy ucp8 on ucp8.policy_type::text = 'CAT8'::text and ucp8.policy_number = uc8.value where uc8.user_key = u.user_key and uc8.category = 8 ) as data_protection,
    ( select ucp9.policy_name from ucat uc9 join policy ucp9 on ucp9.policy_type::text = 'CAT9'::text and ucp9.policy_number = uc9.value where uc9.user_key = u.user_key and uc9.category = 9 ) as school,
    ( select ucp10.policy_name from ucat uc10 join policy ucp10 on ucp10.policy_type::text = 'CAT10'::text and ucp10.policy_number = uc10.value where uc10.user_key = u.user_key and uc10.category = 10 ) as mobile_route,
    ( select ucp11.policy_name from ucat uc11 join policy ucp11 on ucp11.policy_type::text = 'CAT11'::text and ucp11.policy_number = uc11.value where uc11.user_key = u.user_key and uc11.category = 11 ) as declared_disability,
    ( select ucp12.policy_name from ucat uc12 join policy ucp12 on ucp12.policy_type::text = 'CAT12'::text and ucp12.policy_number = uc12.value where uc12.user_key = u.user_key and uc12.category = 12 ) as notices_delivery,
    us.policy_name as status,
    case 
	    when u.birth_date = 0 then null
	    else ('J' || cast(u.birth_date as text))::date
    end as birth_date,
    u.date_created as joined,
    u.last_activity_date as active,
    ( select max(c.date_charged) as max from ( 
        select charge.date_charged from charge where charge.user_key = u.user_key
        union all
        select chargehist.date_charged from chargehist where chargehist.user_key = u.user_key) c) as issued,
    ( select max(c.date_renewed) as max from ( 
        select charge.date_renewed from charge where charge.user_key = u.user_key
        union all
        select chargehist.date_renewed from chargehist where chargehist.user_key = u.user_key) c) as renewed,
    coalesce(( select sum(coalesce(bill.amount_billed, 0::numeric)) as sum from bill where bill.user_key = u.user_key), 0::numeric) as billed,
    coalesce(( select sum(coalesce(billpayment.payment_amount, 0::numeric)) as sum from billpayment where billpayment.user_key = u.user_key), 0::numeric) as paid
from users u
join policy ul on ul.policy_type::text = 'LIBR'::text and ul.policy_number = u.library
join policy us on us.policy_type::text = 'USTN'::text and us.policy_number = u.status
join policy up on up.policy_type::text = 'UPRF'::text and up.policy_number = u.profile;