---------------------------------------------------------------
-- table: ons_census_sw_religions. 
---------------------------------------------------------------

-- drop table ons_census_sw_religions
create table ons_census_sw_religions
(
	oa_code character varying(9),
	total integer,
	christian integer,
	buddhist integer,
	hindu integer,
	jewish integer,
	muslim integer,
	sikh integer,
	other_total integer,
	other_animism integer,
	other_bahai integer,
	other_believe_in_god integer,
	other_brahma_kumari integer,
	other_chinese_religion integer,
	other_church_of_all_religion integer,
	other_confucianist integer,
	other_deist integer,
	other_druid integer,
	other_druze integer,
	other_eckankar integer,
	other_heathen integer,
	other_jain integer,
	other_mixed integer,
	other_mysticism integer,
	other_native_american_church integer,
	other_new_age integer,
	other_occult integer,
	other_own_belief_system integer,
	other_pagan integer,
	other_pantheism integer,
	other_rastafarian integer,
	other_ravidassia integer,
	other_reconstructionist integer,
	other_satanism integer,
	other_scientology integer,
	other_shamanism integer,
	other_shintoism integer,
	other_spiritual integer,
	other_spiritualist integer,
	other_taoist integer,
	other_theism integer,
	other_thelemite integer,
	other_traditional_african_religion integer,
	other_unification_church integer,
	other_universalist integer,
	other_vodun integer,
	other_wicca integer,
	other_witchcraft integer,
	other_zoroastrian integer,
	other_religions integer,
	no_total integer,
	no_noreligion integer,
	no_agnostic integer,
	no_atheist integer,
	no_free_thinker integer,
	no_heavy_metal integer,
	no_humanist integer,
	no_jedi_knight integer,
	no_realist integer,
	not_stated integer,
	constraint pk_onscensusswreligions_code primary key (oa_code)
);