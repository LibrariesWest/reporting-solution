---------------------------------------------------------------
-- view: vw_users_public
---------------------------------------------------------------

-- drop view vw_users_public;
create or replace view vw_users_public as 
select
  vu.id,
  vu.profile,
  vu.postcode,
  vu.library,
  vu.authority,
  vu.gender,
  vu.id_check,
  vu.ethnicity,
  vu.peoples_network,
  vu.marketing,
  vu.religion_belief,
  vu.how_heard,
  vu.data_protection,
  vu.school,
  vu.mobile_route,
  vu.declared_disability,
  vu.notices_delivery,
  vu.status,
  case
    when up.birth_date = 0 then null::date
    else ('J'::text || up.birth_date::text)::date
  end as birth_date,
  vu.joined,
  vu.active,
  vu.issued,
  vu.renewed,
  vu.billed,
  vu.paid
from vw_users vu
where vu.profile::text = any (array['ACC_0-11'::character varying::text, 'ACC_12-14'::character varying::text, 'ACC_15-17'::character varying::text, 'ACC_ADU'::character varying::text, 'ADU'::character varying::text, 'ADU_PRIV'::character varying::text, 'ADU_TOT'::character varying::text, 'CH_0-4'::character varying::text, 'CH_0-4_TOT'::character varying::text, 'CH_5-11'::character varying::text, 'CH_5-11_to'::character varying::text, 'CM_FC'::character varying::text, 'CON_0-11'::character varying::text, 'CON_12-14'::character varying::text, 'CON_15-17'::character varying::text, 'CON_ADU'::character varying::text, 'CV_IND'::character varying::text, 'E_CHMIND'::character varying::text, 'E_FAMILY'::character varying::text, 'E_HOMET'::character varying::text, 'E_LEAVER'::character varying::text, 'E_OTHER'::character varying::text, 'E_TEACH'::character varying::text, 'E_YR_13'::character varying::text, 'E_YR_5'::character varying::text, 'E_YR_6'::character varying::text, 'E_YR_7'::character varying::text, 'E_YR_8'::character varying::text, 'E_YR_9'::character varying::text, 'HOME_IND'::character varying::text, 'INPROCESS'::character varying::text, 'INT_U18'::character varying::text, 'LOSTCARD'::character varying::text, 'NO_ADD'::character varying::text, 'PC_CLASS'::character varying::text, 'PUBLIC'::character varying::text, 'STOLEN'::character varying::text, 'TMP_ADU'::character varying::text, 'TN_12-14'::character varying::text, 'TN_12-14_t'::character varying::text, 'TN_15-17'::character varying::text, 'TN_15-17_T'::character varying::text, 'VIS_0-11'::character varying::text, 'VIS_12-14'::character varying::text, 'VIS_15-17'::character varying::text, 'VIS_ADU'::character varying::text]);