---------------------------------------------------------------
-- view: vw_ons_lsoa_pop
---------------------------------------------------------------

-- drop view vw_ons_lsoa_pop;
create or replace view vw_ons_lsoa_pop as
select 
	*,
	(female_zero_to_sixteen + male_zero_to_sixteen) as zero_to_sixteen,
	(female_seventeen_to_sixty + male_seventeen_to_sixty) as seventeen_to_sixty,
	(female_over_sixty + male_over_sixty) as over_sixty,
	(female_all_ages + male_all_ages) as all_ages
from 
	(select 
		oal.lsoa11cd,
		sum(pf.age_0 + pf.age_1 + pf.age_2 + pf.age_3 + pf.age_4 + pf.age_5 + pf.age_6 + pf.age_7 + pf.age_8 + 
			pf.age_9 + pf.age_10 + pf.age_11 + pf.age_12 + pf.age_13 + pf.age_14 + pf.age_15 + pf.age_16) as female_zero_to_sixteen,
		sum(pf.age_17 + pf.age_18 + pf.age_19 + pf.age_20 + pf.age_21 + pf.age_22 + pf.age_23 + pf.age_24 +
			pf.age_25 + pf.age_26 + pf.age_27 + pf.age_28 + pf.age_29 + pf.age_30 + pf.age_31 + pf.age_32 + pf.age_33 + pf.age_34 +
			pf.age_35 + pf.age_36 + pf.age_37 + pf.age_38 + pf.age_39 + pf.age_40 + pf.age_41 + pf.age_42 + pf.age_43 + pf.age_44 +
			pf.age_45 + pf.age_46 + pf.age_47 + pf.age_48 + pf.age_49 + pf.age_50 + pf.age_51 + pf.age_52 + pf.age_53 + pf.age_54 +
			pf.age_55 + pf.age_56 + pf.age_57 + pf.age_58 + pf.age_59 + pf.age_60) as female_seventeen_to_sixty,
		sum(pf.age_61 + pf.age_62 + pf.age_63 + pf.age_64 + pf.age_65 + pf.age_66 + pf.age_67 + pf.age_68 + 
			pf.age_69 + pf.age_70 + pf.age_71 + pf.age_72 + pf.age_73 + pf.age_74 + pf.age_75 + pf.age_76 + pf.age_77 + pf.age_78 + 
			pf.age_79 + pf.age_80 + pf.age_81 + pf.age_82 + pf.age_83 + pf.age_84 + pf.age_85 + pf.age_86 + pf.age_87 + pf.age_88 + 
			pf.age_89 + pf.age_90) as female_over_sixty,
		sum(pf.all_ages) as female_all_ages,
		sum(pm.age_0 + pm.age_1 + pm.age_2 + pm.age_3 + pm.age_4 + pm.age_5 + pm.age_6 + pm.age_7 + pm.age_8 +
			pm.age_9 + pm.age_10 + pm.age_11 + pm.age_12 + pm.age_13 + pm.age_14 + pm.age_15 + pm.age_16) as male_zero_to_sixteen,
		sum(pm.age_17 + pm.age_18 + pm.age_19 + pm.age_20 + pm.age_21 + pm.age_22 + pm.age_23 + pm.age_24 +
			pm.age_25 + pm.age_26 + pm.age_27 + pm.age_28 + pm.age_29 + pm.age_30 + pm.age_31 + pm.age_32 + pm.age_33 + pm.age_34 +
			pm.age_35 + pm.age_36 + pm.age_37 + pm.age_38 + pm.age_39 + pm.age_40 + pm.age_41 + pm.age_42 + pm.age_43 + pm.age_44 +
			pm.age_45 + pm.age_46 + pm.age_47 + pm.age_48 + pm.age_49 + pm.age_50 + pm.age_51 + pm.age_52 + pm.age_53 + pm.age_54 +
			pm.age_55 + pm.age_56 + pm.age_57 + pm.age_58 + pm.age_59 + pm.age_60) as male_seventeen_to_sixty,
		sum(pm.age_60 + pm.age_61 + pm.age_62 + pm.age_63 + pm.age_64 + pm.age_65 + pm.age_66 + pm.age_67 + pm.age_68 + 
			pm.age_69 + pm.age_70 + pm.age_71 + pm.age_72 + pm.age_73 + pm.age_74 + pm.age_75 + pm.age_76 + pm.age_77 + pm.age_78 + 
			pm.age_79 + pm.age_80 + pm.age_81 + pm.age_82 + pm.age_83 + pm.age_84 + pm.age_85 + pm.age_86 + pm.age_87 + pm.age_88 + 
			pm.age_89 + pm.age_90) as male_over_sixty,
		sum(pm.all_ages) as male_all_ages
	from ons_oas_lookups oal
	join ons_oas_population_female pf on pf.oa11cd = oal.oa11cd
	join ons_oas_population_male pm on pm.oa11cd = oal.oa11cd
	group by oal.lsoa11cd) as pops
order by lsoa11cd;