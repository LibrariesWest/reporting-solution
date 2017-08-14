---------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbyward_geo
---------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbyward_geo;
create or replace view vw_dashboard_membership_borrowersbyward_geo as
select row_to_json(fc)
from (
	select 'FeatureCollection' As type, array_to_json(array_agg(f)) as features
	from (
		select 'Feature' As type, ST_AsGeoJSON(lg.geom, 4)::json As geometry, row_to_json((select l from (select ward, users) As l)) as properties
		from ( select
			ow.name as ward,
			users,
			ST_Transform(ST_SimplifyPreserveTopology(ow.geom, 50), 4326) as geom
			from
				( select distinct
				chp.ward_code as ward_code,
				count(chp.user_key) as users
				from
					( select
					vu.user_key,
					vu.ward_code
					from
						( select user_key, number_of_renewals from charge where date_charged > (now() - interval '1 year')
						union all
						select user_key, number_of_renewals from chargehist where date_charged > (now() - interval '1 year')) ch -- all user keys from charges in last year
					join vw_users_geography vu
					on ch.user_key = vu.user_key) chp -- all charges from last year with user postcode
				group by chp.ward_code) wc -- ward code and number of charges
			join os_wards ow
			on ow.code = wc.ward_code ) as lg -- ward name, number of charges, and geometry  
		) as f -- feature
) as fc; -- feature collection