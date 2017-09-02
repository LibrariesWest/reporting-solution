---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbyward_geo
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbyward_geo;
create or replace view vw_dashboard_membership_borrowersbyward_geo as
select row_to_json(fc)
from (
	select 'FeatureCollection' As type, array_to_json(array_agg(f)) as features
	from (
		select 'Feature' As type, ST_AsGeoJSON(lg.geom, 4)::json As geometry, row_to_json((select l from (select ward_name, ward_code, borrowers) As l)) as properties
		from ( select
			ow.name as ward_name,
			ow.code as ward_code,
			wc.borrowers,
			ST_Transform(ST_SimplifyPreserveTopology(ow.geom, 50), 4326) as geom
			from
				(	select
						vu.ward_name,
						vu.ward_code,
						count(ch.user_key) as borrowers
					from vw_charges_chargeshistory ch
					join vw_users_geography vu on ch.user_key = vu.user_key
					group by vu.ward_name, vu.ward_code) wc -- ward code and number of charges
			join os_wards ow
			on ow.code = wc.ward_code ) as lg -- ward name, number of charges, and geometry  
		) as f -- feature
) as fc; -- feature collection