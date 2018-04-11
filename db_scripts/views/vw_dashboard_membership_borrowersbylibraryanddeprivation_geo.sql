------------------------------------------------------------------------
-- view: vw_dashboard_membership_borrowersbylibraryanddeprivation_geo
------------------------------------------------------------------------

-- drop view vw_dashboard_membership_borrowersbylibraryanddeprivation_geo;
create or replace view vw_dashboard_membership_borrowersbylibraryanddeprivation_geo as
select row_to_json(fc)
from (
	select 'FeatureCollection' As type, array_to_json(array_agg(f)) as features
	from (
		select 'Feature' As type, ST_AsGeoJSON(lg.geom, 4)::json As geometry, row_to_json((select l from (select lsoa_code, usage) As l)) as properties
		from ( select 
                lsoa_data.lsoa_code,
				lsoa_data.imd_decile,
                array_agg((authority, library, borrowers)) as usage,
                ST_Transform(ST_SimplifyPreserveTopology(lsoa_geo.geom, 50), 4326) as geom
            from
                (select
                    auth.charge_authority as authority,
                    auth.charge_library as library,
                    auth.lsoa_code as lsoa_code,
                    auth.imd_decile,
                    count(auth.user_key) as borrowers
                from
                    (   select distinct
                            ch.user_key,
                            ch.charge_authority,
                            ch.charge_library,
                            vu.lsoa_code,
                            vu.imd_decile
                        from vw_charges_chargeshistory ch
                        join vw_users_geography vu on ch.user_key = vu.user_key
                        where ch.date_charged > (now() - interval '1 year')) auth
                group by auth.charge_authority, auth.charge_library, auth.lsoa_code, auth.imd_decile, auth.lsoa_code) as lsoa_data
            join ons_lsoas lsoa_geo on lsoa_geo.lsoa11cd = lsoa_data.lsoa_code 
			group by lsoa_code, imd_decile, geom) as lg -- ward name, number of charges, and geometry  
		) as f -- feature
) as fc; -- feature collection;