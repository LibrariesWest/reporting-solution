---------------------------------------------------------------
-- view: vw_users_geography
---------------------------------------------------------------

-- drop view vw_users_geography;
create or replace view vw_users_geography as
select
    *
from vw_users u
left join os_postcodes op on u.postcode_trim = op.postcode_trim
left join os_districts od on od.code = op.admin_district_code
left join os_counties oc on oc.code = op.admin_county_code
left join os_wards ow on ow.code = op.admin_ward_code 
left join ons_oas oa on op.oa11cd = oa.oa11cd
left join ons_oas_lookups ol on ol.oa11cd = oa.oa11cd
left join ons_lsoas_imd imd on imd.lsoa_code = ol.lsoa11cd;