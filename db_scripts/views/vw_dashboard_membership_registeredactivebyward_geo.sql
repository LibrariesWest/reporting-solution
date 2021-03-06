---------------------------------------------------------------
-- view: vw_dashboard_membership_registeredactivebyward_geo
---------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredactivebyward_geo;
create or replace view vw_dashboard_membership_registeredactivebyward_geo as
select row_to_json(fc)
from (
	select 'FeatureCollection' As type, array_to_json(array_agg(f)) as features
	from (
		select 'Feature' As type, ST_AsGeoJSON(lg.geom, 4)::json as geometry, row_to_json((select l from (select ward_name, ward_code, users) as l)) as properties
		from ( select
			ow.name as ward_name,
			ow.code as ward_code,
			wc.users,
			ST_Transform(ST_SimplifyPreserveTopology(ow.geom, 50), 4326) as geom
			from
				(	select
						case
							when vu.county_name is null then vu.district_name
							else vu.county_name
						end as resident_authority,
						vu.ward_code as ward_code,
						vu.ward_name as ward_name,
						count(*) as users
					from vw_users_geography vu
					where vu.last_activity_date > (now() - interval '1 year')
					group by resident_authority, ward_code, ward_name ) wc
			join os_wards ow
			on ow.code = wc.ward_code ) as lg
		) as f
) as fc;