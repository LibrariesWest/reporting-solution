---------------------------------------------------------------
-- view: vw_dashboard_mosttravelleditems
---------------------------------------------------------------

-- drop view vw_dashboard_mosttravelleditems;
create or replace view vw_dashboard_mosttravelleditems as 
select 
    distances.catalogue_key,
    distances.item_id,
    sum(distances.distance) as distance,
    count(*) as issues
from
    (select
        charges.catalogue_key,
        charges.item_id,
        -- holding library to issuing library
        ST_Distance(ST_SetSRID(ST_MakePoint(ilp.eastings, ilp.northings), 27700),ST_SetSRID(ST_MakePoint(clp.eastings, clp.northings), 27700)) +
        -- issuing library to user
        ST_Distance(ST_SetSRID(ST_MakePoint(clp.eastings, clp.northings), 27700),ST_SetSRID(ST_MakePoint(up.eastings, up.northings), 27700)) +
        -- user to return library
        ST_Distance(ST_SetSRID(ST_MakePoint(up.eastings, up.northings), 27700),ST_SetSRID(ST_MakePoint(rlp.eastings, rlp.northings), 27700)) +
        -- return library to item library
        ST_Distance(ST_SetSRID(ST_MakePoint(rlp.eastings, rlp.northings), 27700),ST_SetSRID(ST_MakePoint(ilp.eastings, ilp.northings), 27700)) as distance
    from
        (select
            i.catalogue_key, 
            i.item_id,
            case
                when u.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
                when u.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
                when u.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
                else null::text
            end as user_postcode,
            case
                when clu.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
                when clu.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
                when clu.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
                else null::text
            end as chargelib_postcode,
            case
                when rlu.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
                when rlu.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
                when rlu.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
                else null::text
            end as returnlib_postcode,
            case
                when ilu.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
                when ilu.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
                when ilu.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
                else null::text
            end as itemlib_postcode
        from items i
        join chargehist ch
        on ch.catalogue_key = i.catalogue_key
        and ch.call_sequence = i.call_sequence
        and ch.copy_number = i.copy_number
        join policy cl
        on cl.policy_type = 'LIBR'
        and cl.policy_number = ch.library
        join policy rl
        on rl.policy_type = 'LIBR'
        and rl.policy_number = ch.discharge_library
        join policy il
        on il.policy_type = 'LIBR'
        and il.policy_number = i.library
        join users u
        on u.user_key = ch.user_key
        join users clu
        on clu.user_id = cl.policy_name
        join users rlu
        on rlu.user_id = rl.policy_name
        join users ilu
        on ilu.user_id = il.policy_name) as charges
    join os_postcodes up
    on ulp.postcode = charges.user_postcode
    join os_postcodes clp
    on clp.postcode = charges.chargelib_postcode
    join os_postcodes rlp
    on rlp.postcode = charges.returnlib_postcode
    join os_postcodes ilp
    on ilp.postcode = charges.itemlib_postcode) as distances
join catalogue c
on c.catalogue_key = distances.catalogue_key
group by item_id
order by distance desc limit 100;