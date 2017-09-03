---------------------------------------------------------------
-- view: vw_dashboard_reservations_holdsbyward_geo
---------------------------------------------------------------

-- drop view vw_dashboard_reservations_holdsbyward_geo;
create or replace view vw_dashboard_reservations_holdsbyward_geo as 
select row_to_json(fc)
from (
	select 'FeatureCollection' As type, array_to_json(array_agg(f)) as features
	from (
		select 'Feature' As type, ST_AsGeoJSON(lg.geom, 4)::json as geometry, row_to_json((select l from (select ward_name, ward_code, holds) as l)) as properties
		from ( select
			ow.name as ward_name,
			ow.code as ward_code,
			wc.holds,
			ST_Transform(ST_SimplifyPreserveTopology(ow.geom, 50), 4326) as geom
			from
				(	select
                        u.ward_name,
                        u.ward_code,
                        count(h.key) as holds
                    from vw_holds h
                    join vw_users_geography u on u.user_key = h.user_key
                    where h.date_placed > (now() - interval '1 year')
                    group by u.ward_name, u.ward_code ) wc
			join os_wards ow
			on ow.code = wc.ward_code ) as lg
		) as f
) as fc;