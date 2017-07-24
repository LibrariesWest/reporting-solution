---------------------------------------------------------------
-- view: vw_users_geography
---------------------------------------------------------------

-- drop view vw_users_geography;
create or replace view vw_users_geography as 
select 
    up.user_key, 
    up.id, 
    up.last_activity_date, 
    up.date_created, 
    up.status,
    case 
        when up.birth_date = 0 then null::date
        else ('J'::text || up.birth_date::text)::date
    end as birth_date,
    op.postcode, 
    op.eastings, 
    op.northings, 
    od.code as district, 
    od.name as district_name, 
    oc.code as county,
    oc.name as county_name, 
    ow.code as ward,
    ow.name as ward_name,
    oa.oa11cd as oa,
    ol.lsoa11cd as lsoa,
    ol.lsoa11nm as lsoa_name,
    ol.msoa11cd as msoa,
    ol.msoa11nm as msoa_name,
    imd.imd_decile
from 
    (select u.user_key, u.id, u.last_activity_date, u.date_created, u.status, u.birth_date,
    case
        when u.mailing_address = 1 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_1 and userxinfo.entry_number = 9000 limit 1)
        when u.mailing_address = 2 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_2 AND userxinfo.entry_number = 9036 limit 1)
        when u.mailing_address = 3 then ( select userxinfo.entry from userxinfo where userxinfo."offset" = u.address_offset_3 AND userxinfo.entry_number = 9036 limit 1)
        else null::text
    end as postcode
    from users u) up
left join os_postcodes op
on up.postcode = op.postcode
left join os_districts od
on od.code = op.admin_district_code
left join os_counties oc
on oc.code = op.admin_county_code
left join os_wards ow
on ow.code = op.admin_ward_code 
left join ons_oas oa
on st_within(op.geom, oa.geom)
left join ons_oas_lookups ol
on ol.oa11cd = oa.oa11cd
left join ons_lsoas_imd imd
on imd.lsoa_code = ol.lsoa11cd;