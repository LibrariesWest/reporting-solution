---------------------------------------------------------------
-- table:
---------------------------------------------------------------

-- drop table ons_census_sw_ethnicity

create table ons_census_sw_ethnicity
(
    oa_code character varying(9),
    total integer,
    white integer,
    white_british integer,
    white_irish integer,
    white_gypsy_irishtraveller integer,
    white_other integer,
    mixed_multiple integer,
    mixed_multiple_white_and_black_caribbean integer,
    mixed_multiple_white_and_black_african integer,
    mixed_multiple_white_and_asian integer,
    mixed_multiple_other integer,
    asian integer,
    asian_asianbritish_indian integer,
    asian_asianbritish_pakistani integer,
    asian_asianbritish_bangladeshi integer,
    asian_asianbritish_chinese integer,
    asian_asianbritish_otherasian integer,
    black integer,
    black_african_caribbean_blackbritish_african integer,
    black_african_caribbean_blackbritish_caribbean integer,
    black_african_caribbean_blackbritish_otherblack integer,
    other integer,
    other_arab integer,
    other_anyother integer,
	constraint pk_onscensusswreligions_code primary key (oa_code)
);
