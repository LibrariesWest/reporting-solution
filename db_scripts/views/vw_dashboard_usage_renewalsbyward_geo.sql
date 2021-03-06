---------------------------------------------------------------
-- view: vw_dashboard_usage_renewalsbyward_geo
---------------------------------------------------------------

-- drop view vw_dashboard_usage_renewalsbyward_geo;
create or replace view vw_dashboard_usage_renewalsbyward_geo as
select row_to_json(fc)
from (
	select 'FeatureCollection' As type, array_to_json(array_agg(f)) as features
	from (
		select 'Feature' As type, ST_AsGeoJSON(lg.geom, 4)::json As geometry, row_to_json((select l from (select ward, renewals) As l)) as properties
		from ( select
			ow.name as ward,
			wc.renewals,
			ST_Transform(ST_SimplifyPreserveTopology(ow.geom, 50), 4326) as geom
			from
				(	select
						u.ward_name,
						u.ward_code,
						sum(ch.number_of_renewals) as renewals
					from vw_charges_chargeshistory ch
					join vw_users_geography u on ch.user_key = u.user_key
					where ch.date_charged > (now() - interval '1 year')
					group by u.ward_name, u.ward_code) wc
			join os_wards ow
			on ow.code = wc.ward_code ) as lg
		) as f
) as fc;