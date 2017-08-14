---------------------------------------------------------------
-- view: vw_dashboard_usage_loansbyward_geo
---------------------------------------------------------------

-- drop view vw_dashboard_usage_loansbyward_geo;
create or replace view vw_dashboard_usage_loansbyward_geo as 
select row_to_json(fc)
from (
	select 'FeatureCollection' As type, array_to_json(array_agg(f)) as features
	from (
		select 'Feature' As type, ST_AsGeoJSON(lg.geom, 4)::json As geometry, row_to_json((select l from (select ward, loans) As l)) as properties
		from ( select
			ow.name as ward,
			wc.loans,
			ST_Transform(ST_SimplifyPreserveTopology(ow.geom, 50), 4326) as geom
			from
				(	select 
						u.ward_code,
						count(ch.user_key) as loans
					from 
						(	select user_key, number_of_renewals from charge where date_charged > (now() - interval '1 year')
							union all
							select user_key, number_of_renewals from chargehist where date_charged > (now() - interval '1 year')
						) ch
					join vw_users_geography u on ch.user_key = u.user_key
					group by u.ward_code ) wc
			join os_wards ow
			on ow.code = wc.ward_code ) as lg
		) as f
) as fc;