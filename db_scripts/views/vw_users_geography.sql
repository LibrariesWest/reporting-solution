---------------------------------------------------------------
-- view: vw_users_geography
---------------------------------------------------------------

-- drop view vw_users_geography;
create or replace view vw_users_geography as
select
    u.*,
    op.eastings as postcode_eastings,
    op.northings as postcode_northings,
    op.geom as geom,
    op.postcode as os_postcode,
    op.country_code as postcode_countrycode,
    op.nhs_regional_ha_code as postcode_nhsregionalhacode,
    op.nhs_ha_code as postcode_nhshacode,
    od.name as district_name,
    od.area_code as district_areacode,
    od.code as district_code,
    oc.name as county_name,
    oc.area_code as county_areacode,
    oc.code as county_code,
    ow.name as ward_name,
    ow.code as ward_code,
    oa.oa11cd as oa_code,
    ol.lsoa11cd as lsoa_code,
    ol.lsoa11nm as lsoa_name,
    ol.msoa11cd as msoa_code,
    ol.msoa11nm as msoa_name,
    ol.lep17cd1 as lep_code1,
    ol.lep17nm1 as lep_name1,
    ol.lep17cd2 as lep_code2,
    ol.lep17nm2 as lep_name2,
    imd.imd_decile
from vw_users u
left join os_postcodes op on u.postcode_trim = op.postcode_trim
left join os_districts od on od.code = op.admin_district_code
left join os_counties oc on oc.code = op.admin_county_code
left join os_wards ow on ow.code = op.admin_ward_code 
left join ons_oas oa on op.oa11cd = oa.oa11cd
left join ons_oas_lookups ol on ol.oa11cd = oa.oa11cd
left join ons_lsoas_imd imd on imd.lsoa_code = ol.lsoa11cd;