------------------------------------------------------------------------
-- view: vw_dashboard_membership_registeredactivebyageanddeprivation_geo
------------------------------------------------------------------------

-- drop view vw_dashboard_membership_registeredactivebyageanddeprivation_geo;
create or replace view vw_dashboard_membership_registeredactivebyageanddeprivation_geo as
select row_to_json(fc)
from (
	select 'FeatureCollection' As type, array_to_json(array_agg(f)) as features
	from (
		select 'Feature' As type, ST_AsGeoJSON(lg.geom, 4)::json As geometry, row_to_json((select l from (
            select lsoa_name, lsoa_code, lad16cd, lad16nm, imd_decile, members, members_percent
            members_zero_to_sixteen, members_seventeen_to_sixty, members_over_sixty, members, 
            population_zero_to_sixteen, population_seventeen_to_sixty, population_over_sixty, population_total,
			members_zero_to_sixteen_percent, members_seventeen_to_sixty_percent, members_over_sixty_percent, members_percent) As l)
        ) as properties
		from ( select
			lsoas.lsoa11nm as lsoa_name,
			members.*,
			ST_Transform(ST_SimplifyPreserveTopology(lsoas.geom, 50), 4326) as geom
			from vw_dashboard_membership_registeredactivebyageanddeprivation members
			join ons_lsoas lsoas
			on members.lsoa_code = lsoas.lsoa11cd ) as lg
		) as f -- feature
) as fc; -- feature collection