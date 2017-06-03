---------------------------------------------------------------
-- view: vw_dashboard_mosttravelleditems
---------------------------------------------------------------

-- drop view vw_dashboard_mosttravelleditems;
create or replace view vw_dashboard_mosttravelleditems as 
select 
    ( select replace((string_to_array(marc.tag, '~'::text))[1], ' /', '') as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '245'::text limit 1) as title,
    ( select (string_to_array(marc.tag, '~'::text))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '100'::text limit 1) as author,
    ( select (string_to_array(marc.tag, ' '::text))[1] as string_to_array from marc where marc.marc = c.marc and marc.tag_number::text = '20'::text limit 1) as isbn,
    distances.item_id,
    sum(distances.library_distance) as distance,
    count(key) as issues
from
    (select
	charges.key,
        charges.catalogue_key,
        charges.item_id,
        ilp.postcode as item_postcode,
        clp.postcode issuing_postcode,
        up.postcode user_postcode,
        rlp.postcode as return_postcode,
        round(ST_Distance(ST_SetSRID(ST_MakePoint(ilp.eastings, ilp.northings), 27700),ST_SetSRID(ST_MakePoint(clp.eastings, clp.northings), 27700)) / 1609) as holding_issuing_distance,
        round(ST_Distance(ST_SetSRID(ST_MakePoint(clp.eastings, clp.northings), 27700),ST_SetSRID(ST_MakePoint(up.eastings, up.northings), 27700)) / 1609) as issuing_user_distance,
        round(ST_Distance(ST_SetSRID(ST_MakePoint(up.eastings, up.northings), 27700),ST_SetSRID(ST_MakePoint(rlp.eastings, rlp.northings), 27700)) / 1609) as user_return_distance,
        round(ST_Distance(ST_SetSRID(ST_MakePoint(rlp.eastings, rlp.northings), 27700),ST_SetSRID(ST_MakePoint(ilp.eastings, ilp.northings), 27700)) / 1609) as return_holding_distance,
        round(
		    (ST_Distance(ST_SetSRID(ST_MakePoint(ilp.eastings, ilp.northings), 27700),ST_SetSRID(ST_MakePoint(clp.eastings, clp.northings), 27700)) +
            ST_Distance(ST_SetSRID(ST_MakePoint(clp.eastings, clp.northings), 27700),ST_SetSRID(ST_MakePoint(rlp.eastings, rlp.northings), 27700)) +
		    ST_Distance(ST_SetSRID(ST_MakePoint(rlp.eastings, rlp.northings), 27700),ST_SetSRID(ST_MakePoint(ilp.eastings, ilp.northings), 27700))) / 1609) as library_distance
    from
        (select
	    ch.key,
            i.catalogue_key,
            i.id as item_id,
            case
                when u.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
                when u.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
                when u.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
                else null::text
            end as user_postcode,
            case
                when clu.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = clu.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
                when clu.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = clu.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
                when clu.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = clu.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
                else null::text
            end as chargelib_postcode,
            case
                when rlu.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = rlu.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
                when rlu.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = rlu.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
                when rlu.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = rlu.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
                else null::text
            end as returnlib_postcode,
            case
                when ilu.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = ilu.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
                when ilu.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = ilu.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
                when ilu.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = ilu.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
                else null::text
            end as itemlib_postcode
        from item i
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
        on clu.id = cl.policy_name
        join users rlu
        on rlu.id = rl.policy_name
        join users ilu
        on ilu.id = il.policy_name) as charges
    join os_postcodes up
    on up.postcode = charges.user_postcode
    join os_postcodes clp
    on clp.postcode = charges.chargelib_postcode
    join os_postcodes rlp
    on rlp.postcode = charges.returnlib_postcode
    join os_postcodes ilp
    on ilp.postcode = charges.itemlib_postcode) as distances
join catalogue c
on c.catalogue_key = distances.catalogue_key
group by title, author, isbn, item_id
order by distance desc limit 100;